unit FormAlbModositUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtDlgs, Buttons, StdCtrls, Mask, DBCtrls;

type
  TFormAlbModosit = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eEloado: TEdit;
    eCim: TEdit;
    btnModosit: TBitBtn;
    btnMegse: TBitBtn;
    EditBorito: TEdit;
    BtnBorito: TSpeedButton;
    OpenPictureDialog: TOpenPictureDialog;
    procedure BtnBoritoClick(Sender: TObject);
    procedure btnMegseClick(Sender: TObject);
    procedure btnModositClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    Procedure Urit;
  end;

var
  FormAlbModosit: TFormAlbModosit;

implementation

uses DataModul, FormKarbantartUnit;

{$R *.DFM}

procedure TFormAlbModosit.BtnBoritoClick(Sender: TObject);
begin
  If OpenPictureDialog.Execute Then EditBorito.Text:=OpenPictureDialog.FileName;
end;

procedure TFormAlbModosit.Urit;
begin
  eCim.Text:='';
  eEloado.Text:='';
  EditBorito.Text:='';
end;

procedure TFormAlbModosit.btnMegseClick(Sender: TObject);
begin
  Urit;
  Close;
end;

procedure TFormAlbModosit.btnModositClick(Sender: TObject);
begin
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
  If (eEloado.Text <> Dm.AlbumokTable.FieldByName('Eloado').asString) Then
  Begin
    Dm.AlbumokTable.Edit;
    Dm.AlbumokTable.FieldByName('Eloado').asString:=eEloado.Text;
    Dm.AlbumokTable.Post;
  End;

  If (eCim.Text <> Dm.AlbumokTable.FieldByName('Cim').asString) Then
  Begin
    Dm.AlbumokTable.Edit;
    Dm.AlbumokTable.FieldByName('Cim').asString:=eCim.Text;
    Dm.AlbumokTable.Post;
  End;

  If (EditBorito.Text <> Dm.AlbumokTable.FieldByName('Borito').asString) Then
  Begin
    Dm.AlbumokTable.Edit;
    Dm.AlbumokTable.FieldByName('Borito').asString:=EditBorito.Text;
    Dm.AlbumokTable.Post;
    If (EditBorito.Text <> '') And FileExists(EditBorito.Text) Then
      FormKarbantart.iBorito.Picture.LoadFromFile(EditBorito.Text)
    Else FormKarbantart.iBorito.Picture:=Nil;
    FormKarbantart.iBorito.Refresh;
  End;
  btnMegseClick(Sender);
end;

procedure TFormAlbModosit.FormActivate(Sender: TObject);
begin
  eEloado.Text:=Dm.AlbumokTable.FieldByName('Eloado').asString;
  eCim.Text:=Dm.AlbumokTable.FieldByName('Cim').asString;
  EditBorito.Text:=Dm.AlbumokTable.FieldByName('Borito').asString;
end;

end.
