unit FormFelvitelUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, FileCtrl, ExtCtrls, ExtDlgs, AudioInfo,
  FormSzamModositUnit;

type
  TFormFelvitel = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    eEloado: TEdit;
    eCim: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    iBorito: TImage;
    Bevel1: TBevel;
    GroupBox4: TGroupBox;
    btnSzamTorles: TBitBtn;
    sgSzamok: TStringGrid;
    BitBtn3: TBitBtn;
    btnSzamUjra: TBitBtn;
    btnEloadoUjra: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditOpen: TEdit;
    BtnOpen: TSpeedButton;
    EditBorito: TEdit;
    BtnBorito: TSpeedButton;
    OpenPictureDialog: TOpenPictureDialog;
    flbSzamok: TFileListBox;
    BitBtn4: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure BtnOpenClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnBoritoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnSzamTorlesClick(Sender: TObject);
    procedure btnEloadoUjraClick(Sender: TObject);
    procedure btnSzamUjraClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    Function GetTitle(FajlNev: String) : String;
    Function GetArtist(FajlNev: String) : String;
    Function MyPosRet(K: Char; Szoveg : String) : Integer;
    Procedure GridUrites;
  public
    AudioInfo : TAudioInfo;
  end;

var
  FormFelvitel: TFormFelvitel;

implementation

Uses FormOpenUnit, DataModul;

{$R *.DFM}

Function TFormFelvitel.MyPosRet(K: Char; Szoveg : String) : Integer;
Var I : Integer;
Begin
  //hátulról indul, és a legelsõ eggyezõt találja meg
  For I:=Length(Szoveg)-1 DownTo 0 Do
  Begin
    If (Szoveg[i] = K) Then
    Begin
      Result:=i;
      Exit;
    End;
  End;
  Result:=0;
End;

Function TFormFelvitel.GetArtist(FajlNev: String) : String;
Var Osszekot : Integer;
Begin
  Result:='';
  Osszekot:=MyPosRet('-',FajlNev);
  If (Osszekot > 0) Then Result:=Trim(Copy(FajlNev,0,Osszekot-1));
End;

Function TFormFelvitel.GetTitle(FajlNev: String) : String;
Var Osszekot : Integer;
Begin
  Osszekot:=MyPosRet('-',FajlNev);
  Result:=Trim(Copy(FajlNev,Osszekot+1,Length(FajlNev)-(Osszekot+4)));
End;

procedure TFormFelvitel.BtnOpenClick(Sender: TObject);
Var I         : Integer;
    Osszekot1 : Integer;
    Osszekot2 : Integer;
