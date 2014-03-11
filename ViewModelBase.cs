using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Diagnostics;

namespace MkGitkeep {
    /// <summary>
    /// INotifyPropertyChanged を実装する
    /// </summary>
    abstract class ViewModelBase : INotifyPropertyChanged {

        /// <summary>
        /// プロパティに変更があった場合に呼び出す
        /// </summary>
        /// <param name="propertyName">プロパティ名</param>
        protected virtual void OnPropertyChanged(string propertyName) {

            VerifyPropertyName(propertyName);

            PropertyChangedEventHandler handler = this.PropertyChanged;
            if (handler != null) {
                handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }

        #region INotifyPropertyChanged の実装

        /// <summary>
        /// プロパティに変更があったときに発生する
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

        #endregion INotifyPropertyChanged の実装

        /// <summary>
        /// デバッグ用にプロパティ名をチェックする
        /// </summary>
        /// <param name="propertyName"></param>
        [Conditional("DEBUG")]
        protected void VerifyPropertyName(string propertyName) {

            if (TypeDescriptor.GetProperties(this)[propertyName] == null) {
                throw new Exception(
                        string.Format("Invalid property name: [{0}]", propertyName)
                    );
            }
        }
    }
}
