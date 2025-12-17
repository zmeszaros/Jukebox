unit FormKarbantartUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls;

type
  TFormKarbantart = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnAlbumTorles: TBitBtn;
    BtnAlbumModosit: TBitBtn;
    btnSzamTorles: TBitBtn;
    btnSzamModosit: TBitBtn;
    Bevel1: TBevel;
    iBorito: TImage;
    BtnBezar: TBitBtn;
    Label3: TLabel;
    DBGridAlbum: TDBGrid;
    DBGridSzamok: TDBGrid;
    procedure BtnAlbumModositClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridAlbumCellClick(Column: TColumn);
    procedure DBGridAlbumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSzamModositClick(Sender: TObject);
    procedure btnSzamTorlesClick(Sender: TObject);
    procedure btnAlbumTorlesClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BtnBezarClick(Sender: TObject);
  private
    Procedure KepBetolt;
  end;

var
  FormKarbantart: TFormKarbantart;

implementation

Uses FoUnit, FormAlbModositUnit, DataModul, FormSzamModosit2Unit;

{$R *.DFM}

procedure TFormKarbantart.BtnAlbumModositClick(Sender: TObject);
begin
  If (Dm.AlbumokTable.RecordCount > 0) Then FormAlbModosit.ShowModal;
end;

procedure TFormKarbantart.FormCreate(Sender: TObject);
begin
  Self.DoubleBuffered:=True;
  DBGridAlbum.DoubleBuffered:=True;
  DBGridSzamok.DoubleBuffered:=True;
end;

procedure TFormKarbantart.FormActivate(Sender: TObject);
begin
  Self.ActiveControl:=DBGridAlbum;
  KepBetolt;
end;

procedure TFormKarbantart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key = VK_RETURN) Or (Key = 13) Then
  Begin
    If (Self.ActiveControl = DBGridAlbum) Then BtnAlbumModositClick(Sender);
    If (Self.ActiveControl = DBGridSzamok) Then btnSzamModositClick(Sender);
  End;
  If (Key = VK_ESCAPE) Or (Key = 27) Then BtnBezarClick(Sender);
end;

procedure TFormKarbantart.DBGridAlbumCellClick(Column: TColumn);
begin
  KepBetolt;
  Dm.SQLLekerdez;
end;

procedure TFormKarbantart.DBGridAlbumKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If (Key = VK_UP) Then
  Begin
    If (Not Dm.AlbumokTable.BOF) Then
    Begin
      Dm.AlbumokTable.Prior;
      KepBetolt;
      Dm.SQLLekerdez;
    End;
    Key:=0;
  End;
  If (Key = VK_DOWN) Then
  Begin
    If (Not Dm.AlbumokTable.EOF) Then
    Begin
      Dm.AlbumokTable.Next;
      KepBetolt;
      Dm.SQLLekerdez;
    End;
    Key:=0;
  End;
end;

procedure TFormKarbantart.KepBetolt;
Var Kep : String;
begin
  Kep:=Dm.AlbumokTable.FieldByName('Borito').asString;
  If FileExists(Kep) Then iBorito.Picture.LoadFromFile(Kep)
    Else iBorito.Picture:=Nil;
end;

procedure TFormKarbantart.btnSzamModositClick(Sender: TObject);
begin
  If (Dm.SQLSzamok.RecordCount > 0) Then FormSzamModosit2.ShowModal;
end;

procedure TFormKarbantart.btnSzamTorlesClick(Sender: TObject);
Var Aktiv   : Boolean;
    Frissit : Boolean;
    Index   : String;
begin
  Frissit:=False;
  Aktiv:=Dm.SzamokTable.Active;
  Index:=Dm.SzamokTable.IndexName;
  //kinyitás indexváltás
  If (Not Dm.SzamokTable.Active) Then Dm.SzamokTable.Open;
  If (Dm.SzamokTable.RecordCount > 0) Then
  Begin
    Dm.SzamokTable.IndexName:='Utvonal';
    //rákeresés a keresett rekordra (tquery-t nem lehet írni :-( )
    If Dm.SzamokTable.FindKey([Dm.SQLSzamok.FieldByName('UTVONAL')]) Then
    Begin
      Dm.SzamokTable.Delete;
      Frissit:=True;
    End;
  End;
  Dm.SzamokTable.Active:=Aktiv;
  Dm.SzamokTable.IndexName:=Index;
  If Frissit Then
  Begin
    Dm.SQLLekerdez;
    DBGridSzamok.SetFocus;
  End;
end;

procedure TFormKarbantart.btnAlbumTorlesClick(Sender: TObject);
Var Aktiv   : Boolean;
begin
  Aktiv:=Dm.AlbumokTable.Active;
  If (Not Aktiv) Then Dm.AlbumokTable.Open;
  If (Dm.AlbumokTable.RecordCount > 0) Then
  Begin
    Dm.SQLTorol;
    Dm.AlbumokTable.Delete;
    Dm.AlbumokToroltRekordEl;
    Dm.SQLLekerdez;
    DBGridAlbum.SetFocus;
  End;
  Dm.AlbumokTable.Active:=Aktiv;
end;

procedure TFormKarbantart.BtnBezarClick(Sender: TObject);
begin
  iBorito.Picture:=Nil;
  Close;
end;

end.
