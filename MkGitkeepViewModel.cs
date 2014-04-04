using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Diagnostics;

namespace MkGitkeep {
    class MkGitkeepViewModel : ViewModelBase {

        // エラー表示表のハンドラ
        Action<string, string> displayError;

        // コンストラクタ
        public MkGitkeepViewModel(Action<string, string> displayError) {

            LoadProperties();
            
            this.displayError = displayError;

            // タイトルを設定する
            FileVersionInfo fileVersionInfo = FileVersionInfo.GetVersionInfo(System.Reflection.Assembly.GetExecutingAssembly().Location);
            this.Title = string.Format("{0} - {1}",
                                Properties.Resources.MainWindowTitle,
                                fileVersionInfo.FileVersion
                            );
        }

        // タイトル
        public string Title {
            get;
            private set;
        }

        // ルートディレクトリ名
        private string rootDirectory = "";
        public string RootDirectory {
            get {
                return this.rootDirectory;
            }
            set {
                this.rootDirectory = value;
                this.OnPropertyChanged("RootDirectory");
            }
        }

        // ファイル名
        private string keepFilename = "";
        public string KeepFilename {
            get {
                return this.keepFilename;
            }
            set {
                this.keepFilename = value;
                this.OnPropertyChanged("KeepFilename");
            }
        }

        // 影響を受けたファイル名
        private string filenames = "";
        public string Filenames {
            get {
                return this.filenames;
            }
            set {
                this.filenames = value;
                this.OnPropertyChanged("Filenames");
            }
        }
        
        // 作成を行う
        public ICommand CreateGitkeep {
            get {
                return new DelegateCommand((param) => {
                    try {
                        Gitkeep gitkeep = new Gitkeep(this.KeepFilename);
                        List<string> filenames = gitkeep.Create(RootDirectory);
                        this.Filenames = string.Join("\n", filenames);
                    } catch (Exception ex) {
                        displayError(ex.Message, Properties.Resources.ErrorMessageCaption);
                    }
                });
            }
        }

        // 削除を行う
        public ICommand RemoveGitkeep {
            get {
                return new DelegateCommand((param) => {
                    try {
                        Gitkeep gitkeep = new Gitkeep(this.KeepFilename);
                        List<string> filenames = gitkeep.Remove(RootDirectory);
                        this.Filenames = string.Join("\n", filenames);
                    } catch (Exception ex) {
                        displayError(ex.Message, Properties.Resources.ErrorMessageCaption);
                    }
                });
            }
        }

        // プロパティをロードする
        private void LoadProperties() {
            string rootDirectory = Properties.Settings.Default.RootDirectory;
            string keepFilename = Properties.Settings.Default.KeepFilename;

            this.RootDirectory = rootDirectory;

            if (string.IsNullOrEmpty(keepFilename)) {
                this.KeepFilename = Gitkeep.GetDefaultKeepFilename();
            } else {
                this.KeepFilename = keepFilename.Trim();
            }
        }

        // プロパティを保存する
        public void SaveProperties() {
            Properties.Settings.Default.RootDirectory = this.RootDirectory;
            Properties.Settings.Default.KeepFilename = this.KeepFilename;

            Properties.Settings.Default.Save();
        }
    }
}
