unit FormStatisztikaUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, IniFiles, ExtCtrls, FileCtrl;

type
  TFormStatisztika = class(TForm)
    GridStat: TDBGrid;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnMegse: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    BitBtn1: TBitBtn;
    procedure btnMegseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Cash50       : Integer;
    Cash100      : Integer;
    Halmozott50  : String;
    Halmozott100 : String;
    UtolsoNaplo  : String;
    Procedure Urit;
    Procedure CashBeolvas;
  public
    Function DatumAtAlakit: String;
  end;

var
  FormStatisztika: TFormStatisztika;

implementation

Uses DataModul, FoUnit;

{$R *.DFM}

Function TFormStatisztika.DatumAtAlakit: String;
Var Pos,I : Integer;
Begin
  Result:=Trim(DateToStr(Date));
  Pos:=System.Pos('.',Result);
  For I:=0 To 1 Do
  Begin
    If (Pos > 0) Then
    Begin
      System.Delete(Result,Pos,1);
      System.Insert('_',Result,Pos);
      While (System.Pos(' ',Result) > 0) Do System.Delete(Result,System.Pos(' ',Result),1);
      Pos:=System.Pos('.',Result);
    End;
  End;
  If (Pos > 0) Then System.Delete(Result,Pos,1);
End;

procedure TFormStatisztika.btnMegseClick(Sender: TObject);
begin
  Urit;
  Close;
end;

procedure TFormStatisztika.CashBeolvas;
Var FileName : String;
    Proba    : String;
    FileIni  : TIniFile;
Begin
  FileName:=ExtractFilePath(ParamStr(0))+IniFileNev+'.ini';
  FileIni:=TIniFile.Create(FileName);
  Try
    With FileIni Do
    Begin
      Proba:=ReadString('Cash','Cash50','¤');
      If (Proba = '¤') Then WriteInteger('Cash','Cash50',0);
      Cash50:=ReadInteger('Cash','Cash50',Cash50);

      Proba:=ReadString('Cash','Cash100','¤');
      If (Proba = '¤') Then WriteInteger('Cash','Cash100',0);
      Cash100:=ReadInteger('Cash','Cash100',Cash100);

      Proba:=ReadString('Naplo','UtolsoNaplo','¤');
      If (Proba = '¤') Then WriteString('Naplo','UtolsoNaplo','');
      UtolsoNaplo:=ReadString('Naplo','UtolsoNaplo','');

      Proba:=ReadString('Naplo','Halmozott50','¤');
      If (Proba = '¤') Then WriteString('Naplo','Halmozott50','0');
      Halmozott50:=ReadString('Naplo','Halmozott50','0');

      Proba:=ReadString('Naplo','Halmozott100','¤');
      If (Proba = '¤') Then WriteString('Naplo','Halmozott100','0');
      Halmozott100:=ReadString('Naplo','Halmozott100','0');
    End;
  Finally
    FreeAndNil(FileIni);
  End;
end;

procedure TFormStatisztika.Urit;
begin
  Edit1.ReadOnly:=False;
  Edit1.Text:='';
  Edit1.ReadOnly:=True;
  Edit2.ReadOnly:=False;
  Edit2.Text:='';
  Edit2.ReadOnly:=True;
end;

procedure TFormStatisztika.FormActivate(Sender: TObject);
begin
  CashBeolvas;
  Edit1.ReadOnly:=False;
  Edit1.Text:=' '+IntToStr(Cash50)+' db';
  Edit1.ReadOnly:=True;
  Label6.Caption:=IntToStr(50*Cash50);
  Edit2.ReadOnly:=False;
  Edit2.Text:=' '+IntToStr(Cash100)+' db';
  Edit2.ReadOnly:=True;
  Label7.Caption:=IntToStr(100*Cash100);
  Label11.Caption:=IntToStr((50*Cash50)+(100*Cash100));
  Dm.SQLLejatszva;
end;

procedure TFormStatisztika.BitBtn1Click(Sender: TObject);
Var NaploList : TStringList;
    FileName  : String;
    FileIni   : TIniFile;
    Halmozott : Integer;
begin
  // létezik a mentés könyvtár?
  If (Not DirectoryExists(NAPLODIR)) Then
  Begin
    // létre tudjuk hozni ?
    If (Not CreateDir(NAPLODIR)) Then
    Begin
      Raise Exception.Create('Nem tudtam létrehozni a(z) "'+NAPLODIR+'" könyvtárat!'+
        #13+'Az adatok nem lettek mentve !');
    End;
  End;
  NaploList:=TStringList.Create;
  With NaploList Do
  Begin
    Add('Utolsó naplózás dátuma    : '+UtolsoNaplo);
    Add('Halmozott 50 Ft-os érmék  : '+Halmozott50+' db');
    Add('Halmozott 100 Ft-os érmék : '+Halmozott100+' db');
    Add('');
    Add('Azóta bedobott érmék:');
    Add('--------------------');
    Add('50 Ft-os érme  : '+Edit1.Text+' = '+Label6.Caption+' Ft');
    Add('100 Ft-os érme : '+Edit2.Text+' = '+Label7.Caption+' Ft');
    Add('Összesen       : '+Label11.Caption+' Ft');
    SaveToFile(ExtractFilePath(paramstr(0))+NAPLODIR+'\'+DatumAtAlakit+'.txt');
  End;
  FreeAndNil(NaploList);
  FileName:=ExtractFilePath(ParamStr(0))+IniFileNev+'.ini';
  FileIni:=TIniFile.Create(FileName);
  Try
    With FileIni Do
    Begin
      WriteInteger('Cash','Cash50',0);
      WriteInteger('Cash','Cash100',0);
      WriteString('Naplo','UtolsoNaplo',Trim(DateToStr(Date)));
      Halmozott:=StrToInt(Halmozott50)+Cash50;
      WriteString('Naplo','Halmozott50',IntToStr(Halmozott));
      Halmozott:=StrToInt(Halmozott100)+Cash100;
      WriteString('Naplo','Halmozott100',IntToStr(Halmozott));
    End;
  Finally
    FreeAndNil(FileIni);
  End;
  Self.Cash50:=0;
  Self.Cash100:=0;
  FormMusicBox.Cash50:=0;
  FormMusicBox.Cash100:=0;
  Edit1.ReadOnly:=False;
  Edit1.Text:=' '+IntToStr(Cash50)+' db';
  Edit1.ReadOnly:=True;
  Label6.Caption:=IntToStr(50*Cash50);
  Edit2.ReadOnly:=False;
  Edit2.Text:=' '+IntToStr(Cash100)+' db';
  Edit2.ReadOnly:=True;
  Label7.Caption:=IntToStr(100*Cash100);
  Label11.Caption:=IntToStr((50*Cash50)+(100*Cash100));
end;

end.
