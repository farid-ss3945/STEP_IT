using System.IO;
using System.Text;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using UserInfo;

namespace Login;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
    }
    private void Register_OnClick(object sender, RoutedEventArgs e)
    {
        User user = new User();
        user._name = Username.Text;
        user._pwd = Password.Text;
        var options = new JsonSerializerOptions
        {
            IncludeFields = true,
            WriteIndented = true
        };
            
        if (Username.Text.Length>0 && Password.Text.Length >= 4 && !File.Exists($"C:\\Users\\MSI1\\RiderProjects\\Login\\Login\\bin\\Debug\\net9.0-windows\\{Username.Text}Root\\"+user._name + ".json")) 
        {
            Directory.CreateDirectory(Username.Text+"Root");
            File.WriteAllText($"C:\\Users\\MSI1\\RiderProjects\\Login\\Login\\bin\\Debug\\net9.0-windows\\{Username.Text}Root\\"+user._name + ".json", JsonSerializer.Serialize(user,options));
            Reg_1.Visibility = Visibility.Collapsed;
            Main.Visibility = Visibility.Visible;
        }
        else if (File.Exists($"C:\\Users\\MSI1\\RiderProjects\\Login\\Login\\bin\\Debug\\net9.0-windows\\{Username.Text}Root\\"+user._name + ".json"))
        {
            MessageBox.Show("There is a user with this name,maybe you wanna login?67");
        }
        else
        {
            MessageBox.Show("Incorrect authorization data(Password must have atleast 4 symbols)");
        }
        Username.Clear();
        Password.Clear();
        
    }

    private void Login_OnClick(object sender, RoutedEventArgs e)
    {
        Username.Clear();
        Password.Clear();
        Reg_1.Visibility = Visibility.Collapsed;
        LogView.Visibility = Visibility.Visible;
    }

    private void Login_2_OnClick_OnClick(object sender, RoutedEventArgs e)
    {
        var options = new JsonSerializerOptions
        {
            IncludeFields = true,
            WriteIndented = true
        };

        if (!File.Exists($"C:\\Users\\MSI1\\RiderProjects\\Login\\Login\\bin\\Debug\\net9.0-windows\\{Username_2.Text}Root\\"+Username_2.Text + ".json"))
        {
            MessageBox.Show("User not found");
            return;
        }

        string jsonText = File.ReadAllText($"C:\\Users\\MSI1\\RiderProjects\\Login\\Login\\bin\\Debug\\net9.0-windows\\{Username_2.Text}Root\\"+Username_2.Text + ".json");
        var json = JsonSerializer.Deserialize<User>(jsonText, options);

        if (Password_2.Text == json._pwd)
        {
            Username_2.Clear();
            Password_2.Clear();
            LogView.Visibility = Visibility.Collapsed;
            Main.Visibility = Visibility.Visible;
        }
        else
        {
            MessageBox.Show("Incorrect Password");
        }
    }


    private void Back_OnClick(object sender, RoutedEventArgs e)
    {
        Username_2.Clear();
        Password_2.Clear();
        LogView.Visibility = Visibility.Collapsed;
        Reg_1.Visibility = Visibility.Visible;
    }

    private void BackToReg_OnClick(object sender, RoutedEventArgs e)
    {
        Main.Visibility = Visibility.Collapsed;
        Reg_1.Visibility = Visibility.Visible;
    }
}