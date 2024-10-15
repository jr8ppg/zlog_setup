//
//  zLog for Windows �ߘaEdition Setup script
//
//  Copyright (C) 2024 JR8PPG.
//
//  This software is released under the MIT License.
//
[Setup]
WizardStyle=modern
ArchitecturesAllowed=x86compatible or x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

// �A�v����
AppName=zLog

// �A�v�����{�o�[�W����
AppVerName=zLog �ߘa Edition

// �A�[�J�C�u��
OutputBaseFilename=zLogSetup

// �����C���X�g�[���f�B���N�g��
DefaultDirName=D:\zlogwin

// �O��C���X�g�[���t�H���_���g���B yes�̏ꍇ�A�C���X�g�[����𕷂���Ȃ��B
UsePreviousAppDir=no

// �C���X�g�[���t�@�C���̃o�[�W����
VersionInfoVersion=2.9.2.0
// �C���X�g�[���t�@�C���̐���
VersionInfoDescription=zLog�ߘaEdition �Z�b�g�A�b�v
// �C���X�g�[���t�@�C����COPYRIGHT
AppCopyright=COPYRIGHT(C) 2024 JR8PPG

// �C���X�g�[���O�ɏ��^README�̕\��
//InfoBeforeFile=files\readme.txt

// �C���X�g�[����ɏ��^README�̕\��
InfoAfterFile=files\readme.txt

DisableProgramGroupPage=yes

[Types]
Name: "std"; Description: "�W���Z�b�g�A�b�v"
Name: "full"; Description: "�t���Z�b�g�A�b�v"
Name: "compact"; Description: "�ŏ��Z�b�g�A�b�v"
Name: "custom"; Description: "�J�X�^���Z�b�g�A�b�v"; Flags: iscustom

[Components]
Name: "Main"; Description: "zLog��{�t�@�C��"; Types: std full compact custom; Flags: fixed;
Name: "Options"; Description: "�I�v�V����"; Types: std full
Name: "Options\CfgDatJa"; Description: "���[�U�[��`�R���e�X�g�i�����j"; Types: std full
Name: "Options\CfgDatDx"; Description: "���[�U�[��`�R���e�X�g�i�c�w�j"; Types: full
Name: "Options\Documents"; Description: "�e��h�L�������g"; Types: std full

[Tasks]
Name: desktopicon; Description: "�f�X�N�g�b�v�ɃA�C�R�����쐬����"; GroupDescription: "�ǉ��̃^�X�N:"; Components: Main

[Icons]
Name: "{userdesktop}\zLog"; Filename: "{app}\zlog.exe"; Components: Main; Tasks: desktopicon

[Files]
// x64 files
Source: files\x64\zlog.JPN; DestDir: {app}; Components: Main; Flags: ignoreversion; Check: Is64BitInstallMode;
Source: files\x64\zlog_keyedit.exe; DestDir: {app}; Components: Main; Flags: ignoreversion; Check: Is64BitInstallMode;
Source: files\x64\zlog_telnet.exe; DestDir: {app}; Components: Main; Flags: ignoreversion; Check: Is64BitInstallMode;
Source: files\x64\zlog.exe; DestDir: {app}; Components: Main; Flags: ignoreversion; Check: Is64BitInstallMode;

// x86 files
Source: files\x86\zlog.JPN; DestDir: {app}; Components: Main; Flags: ignoreversion; Check: not Is64BitInstallMode;
Source: files\x86\zlog_keyedit.exe; DestDir: {app}; Components: Main; Flags: ignoreversion; Check: not Is64BitInstallMode;
Source: files\x86\zlog_telnet.exe; DestDir: {app}; Components: Main; Flags: ignoreversion; Check: not Is64BitInstallMode;
Source: files\x86\zlog.exe; DestDir: {app}; Components: Main; Flags: ignoreversion; Check: not Is64BitInstallMode;

// common files
Source: files\zlog.ini; DestDir: {app};
Source: files\cty.dat; DestDir: {app}; Components: Main;
Source: files\cty_copyright.txt; DestDir: {app}; Components: Main;
Source: files\clusterlist.txt; DestDir: {app}; Components: Main; Flags: onlyifdoesntexist;
Source: files\ZLOGHELP.TXT; DestDir: {app}; Components: Main; Flags: onlyifdoesntexist;

