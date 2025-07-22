using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using static System.Runtime.InteropServices.JavaScript.JSType;

var configBuilder = new ConfigurationBuilder();
configBuilder.AddJsonFile("Dz1.json");

var config=configBuilder.Build();

var connectionString = config.GetConnectionString("Default");


using SqlConnection conn = new(connectionString);


while (true)
{
    Console.WriteLine("1.Add book.\n2.Show all.\n3.Books count.\n4.Find by author.\n5.Delete book\n0.Exit");
    string choice=Console.ReadLine();

    if (choice == "1")
    {
        Console.Write("Title: ");
        string title = Console.ReadLine();
        Console.Write("Author: ");
        string author = Console.ReadLine();
        Console.Write("Year: ");
        int year = Convert.ToInt32(Console.ReadLine());
        Console.Write("Month: ");
        int month = Convert.ToInt32(Console.ReadLine());
        Console.Write("Day: ");
        int day = Convert.ToInt32(Console.ReadLine());

        string yearPublished = $"{day}{month}{year}";

        var add = new SqlCommand($"INSERT INTO Books (Title, Author, YearPublished) " + $"VALUES ('{title}', '{author}', '{yearPublished}')", conn);

        conn.Open();

        add.ExecuteNonQuery();

        conn.Close();   
    }

    else if (choice == "2")
    {
        var command = new SqlCommand("select * from Books", conn);

        conn.Open();

        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            Console.WriteLine($"Id: {reader[0]}, Title: {reader[1]}, Author: {reader[2]}, yearPublished: {reader[3]}");
        }

        conn.Close();
    }

    else if (choice == "3")
    {
        var command = new SqlCommand("SELECT COUNT(*) FROM Books", conn);
        conn.Open();
        var res = command.ExecuteScalar(); 
        Console.WriteLine($"Count: {res}");
        conn.Close();
    }

    else if (choice == "4")
    {
        Console.Write("Author's name: ");
        string author= Console.ReadLine();
        var command = new SqlCommand($"select * from Books where Author='{author}'", conn);

        conn.Open();

        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            Console.WriteLine($"Id: {reader[0]}, Title: {reader[1]}, Author: {reader[2]}, yearPublished: {reader[3]}");
        }

        conn.Close();
    }

    else if (choice == "5")
    {
        Console.Write("Id: ");
        int id=Convert.ToInt32(Console.ReadLine()); 
        var delete = new SqlCommand($"delete from Books where Id={id} ", conn);
        conn.Open();

        delete.ExecuteNonQuery();

        conn.Close();
    }

    else if (choice == "0") {
        break;
    }
}
