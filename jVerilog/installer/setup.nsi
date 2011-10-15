;jVerilog Installer Script
;Written by Bangon Kali.

;--------------------------------
;Includes
   
  !include "MUI2.nsh"            ; Modern UI
  !include "EnvVarUpdate.nsh"    ; http://j.mp/reuJ0J
  !include "winmessages.nsh"     ; Environ Variables.

;--------------------------------
;General

  ;Name and file
  !define VERSION_PACKAGE "0"    ; Installer Version
  !define VERSION_APP "1.4.3"   ; jVerilog Version
  !define NAME_PACKAGE "jVerilog"  ; Package Name
  
  Name "${NAME_PACKAGE} ${VERSION_APP}.${VERSION_PACKAGE}"
  OutFile "jVerilog_setup_${VERSION_APP}.${VERSION_PACKAGE}.exe"

  ;Default installation folder
  InstallDir "$PROGRAMFILES\${NAME_PACKAGE}"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\${NAME_PACKAGE}" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel highest

  ; Compression Method
  SetCompressor /SOLID lzma
  SetDatablockOptimize on
  
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_RIGHT
  !define MUI_HEADERIMAGE_BITMAP "assets\header_image.BMP" 
  !define MUI_HEADERIMAGE_UNBITMAP "assets\header_image.BMP" 
  
  !define MUI_WELCOMEFINISHPAGE_BITMAP "assets\win.BMP" 
  !define MUI_UNWELCOMEFINISHPAGE_BITMAP "assets\win.BMP" 
  
  !define MUI_FINISHPAGE_NOAUTOCLOSE
  !define MUI_UNFINISHPAGE_NOAUTOCLOSE

;--------------------------------
;Version Information

  VIProductVersion "${VERSION_APP}.${VERSION_PACKAGE}"
  VIAddVersionKey "ProductName" "${NAME_PACKAGE} ${VERSION_APP}"
  VIAddVersionKey "Comments" "This is a simple jVerilog Install Package for Windows"
  VIAddVersionKey "CompanyName" "Bangon Kali"
  VIAddVersionKey "LegalTrademarks" "jVerilog ${VERSION_APP} is a trademark of Bangon Kali. See the trademark policy for more information."
  VIAddVersionKey "LegalCopyright" "Copyright 2010 Bangon Kali"
  VIAddVersionKey "FileDescription" "jVerilog ${VERSION_APP} is a simple GUI implementation of iVerilog."
  VIAddVersionKey "FileVersion" "${VERSION_APP}"


;--------------------------------
;Variables

  Var StartMenuFolder
  
;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING
   
;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "license.rtf"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH
  
  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\${NAME_PACKAGE}" 
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
  
  ; HKLM (all users) vs HKCU (current user) defines
  !define env_hklm 'HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"'
  !define env_hkcu 'HKCU "Environment"'
  
  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Full Install" SecInstallation
  SetOverwrite on

  ; Change the output directory to 
  SetOutPath "$INSTDIR"
  File /a /r "raw\*.*"

  ;Store installation folder
  WriteRegStr HKCU "Software\${NAME_PACKAGE}" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  
  ; Start menu stuff
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
	
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
	
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\jVerilog.lnk" "$INSTDIR\bin\jVerilog.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\GTKWave.lnk" "$INSTDIR\bin\gtkwave.exe"
	
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\VVP Manual.lnk" "$INSTDIR\vvp.pdf"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\iVerilog-VPI Manual.lnk" "$INSTDIR\iverilog-vpi.pdf"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\iVerilog Manual.lnk" "$INSTDIR\iverilog.pdf"
	
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Examples.lnk" "$INSTDIR\samples"
    
  !insertmacro MUI_STARTMENU_WRITE_END
  
  ; Append to Path
  ${EnvVarUpdate} $0 "PATH" "A" "HKLM" "$INSTDIR\bin"
  
  ; set variable (not needed for the moment)
  ; WriteRegExpandStr ${env_hklm} "APP_PATH" "$INSTDIR\jVerilog_modules"
  
  ; make sure windows knows about the change
  SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment" /TIMEOUT=2500
  
SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecInstallation ${LANG_ENGLISH} "Full jVerilog Installation."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecInstallation} $(DESC_SecInstallation)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"
  SetOutPath $TEMP

  ;--------------------------------
  ; Delete files and folders

  RMDir /r "$INSTDIR"
  RMDir "$INSTDIR"
  
  ;--------------------------------
  ;Remove Start Menu
  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder

  Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\jVerilog.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\GTKWave.lnk"
  
  Delete "$SMPROGRAMS\$StartMenuFolder\VVP Manual.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\iVerilog-VPI Manual.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\iVerilog Manual.lnk"  
  
  Delete "$SMPROGRAMS\$StartMenuFolder\Examples.lnk"
  
  RMDir "$SMPROGRAMS\$StartMenuFolder"
  
  ;--------------------------------
  ; Delete registry key settings
  
  DeleteRegKey /ifempty HKCU "Software\${NAME_PACKAGE}"
  
  ;--------------------------------
  ; Remove environment variable settings!
  
  ; Remove path
  ${un.EnvVarUpdate} $0 "PATH" "R" "HKLM" "$INSTDIR\bin"
  
  ; delete variable (not needed for the moment)
  ; DeleteRegValue ${env_hklm} APP_PATH
  
  ; make sure windows knows about the change
  SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment" /TIMEOUT=2500
  
SectionEnd
