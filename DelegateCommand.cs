using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MkGitkeep {
    class DelegateCommand : ICommand {

        /// <summary>
        /// 実行する処理
        /// </summary>
        readonly Action<object> execute;

        /// <summary>
        /// 処理を実行してよいかをチェックする処理
        /// </summary>
        readonly Predicate<object> canExecute;

        /// <summary>
        /// コンストラクタ
        /// </summary>
        /// <param name="execute">実行する処理</param>
        public DelegateCommand(Action<object> execute) :
            this(execute, null) {
        }

        /// <summary>
        /// コンストラクタ
        /// </summary>
        /// <param name="execute">実行する処理</param>
        /// <param name="canExecute">処理を実行してよいかをチェックする処理</param>
        public DelegateCommand(Action<object> execute, Predicate<object> canExecute) {

            if (execute == null) {
                throw new ArgumentNullException("execute");
            }

            if (canExecute == null) {
                // デフォルトで常に真を返すチェック処理を渡す
                canExecute = (p) => true;
            }

            this.execute = execute;
            this.canExecute = canExecute;
        }

        #region ICommand の実装

        /// <summary>
        /// 処理を実行してよいかをチェックする
        /// </summary>
        /// <param name="parameter">パラメータ</param>
        /// <returns>実行してよい場合は真を返す</returns>
        bool ICommand.CanExecute(object parameter) {
            return this.canExecute(parameter);
        }

        /// <summary>
        /// 処理を実行してよいかどうかに変更があったことを通知するためのイベント
        /// </summary>
        event EventHandler ICommand.CanExecuteChanged {
            add {
                CommandManager.RequerySuggested += value;
            }
            remove {
                CommandManager.RequerySuggested -= value;
            }
        }

        /// <summary>
        /// 処理を実行する
        /// </summary>
        /// <param name="parameter">パラメータ</param>
        void ICommand.Execute(object parameter) {
            this.execute(parameter);
        }

        #endregion ICommand の実装
    }
}
