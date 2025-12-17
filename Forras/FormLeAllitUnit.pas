unit FormLeAllitUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TFormLeAllit = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    Button1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    HatralevoIdo : Integer;
  end;

var
  FormLeAllit: TFormLeAllit;

implementation

{$R *.DFM}

procedure TFormLeAllit.FormCreate(Sender: TObject);
begin
  Timer1.Enabled:=False;
end;

procedure TFormLeAllit.FormActivate(Sender: TObject);
begin
  HatralevoIdo:=ProgressBar1.Max;
  Label2.Caption:=IntToStr(ProgressBar1.Max);
  Timer1.Enabled:=True;
  ProgressBar1.Position:=ProgressBar1.Min;
end;

procedure TFormLeAllit.Timer1Timer(Sender: TObject);
begin
  Dec(HatralevoIdo);
  Label2.Caption:=IntToStr(HatralevoIdo);
  ProgressBar1.Position:=ProgressBar1.Max-HatralevoIdo;
  If (HatralevoIdo <= 0) Then
  Begin
    Timer1.Enabled:=False;
    Self.ModalResult:=mrOK;
  End;
end;

procedure TFormLeAllit.Button1Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
  Self.ModalResult:=mrCancel;
end;

end.
