using System;
using System.Collections.Generic;
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

namespace MkGitkeep {
    /// <summary>
    /// MainWindow.xaml の相互作用ロジック
    /// </summary>
    public partial class MainWindow : Window {
        public MainWindow() {
            InitializeComponent();

            if (0 < Properties.Settings.Default.MainWindowWidth) {
                this.Width = Properties.Settings.Default.MainWindowWidth;
            }
            if (0 < Properties.Settings.Default.MainWindowHeight) {
                this.Height = Properties.Settings.Default.MainWindowHeight;
            }

            Action<string, string> displayError = (msg, caption) => {
                MessageBox.Show(this, msg, caption, MessageBoxButton.OK, MessageBoxImage.Error);
            };

            MkGitkeepViewModel viewModel = new MkGitkeepViewModel(
                    Properties.Settings.Default.RootDirectory,
                    Properties.Settings.Default.KeepFilename,
                    displayError
                );
            this.DataContext = viewModel;
        }

        private void OpenRootDirecoty_Click(object sender, RoutedEventArgs e) {
            System.Windows.Forms.FolderBrowserDialog fbd = new System.Windows.Forms.FolderBrowserDialog();
            fbd.Description = "フォルダパスを指定してください:";
            fbd.ShowNewFolderButton = false;

            System.Windows.Forms.DialogResult dr = fbd.ShowDialog();
            if (dr == System.Windows.Forms.DialogResult.OK) {
                RootDirectory.Text = fbd.SelectedPath;
            }
        }

        private void RootDirectory_PreviewDragOver(object sender, DragEventArgs e) {
            e.Handled = e.Data.GetDataPresent(DataFormats.FileDrop);
        }

        private void RootDirectory_Drop(object sender, DragEventArgs e) {
            string[] files = e.Data.GetData(DataFormats.FileDrop) as string[];
            if (files != null) {
                RootDirectory.Text = files[0];
            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e) {
            Properties.Settings.Default.RootDirectory = RootDirectory.Text;
            Properties.Settings.Default.KeepFilename = KeepFilename.Text;

            Properties.Settings.Default.MainWindowWidth = this.Width;
            Properties.Settings.Default.MainWindowHeight = this.Height;

            Properties.Settings.Default.Save();
        }

    }
}
