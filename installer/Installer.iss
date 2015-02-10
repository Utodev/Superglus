[Setup]
AppId={{50232678-E709-417A-9002-B779C7E890B0}
AppName=Superglús
AppVerName=Superglús 1.2
AppPublisherURL=http://www.caad.es/superglus
AppSupportURL=http://www.caad.es/superglus
AppUpdatesURL=http://www.caad.es/superglus
DefaultDirName={pf}\Superglús
DefaultGroupName=Superglús
AllowNoIcons=yes
OutputDir=..\installer
OutputBaseFilename=SuperglusSetup1.2
Compression=lzma
SolidCompression=yes
ChangesAssociations=yes

[Registry]
Root: HKCR; Subkey: ".txp"; ValueType: string; ValueName: ""; ValueData: "Superglus"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Superglus"; ValueType: string; ValueName: ""; ValueData: "Superglus"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Superglus\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\superglus.exe,0"
Root: HKCR; Subkey: "Superglus\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\superglus.exe"" ""%1"""

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\Release\superglus.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\VocHighLight.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\blc.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\CodeHighLight.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\CONTEXT.HLP"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\DataHighLight.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\garglk.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\glulxa.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\glulxe.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\init.lib"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\libfreetype.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\libgarglk.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\libjpeg.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\libogg-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\libpng.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\libvorbis-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\libvorbisfile-3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\libz.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\SDL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\SDL_mixer.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\SDL_sound.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\smpeg.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\spg.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\superglus.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\txtpaws.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Release\CONTEXT.HLP"; DestDir: "{app}"; Flags: ignoreversion


Source: "..\Release\pgl\*.*"; DestDir: "{app}\pgl"; Flags: ignoreversion
Source: "..\Release\ejemplos\generador_de_puzzles\*.*"; DestDir: "{app}\ejemplos\generador_de_puzzles"; Flags: ignoreversion
Source: "..\Release\ejemplos\fuentes\*.*"; DestDir: "{app}\ejemplos\fuentes"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\Superglús"; Filename: "{app}\superglus.exe"


Name: "{group}\Ejemplos"; Filename: "{app}\ejemplos"

Name: "{group}\{cm:ProgramOnTheWeb,Documentación online}"; Filename: "http://www.caad.es/superglus"
Name: "{commondesktop}\Superglús"; Filename: "{app}\superglus.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Superglús"; Filename: "{app}\superglus.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\superglus.exe"; Description: "{cm:LaunchProgram,Superglús}"; Flags: nowait postinstall skipifsilent

