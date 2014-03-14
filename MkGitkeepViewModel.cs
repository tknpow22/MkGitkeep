using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace MkGitkeep {
    class MkGitkeepViewModel : ViewModelBase {

        // エラー表示表のハンドラ
        Action<string, string> displayError;

        // コンストラクタ
        public MkGitkeepViewModel(string rootDirectory, string keepFilename, Action<string, string> displayError) {
            this.displayError = displayError;
            this.RootDirectory = rootDirectory;

            if (string.IsNullOrEmpty(keepFilename)) {
                this.KeepFilename = Gitkeep.GetDefaultKeepFilename();
            } else {
                this.KeepFilename = keepFilename.Trim();
            }
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
    }
}
