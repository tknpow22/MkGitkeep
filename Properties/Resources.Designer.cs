﻿//------------------------------------------------------------------------------
// <auto-generated>
//     このコードはツールによって生成されました。
//     ランタイム バージョン:4.0.30319.34014
//
//     このファイルへの変更は、以下の状況下で不正な動作の原因になったり、
//     コードが再生成されるときに損失したりします。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MkGitkeep.Properties {
    using System;
    
    
    /// <summary>
    ///   ローカライズされた文字列などを検索するための、厳密に型指定されたリソース クラスです。
    /// </summary>
    // このクラスは StronglyTypedResourceBuilder クラスが ResGen
    // または Visual Studio のようなツールを使用して自動生成されました。
    // メンバーを追加または削除するには、.ResX ファイルを編集して、/str オプションと共に
    // ResGen を実行し直すか、または VS プロジェクトをビルドし直します。
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class Resources {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Resources() {
        }
        
        /// <summary>
        ///   このクラスで使用されているキャッシュされた ResourceManager インスタンスを返します。
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("MkGitkeep.Properties.Resources", typeof(Resources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   厳密に型指定されたこのリソース クラスを使用して、すべての検索リソースに対し、
        ///   現在のスレッドの CurrentUICulture プロパティをオーバーライドします。
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Browse に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string BrowseFileButtonCaption {
            get {
                return ResourceManager.GetString("BrowseFileButtonCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Please specify a Folder path: に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string BrowseFileDialogTitle {
            get {
                return ResourceManager.GetString("BrowseFileDialogTitle", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Create に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string CreateButtonCaption {
            get {
                return ResourceManager.GetString("CreateButtonCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Delete に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string DeleteButtonCaption {
            get {
                return ResourceManager.GetString("DeleteButtonCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Error に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string ErrorMessageCaption {
            get {
                return ResourceManager.GetString("ErrorMessageCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Filename: に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string FilenameLabelCaption {
            get {
                return ResourceManager.GetString("FilenameLabelCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Folder path: に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string FolderpathLabelCaption {
            get {
                return ResourceManager.GetString("FolderpathLabelCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Please input Filename. に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string InputFilenameAlert {
            get {
                return ResourceManager.GetString("InputFilenameAlert", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Please input Folder path. に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string InputFolderpathAlert {
            get {
                return ResourceManager.GetString("InputFolderpathAlert", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Check Git repository に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string IsCheckGitRepositoryCaption {
            get {
                return ResourceManager.GetString("IsCheckGitRepositoryCaption", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Make .gitkeep file に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string MainWindowTitle {
            get {
                return ResourceManager.GetString("MainWindowTitle", resourceCulture);
            }
        }
        
        /// <summary>
        ///   It is not a folder of Git repository. に類似しているローカライズされた文字列を検索します。
        /// </summary>
        public static string NotFindGitFolderAlert {
            get {
                return ResourceManager.GetString("NotFindGitFolderAlert", resourceCulture);
            }
        }
    }
}
