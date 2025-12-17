Unit FormSzamModositUnit;

Interface

Uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, Buttons, ExtCtrls;

Type
  TFormSzamModosit = Class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    btnModosit: TBitBtn;
    btnMegse: TBitBtn;
    eEloado: TEdit;
    eCim: TEdit;
    BitBtn1: TBitBtn;
    procedure btnMegseClick(Sender: TObject);
    procedure btnModositClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  End;

Var
  FormSzamModosit: TFormSzamModosit;

Implementation

Uses FormFelvitelUnit;

{$R *.DFM}

procedure TFormSzamModosit.btnMegseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSzamModosit.btnModositClick(Sender: TObject);
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
  With FormFelvitel Do
  Begin
    sgSzamok.Cells[0,sgSzamok.Row]:=Self.eEloado.Text;
    sgSzamok.Cells[1,sgSzamok.Row]:=Self.eCim.Text;
  End;
  Close;
end;

procedure TFormSzamModosit.BitBtn1Click(Sender: TObject);
begin
  Self.eEloado.Text:=FormFelvitel.eEloado.Text;
end;

procedure TFormSzamModosit.FormActivate(Sender: TObject);
begin
  With FormFelvitel Do
  Begin
    Self.eEloado.Text:=sgSzamok.Cells[0,sgSzamok.Row];
    Self.eCim.Text:=sgSzamok.Cells[1,sgSzamok.Row];
  End;
  Self.eEloado.Setfocus;
end;

End.
