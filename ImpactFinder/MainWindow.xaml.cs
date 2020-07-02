using Microsoft.WindowsAPICodePack.Dialogs;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ImpactFinder
{
    /// <summary>
    /// MainWindow.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            

            
        }
        

        private void button_Click(object sender, RoutedEventArgs e)
        {
            CommonOpenFileDialog folderDialog = new CommonOpenFileDialog() { InitialDirectory = "", IsFolderPicker = true };

            if (folderDialog.ShowDialog() == CommonFileDialogResult.Ok) { FolderPathTextBox.Text = folderDialog.FileName; }

        }


        private void FindFileButton_Click(object sender, RoutedEventArgs e)
        {

            if(FolderPathTextBox.Text.Length < 0)
            {
                MessageBox.Show("검색할 폴더 경로를 입력해 주세요.");
                return;
                
            }
            if (FindNameTextBox.Text.Length < 0)
            {
                MessageBox.Show("검색할 텍스트를 입력해주세요.");
                return;

            }

            searchImpact();

        }

        public DataTable CreateDataTable()
        {
           DataTable dataTable = new DataTable();
           dataTable.Columns.Add("FILEPATH", typeof(string));
           dataTable.Columns.Add("FILENAME", typeof(string));
           dataTable.Columns.Add("FINDTEXT", typeof(string));

            return dataTable;
        }




        public void searchImpact()
        {
            bool bExist = false;
            FileInfo[] file = fileList(FolderPathTextBox.Text);
            DataTable dataTable = CreateDataTable();

            // 파일 리스트 많큼 for 
            for (int i=0; i < file.Length; i++)
            {
                // 경로 포함 파일명  
                String fileName = file[i].FullName;

                // 확장자 검색
                String[] str = ExtTextBox.Text.Split(',');

                String[] findNames = FindNameTextBox.Text.Split(',');

                foreach(String findName in findNames)
                {
                    // 확장자 있는 경우
                    if (str.Length > 0)
                    {
                        foreach (string ext in str)
                        {
                            if (ext.Trim() == file[i].Extension)
                            {
                                FileSearch(file[i], dataTable, findName.Trim(), bExist);
                            }
                        }
                    }
                    // 검색하려는 확장자가 없는 경우
                    else
                    {
                        FileSearch(file[i], dataTable, findName.Trim(), bExist);
                    }
                }

            }
            dataTable.DefaultView.Sort = "FINDTEXT desc";
            dataGrid.ItemsSource = dataTable.DefaultView;

        }

        public DataTable FileSearch(FileInfo file, DataTable dataTable, String findName, bool bExist)
        {
            

            string sContents = File.ReadAllText(file.FullName, Encoding.Default);

            int result = sContents.IndexOf(findName);

            if (result != -1)
            {
                dataTable.Rows.Add(new string[] { file.Directory.FullName, file.Name, findName });
                Console.WriteLine(file.FullName + ", "+ findName);
            }


            return dataTable;
        }

        /*선택한 경로 하위 모든 파일정보를 불러온다*/
        public FileInfo[] fileList(String searchPath)
        {
            DirectoryInfo Di = new DirectoryInfo(searchPath);
            FileInfo[] file = Di.GetFiles("*", SearchOption.AllDirectories);
            return file;
        }

    }
}
