// ConsoleApplication3.cpp: определяет точку входа для консольного приложения.
//

#include<mpi.h>
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
int ProcNum;
int ProcRank;
int flag = 0;
int Size;
double *A;  double *B; double *C;


void PrintMatrix(double* pMatrix, int Size) {
	for (int i = 0; i<Size; i++) {
		printf("\n");
		for (int j = 0; j<Size; j++)
			printf("%7.4f ", pMatrix[i*Size + j]);
	}
}

void RandInit(double* pMatrix, int Size) { //заполнение матрицы
	srand(100);
	for (int i = 0; i<Size; i++) {
		for (int j = 0; j<Size; j++)  pMatrix[i*Size + j] = rand() / double(1000);
	}
}

void InitProcess(double* &A, double* &B, double* &C, int &Size) {
	MPI_Comm_size(MPI_COMM_WORLD, &ProcNum);
	MPI_Comm_rank(MPI_COMM_WORLD, &ProcRank);
	if (ProcRank == 0) {
		do {
			scanf("%d", &Size);
			if (Size< ProcNum) printf("Error! \n");
			if (Size%ProcNum != 0) printf("Error! \n");
		} while ((Size< ProcNum) || (Size%ProcNum != 0));
	}
	if (Size<10) flag = 1;
	MPI_Bcast(&Size, 1, MPI_INT, 0, MPI_COMM_WORLD); //отправка размера матриц

	if (ProcRank == 0) {
		A = new double[Size*Size];
		B = new double[Size*Size];
		C = new double[Size*Size];
		RandInit(A, Size); RandInit(B, Size);
	}
}

void Transpouse(double *&B, int dim) { //транспонирование матриц
	double temp = 0.0;
	for (int i = 0; i<dim; i++){
		for (int j = i + 1; j<dim; j++){
			temp = B[i*dim + j]; B[i*dim + j] = B[j*dim + i]; B[j*dim + i] = temp;
		}
	}
}

void MatrixMultiplicationMPI(double *&A, double *&B, double *&C, int &Size) { //умножение матриц
	int dim = Size;
	int i, j, k, p, ind;
	double temp;
	MPI_Status Status;
	int ProcPartSize = dim / ProcNum;
	int ProcPartElem = ProcPartSize*dim;
	double* bufA = new double[dim*ProcPartSize];
	double* bufB = new double[dim*ProcPartSize];
	double* bufC = new double[dim*ProcPartSize];
	int ProcPart = dim / ProcNum, part = ProcPart*dim;
	if (ProcRank == 0) {
		Transpouse(B, Size);
	}

	MPI_Scatter(A, part, MPI_DOUBLE, bufA, part, MPI_DOUBLE, 0, MPI_COMM_WORLD);//отправка по кусочкам
	MPI_Scatter(B, part, MPI_DOUBLE, bufB, part, MPI_DOUBLE, 0, MPI_COMM_WORLD);

	temp = 0.0;
	for (i = 0; i<ProcPartSize; i++){
		for (j = 0; j<ProcPartSize; j++){
			for (k = 0; k<dim; k++) temp += bufA[i*dim + k] * bufB[j*dim + k];
			bufC[i*dim + j + ProcPartSize*ProcRank] = temp; temp = 0.0;
		}
	}

	int NextProc; int PrevProc;
	for (p = 1; p<ProcNum; p++) {
		NextProc = ProcRank + 1;
		if (ProcRank == ProcNum - 1) NextProc = 0;
		PrevProc = ProcRank - 1;
		if (ProcRank == 0) PrevProc = ProcNum - 1;
		MPI_Sendrecv_replace(bufB, part, MPI_DOUBLE, NextProc, 0, PrevProc, 0, MPI_COMM_WORLD, &Status); 
		temp = 0.0;
		for (i = 0; i<ProcPartSize; i++) {
			for (j = 0; j<ProcPartSize; j++) {
				for (k = 0; k<dim; k++){
					temp += bufA[i*dim + k] * bufB[j*dim + k];
				}
				if (ProcRank - p >= 0)
					ind = ProcRank - p;
				else ind = (ProcNum - p + ProcRank);
				bufC[i*dim + j + ind*ProcPartSize] = temp;
				temp = 0.0;
			}
		}
	}
	MPI_Gather(bufC, ProcPartElem, MPI_DOUBLE, C, ProcPartElem, MPI_DOUBLE, 0, MPI_COMM_WORLD); //сборка

	delete[]bufA;
	delete[]bufB;
	delete[]bufC;
}


int main(int argc, char* argv[]) {
	double beg, end, serial, parallel = 0;
	MPI_Init(&argc, &argv);
	InitProcess(A, B, C, Size);
	beg = MPI_Wtime();
	MatrixMultiplicationMPI(A, B, C, Size);
	end = MPI_Wtime(); parallel = end - beg;
	if (ProcRank == 0) {
		printf("\n", &ProcNum);
		printf("\n");
		printf("\nExcitement time:\n");
		printf("%7.4f", parallel);
		if (flag) {
			printf("\nMatrix C: \n");
			PrintMatrix(C, Size);
		}
		printf("\n");
	}
	MPI_Finalize();
	delete[] A; delete[] B; delete[] C;
	return(0);

}