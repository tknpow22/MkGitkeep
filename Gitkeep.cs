﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace MkGitkeep {

    class GitKeepException : Exception {
        public GitKeepException(string message)
            : base(message) {
        }
    }
    
    class Gitkeep {

        // デフォルトのファイル名を返す
        public static string GetDefaultKeepFilename() {
            return ".gitkeep";
        }

        // ファイル名
        private string keepFilename;

        // コンストラクタ
        public Gitkeep(string keepFilename) {
            if (keepFilename == null || keepFilename.Trim().Length == 0) {
                throw new GitKeepException(Properties.Resources.InputFilenameAlert);
            }

            this.keepFilename = keepFilename;
        }

        // ディレクトリ配下にファイルを作成する
        public List<string> Create(string rootDirectory, bool isCheckGitRepository) {
            ThrowExceptionIfError(rootDirectory, isCheckGitRepository);

            List<string> filenames = new List<string>();

            IEnumerable<string> directories = Directory.EnumerateDirectories(rootDirectory, "*", SearchOption.TopDirectoryOnly);
            foreach (string directory in directories) {
                string dirname = Path.GetFileName(directory);
                if (string.Compare(dirname, ".git", StringComparison.CurrentCulture) == 0) {
                    continue;
                }

                CreateKeepFile(directory, filenames);
                IEnumerable<string> subDirectories = Directory.EnumerateDirectories(directory, "*", SearchOption.AllDirectories);
                foreach (string subDirectory in subDirectories) {
                    CreateKeepFile(subDirectory, filenames);
                }
            }

            return filenames;
        }

        // ディレクトリ下にファイルを作成する
        private void CreateKeepFile(string directory, List<string> filenames) {
            string[] entries = Directory.GetFileSystemEntries(directory);
            if (entries.Length == 0) {
                // ディレクトリが空なら、".gitkeep" ファイルを作成する
                string keepFilepath = Path.Combine(directory, this.keepFilename);
                Touch(keepFilepath);
                filenames.Add(keepFilepath);
            } else if (entries.Length == 1) {
                // ディレクトリに ".gitkeep" しか無い場合でも、一応、再作成する
                string filepath = entries[0];
                string filename = Path.GetFileName(filepath);
                if (filename.Equals(this.keepFilename, StringComparison.CurrentCultureIgnoreCase)) {
                    Touch(filepath);
                    filenames.Add(filepath);
                }
            }
        }

        // ディレクトリ配下のファイルを削除する
        public List<string> Remove(string rootDirectory, bool isCheckGitRepository) {
            ThrowExceptionIfError(rootDirectory, isCheckGitRepository);

            List<string> filenames = new List<string>();

            IEnumerable<string> keepFiles = Directory.EnumerateFiles(rootDirectory, this.keepFilename, SearchOption.AllDirectories);
            foreach (string keepFilepath in keepFiles) {
                Untouch(keepFilepath);
                filenames.Add(keepFilepath);
            }

            return filenames;
        }

        // ファイルを作成する
        private void Touch(string filepath) {
            if (File.Exists(filepath)) {
                // 再作成するために一度削除する
                File.Delete(filepath);
            }
            using (FileStream stream = File.Create(filepath)) {
                stream.Close(); // 念のため
            }
        }

        // ファイルを削除する
        private void Untouch(string filepath) {
            File.Delete(filepath);
        }

        // チェック
        private void ThrowExceptionIfError(string rootDirectory, bool isCheckGitRepository) {
            if (rootDirectory == null || rootDirectory.Trim().Length == 0) {
                throw new GitKeepException(Properties.Resources.InputFolderpathAlert);
            }
            if (this.keepFilename == null || this.keepFilename.Trim().Length == 0) {
                throw new GitKeepException(Properties.Resources.InputFilenameAlert);
            }
            if (isCheckGitRepository) {
                string gitRepodataFolder = Path.Combine(rootDirectory, ".git");

                if (!Directory.Exists(gitRepodataFolder)) {
                    throw new GitKeepException(Properties.Resources.NotFindGitFolderAlert);
                }
            }
        }
    }
}
