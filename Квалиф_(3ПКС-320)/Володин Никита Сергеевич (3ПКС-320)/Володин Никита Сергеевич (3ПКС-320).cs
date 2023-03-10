using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Serialization;
using static System.Math;
namespace ConsoleApp3
{
    public class Employee
    {
        public string second_name;
        public List<int> sal = new List<int>();
        public Employee()
        {
          second_name= string.Empty;
        }
        public Employee(string lastName, string salary)
        {
            int[] a = salary.Split(',').Select(int.Parse).ToArray();

            second_name = lastName;
            for (int i = 0; i < a.Length; i++)
            {
                sal.Add(a[i]);
            }

        }
        public Employee(string lastName)
        {
            second_name = lastName;
            Random rnd = new Random();
            int amount = rnd.Next(1, 10);
            for (int i = 0; i < amount; i++)
            {
                int am = rnd.Next(40000, 60000);
                sal.Add(am);
            }
        }
        public void show()
        {
            Console.WriteLine($"Last name is:{second_name}");
            for (int i = 0; i < sal.Count; i++)
            {
                Console.WriteLine($"{i + 1}-salary is:{sal[i]}");
            }
        }
        public void avr()
        {
            double sum = 0;
            double average = 0;
            for (int i = 0; i < sal.Count; i++)
            {
                sum += sal[i];
                average = sum / sal.Count;
            }
            Console.WriteLine($"Amount of salaries is:{sum}");
            Console.WriteLine($"Avarage salary is:{Math.Round(average,2)}");
        }  
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            int counter = 0;
            List<Employee> workers = new List<Employee>();
            while (counter != 3)
            {



                Console.WriteLine("Enter second name of worker:");
                string name = Console.ReadLine();
                Console.WriteLine("Would you like to add salaries?\nPress 1 if yes, else press 2");
                int choice = Convert.ToInt32(Console.ReadLine());
                if (choice == 1)
                {
                    Console.WriteLine("Enter salaries of worker:");
                    string salaries = Console.ReadLine();
                    workers.Add(new Employee(name, salaries));
                }
                else if (choice == 2)
                {
                    workers.Add(new Employee(name));
                }
                else
                {
                    Console.WriteLine("Your input is incorrect");
                }
                counter++;
            }
            workers[0].avr();
            workers[1].avr();
            workers[2].avr();
            
                var serializer = new XmlSerializer(typeof(List<Employee>));
                using (var writer = new StreamWriter("C:/Users/208512/spisok"))
                {
                    serializer.Serialize(writer, workers);
                }
        }
    }
}
