using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication8
{
    class Program
    {
        static int ReadInt(int Min, int Max)
        {
            bool ok = false;
            int number;
            do
            {
                string buf = Console.ReadLine();
                ok = Int32.TryParse(buf, out number);
                if (ok == false) Console.WriteLine("Error");
                if (number < Min || number > Max)
                {
                    Console.WriteLine("Error");
                    ok = false;
                }

            } while (ok == false);
            return number;
        }

        static void FunctionForDeleteElement(int size, int[] array)
        {
            int sum = 0;
            for (int i = 0; i < size; i++)
            {
                sum = sum + i;
            }
            int el = sum / size;
            int[] array2 = new int[size - 1];
            for (int i = 0; i < size; i++)
            {
                if (i < el)
                {
                    array2[i] = array[i];
                }
                else if (i > el)
                {
                    array2[i-1] = array[i];
                }
            }
            Console.WriteLine("Итоговый массив: ");
            PrintMass(size, array2);
        }

        static int[] AutoMakeMass(int size, int[] array) //создание и заполнение одномерного массива случайными числами
        {
            array = new int[size];
            Random rand = new Random();
            for (int i = 0; i < array.Length; i++)
            {
                array[i] = rand.Next(-50, 50);
            }
            PrintMass(size, array);
            Console.WriteLine();
            FunctionForDeleteElement(size, array);
            return array;
        }

        static int[] HandMakeMass(int size, int[] array) //создание и заполнение одномерного массива вручную 
        {
            array = new int[size];

            for (int i = 0; i < array.Length; i++)
                array[i] = ReadInt(-50, 50);

            PrintMass(size, array);

            return array;
        }

        static void PrintMass(int size, int[] array)
        {
            for (int i = 0; i < array.Length; i++)
                Console.Write(array[i] + " | ");
        }

        static void AddColumn(int line, int column, int[,] array)
        {
            int [,] array2 = new int[line, column+1];
            for (int i = 0; i < line; i++)
            {
                for (int j = 0; j < column+1; j++)
                {
                    if (j < column)
                    {
                        array2[i, j] = array[i, j];
                    }
                    else  array2[i, j] = ReadInt(-50, 50);
                }
            }

            PrintTDMass(line, column, array2);
        }

        static int[ , ] AutoMakeTDMass(int line, int column, int[,] array) //*two-dimensional* создание и заполнение двумерного массива случайными числами
        {
            array = new int[line, column];
            Random rand = new Random();
            for (int i = 0; i < line; i++)
            {
                for (int j = 0; j < column; j++)
                {
                    array[i, j] = rand.Next(-50, 50);
                }
            }
            PrintTDMass(line, column, array);
            AddColumn(line, column, array);
            return array;
        }

        static int[ , ] HandMakeTDMass (int line, int column, int[,] array)//*two-dimensional* создание и заполнение двумерного массива вручную
            {
            array = new int[line, column];
            for (int i = 0; i < line; i++)
            {
                for (int j = 0; j < column; j++)
                {
                    array[i, j] = ReadInt(-50, 50);
                }
            }

            PrintTDMass(line, column, array);

            AddColumn(line, column, array);
            return array;
        }

        static void PrintTDMass(int line, int column, int[,] array)
        {
            for (int i = 0; i < line; i++)
            {
                for (int j = 0; j < column; j++)
                {
                    Console.Write(array[i, j] + " | ");
                }
                Console.WriteLine();
            }
        }

        static void DelLine(int line, int[][] array)
        {
            Console.Write("Введите элемент для поиска и удаления строк: ");
            int el = ReadInt(-50, 50);
            int sch = 0;
            for (int i = 0; i < line; i++)
            {
                for (int j = 0; j < array[i].Length; j++)
                {
                    if (array[i][j] == el)
                    {
                        array[i] = null;
                        sch++;
                        break;
                    }
                }
            }
            Console.WriteLine("Полученный массив: ");
            for (int i = 0; i < line; i++)
            {
                if (array[i] != null)
                {
                    for (int j = 0; j < array[i].Length; j++)
                    {
                        Console.Write(array[i][j] + " | ");
                    }
                    Console.WriteLine();
                }
            }
            Console.Write("Количество удаленных строк: " + sch);
        }

        static void PrintRagMass(int line, int[][] array)
        {
            Console.WriteLine("Ваш массив: ");
            for (int i = 0; i < line; i++)
            {
                for (int j = 0; j < array[i].Length; j++)
                {
                    Console.Write(array[i][j] + " | ");
                }
                Console.WriteLine();
            }
        }

        static int [][] AutoRagMass(int line, int[][] array) //*ragged* создание и заполнение рваного массива случайными числами
        {
            int column;
            array = new int[line][];
            Random rand = new Random();
            for (int i = 0; i < line; i++)
            {
                Console.Write("Количество элементов в строке: ");
                column = ReadInt(1, 10);
                array[i] = new int[column];
                for (int j = 0; j < column; j++)
                {
                    array[i] [j] = rand.Next(-50, 50);
                }
            }
            PrintRagMass(line, array);
            DelLine(line, array);
            return array;
        }

        static int [][] HandRagMass(int line, int[][] array)
        {
            int column;
            array = new int[line][];
            for (int i = 0; i < line; i++)
            {
                Console.Write("Количество элементов в строке: ");
                column = ReadInt(1, 10);
                array[i] = new int[column];
                for (int j = 0; j < column; j++)
                {
                    array[i][j] = ReadInt(-20, 20);
                }
            }
            PrintRagMass(line, array);
            return array;
         }

        static void Menu1()
        {
            Console.Write("Выбор способа ввода: " +
                "\n1. Ручной ввод" +
                "\n2. Автоматический ввод");
            int k = ReadInt(1, 2);
            if (k == 1)
            {
                Menu2();
            }
            else
            {
                Menu3();
            }

        }

        static void Menu2() //hand
        {
            Console.Write("Выбор массива: " +
                "\n1. Одномерный" +
                "\n2. Двумерный" +
                "\n3. Рваный" +
                "\n0 Выход\n");
            int k = ReadInt(0, 3);
            switch (k)
            {
                case 1:
                    Console.Write("Введите размер массива: ");
                    int size = ReadInt(1, 11);
                    int[] array = null;
                    HandMakeMass(size, array);
                    break;
                case 2:
                    Console.Write("Введите количество строк: ");
                    int line = ReadInt(1, 11);
                    Console.Write("\nВведите количество столбцов: ");
                    int column = ReadInt(1, 11);
                    int[,] array2 = null;
                    HandMakeTDMass(line, column, array2);
                    break;
                case 3:
                    Console.Write("Введите количество строк: ");
                    int lineR = ReadInt(1, 11);
                    int[][] array3 = null;
                    HandRagMass(lineR, array3);
                    break;
                case 0:
                    Environment.Exit(0);
                    break;
            }
        }

        static void Menu3()
        {
            Console.Write("Выбор массива: " +
                "\n1. Одномерный" +
                "\n2. Двумерный" +
                "\n3. Рваный" +
                "\n0 Выход\n");
            int k = ReadInt(0, 3);
            switch (k)
            {
                case 1:
                    Console.Write("Введите размер массива: ");
                    int size = ReadInt(1, 11);
                    int[] array = null;
                    AutoMakeMass(size, array);
                    break;
                case 2:
                    Console.Write("Введите количество строк: ");
                    int line = ReadInt(1, 11);
                    Console.Write("\nВведите количество столбцов: ");
                    int column = ReadInt(1, 11);
                    int[,] array2 = null;
                    AutoMakeTDMass(line, column, array2);
                    break;
                case 3:
                    Console.Write("Введите количество строк: ");
                    int lineR = ReadInt(1, 11);
                    int[][] array3 = null;
                    AutoRagMass(lineR, array3);
                    break;
                case 0:
                    Environment.Exit(0);
                    break;
            }
        }

        static void Main(string[] args)
        {
            Menu1();

            Console.ReadKey();
        }
    }
}
