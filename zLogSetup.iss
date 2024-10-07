//
//  zLog for Windows 令和Edition Setup script
//
//  Copyright (C) 2024 JR8PPG.
//
//  This software is released under the MIT License.
//
[Setup]

// アプリ名
AppName=zLog

// アプリ名＋バージョン
AppVerName=zLog 令和 Edition

// アーカイブ名
OutputBaseFilename=zLogSetup

// 初期インストールディレクトリ
DefaultDirName=D:\zlogwin

// 前回インストールフォルダを使う。 yesの場合、インストール先を聞かれない。
UsePreviousAppDir=no

// インストーラファイルのバージョン
VersionInfoVersion=2.9.2.0
// インストーラファイルの説明
VersionInfoDescription=zLog令和Edition セットアップ
// インストーラファイルのCOPYRIGHT
AppCopyright=COPYRIGHT(C) 2024 JR8PPG

// インストール前に情報／READMEの表示
//InfoBeforeFile=files\readme.txt

// インストール後に情報／READMEの表示
InfoAfterFile=files\readme.txt

[Types]
Name: "full"; Description: "フルセットアップ"
Name: "compact"; Description: "最小セットアップ"

[Components]
Name: "Main"; Description: "zLog基本ファイル"; Types: full compact;
Name: "CfgDat"; Description: "ユーザー定義コンテスト"; Types: full

[Tasks]
Name: desktopicon; Description: "デスクトップにアイコンを作成する"; GroupDescription: "追加のタスク:"; Components: Main

[Icons]
Name: "{userdesktop}\zLog"; Filename: "{app}\zlog.exe"; Components: Main; Tasks: desktopicon

[Files]
// x64 files
Source: files\x64\zlog.JPN; DestDir: {app}; Components: Main; Flags: 64bit;
Source: files\x64\zlog_keyedit.exe; DestDir: {app}; Components: Main; Flags: 64bit;
Source: files\x64\zlog_telnet.exe; DestDir: {app}; Components: Main; Flags: 64bit;
Source: files\x64\zlog.exe; DestDir: {app}; Components: Main; Flags: 64bit;

// x86 files
Source: files\x86\zlog.JPN; DestDir: {app}; Components: Main; Flags: 32bit;
Source: files\x86\zlog_keyedit.exe; DestDir: {app}; Components: Main; Flags: 32bit;
Source: files\x86\zlog_telnet.exe; DestDir: {app}; Components: Main; Flags: 32bit;
Source: files\x86\zlog.exe; DestDir: {app}; Components: Main; Flags: 32bit;

// common files
Source: files\zlog.ini; DestDir: {app};
Source: files\cty.dat; DestDir: {app}; Components: Main;
Source: files\cty_copyright.txt; DestDir: {app}; Components: Main;
Source: files\clusterlist.txt; DestDir: {app}; Components: Main;
Source: files\ZLOGHELP.TXT; DestDir: {app}; Components: Main;

// CFG&DAT
Source: files\cfg_dat\*.*; DestDir: {app}\cfg_dat; Components: CfgDat;

// Documents
Source: "files\ZLOG 令和EDITION V2.9 リグコントロール設定.pdf"; DestDir: {app}; Components: Main;
Source: "files\zlog_v2922_release_note.pdf"; DestDir: {app}; Components: Main;

