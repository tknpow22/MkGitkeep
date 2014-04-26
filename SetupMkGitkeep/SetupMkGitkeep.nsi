;============================================================================
; NSIS スクリプト: NSIS 2.4x 系用
;----------------------------------------------------------------------------
;   HM NIS Edit で作成したものをカスタマイズしました。
;   言語ファイル "Japanese" のフォントおよびメッセージを変更したかったため、
;   NSIS 附属の Japanese.nlf、Japanese.nsh をコピーして、
;   MkGitkeep.nlf、MkGitkeep.nsh を作成しました。
;   MkGitkeep.nlf でフォントを変更し、MkGitkeep.nsh でメッセージを変更しています。
;   このため、本スクリプトをコンパイルするには、MkGitkeep.nlf、MkGitkeep.nsh を
;   事前に ${NSISDIR}\Contrib\Language files\ 下にコピーしておく必要があります。
;   なお、メッセージの一部だけ再定義(再ロード)したため、コンパイル時に二重定義の
;   警告が出てしまいますが、動作には支障ありませんので、無視して下さい。
;   ほかにも、バージョン情報を言語に関係なく定義したりと、きちんとした形では
;   MUI を利用できていません。
;============================================================================

;----------------------------------------------------------------------------
; インクルード
;----------------------------------------------------------------------------

!include "LogicLib.nsh"

;----------------------------------------------------------------------------
; 情報など
;----------------------------------------------------------------------------

!define PRODUCT_NAME "MkGitkeep"
!define PRODUCT_VERSION "1.0.0.9"
!define PRODUCT_PUBLISHER "Bono"
!define PRODUCT_WEB_SITE "http://www.koutou-software.co.jp/junk/make-gitkeep.html"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\Bono.MkGitkeep"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

;----------------------------------------------------------------------------
; MUI のための設定
;----------------------------------------------------------------------------

!include "MUI2.nsh"

!define MUI_ABORTWARNING
!define MUI_WELCOMEFINISHPAGE_BITMAP "Graphics\Title.bmp"
!define MUI_ICON "..\MkGitkeep.ico"
!define MUI_UNICON "..\MkGitkeep.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "Graphics\HeaderInstall.bmp"

;----------------------------------------------------------------------------
; 表示するページの選択
;----------------------------------------------------------------------------

; ようこそページ
!insertmacro MUI_PAGE_WELCOME
; コンポーネント選択ページ
!insertmacro MUI_PAGE_COMPONENTS
; フォルダ選択ページ
!insertmacro MUI_PAGE_DIRECTORY
; インストール進捗ページ
!insertmacro MUI_PAGE_INSTFILES
; 最終ページ
!insertmacro MUI_PAGE_FINISH

; アンインストール進捗ページ
!insertmacro MUI_UNPAGE_INSTFILES

;----------------------------------------------------------------------------
; 言語ファイルとメッセージの再定義
;----------------------------------------------------------------------------
; NOTE: ここでメッセージを再定義しているため、コンパイル時にその旨、警告が表示されますが
;       無視して下さい。

; 言語ファイル
;;;;!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "MkGitkeep"

; インストールの初期画面に表示するメッセージ
; NOTE: ${PRODUCT_VERSION} を参照したいために、ここで再定義しています。
LangString MUI_TEXT_WELCOME_INFO_TEXT ${LANG_MkGitkeep} "このウィザードは、$(^NameDA)のインストールの手順をご案内します。$\r$\n$\r$\nインストールする$(^NameDA)のバージョン: ${PRODUCT_VERSION}$\r$\n$\r$\n$_CLICK"

; アンインストール後のサブタイトルメッセージ
;LangString MUI_UNTEXT_FINISH_SUBTITLE ${LANG_MkGitkeep} "アンインストールに成功しました。「閉じる」で画面を閉じて下さい。"

;----------------------------------------------------------------------------
; インストーラ定義
;----------------------------------------------------------------------------

Name "${PRODUCT_NAME}"
OutFile "SetupMkGitkeep.exe"
InstallDir "$PROGRAMFILES\MkGitkeep"
ShowInstDetails show
ShowUnInstDetails show

; ファイルに付与するバージョン情報

VIAddVersionKey /LANG=${LANG_MkGitkeep} "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_MkGitkeep} "CompanyName" "${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_MkGitkeep} "OriginalFilename" "MkGitkeep.exe"
VIAddVersionKey /LANG=${LANG_MkGitkeep} "ProductVersion" "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_MkGitkeep} "LegalCopyright" "Copyleft 2014 ${PRODUCT_PUBLISHER}."
VIAddVersionKey /LANG=${LANG_MkGitkeep} "FileDescription" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_MkGitkeep} "FileVersion" "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_MkGitkeep} "InternalName" "MkGitkeep.exe"

VIProductVersion "${PRODUCT_VERSION}"

;============================================================================
; インストール処理
;============================================================================

;----------------------------------------------------------------------------
; MkGitkeep 本体セクション
;----------------------------------------------------------------------------

