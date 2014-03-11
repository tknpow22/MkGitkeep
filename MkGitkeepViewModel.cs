using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace MkGitkeep {
    class MkGitkeepViewModel : ViewModelBase {

        Action<string, string> displayError;

        public MkGitkeepViewModel(string rootDirectory, string keepFilename, Action<string, string> displayError) {
            this.displayError = displayError;
            this.RootDirectory = rootDirectory;

            if (keepFilename == null || keepFilename.Trim().Length == 0) {
                this.KeepFilename = Gitkeep.GetDefaultKeepFilename();
            } else {
                this.KeepFilename = keepFilename.Trim();
            }
        }

        // ルートディレクトリ名
        private string rootDirectory_;
        public string RootDirectory {
            get {
                return this.rootDirectory_;
            }
            set {
                this.rootDirectory_ = value;
                this.OnPropertyChanged("RootDirectory");
            }
        }

        // デフォルトのファイル名
        private string keepFilename_;
        public string KeepFilename {
            get {
                return this.keepFilename_;
            }
            set {
                this.keepFilename_ = value;
                this.OnPropertyChanged("KeepFilename");
            }
        }

        // 影響を受けたファイル名
        private string filenames_ = "";
        public string Filenames {
            get {
                return this.filenames_;
            }
            set {
                this.filenames_ = value;
                this.OnPropertyChanged("Filenames");
            }
        }
        
        // 作成を行う
        public ICommand CreateGitkeep {
            get {
                return new DelegateCommand((param) => {
                    ExecCreateGitkeep();
                });
            }
        }

        public void ExecCreateGitkeep() {
            try {
                Gitkeep gitkeep = new Gitkeep(KeepFilename);
                List<string> filenames = gitkeep.Create(RootDirectory);
                this.Filenames = string.Join("\n", filenames);
            } catch (Exception ex) {
                displayError(ex.Message, "エラー");
            }
        }

        // 削除を行う
        public ICommand RemoveGitkeep {
            get {
                return new DelegateCommand((param) => {
                    ExecRemoveGitkeep();
                });
            }
        }

        public void ExecRemoveGitkeep() {
            try {
                Gitkeep gitkeep = new Gitkeep(KeepFilename);
                List<string> filenames = gitkeep.Remove(RootDirectory);
                this.Filenames = string.Join("\n", filenames);
            } catch (Exception ex) {
                displayError(ex.Message, "エラー");
            }
        }
    }
}
