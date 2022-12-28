using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Examen
{
    class sotrudnik //класс сотрудник
    {
        public string subname; //характеристика "фамилия"
        public List<int> zarpl = new List<int>(); //характеристика "коллекция зарплат по месяцам"
        public sotrudnik() { }
        public sotrudnik(string sn) { subname = sn; } //способ создания класса вида "название_класса(фамилия)"
        public sotrudnik(string sn, List<int> m) { } //способ создания класса вида "название_класса(фамилия, зарплаты)"
        public void infa() //метод для вывода на экран информации о зарплатах
        {
            Console.Write("Фамилия сотрудника: " + subname + "; Зарплата: ");
            for (int i = 0; i < zarpl.Count; i++)
            {
                if (i == zarpl.Count - 1) { Console.Write(zarpl[i] + "."); }
                else { Console.Write(zarpl[i] + ", "); }
            }
            Console.WriteLine();
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Random rnd = new Random();
            int a = rnd.Next(1, 11); //генерация количества зарплат
            int b = rnd.Next(40000, 60001); //генерация зарплаты
            string tofile = "";
            sotrudnik[] sotrudniks = new sotrudnik[] { new sotrudnik("Костиков"), new sotrudnik("Снежная"), new sotrudnik("Дилеева") }; //коллекция с 3 объектами класса
            for (int i = 0; i < sotrudniks.Length; i++)
            {
                for (int j = 0; j < a; j++)
                {
                    sotrudniks[i].zarpl.Add(b);
                    b = rnd.Next(40000, 60001);//генерация зарплат
                }
                a = rnd.Next(1, 11);//генерация количества зарплат
            }
            for (int i = 0; i < sotrudniks.Length; i++)
            {
                sotrudniks[i].infa();
            }
            //пример кода, выполненного в ассемблере, для вывода на консоль в программе c#
            double[] summa = new double[3]{ 0,0,0};
            double[] sr_zp = new double[3];
            int sch = 0;
            for (int i = 0; i < sotrudniks.Length; i++)
            {
                for (int j = 0; j < sotrudniks[i].zarpl.Count; j++)
                {
                    summa[i] = summa[i] + sotrudniks[i].zarpl[j];
                    sch = sch+1;
                }
                sr_zp[i] = summa[i] / sch;
                sch = 0;
            }
            Math.Round(sr_zp[0], 2);
            for (int i = 0; i < sotrudniks.Length; i++)
            {
                Console.WriteLine("Сумма зарплат: " + summa[i] + ", средняя зарплата: " + Math.Round(sr_zp[i], 2));
            }
            //заполнение переменной типа string информацией, которую необходимо вывести в файл.txt 
            for (int i = 0; i < sotrudniks.Length; i++)
            {
                if (sotrudniks[i].zarpl.Count >= 6)
                {
                    tofile = tofile + sotrudniks[i].subname + ", зарплата за 6 месяцев: " + sotrudniks[i].zarpl[0] + " " + sotrudniks[i].zarpl[1] + " " + sotrudniks[i].zarpl[2] + " " + sotrudniks[i].zarpl[3] + " " + sotrudniks[i].zarpl[4] + " " + sotrudniks[i].zarpl[5] + ", средняя зарплата " + Math.Round(sr_zp[i], 2) + "\n";
                }
                else {
                    tofile = tofile + sotrudniks[i].subname + ", зарплата за 6 месяцев: ";
                    for (int j = 0; j < sotrudniks[i].zarpl.Count; j++)
                    {
                        tofile = tofile + sotrudniks[i].zarpl[j] + " ";
                    }
                    tofile = tofile + ", средняя зарплата " + Math.Round(sr_zp[i], 2) + "\n";
                }
            }
            string path = @"C:\Users\tinag\OneDrive\Рабочий стол\дз\экзамен.txt";//указание пути к файлу, в который идёт вывод информации
            File.WriteAllText(path, tofile);//запись информации в файл
            string name = File.ReadAllText(path);//чтение информации с файла
            Console.WriteLine(name);//вывод в консоль информации из файла
            Console.ReadKey(true);
        }
    }
}
