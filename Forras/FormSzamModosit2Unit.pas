unit FormSzamModosit2Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormSzamModosit2 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eEloado: TEdit;
    eCim: TEdit;
    btnModosit: TBitBtn;
    btnMegse: TBitBtn;
    eUtvonal: TEdit;
    BtnBorito: TSpeedButton;
    OpenDialog: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure btnMegseClick(Sender: TObject);
    procedure BtnBoritoClick(Sender: TObject);
    procedure btnModositClick(Sender: TObject);
  private
    Procedure Urit;
  end;

var
  FormSzamModosit2: TFormSzamModosit2;

implementation

Uses FormKarbantartUnit, DataModul;

{$R *.DFM}

procedure TFormSzamModosit2.FormActivate(Sender: TObject);
begin
  eEloado.Text:=Dm.SQLSzamok.FieldByName('Eloado').asString;
  eCim.Text:=Dm.SQLSzamok.FieldByName('Szamcim').asString;
  eUtvonal.Text:=Dm.SQLSzamok.FieldByName('Utvonal').asString;
end;

procedure TFormSzamModosit2.Urit;
begin
  eEloado.Text:='';
  eCim.Text:='';
  eUtvonal.Text:='';
end;

procedure TFormSzamModosit2.btnMegseClick(Sender: TObject);
begin
  Urit;
  Close;
end;

procedure TFormSzamModosit2.BtnBoritoClick(Sender: TObject);
begin
  If OpenDialog.Execute Then eUtvonal.Text:=OpenDialog.FileName;
end;

procedure TFormSzamModosit2.btnModositClick(Sender: TObject);
Var Aktiv   : Boolean;
    Frissit : Boolean;
    Index   : String;
begin
  Frissit:=False;
  If (Self.eEloado.Text = '') Then
  Begin
    Self.ActiveControl:=Self.eEloado;
    Exit;
  End;
  If (Self.eCim.Text = '') Then
  Begin
    Self.ActiveControl:=Self.eCim;
    Exit;
  End;
  If (Self.eUtvonal.Text = '') Or (Not FileExists(eUtvonal.Text)) Then
  Begin
    eUtvonal.Text:='';
    Self.ActiveControl:=Self.eUtvonal;
    Exit;
  End;
  Aktiv:=Dm.SzamokTable.Active;
  Index:=Dm.SzamokTable.IndexName;
  //kinyitás indexváltás
  If (Not Dm.SzamokTable.Active) Then Dm.SzamokTable.Open;
  Dm.SzamokTable.IndexName:='Utvonal';
  //rákeresés a keresett rekordra (tquery-t nem lehet írni :-( )
  If Dm.SzamokTable.FindKey([Dm.SQLSzamok.FieldByName('UTVONAL')]) Then
  Begin
    If (eEloado.Text <> Dm.SzamokTable.FieldByName('ELOADO').asString) Then
    Begin
      Dm.SzamokTable.Edit;
      Dm.SzamokTable.FieldByName('ELOADO').asString:=eEloado.Text;
      Dm.SzamokTable.Post;
      Frissit:=True;
    End;

    If (eCim.Text <> Dm.SzamokTable.FieldByName('SZAMCIM').asString) Then
    Begin
      Dm.SzamokTable.Edit;
      Dm.SzamokTable.FieldByName('SZAMCIM').asString:=eCim.Text;
      Dm.SzamokTable.Post;
      Frissit:=True;
    End;

    If (eUtvonal.Text <> Dm.SzamokTable.FieldByName('UTVONAL').asString) Then
    Begin
      Dm.SzamokTable.Edit;
      Dm.SzamokTable.FieldByName('UTVONAL').asString:=eUtvonal.Text;
      Dm.SzamokTable.Post;
      Frissit:=True;
    End;
  End;
  Dm.SzamokTable.Active:=Aktiv;
  Dm.SzamokTable.IndexName:=Index;
  If Frissit Then Dm.SQLLekerdez;
  btnMegseClick(Sender);
end;

end.
