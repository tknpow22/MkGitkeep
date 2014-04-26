;============================================================================
; NSIS �X�N���v�g: NSIS 2.4x �n�p
;----------------------------------------------------------------------------
;   HM NIS Edit �ō쐬�������̂��J�X�^�}�C�Y���܂����B
;   ����t�@�C�� "Japanese" �̃t�H���g����у��b�Z�[�W��ύX�������������߁A
;   NSIS ������ Japanese.nlf�AJapanese.nsh ���R�s�[���āA
;   MkGitkeep.nlf�AMkGitkeep.nsh ���쐬���܂����B
;   MkGitkeep.nlf �Ńt�H���g��ύX���AMkGitkeep.nsh �Ń��b�Z�[�W��ύX���Ă��܂��B
;   ���̂��߁A�{�X�N���v�g���R���p�C������ɂ́AMkGitkeep.nlf�AMkGitkeep.nsh ��
;   ���O�� ${NSISDIR}\Contrib\Language files\ ���ɃR�s�[���Ă����K�v������܂��B
;   �Ȃ��A���b�Z�[�W�̈ꕔ�����Ē�`(�ă��[�h)�������߁A�R���p�C�����ɓ�d��`��
;   �x�����o�Ă��܂��܂����A����ɂ͎x�Ⴀ��܂���̂ŁA�������ĉ������B
;   �ق��ɂ��A�o�[�W������������Ɋ֌W�Ȃ���`������ƁA������Ƃ����`�ł�
;   MUI �𗘗p�ł��Ă��܂���B
;============================================================================

;----------------------------------------------------------------------------
; �C���N���[�h
;----------------------------------------------------------------------------

!include "LogicLib.nsh"

;----------------------------------------------------------------------------
; ���Ȃ�
;----------------------------------------------------------------------------

!define PRODUCT_NAME "MkGitkeep"
!define PRODUCT_VERSION "1.0.0.9"
!define PRODUCT_PUBLISHER "Bono"
!define PRODUCT_WEB_SITE "http://www.koutou-software.co.jp/junk/make-gitkeep.html"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\Bono.MkGitkeep"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

;----------------------------------------------------------------------------
; MUI �̂��߂̐ݒ�
;----------------------------------------------------------------------------

!include "MUI2.nsh"

!define MUI_ABORTWARNING
!define MUI_WELCOMEFINISHPAGE_BITMAP "Graphics\Title.bmp"
!define MUI_ICON "..\MkGitkeep.ico"
!define MUI_UNICON "..\MkGitkeep.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "Graphics\HeaderInstall.bmp"

;----------------------------------------------------------------------------
; �\������y�[�W�̑I��
;----------------------------------------------------------------------------

; �悤�����y�[�W
!insertmacro MUI_PAGE_WELCOME
; �R���|�[�l���g�I���y�[�W
!insertmacro MUI_PAGE_COMPONENTS
; �t�H���_�I���y�[�W
!insertmacro MUI_PAGE_DIRECTORY
; �C���X�g�[���i���y�[�W
!insertmacro MUI_PAGE_INSTFILES
; �ŏI�y�[�W
!insertmacro MUI_PAGE_FINISH

; �A���C���X�g�[���i���y�[�W
!insertmacro MUI_UNPAGE_INSTFILES

;----------------------------------------------------------------------------
; ����t�@�C���ƃ��b�Z�[�W�̍Ē�`
;----------------------------------------------------------------------------
; NOTE: �����Ń��b�Z�[�W���Ē�`���Ă��邽�߁A�R���p�C�����ɂ��̎|�A�x�����\������܂���
;       �������ĉ������B

; ����t�@�C��
;;;;!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "MkGitkeep"

; �C���X�g�[���̏�����ʂɕ\�����郁�b�Z�[�W
; NOTE: ${PRODUCT_VERSION} ���Q�Ƃ��������߂ɁA�����ōĒ�`���Ă��܂��B
LangString MUI_TEXT_WELCOME_INFO_TEXT ${LANG_MkGitkeep} "���̃E�B�U�[�h�́A$(^NameDA)�̃C���X�g�[���̎菇�����ē����܂��B$\r$\n$\r$\n�C���X�g�[������$(^NameDA)�̃o�[�W����: ${PRODUCT_VERSION}$\r$\n$\r$\n$_CLICK"

; �A���C���X�g�[����̃T�u�^�C�g�����b�Z�[�W
;LangString MUI_UNTEXT_FINISH_SUBTITLE ${LANG_MkGitkeep} "�A���C���X�g�[���ɐ������܂����B�u����v�ŉ�ʂ���ĉ������B"

;----------------------------------------------------------------------------
; �C���X�g�[����`
;----------------------------------------------------------------------------

Name "${PRODUCT_NAME}"
OutFile "SetupMkGitkeep.exe"
InstallDir "$PROGRAMFILES\MkGitkeep"
ShowInstDetails show
ShowUnInstDetails show

; �t�@�C���ɕt�^����o�[�W�������

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
; �C���X�g�[������
;============================================================================

;----------------------------------------------------------------------------
; MkGitkeep �{�̃Z�N�V����
;----------------------------------------------------------------------------

Section "MkGitkeep" MkGitkeepSection

  SetShellVarContext all
  SetOutPath "$INSTDIR"
  SetOverwrite on

  ; �t�@�C�����R�s�[����
  File "..\bin\Release\MkGitkeep.exe"
  File /r "..\bin\Release\ja-JP"

  ; �A���C���X�g�[�����쐬����
  WriteUninstaller "$INSTDIR\UninstallMkGitkeep.exe"

  ; �A���C���X�g�[������o�^����
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
; �X�^�[�g���j���[�ɓo�^�Z�N�V����
;----------------------------------------------------------------------------

Section "�X�^�[�g���j���[�ɓo�^����" MkGitkeepRegistStartMenuSection
  CreateDirectory "$SMPROGRAMS\MkGitkeep"
  CreateShortCut "$SMPROGRAMS\MkGitkeep\MkGitkeep.lnk" "$INSTDIR\MkGitkeep.exe"
SectionEnd

;----------------------------------------------------------------------------
; �f�X�N�g�b�v�ւ̃V���[�g�J�b�g�Z�N�V����
;----------------------------------------------------------------------------

Section "�f�X�N�g�b�v�ւ̃V���[�g�J�b�g���쐬����" MkGitkeepDesktopShortCutSection
  CreateShortCut "$DESKTOP\MkGitkeep.lnk" "$INSTDIR\MkGitkeep.exe"
SectionEnd

;----------------------------------------------------------------------------
; �X�^�[�g���j���[�ɃA���C���X�g�[���A�C�R����o�^�Z�N�V����
;----------------------------------------------------------------------------

Section /o "�A���C���X�g�[���p�̃V���[�g�J�b�g���X�^�[�g���j���[�ɓo�^����" MkGitkeepRegistUninstallToStartMenuSection
  CreateDirectory "$SMPROGRAMS\MkGitkeep"
  CreateShortCut "$SMPROGRAMS\MkGitkeep\MkGitkeep�̃A���C���X�g�[��.lnk" "$INSTDIR\UninstallMkGitkeep.exe"
SectionEnd

;----------------------------------------------------------------------------
; �O����
;----------------------------------------------------------------------------

Function .onInit

  ; MkGitkeep�{�̂�I��K�{�ɂ���
  IntOp $0 ${SF_SELECTED} | ${SF_RO}
  SectionSetFlags ${MkGitkeepSection} $0

FunctionEnd

;----------------------------------------------------------------------------
; �Z�N�V�����̐�����ݒ�
;----------------------------------------------------------------------------

LangString DESC_MkGitkeepSection ${LANG_MkGitkeep} "$(^NameDA)�̎��s���W���[���ł��B"
LangString DESC_MkGitkeepRegistStartMenuSection ${LANG_MkGitkeep} "$(^NameDA)���X�^�[�g���j���[�ɓo�^����ꍇ�͑I�����Ă��������B"
LangString DESC_MkGitkeepDesktopShortCutSection ${LANG_MkGitkeep} "�f�X�N�g�b�v��$(^NameDA)�ւ̃V���[�g�J�b�g���쐬����ꍇ�͑I�����Ă��������B"
LangString DESC_MkGitkeepRegistUninstallToStartMenuSection ${LANG_MkGitkeep} "�X�^�[�g���j���[��$(^NameDA)�̃A���C���X�g�[���p�̃V���[�g�J�b�g��o�^����ꍇ�͑I�����Ă��������B"

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${MkGitkeepSection} $(DESC_MkGitkeepSection)
  !insertmacro MUI_DESCRIPTION_TEXT ${MkGitkeepRegistStartMenuSection} $(DESC_MkGitkeepRegistStartMenuSection)
  !insertmacro MUI_DESCRIPTION_TEXT ${MkGitkeepDesktopShortCutSection} $(DESC_MkGitkeepDesktopShortCutSection)
  !insertmacro MUI_DESCRIPTION_TEXT ${MkGitkeepRegistUninstallToStartMenuSection} $(DESC_MkGitkeepRegistUninstallToStartMenuSection)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;============================================================================
; �A���C���X�g�[������
;============================================================================

;----------------------------------------------------------------------------
; �t�@�C���폜�Ȃ�
;----------------------------------------------------------------------------

Section Uninstall

  SetShellVarContext all

  ; �t�@�C�����폜����
  Delete "$INSTDIR\MkGitkeep.exe"
  Delete "$INSTDIR\ja-JP\*.*"
  RMDir /r "$INSTDIR\ja-JP\"

  Delete "$INSTDIR\UninstallMkGitkeep.exe"

  ; �V���[�g�J�b�g���폜����
  Delete "$SMPROGRAMS\MkGitkeep\MkGitkeep�̃A���C���X�g�[��.lnk"
  Delete "$DESKTOP\MkGitkeep.lnk"
  Delete "$SMPROGRAMS\MkGitkeep\MkGitkeep.lnk"
  RMDir "$SMPROGRAMS\MkGitkeep"

  ; �t�H���_���폜����
  RMDir "$INSTDIR"

  ; �A���C���X�g�[�������폜����
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"

  SetAutoClose true

SectionEnd

;----------------------------------------------------------------------------
; �O����
;----------------------------------------------------------------------------

Function un.onInit

  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(^Name)���A���C���X�g�[�����Ă�낵���ł���?�B" IDYES +2
  Abort

FunctionEnd

;----------------------------------------------------------------------------
; �㏈��
;----------------------------------------------------------------------------

Function un.onUninstSuccess

  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name)���A���C���X�g�[�����܂����B"

FunctionEnd
