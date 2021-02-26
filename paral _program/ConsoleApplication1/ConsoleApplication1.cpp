// ConsoleApplication2.cpp: ���������� ����� ����� ��� ����������� ����������.
//

#include "stdafx.h"
#include <iostream>
#include <time.h>
#include <omp.h>
#include <vector>
using namespace std;

bool search_reverse_matrix(vector <vector<double>> &matrix)
{
	int size = matrix.size();
	vector <vector<double>> E(size, vector<double>(size));

	//���������� ��������� �������
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < size; j++)
		{
			if (i == j) E[i][j] = 1.0;
			else E[i][j] = 0.0;
		}
	}

	//������������� �������� ������� � �����������������
	for (int k = 0; k < size; k++)
	{
		if (abs(matrix[k][k]) < 1e-8)
		{
			bool changed = false;

			for (int i = k + 1; i < size; i++)
			{
				if (abs(matrix[i][k]) > 1e-8)
				{
					swap(matrix[k], matrix[i]);
					swap(E[k], E[i]);
					changed = true;
					break;
				}
			}

			if (!changed)
				return false;
		}

		double div = matrix[k][k];

		//������� ������� �������� ������ �� ������� ���� ������, ������� �� ������� ��������� 
#pragma omp parallel
		{
#pragma omp for
			for (int j = 0; j < size; j++)
			{
				matrix[k][j] /= div;
				E[k][j] /= div;
			}
		}


#pragma omp parallel
		{
#pragma omp for
			for (int i = k + 1; i < size; i++)
			{
				double multi = matrix[i][k];


				for (int j = 0; j < size; j++)
				{
					matrix[i][j] -= multi * matrix[k][j];
					E[i][j] -= multi * E[k][j];
				}
			}
		}
	}

	//������������ ��������� ������� �� ��������
	//� �������� �� ���������
	for (int k = size - 1; k > 0; k--)
	{
#pragma omp parallel
	{
#pragma omp for
		for (int i = k - 1; i > -1; i--)
		{
			double multi = matrix[i][k];

			for (int j = 0; j < size; j++)
			{
				matrix[i][j] -= multi * matrix[k][j];
				E[i][j] -= multi * E[k][j];
			}
		}
	}
	}
	matrix = E;
	return true;
}

double random(const int min, const int max)
{
	if (min == max)
		return min;
	return min + rand() % (max - min);
}

int main()
{
	setlocale(LC_ALL, "RUS");
	int equations_amount;
	cout << "������� ���������� ���������: ";
	cin >> equations_amount;

	vector<vector<double>> matrix(equations_amount, vector<double>(equations_amount));
	vector<double> B(equations_amount);

	// ��������� ������� ������������� � B
	for (int i = 0; i < equations_amount; i++)
	{
		for (int j = 0; j < equations_amount; j++)
			matrix[i][j] = random(0, 100);
			//cin >> matrix[i][j];
		//cin >> B[i];
		B[i] = random(0, 100);
	}

	// ����� ������� ���������
	/*cout << "\n������� ���������:\n";
	for (int i = 0; i < equations_amount; i++)
	{
	for (int j = 0; j < equations_amount; j++)
	{

	if (j != 0 && matrix[i][j] >= 0)
	cout << " +";
	cout << " " << matrix[i][j] << "x" << j + 1;
	}
	cout << " = " << B[i] << endl;
	}*/
	/*vector<double> E(equations_amount);
	for (int i = 0; i < equations_amount; i++)
	{
		cin >> E[i];
	}
	cout << "\n������ ����������:";
	for (int i = 0; i < equations_amount; i++)
		cout << "\nx" << i + 1 << " = " << E[i];*/

	double t = clock();

	// ���������� �������� �������
	if (!search_reverse_matrix(matrix))
	{
		cout << "\n���������� ����� �������� �������!\n";
		exit(1);
	}

	// �������-������� ����������� X � ���������� �������������� ����������
	vector<double> X(equations_amount);
#pragma omp parallel
	{
#pragma omp for
		for (int i = 0; i < equations_amount; i++)
		{
			X[i] = 0;
			for (int j = 0; j < equations_amount; j++)
				X[i] += matrix[i][j] * B[j];
		}
	}

	// ����� �������������� ����������
	/*cout << "\n������� ������� ���������:";
	for (int i = 0; i < equations_amount; i++)
		cout << "\nx" << i + 1 << " = " << X[i];*/

	t = (clock() - t) / 1000;
	cout << "\n\n�����, ����������� �� ����������: " << t << "�.\n";
	system("pause");
	return 0;
}
