; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "AutoTasks"
#define MyAppVersion "3.0.2"
#define MyAppPublisher "Marcelo Horita"
#define MyAppURL "https://github.com/mfhorita"
#define MyAppExeName "AutoTasks.exe"
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{52FE1BAA-ECFA-497C-AA62-AAE99E1C2F0D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\{#MyAppName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=D:\Projects\AutoTasks
OutputBaseFilename=Setup
SetupIconFile=D:\Projects\AutoTasks\build\exe.win-amd64-3.8\AutoTasks.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\Projects\AutoTasks\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\AutoTasks\build\exe.win-amd64-3.8\lib\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\Projects\AutoTasks\AutoTasks.build\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\Projects\AutoTasks\AutoTasks.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\AutoTasks\AutoTasks.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\AutoTasks\AutoTasks.pdf"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\AutoTasks\Autotasks.png"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\AutoTasks\build\exe.win-amd64-3.8\AutoTasks_.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\AutoTasks\build\exe.win-amd64-3.8\python3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\AutoTasks\build\exe.win-amd64-3.8\python38.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