Section "MkGitkeep" MkGitkeepSection

  SetShellVarContext all
  SetOutPath "$INSTDIR"
  SetOverwrite on

  ; ファイルをコピーする
  File "..\bin\Release\MkGitkeep.exe"
  File /r "..\bin\Release\ja-JP"

  ; アンインストーラを作成する
  WriteUninstaller "$INSTDIR\UninstallMkGitkeep.exe"

  ; アンインストール情報を登録する
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\MkGitkeep.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\UninstallMkGitkeep.exe"
  WriteRegDWORD ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "VersionMajor" 0x1
  WriteRegDWORD ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "VersionMinor" 0x0

SectionEnd

;----------------------------------------------------------------------------
; スタートメニューに登録セクション
;----------------------------------------------------------------------------

Section "スタートメニューに登録する" MkGitkeepRegistStartMenuSection
  CreateDirectory "$SMPROGRAMS\MkGitkeep"
  CreateShortCut "$SMPROGRAMS\MkGitkeep\MkGitkeep.lnk" "$INSTDIR\MkGitkeep.exe"
SectionEnd

;----------------------------------------------------------------------------
; デスクトップへのショートカットセクション
;----------------------------------------------------------------------------

Section "デスクトップへのショートカットを作成する" MkGitkeepDesktopShortCutSection
  CreateShortCut "$DESKTOP\MkGitkeep.lnk" "$INSTDIR\MkGitkeep.exe"
SectionEnd

;----------------------------------------------------------------------------
; スタートメニューにアンインストールアイコンを登録セクション
;----------------------------------------------------------------------------

Section /o "アンインストール用のショートカットをスタートメニューに登録する" MkGitkeepRegistUninstallToStartMenuSection
  CreateDirectory "$SMPROGRAMS\MkGitkeep"
  CreateShortCut "$SMPROGRAMS\MkGitkeep\MkGitkeepのアンインストール.lnk" "$INSTDIR\UninstallMkGitkeep.exe"
SectionEnd

;----------------------------------------------------------------------------
; 前処理
;----------------------------------------------------------------------------

Function .onInit

  ; MkGitkeep本体を選択必須にする
  IntOp $0 ${SF_SELECTED} | ${SF_RO}
  SectionSetFlags ${MkGitkeepSection} $0

FunctionEnd

;----------------------------------------------------------------------------
; セクションの説明を設定
;----------------------------------------------------------------------------

LangString DESC_MkGitkeepSection ${LANG_MkGitkeep} "$(^NameDA)の実行モジュールです。"
LangString DESC_MkGitkeepRegistStartMenuSection ${LANG_MkGitkeep} "$(^NameDA)をスタートメニューに登録する場合は選択してください。"
LangString DESC_MkGitkeepDesktopShortCutSection ${LANG_MkGitkeep} "デスクトップに$(^NameDA)へのショートカットを作成する場合は選択してください。"
LangString DESC_MkGitkeepRegistUninstallToStartMenuSection ${LANG_MkGitkeep} "スタートメニューに$(^NameDA)のアンインストール用のショートカットを登録する場合は選択してください。"

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${MkGitkeepSection} $(DESC_MkGitkeepSection)
  !insertmacro MUI_DESCRIPTION_TEXT ${MkGitkeepRegistStartMenuSection} $(DESC_MkGitkeepRegistStartMenuSection)
  !insertmacro MUI_DESCRIPTION_TEXT ${MkGitkeepDesktopShortCutSection} $(DESC_MkGitkeepDesktopShortCutSection)
  !insertmacro MUI_DESCRIPTION_TEXT ${MkGitkeepRegistUninstallToStartMenuSection} $(DESC_MkGitkeepRegistUninstallToStartMenuSection)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;============================================================================
; アンインストール処理
;============================================================================

;----------------------------------------------------------------------------
; ファイル削除など
;----------------------------------------------------------------------------

Section Uninstall

  SetShellVarContext all

  ; ファイルを削除する
  Delete "$INSTDIR\MkGitkeep.exe"
  Delete "$INSTDIR\ja-JP\*.*"
  RMDir /r "$INSTDIR\ja-JP\"

  Delete "$INSTDIR\UninstallMkGitkeep.exe"

  ; ショートカットを削除する
  Delete "$SMPROGRAMS\MkGitkeep\MkGitkeepのアンインストール.lnk"
  Delete "$DESKTOP\MkGitkeep.lnk"
  Delete "$SMPROGRAMS\MkGitkeep\MkGitkeep.lnk"
  RMDir "$SMPROGRAMS\MkGitkeep"

  ; フォルダを削除する
  RMDir "$INSTDIR"

  ; アンインストール情報を削除する
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"

  SetAutoClose true

SectionEnd

;----------------------------------------------------------------------------
; 前処理
;----------------------------------------------------------------------------

Function un.onInit

  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(^Name)をアンインストールしてよろしいですか?。" IDYES +2
  Abort

FunctionEnd

;----------------------------------------------------------------------------
; 後処理
;----------------------------------------------------------------------------

Function un.onUninstSuccess

  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name)をアンインストールしました。"

FunctionEnd
