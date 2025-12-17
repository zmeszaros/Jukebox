unit FormBeallitasUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, IniFiles, Registry;

type
  TFormBeallitas = class(TForm)
    ColorDialog: TColorDialog;
    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Button1: TButton;
    btnMegse: TBitBtn;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    btnModosit: TBitBtn;
    GroupBox5: TGroupBox;
    WinampPath: TEdit;
    BtnBorito: TSpeedButton;
    OpenDialog: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure btnMegseClick(Sender: TObject);
    procedure btnModositClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnBoritoClick(Sender: TObject);
  private
    Procedure BeallitasMent;
    Procedure AutInditBe;
    Procedure AutInditKi;
  end;

var
  FormBeallitas: TFormBeallitas;

implementation

Uses DataModul, FoUnit;

{$R *.DFM}

Procedure TFormBeallitas.BeallitasMent;
Var FileName : String;
    FileIni  : TIniFile;
Begin
  FileName:=ExtractFilePath(ParamStr(0))+IniFileNev+'.ini';
  FileIni:=TIniFile.Create(FileName);
  Try
    With FileIni Do
    Begin
      WriteString('Beállítások','Winamp',WinampPath.Text);
      WriteInteger('Play','CreditToCash50',SpinEdit1.Value);
      WriteInteger('Play','CreditToCash100',SpinEdit2.Value);
      WriteBool('Beállítások','ShutDown',CheckBox1.Checked);
      WriteBool('Beállítások','ProgiIndit',CheckBox2.Checked);
      WriteInteger('Beállítások','BetuSzin',ColorDialog.Color);
    End;
  Finally
    FreeAndNil(FileIni);
  End;
End;

procedure TFormBeallitas.Button1Click(Sender: TObject);
begin
  If ColorDialog.Execute Then Label5.Font.Color:=ColorDialog.Color;
end;

procedure TFormBeallitas.btnMegseClick(Sender: TObject);
begin
  WinampPath.Text:='';
  Close;
end;

procedure TFormBeallitas.btnModositClick(Sender: TObject);
begin
  BeallitasMent;
  If CheckBox2.Checked Then AutInditBe
    Else AutInditKi;
end;

procedure TFormBeallitas.FormActivate(Sender: TObject);
begin
  ColorDialog.Color:=FormMusicBox.BetuSzin;
  Label5.Font.Color:=ColorDialog.Color;
  SpinEdit1.Value:=FormMusicBox.CreditToCash50;
  SpinEdit2.Value:=FormMusicBox.CreditToCash100;
  CheckBox1.Checked:=FormMusicBox.ShutDown;
  CheckBox2.Checked:=FormMusicBox.ProgiIndit;
  WinampPath.Text:=FormMusicBox.WinampPath;
end;

procedure TFormBeallitas.BtnBoritoClick(Sender: TObject);
begin
  If OpenDialog.Execute Then WinampPath.Text:=OpenDialog.FileName;
end;

procedure TFormBeallitas.AutInditBe;
Var Reg : TRegistry;
begin
  Try
    Reg:=TRegistry.Create;
    With Reg Do
    Begin
      RootKey:=HKEY_LOCAL_MACHINE;
      OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',False);
      WriteString('JukeBox',ParamStr(0));
      CloseKey;
    End;
  Finally
    FreeAndNil(Reg);
  End;
end;

procedure TFormBeallitas.AutInditKi;
Var Reg : TRegistry;
begin
  Try
    Reg:=TRegistry.Create;
    With Reg Do
    Begin
      RootKey:=HKEY_LOCAL_MACHINE;
      OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',False);
      DeleteValue('JukeBox');
      CloseKey;
    End;
  Finally
    FreeAndNil(Reg);
  End;
end;

end.