// CFG&DAT(JA)
Source: files\cfg_dat\*.cfg; DestDir: "{app}\cfg_dat"; Components: "Options\CfgDatJa"; BeforeInstall: BeforeCfgInstall; AfterInstall: AfterCfgInstall;
Source: files\cfg_dat\*.dat; DestDir: "{app}\cfg_dat"; Components: "Options\CfgDatJa";

// CFG&DAT(DX)
Source: files\cfg_dat_dx\arrl160\*.cfg; DestDir: "{app}\cfg_dat"; Components: "Options\CfgDatDx"; BeforeInstall: BeforeCfgInstall; AfterInstall: AfterCfgInstall;
Source: files\cfg_dat_dx\arrl160\*.dat; DestDir: "{app}\cfg_dat"; Components: "Options\CfgDatDx";
Source: files\cfg_dat_dx\dxcfg12\*.cfg; DestDir: "{app}\cfg_dat"; Components: "Options\CfgDatDx"; BeforeInstall: BeforeCfgInstall; AfterInstall: AfterCfgInstall;
Source: files\cfg_dat_dx\dxcfg12\*.dat; DestDir: "{app}\cfg_dat"; Components: "Options\CfgDatDx";
Source: files\cfg_dat_dx\eudx\*.cfg; DestDir: "{app}\cfg_dat"; Components: "Options\CfgDatDx"; BeforeInstall: BeforeCfgInstall; AfterInstall: AfterCfgInstall;
Source: files\cfg_dat_dx\eudx\*.dat; DestDir: "{app}\cfg_dat"; Components: "Options\CfgDatDx";

// Documents
Source: "files\ZLOG �ߘaEDITION V2.9 ���O�R���g���[���ݒ�.pdf"; DestDir: {app}; Components: "Options\Documents";
Source: "files\zlog_v2922_release_note.pdf"; DestDir: {app}; Components: "Options\Documents";

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
  BakString: string;
  RootFolder: string;
  CfgDatFolder: string;

procedure CheckOldDat(folder: string; datfile: string);
var
   S: string;
   D: string;