[#Dirs]
Name: "{app}\cfg_dat"
Name: "{app}\log"
Name: "{app}\backup"
Name: "{app}\voice"
Name: "{app}\spc"
Name: "{app}\plugin"

[#INI]
Filename: "zlog.ini"; Section: "Preferences"; Key: "RootPath"; String: "%ZLOG_ROOT%"; Flags: createkeyifdoesntexist;
Filename: "zlog.ini"; Section: "Preferences"; Key: "CFGDATPath"; String: "cfg_dat"; Flags: createkeyifdoesntexist;
Filename: "zlog.ini"; Section: "Preferences"; Key: "LogsPath"; String: "log"; Flags: createkeyifdoesntexist;
Filename: "zlog.ini"; Section: "Preferences"; Key: "BackUpPath"; String: "backup"; Flags: createkeyifdoesntexist;
Filename: "zlog.ini"; Section: "Preferences"; Key: "SoundPath"; String: "voice"; Flags: createkeyifdoesntexist;
Filename: "zlog.ini"; Section: "SuperCheck"; Key: "Folder"; String: "spc"; Flags: createkeyifdoesntexist;
Filename: "zlog.ini"; Section: "zylo"; Key: "path"; String: "plugin"; Flags: createkeyifdoesntexist;

[Languages]
Name: japanese; MessagesFile: compiler:Languages\Japanese.isl

[Code]
var
  UserPage: TInputQueryWizardPage;
  UserPage2: TInputQueryWizardPage;

procedure CurStepChanged(CurStep: TSetupStep);
var
   S1,S2,S3,S4,S5,S6,S7: string;
   ini: string;
   ROOT: string;
begin
   if CurStep = ssPostInstall then begin
      ini := ExpandConstant('{app}') + '\zlog.ini';
      S1 := GetIniString('Preferences', 'RootPath', '%ZLOG_ROOT%', ini);
      S2 := GetIniString('Preferences', 'CFGDATPath', 'cfg_dat', ini);
      S3 := GetIniString('Preferences', 'LogsPath', 'log', ini);
      S4 := GetIniString('Preferences', 'BackUpPath', 'backup', ini);
      S5 := GetIniString('Preferences', 'SoundPath', 'voice', ini);
      S6 := GetIniString('SuperCheck', 'Folder', 'spc', ini);
      S7 := GetIniString('zylo', 'path', 'plugin', ini);
   
      if S1 = '%ZLOG_ROOT%' then begin
         ROOT := ExpandConstant('{app}');
      end
      else begin
         ROOT := S1;
      end;
      
      CreateDir(ROOT + '\' + S2);
      CreateDir(ROOT + '\' + S3);
      CreateDir(ROOT + '\' + S4);
      CreateDir(ROOT + '\' + S5);
      CreateDir(ROOT + '\' + S6);
      CreateDir(ROOT + '\' + S7);
      
      SetIniString('Preferences', 'RootPath', S1, ini);
      SetIniString('Preferences', 'CFGDATPath', S2, ini);
      SetIniString('Preferences', 'LogsPath', S3, ini);
      SetIniString('Preferences', 'BackUpPath', S4, ini);
      SetIniString('Preferences', 'SoundPath', S5, ini);
      SetIniString('SuperCheck', 'Folder', S6, ini);
      SetIniString('zylo', 'path', S7, ini);

      S1 := UserPage.Values[0];
      S2 := UserPage.Values[1];
      S3 := UserPage.Values[2];
      S4 := UserPage2.Values[0];
      S5 := UserPage2.Values[1];
      SetIniString('Categories', 'MyCall', S1, ini);
      SetIniString('Profiles', 'Province/State', S2, ini);
      SetIniString('Profiles', 'City', S3, ini);
      SetIniString('Profiles', 'CQZone', S4, ini);
      SetIniString('Profiles', 'ITUZone', S5, ini);
   end;
end;

procedure InitializeWizard;
var
   ini: string;
begin
   { Create the pages }
   UserPage := CreateInputQueryPage(wpSelectDir,
      'ステーション情報', 'コンテストに必要な情報を入力してください。', 'コールサイン,都道府県コード,市郡コードを入力してください。');
   UserPage.Add('コールサイン:', False);
   UserPage.Add('都道府県($V)コード:', False);
   UserPage.Add('市郡($Q)コード:', False);

   UserPage2 := CreateInputQueryPage(UserPage.ID,
      'ステーション情報', 'コンテストに必要な情報を入力してください。', 'CQゾーン,ITUゾーン番号を入力してください。');
   UserPage2.Add('CQ Zone($Z):', False);
   UserPage2.Add('ITU Zone($I):', False);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
   ini: string;
begin
   if CurPageID = wpSelectDir then begin
      ini := ExpandConstant('{app}') + '\zlog.ini';

      if FileExists(ini) = False then begin
         FileCopy('files\zlog.ini', ini, True);
      end;

      UserPage.Values[0] := GetIniString('Categories', 'MyCall', '', ini);
      UserPage.Values[1] := GetIniString('Profiles', 'Province/State', '', ini);
      UserPage.Values[2] := GetIniString('Profiles', 'City', '', ini);
      UserPage2.Values[0] := GetIniString('Profiles', 'CQZone', '25', ini);
      UserPage2.Values[1] := GetIniString('Profiles', 'IARUZone', '45', ini);
   end;

   Result := True;
end;