begin
  EditOpen.ReadOnly:=False;
  If (FormOpen.ShowModal = mrOK) Then
  Begin
    EditOpen.Text:=FormOpen.LabelDir.Caption;
    //Cím és elõadó kinyerése a könyvtárnévbõl
    Osszekot1:=MyPosRet('-',EditOpen.Text);
    If (Osszekot1 > 0) Then
    Begin
      eCim.Text:=Trim(Copy(EditOpen.Text,Osszekot1+1,EditOpen.GetTextLen-Osszekot1+1));
      Osszekot2:=MyPosRet('\',EditOpen.Text);
      eEloado.Text:=Trim(Copy(EditOpen.Text,Osszekot2+1,Osszekot1 - (Osszekot2+1)));
    End;
    //borító van e a könyvtárban, ha igen megjelenítés
    flbSzamok.Enabled:=True;
    flbSzamok.Directory:=EditOpen.Text;
    flbSzamok.Mask:='*.jpg;*.jpeg;*.bmp';//OpenPictureDialog.Filter;
    If (flbSzamok.Items.Count > 0) Then
    Begin
      EditBorito.ReadOnly:=False;
      EditBorito.Text:=flbSzamok.Directory+'\'+flbSzamok.Items.Strings[0];
      EditBorito.ReadOnly:=True;
      iBorito.Picture.LoadFromFile(EditBorito.Text);
      iBorito.Refresh;
    End
    Else Begin
      EditBorito.ReadOnly:=False;
      EditBorito.Text:='';
      EditBorito.ReadOnly:=True;
      iBorito.Picture:=Nil;
      iBorito.Refresh;
    End;

    //fájlok betöltése listába
    flbSzamok.Mask:='*.mp3';
    GridUrites;

    For i:=0 To flbSzamok.Items.Count-1 Do
    Begin
      If FileExists(EditOpen.Text+'\'+flbSzamok.Items.Strings[i]) Then
      Begin
        AudioInfo.LoadFromFile(EditOpen.Text+'\'+flbSzamok.Items.Strings[i]);
        If (AudioInfo.ID3.Artist <> '') Then sgSzamok.Cells[0,i+1]:=AudioInfo.ID3.Artist
          Else sgSzamok.Cells[0,i+1]:=GetArtist(flbSzamok.Items.Strings[i]);

        If (AudioInfo.ID3.Title <> '') Then sgSzamok.Cells[1,i+1]:=AudioInfo.ID3.Title
          Else sgSzamok.Cells[1,i+1]:=GetTitle(flbSzamok.Items.Strings[i]);
        sgSzamok.Cells[2,i+1]:=Copy(FormatDateTime ('hh:nn:ss', audioinfo.MpegDuration / (24 * 60 * 60 * 1000)),4,5);
        sgSzamok.Cells[3,i+1]:=ExtractShortPathName(EditOpen.Text+'\'+flbSzamok.Items.Strings[i]);
        If (i < flbSzamok.Items.Count-1) Then
        Begin
          sgSzamok.RowCount:=sgSzamok.RowCount+1;
          sgSzamok.Cells[0,sgSzamok.RowCount]:='';
          sgSzamok.Cells[1,sgSzamok.RowCount]:='';
          sgSzamok.Cells[2,sgSzamok.RowCount]:='';
          sgSzamok.Cells[3,sgSzamok.RowCount]:='';
        End;
      End;
      flbSzamok.Enabled:=False;
    End;
    btnEloadoUjra.Enabled:=True;
    btnSzamUjra.Enabled:=True;
  End
  Else EditOpen.Text:='';
  EditOpen.ReadOnly:=True;
end;

procedure TFormFelvitel.BitBtn2Click(Sender: TObject);
begin
  iBorito.Picture:=nil;
  GridUrites;
  EditOpen.Text:='';
  EditBorito.Text:='';
  eEloado.Text:='';
  eCim.Text:='';
  Close;
end;

procedure TFormFelvitel.BtnBoritoClick(Sender: TObject);
begin
  If OpenPictureDialog.Execute Then
  Begin
    EditBorito.ReadOnly:=False;
    EditBorito.Text:=OpenPictureDialog.FileName;
    EditBorito.ReadOnly:=True;
    iBorito.Picture.LoadFromFile(OpenPictureDialog.FileName);
    iBorito.Refresh;
  End;
end;

procedure TFormFelvitel.FormCreate(Sender: TObject);
begin
  Self.DoubleBuffered:=True;
  sgSzamok.DoubleBuffered:=True;
  AudioInfo:=TAudioInfo.Create;
  sgSzamok.ColWidths[0]:=130;
  sgSzamok.ColWidths[1]:=160;
  sgSzamok.ColWidths[2]:=35;
  sgSzamok.ColWidths[3]:=330;
  sgSzamok.Cells[0,0]:='Elõadó';
  sgSzamok.Cells[1,0]:='Számcím';
  sgSzamok.Cells[2,0]:='Idõ';
  sgSzamok.Cells[3,0]:='Hely';
  EditBorito.ReadOnly:=True;
  EditOpen.ReadOnly:=True;
end;

procedure TFormFelvitel.FormDestroy(Sender: TObject);
begin
  AudioInfo.Free;
end;

procedure TFormFelvitel.BitBtn1Click(Sender: TObject);
Var Albumszam   : Integer;
    AktivAlbum  : Boolean;
    AktivSzamok : Boolean;
    I           : Integer;
    Index       : String;
begin
  If (EditOpen.Text = '') Then Exit;
  If (eEloado.Text = '') Then
  Begin
    Self.ActiveControl:=eEloado;
    Exit;
  End;
  If (eCim.Text = '') Then
  Begin
    Self.ActiveControl:=eCim;
    Exit;
  End;

  With Dm Do
  Begin
    AktivAlbum:=AlbumokTable.Active;
    Index:=AlbumokTable.IndexName;
    AlbumokTable.IndexName:='';
    With AlbumokTable Do
    Begin
      If (Not Active) Then Open;
      Last;
      //sorszám megállapítása
      If Eof And Bof Then Albumszam:=1
        Else Albumszam:=FieldByName('Sorszam').asInteger+1;
      //Album "fejléc" mentése
      Append;
      FieldByName('Eloado').asString:=eEloado.Text;
      FieldByName('Cim').asString:=eCim.Text;
      If (EditBorito.Text <> '') And FileExists(EditBorito.Text) Then
        FieldByName('Borito').asString:=EditBorito.Text;
      FieldByName('Sorszam').asInteger:=Albumszam;
      Post;
      Active:=AktivAlbum;
      IndexName:=Index;
    End;
    //számok mentése
    With SzamokTable Do
    Begin
      AktivSzamok:=Active;
      If (Not Active) Then Open;
      For I:=1 To sgSzamok.RowCount-1 Do
      Begin
        Append;
        FieldByName('Albumszam').asInteger:=Albumszam;
        FieldByName('Szamindex').asInteger:=i;
        FieldByName('Eloado').asString:=sgSzamok.Cells[0,i];
        FieldByName('Szamcim').asString:=sgSzamok.Cells[1,i];
        FieldByName('Perc').asString:=sgSzamok.Cells[2,i];
        FieldByName('Utvonal').asString:=sgSzamok.Cells[3,i];
        FieldByName('Jatszva').asInteger:=0;
        Post;
      End;
      Active:=AktivSzamok;
    End;
  End;

  EditOpen.ReadOnly:=False;
  EditOpen.Text:='';
  EditOpen.ReadOnly:=True;
  eEloado.Text:='';
  eCim.Text:='';
  EditBorito.ReadOnly:=False;
  EditBorito.Text:='';
  EditBorito.ReadOnly:=True;
  iBorito.Picture:=Nil;
  GridUrites;
end;

procedure TFormFelvitel.GridUrites;
begin
  sgSzamok.RowCount:=2;
  sgSzamok.Rows[1].Clear;
end;

procedure TFormFelvitel.BitBtn4Click(Sender: TObject);
Var I : Integer;
begin
  If (flbSzamok.Items.Count > 0) And (eEloado.Text <> '') Then
    For i:=0 To flbSzamok.Items.Count-1 Do sgSzamok.Cells[0,i+1]:=eEloado.Text;
end;

procedure TFormFelvitel.btnSzamTorlesClick(Sender: TObject);
Var i : Integer;
begin
  If (sgSzamok.Rowcount > 1) Then
  Begin
    For i:=sgSzamok.Row to sgSzamok.Rowcount-2 Do
    Begin
      sgSzamok.Cells[0,i]:=sgSzamok.Cells[0,i+1];
      sgSzamok.Cells[1,i]:=sgSzamok.Cells[1,i+1];
      sgSzamok.Cells[2,i]:=sgSzamok.Cells[2,i+1];
      sgSzamok.Cells[3,i]:=sgSzamok.Cells[3,i+1];
    End;
    sgSzamok.Cells[0,sgSzamok.RowCount-1]:='';
    sgSzamok.Cells[1,sgSzamok.RowCount-1]:='';
    sgSzamok.Cells[2,sgSzamok.RowCount-1]:='';
    sgSzamok.Cells[3,sgSzamok.RowCount-1]:='';
    If (sgSzamok.Rowcount > 2) Then sgSzamok.RowCount:=sgSzamok.RowCount-1;
  End;
end;

procedure TFormFelvitel.btnEloadoUjraClick(Sender: TObject);
Var I : Integer;
begin
  For I:=0 To flbSzamok.Items.Count-1 Do
  Begin
    If FileExists(EditOpen.Text+'\'+flbSzamok.Items.Strings[i]) Then
    Begin
      sgSzamok.Cells[0,i+1]:=GetArtist(flbSzamok.Items.Strings[i]);
    End;
  End;
end;

procedure TFormFelvitel.btnSzamUjraClick(Sender: TObject);
Var I : Integer;
begin
  For I:=0 To flbSzamok.Items.Count-1 Do
  Begin
    If FileExists(EditOpen.Text+'\'+flbSzamok.Items.Strings[i]) Then
    Begin
      sgSzamok.Cells[1,i+1]:=GetTitle(flbSzamok.Items.Strings[i]);
    End;
  End;
end;

procedure TFormFelvitel.BitBtn3Click(Sender: TObject);
begin
  If (sgSzamok.Rowcount > 1) Then FormSzamModosit.ShowModal;
end;

procedure TFormFelvitel.SpeedButton1Click(Sender: TObject);
begin
  EditBorito.ReadOnly:=False;
  EditBorito.Text:='';
  EditBorito.ReadOnly:=True;
  iBorito.Picture:=Nil;
end;

end.