begin
   S := folder + '\' + datfile;
   D := folder + '\' + datfile + BakString;
   if FileExists(S) then begin
      if FileExists(D) then begin
         DeleteFile(D);
      end;
      RenameFile(S, D);

      MsgBox(S + ' ���A' + datfile + BakString + ' �փ��l�[�����܂���.', mbInformation, MB_OK);

      Exit;
   end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
   S1,S2,S3,S4,S5,S6,S7: string;
   ini: string;
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
         RootFolder := ExpandConstant('{app}');
      end
      else begin
         RootFolder := S1;
      end;

      CfgDatFolder := RootFolder + '\' + S2;
      
      CreateDir(CfgDatFolder);
      CreateDir(RootFolder + '\' + S3);
      CreateDir(RootFolder + '\' + S4);
      CreateDir(RootFolder + '\' + S5);
      CreateDir(RootFolder + '\' + S6);
      CreateDir(RootFolder + '\' + S7);
      
      SetIniString('Preferences', 'RootPath', S1, ini);
      SetIniString('Preferences', 'CFGDATPath', S2, ini);
      SetIniString('Preferences', 'LogsPath', S3, ini);
      SetIniString('Preferences', 'BackUpPath', S4, ini);
      SetIniString('Preferences', 'SoundPath', S5, ini);
      SetIniString('SuperCheck', 'Folder', S6, ini);
      SetIniString('zylo', 'path', S7, ini);

      S1 := UpperCase(UserPage.Values[0]);
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
      '�X�e�[�V�������', '�R���e�X�g�ɕK�v�ȏ�����͂��Ă��������B', '�R�[���T�C��,�s���{���R�[�h,�s�S�R�[�h����͂��Ă��������B');
   UserPage.Add('�R�[���T�C��:', False);
   UserPage.Add('�s���{��($V)�R�[�h:', False);
   UserPage.Add('�s�S($Q)�R�[�h:', False);

   UserPage2 := CreateInputQueryPage(UserPage.ID,
      '�X�e�[�V�������', '�R���e�X�g�ɕK�v�ȏ�����͂��Ă��������B', 'CQ�]�[��,ITU�]�[���ԍ�����͂��Ă��������B');
   UserPage2.Add('CQ Zone($Z):', False);
   UserPage2.Add('ITU Zone($I):', False);
   
   BakString := '.' + GetDateTimeString('yyyymmdd', #0, #0);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
   ini: string;
begin
   if CurPageID = wpSelectDir then begin
      ini := ExpandConstant('{app}') + '\zlog.ini';

      if FileExists(ini) = False then begin
         FileCopy('files\zlog.ini', ini, False);
      end;

      UserPage.Values[0] := GetIniString('Categories', 'MyCall', '', ini);
      UserPage.Values[1] := GetIniString('Profiles', 'Province/State', '', ini);
      UserPage.Values[2] := GetIniString('Profiles', 'City', '', ini);
      UserPage2.Values[0] := GetIniString('Profiles', 'CQZone', '25', ini);
      UserPage2.Values[1] := GetIniString('Profiles', 'IARUZone', '45', ini);
   end;

   if CurPageID = wpInfoAfter then begin
      CheckOldDat(CfgDatFolder, 'XPO.DAT');
      CheckOldDat(RootFolder, 'XPO.DAT');
      CheckOldDat(CfgDatFolder, 'ACAG.DAT');
      CheckOldDat(RootFolder, 'ACAG.DAT');
   end;
   
   Result := True;
end;

procedure CopyCfgItem(from_cfg, to_cfg: TStringList; item: string);
var
   i: Integer;
   S: string;
   line: string;
begin
   line := '';
   for i := 0 to from_cfg.Count - 1 do begin
      S := from_cfg.Strings[i];
      if item = UpperCase(Copy(S, 1, Length(item))) then begin
         line := S;
         Break;
      end;
   end;

   if line = '' then begin
      Exit;
   end;
   
   for i := 0 to to_cfg.Count - 1 do begin
      S := to_cfg.Strings[i];
      if item = UpperCase(Copy(S, 1, Length(item))) then begin
         to_cfg.Strings[i] := line;
         Break;
      end;
   end;   
end;

procedure BeforeCfgInstall();
var
   dstfile: string;
begin
   dstfile := CurrentFileName;
   StringChange(dstfile, '{app}', ExpandConstant('{app}'));

   if FileExists(dstfile) = True then begin
      FileCopy(dstfile, dstfile + BakString, False);
   end;
end;

procedure AfterCfgInstall();
var
   SRC: TStringList;
   DST: TStringList;
   S1, S2: string;
   srcfile, dstfile: string;
begin
   SRC := TStringList.Create();
   DST := TStringList.Create();

   dstfile := CurrentFileName;
   StringChange(dstfile, '{app}', ExpandConstant('{app}'));

   srcfile := dstfile + BakString;
      
   // ���t�@�C��
   SRC.LoadFromFile(srcfile);
   
   // �V�t�@�C��
   if FileExists(dstfile) = True then begin
      DST.LoadFromFile(dstfile);

      // ���g�������Ȃ�X�L�b�v
      S1 := SRC.Text;
      S2 := DST.Text;
      if S1 = S2 then begin
         SRC.Free();
         DST.Free();
         DeleteFile(srcfile);
         Exit;
      end;
      
      // ���t�@�C��(DST)����V�t�@�C��(SRC)�ɍ��ڃR�s�[
      CopyCfgItem(SRC, DST, 'PROV');
      CopyCfgItem(SRC, DST, 'CITY');
      CopyCfgItem(SRC, DST, 'F1_A');
      CopyCfgItem(SRC, DST, 'F2_A');
      CopyCfgItem(SRC, DST, 'F3_A');
      CopyCfgItem(SRC, DST, 'F4_A');
      CopyCfgItem(SRC, DST, 'F5_A');
      CopyCfgItem(SRC, DST, 'F6_A');
      CopyCfgItem(SRC, DST, 'F7_A');
      CopyCfgItem(SRC, DST, 'F8_A');
      CopyCfgItem(SRC, DST, 'F1_B');
      CopyCfgItem(SRC, DST, 'F2_B');
      CopyCfgItem(SRC, DST, 'F3_B');
      CopyCfgItem(SRC, DST, 'F4_B');
      CopyCfgItem(SRC, DST, 'F5_B');
      CopyCfgItem(SRC, DST, 'F6_B');
      CopyCfgItem(SRC, DST, 'F7_B');
      CopyCfgItem(SRC, DST, 'F8_B');
   end;
   
   // dstfile�ɕۑ�
   DST.SaveToFile(dstfile);
   
   SRC.Free();
   DST.Free();
end;

function CheckCfgFile(): Boolean;
begin
   Result := True;
end;