unit FoUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ExtDlgs, JPeg, ExtCtrls, IniFiles, DataModul, Grids,
  DBGrids, ATWinAmpDriver, Buttons, FileCtrl, Winamp, LCDScreen, Animate,
  GIFCtrl, RXDBCtrl, DB, MMSystem;

Const INIFILENEV    = 'Lejatszo';
      DBALBUMNEV    = 'Albumok';
      DBSZAMOKNEV   = 'Szamok';
      DBKIT         = '.dbf';
      INDKIT        = '.mdx';
      NAPLODIR      = 'Naplok';
      MENTESEKDIR   = 'Mentesek';
      KILEPES       = VK_MULTIPLY;
      ALBUMELORE    = VK_NUMPAD2;
      ALBUMHATRA    = VK_NUMPAD8;
      SZAMKOVETKEZO = VK_NUMPAD3;
      SZAMELOZO     = VK_NUMPAD9;
      PENZ_50       = VK_NUMPAD7;
      PENZ_100      = VK_NUMPAD4;
      SZAMKIVALASZT = VK_NUMPAD5;
      HANGNOVEL     = VK_ADD;
      HANGCSOKKENT  = VK_SUBTRACT;
      LISTATORLES   = VK_NUMPAD0;
      GRIDSZIN      = TColor(12219649);
      LINEINUP      = True;
      LINEINDOWN    = False;

type
  TVolume = Object
    Left   : Word;
    Right  : Word;
    Arany  : Word;
    Irany  : Boolean;
    Mentve : Boolean;
    Procedure GetVolume;
    Procedure SetVolume(Ertek: DWORD);
  End;

  TFormMusicBox = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    BeallitMenu: TMenuItem;
    N2: TMenuItem;
    KilepMenu: TMenuItem;
    HatterMenu: TMenuItem;
    HatterRejtMenu: TMenuItem;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    CreditLabel: TLabel;
    Bevel5: TBevel;
    Label3: TLabel;
    Bevel6: TBevel;
    PLLabel1: TLabel;
    PLLabel2: TLabel;
    PLLabel3: TLabel;
    DBGridSzamok: TDBGrid;
    Bevel7: TBevel;
    Bevel8: TBevel;
    LabelAktualis: TLabel;
    Bevel9: TBevel;
    AlbumLabel: TLabel;
    Credit1: TMenuItem;
    Credit3: TMenuItem;
    BoritoImage: TImage;
    N1: TMenuItem;
    Albumfelvitele1: TMenuItem;
    Mdostsok1: TMenuItem;
    Statisztika1: TMenuItem;
    ProgramBeallitMenu: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    WinampTimer: TTimer;
    Winamp: TWinamp;
    LCDScreen: TLCDScreen;
    LCDAnimator: TLCDAnimator;
    LCDTimer: TTimer;
    CycleLCDAnimator: TLCDAnimator;
    GravityLCDAnimator: TLCDAnimator;
    FlashLCDAnimator: TLCDAnimator;
    WaveLCDAnimator: TLCDAnimator;
    RxGIFAnimator1: TRxGIFAnimator;
    RxGIFAnimator2: TRxGIFAnimator;
    Image2: TImage;
    Image3: TImage;
    iElozoBorito: TImage;
    iKovBorito: TImage;
    Bevel3: TBevel;
    Bevel4: TBevel;
    HatterTimer: TTimer;
    Image4: TImage;
    FelTimer: TTimer;
    LeTimer: TTimer;
    RandTimer: TTimer;
    iSegedKep: TImage;
    VolumeTimer: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HatterMenuClick(Sender: TObject);
    procedure HatterRejtMenuClick(Sender: TObject);
    procedure KilepMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Credit1Click(Sender: TObject);
    procedure Credit3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Albumfelvitele1Click(Sender: TObject);
    procedure Mdostsok1Click(Sender: TObject);
    procedure Statisztika1Click(Sender: TObject);
    procedure ProgramBeallitMenuClick(Sender: TObject);
    procedure WinampTimerTimer(Sender: TObject);
    procedure WinampStartPlay(Sender: TObject);
    procedure WinampStopPlay(Sender: TObject);
    procedure LCDTimerTimer(Sender: TObject);
    procedure RxGIFAnimator2FrameChanged(Sender: TObject);
    procedure RxGIFAnimator1FrameChanged(Sender: TObject);
    procedure HatterTimerTimer(Sender: TObject);
    procedure FelTimerTimer(Sender: TObject);
    procedure RandTimerTimer(Sender: TObject);
    procedure LeTimerTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VolumeTimerTimer(Sender: TObject);
  private
    HatterKep     : String;    // a háttérkép útvonala
    HatterRejtett : Boolean;   // látszik-e a háttárkép
    Credit        : Integer;   // Credit -ek számát tárolja
    SavePlace     : TBookmark;
    LineInVolume  : TVolume;
    function IsWinAmpRunning : Boolean;
    function GetWinAmpHandle : HWnd;
    Function Ellenor(Fajlnev: String) : Boolean;
    Function HatterBeallit(FileNev: String) : Boolean;
    Procedure HatterBetolt;
    Procedure HatterMent;
    Procedure HatterRejt;
    Procedure HatterBehoz;
    Procedure DBToltes;
    Procedure DBMentes;
    Procedure BetuSzinAtallit;
    Procedure ListaTorlese;
    Procedure FileCopy(Const SourceFileName,Targetfilename: String);
    Procedure PlayListFrissit;
    Procedure SavePlayList;
    Procedure CreditBeolvas;
    Procedure CreditKiir(IniNeed: Boolean);
    Procedure HatterEloreHatra(Ertek: Boolean);
    Procedure TransparenetBeallit(Ertek: Boolean);
  public
    WinampPath      : String;      // winamp elérési útvolnala
    Cash50          : Integer;     // bedobott 50 - esek
    Cash100         : Integer;     // bedobott 100 - asok
    BetuSzin        : Integer;     // feliratok színe
    Szamlalo        : Integer;     // melyik albumon állunk
    CreditToCash50  : Integer;     // mennyi Credit jár az 50 Ft-ért
    CreditToCash100 : Integer;     // mennyi Credit jár a 100 Ft-ért
    ShutDown        : Boolean;     // automatikus kikapcsolás
    ProgiIndit      : Boolean;     // automatikus programindítás
    PlayList        : TStringList; // elõadó számcím
    PlayListFile    : TStringList; // fájlnév
    PlayListStatus  : TStringList; // lejátszási státusz 0 -nincs lejátszva, 1 lejátszva
    Procedure BeallitasBetolt;     // beállítások betöltése ini-bõl
  end;

  Function GetLineInHandle(AudioType: Integer) : Integer;

var
  FormMusicBox: TFormMusicBox;

implementation

Uses FormFelvitelUnit, FormKarbantartUnit, FormStatisztikaUnit,
     FormBeallitasUnit, FormLeAllitUnit;

{$R *.DFM}

//LineIn lekérdezése
Function GetLineInHandle(AudioType: Integer) : Integer;
Var I         : Integer;
    AudioCaps : TAuxCaps;
Begin
  Result:=0;
  For I:=0 To auxGetNumDevs-1 Do
  Begin
    auxGetDevCaps(I,@AudioCaps,SizeOf(AudioCaps));
    If AudioCaps.wTechnology = AudioType Then
    Begin
      Result:=I;
      Break;
    End;
  End;
End;

procedure TVolume.SetVolume(Ertek: DWORD);
begin
  AuxSetVolume(GetLineInHandle(AUXCAPS_AUXIN),Ertek);
end;

Procedure TVolume.GetVolume;
Var Vol : DWord;
Begin
  AuxGetVolume(GetLineInHandle(AUXCAPS_AUXIN),@Vol);
  Left:=LoWord(Vol);
  Right:=HiWord(Vol);
  If (Left <> Right) Then
  Begin
    If (Left > Right) Then Right:=Left
    Else Left:=Right;
  End;
  Arany:=Abs(Left Div 10);
End;

Procedure TFormMusicBox.VolumeTimerTimer(Sender: TObject);
Var vHang : Integer;
    Vol   : DWord;
Begin
  VolumeTimer.Tag:=VolumeTimer.Tag+1;
  AuxGetVolume(GetLineInHandle(AUXCAPS_AUXIN),@Vol);
  vHang:=LoWord(Vol);
  If LineInVolume.Irany Then
  Begin
    Inc(vHang,LineInVolume.Arany);
    If (vHang < LineInVolume.Left) Then Vol:=MakeLong(Word(vHang),Word(vHang))
    Else Begin
      vHang:=LineInVolume.Left;
      Vol:=MakeLong(Word(vHang),Word(vHang));
      VolumeTimer.Enabled:=False;
    End;
  End
  Else Begin
    Dec(vHang,LineInVolume.Arany);
    If (vHang > 0) Then Vol:=MakeLong(Word(vHang),Word(vHang))
    Else Begin
      vHang:=0;
      Vol:=MakeLong(Word(vHang),Word(vHang));
      VolumeTimer.Enabled:=False;
    End;
  End;
  LineInVolume.SetVolume(Vol);
  If (VolumeTimer.Tag > 20) Then VolumeTimer.Enabled:=False;
End;

//fut-e a Winamp
function TFormMusicBox.IsWinAmpRunning : Boolean;
begin
  If (GetWinAmpHandle <> 0) Then Result:=True
  Else Result:=False;
end;

//lekérdezi a Winamp kezelõjét
function TFormMusicBox.GetWinAmpHandle : HWnd;
begin
  Result:=FindWindow('Winamp v1.x',nil);  
end;

//háttárkép elmentése ini-be
Procedure TFormMusicBox.HatterMent;
Var FileName : String;
    FileIni  : TIniFile;
Begin
  FileName:=ExtractFilePath(ParamStr(0))+IniFileNev+'.ini';
  FileIni:=TIniFile.Create(FileName);
  Try
    With FileIni Do
    Begin
      WriteString('Beállítások','HatterKep',HatterKep);
      WriteBool('Beállítások','HatterRejtett',HatterRejtett);
    End;
  Finally
    FreeAndNil(FileIni);
  End;
End;

//háttárkép betöltése ini-bõl
procedure TFormMusicBox.HatterBetolt;
Var Proba    : String;
    FileName : String;
    IniFile  : TIniFile;
Begin
  FileName:=ExtractFilePath(ParamStr(0))+IniFileNev+'.ini';
  IniFile:=TIniFile.Create(FileName);
  Try
    With IniFile Do
    Begin
      Proba:=ReadString('Beállítások','HatterKep','¤');
      If (Proba = '¤') Then WriteString('Beállítások','HatterKep','');
      HatterKep:=ReadString('Beállítások','HatterKep','');

      Proba:=ReadString('Beállítások','HatterRejtett','¤');
      If (Proba = '¤') Then WriteBool('Beállítások','HatterRejtett',False);
      HatterRejtett:=ReadBool('Beállítások','HatterRejtett',False);
    End;
  Finally
    FreeAndNil(IniFile);
  End;
End;

//beállítások betöltése ini-bõl
procedure TFormMusicBox.BeallitasBetolt;
Var Proba    : String;
    FileName : String;
    IniFile  : TIniFile;
Begin
  FileName:=ExtractFilePath(ParamStr(0))+IniFileNev+'.ini';
  IniFile:=TIniFile.Create(FileName);
  Try
    With IniFile Do
    Begin
      Proba:=ReadString('Play','CreditToCash50','¤');
      If (Proba = '¤') Then WriteInteger('Play','CreditToCash50',1);
      CreditToCash50:=ReadInteger('Play','CreditToCash50',CreditToCash50);

      Proba:=ReadString('Play','CreditToCash100','¤');
      If (Proba = '¤') Then WriteInteger('Play','CreditToCash100',3);
      CreditToCash100:=ReadInteger('Play','CreditToCash100',CreditToCash100);

      Proba:=ReadString('Beállítások','BetuSzin','¤');
      If (Proba = '¤') Then WriteInteger('Beállítások','BetuSzin',clBlack);
      BetuSzin:=ReadInteger('Beállítások','BetuSzin',clBlack);

      Proba:=ReadString('Beállítások','ShutDown','¤');
      If (Proba = '¤') Then WriteBool('Beállítások','ShutDown',False);
      ShutDown:=ReadBool('Beállítások','ShutDown',False);

      Proba:=ReadString('Beállítások','ProgiIndit','¤');
      If (Proba = '¤') Then WriteBool('Beállítások','ProgiIndit',False);
      ProgiIndit:=ReadBool('Beállítások','ProgiIndit',False);

      Winamp.PathToWinAmp:='';
      Proba:=ReadString('Beállítások','Winamp','¤');
      If (Proba = '¤') Then WriteString('Beállítások','Winamp','');
      WinampPath:=ReadString('Beállítások','Winamp','');
      Winamp.PathToWinAmp:=WinampPath;
    End;
  Finally
    FreeAndNil(IniFile);
  End;
End;

//mennyi creditünk van, ini-bõl olvassa be
procedure TFormMusicBox.CreditBeolvas;
Var FileName : String;
    Proba    : String;
    FileIni  : TIniFile;
Begin
  FileName:=ExtractFilePath(ParamStr(0))+IniFileNev+'.ini';
  FileIni:=TIniFile.Create(FileName);
  Try
    With FileIni Do
    Begin
      Proba:=ReadString('Play','Credit','¤');
      If (Proba = '¤') Then WriteInteger('Play','Credit',0);
      Credit:=ReadInteger('Play','Credit',Credit);

      Proba:=ReadString('Cash','Cash50','¤');
      If (Proba = '¤') Then WriteInteger('Cash','Cash50',0);
      Cash50:=ReadInteger('Cash','Cash50',Cash50);

      Proba:=ReadString('Cash','Cash100','¤');
      If (Proba = '¤') Then WriteInteger('Cash','Cash100',0);
      Cash100:=ReadInteger('Cash','Cash100',Cash100);
    End;
  Finally
    FreeAndNil(FileIni);
  End;
  CreditLabel.Caption:=IntToStr(Credit);
End;

//az átadott fájlnév létezését leellenõrzi, és ha nem létezik hibaüzenetet ad
Function TFormMusicBox.Ellenor(Fajlnev : String) : Boolean;
Begin
  If (Not FileExists(ExtractFilePath(paramstr(0))+Fajlnev)) Then
  Begin
    ShowMessage(' Hiányzik a(z) '+Fajlnev+' ! ');
    Result:=False;
  End
  Else Result:=True;
End;

//háttérkép betöltése
Function TFormMusicBox.HatterBeallit(FileNev: String) : Boolean;
begin
  Try
    Image1.Picture.LoadFromFile(FileNev);
    Image1.Align:=alClient;
    HatterRejtMenu.Enabled:=True;
    HatterBehoz;
    HatterKep:=FileNev;
    HatterMent;
    With OpenPictureDialog1 Do InitialDir:=ExtractFileDir(FileNev);
    Result:=True;
  Except
    on EInvalidGraphic Do Begin
      Image1.Picture:=Nil;
      HatterRejtMenu.Checked:=False;
      Result:=False;
    End;
    on EFOpenError Do Begin
      Image1.Picture:=Nil;
      HatterRejtMenu.Checked:=False;
      HatterRejtMenu.Enabled:=False;
      Result:=False;
    End;
  End;
end;

procedure TFormMusicBox.HatterMenuClick(Sender: TObject);
begin
  HatterTimer.Enabled:=False;
  If OpenPictureDialog1.Execute Then HatterBeallit(OpenPictureDialog1.FileName);
  HatterTimer.Enabled:=True;
end;

//háttér láthatóvá tétele
procedure TFormMusicBox.HatterBehoz;
begin
  If (Image1.Picture.Graphic <> Nil) Then
  Begin
    HatterRejtMenu.Checked:=False;
    Image1.Visible:=True;
  End;
end;

//háttér elrejtése
procedure TFormMusicBox.HatterRejt;
begin
  If (Image1.Picture.Graphic <> Nil) Then
  Begin
    HatterRejtMenu.Checked:=True;
    Image1.Visible:=False;
  End;
end;

procedure TFormMusicBox.HatterRejtMenuClick(Sender: TObject);
begin
  If HatterRejtMenu.Checked Then HatterBehoz
    Else HatterRejt;
  HatterRejtett:=HatterRejtMenu.Checked;
  HatterMent;
end;

procedure TFormMusicBox.FormCreate(Sender: TObject);
Var KS        : TKeyboardState;
    Tovabb    : Boolean;
    VanMentes : Boolean;
begin
  Self.DoubleBuffered:=True;
  DBGridSzamok.DoubleBuffered:=True;
  //DBGridSzamok.Color:=integer(GRIDSZIN);
  LCDAnimator.Code.Clear;
  LCDAnimator.Code.Add('[HorzScroll(-1); ]');
  LCDScreen.AnimationEnabled:=True;
  LCDTimer.Enabled:=True;
  RxGIFAnimator1.Animate:=False;
  RxGIFAnimator2.Animate:=False;
  Image4.Height:=240;
  Image4.Width:=240;

  //adatok beolvasása ini-bõl
  BeallitasBetolt;
  HatterBetolt;
  BetuSzinAtAllit;
  CreditBeolvas;

  //háttérkép beállítása
  Image1.Visible:=False;
  HatterRejtMenu.Enabled:=False;
  If (HatterKep <> '') Then HatterBeallit(HatterKep);
  If HatterRejtett Then HatterRejt
    Else HatterBehoz;

  //albumszámláló kezdeti értéke
  Szamlalo:=1;

  //Egér eltüntetése
  Cursor:=crNone;
  DBGridSzamok.Cursor:=crNone;
  Panel1.Cursor:=crNone;
  Panel2.Cursor:=crNone;
  // form méretének beállítása
  ClientWidth:=800;
  ClientHeight:=600;
  //feliratok eltüntetése
  PLLabel1.Caption:='';
  PLLabel2.Caption:='';
  PLLabel3.Caption:='';
  LabelAktualis.Caption:='';
  LabelAktualis.Visible:=False;
  Bevel8.Visible:=False;

  //NumLock bekapcsolása
  GetKeyboardState(KS);
  KS[VK_NUMLOCK]:=integer(True);
  SetKeyboardState(KS);

  //Megvannak az adatbázisfájlok mentései?
  Tovabb:=True;
  VanMentes:=False;
  If (Not Ellenor(MENTESEKDIR+'\'+DBALBUMNEV+DBKIT)) Then Tovabb:=False;
  If Tovabb And (Not Ellenor(MENTESEKDIR+'\'+DBALBUMNEV+INDKIT)) Then Tovabb:=False;
  If Tovabb And (Not Ellenor(MENTESEKDIR+'\'+DBSZAMOKNEV+DBKIT)) Then Tovabb:=False;
  If Tovabb And (Not Ellenor(MENTESEKDIR+'\'+DBSZAMOKNEV+INDKIT)) Then Tovabb:=False;
  If Tovabb Then
  Begin
    DBToltes;
    VanMentes:=True;
  End;

  //program könyvtárban ellenõrzés
  Tovabb:=True;
  If (Not Ellenor(DBALBUMNEV+DBKIT)) Then Tovabb:=False;
  If Tovabb And (Not Ellenor(DBALBUMNEV+INDKIT)) Then Tovabb:=False;
  If Tovabb And (Not Ellenor(DBSZAMOKNEV+DBKIT)) Then Tovabb:=False;
  If Tovabb And (Not Ellenor(DBSZAMOKNEV+INDKIT)) Then Tovabb:=False;
  If (Not Tovabb) Then
  Begin
    //ha nincsenek adatbézisok, akkor létrehozzuk
    If (Not VanMentes) Then
    Begin
      Dm.AlbumokTablaKeszit;
      Dm.SzamokTablaKeszit;
    End;
    Application.MessageBox('Próbálja meg újraindítani a gépet.'+#13+
      'Ha úgy sem indul el a program,'+#13+
      'akkor szóljon az üzemeltetõnek!','HIBA: ADATBÁZIS HIÁNYZIK',MB_OK);
    Application.Terminate;
    Exit;
  End;

  VolumeTimer.Tag:=0;
  VolumeTimer.Interval:=100;
  VolumeTimer.Enabled:=False;
  LineInVolume.Mentve:=False;

  //listák létrehozása
  PlayList:=TStringList.Create;
  PlayListFile:=TStringList.Create;
  PlayListStatus:=TStringList.Create;

  //Mentett playlist visszatöltése
  If FileExists(ExtractFilePath(ParamStr(0))+'PlayList.dat') And
     FileExists(ExtractFilePath(ParamStr(0))+'PlayListFile.dat') And
     FileExists(ExtractFilePath(ParamStr(0))+'PlayListStatus.dat') Then
  Begin
    Try
      //ha a három lista mérete azonos akkor mind jó, ha nem akkor ürítések
      PlayList.LoadFromFile(ExtractFilePath(ParamStr(0))+'PlayList.dat');
      PlayListFile.LoadFromFile(ExtractFilePath(ParamStr(0))+'PlayListFile.dat');
      PlayListStatus.LoadFromFile(ExtractFilePath(ParamStr(0))+'PlayListStatus.dat');
      //listák ürítése
      If (PlayList.Count <> PlayListFile.Count) Or
         (PlayList.Count <> PlayListStatus.Count) Then
      Begin
        PlayList.Clear;
        PlayListFile.Clear;
        PlayListStatus.Clear;
      End;
      PlayListFrissit;
    Except
      on EFOpenError Do Begin
        PlayList.Clear;
        PlayListFile.Clear;
        PlayListStatus.Clear;
      End;
    End;
  End;

  If (WinampPath <> '') Then
  Begin
    //lejátszó indítása
    If (Not Winamp.StartWinAmp) Then
    Begin
      ShowMessage('Nem indult el a Winamp!'+#13+
        'Esetleg rossz az elérési útvonal.');
      Application.Terminate;
      Exit;
    End
    Else Winamp.FileName:='';
    Winamp.Visible:=False;
    Winamp.WAShuffle:=False;
    Winamp.WARepeat:=False;
    Winamp.WAPlayListEditor:=False;
    Winamp.WAEqualizer:=False;
    //idõzítõ indítása
    WinampTimer.Enabled:=True;
  End
  Else ShowMessage('A Winamp elérési útvonala ismeretlen!');
end;

procedure TFormMusicBox.FormActivate(Sender: TObject);
begin
  Image4.Visible:=False;
  //adatbázisok megnyitása
  If (Not Dm.AlbumokTable.Active) Then Dm.AlbumokTable.Open;
  Dm.KezdoKepek;
  Self.ActiveControl:=DBGridSzamok;
end;

procedure TFormMusicBox.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  HatterTimer.Enabled:=False;
  HatterEloreHatra(False);

  If (Key = ALBUMHATRA) Then
  Begin
    Dec(Szamlalo);
    RxGIFAnimator1.Animate:=True;
    Dm.AlbumokTable.Prior;
    If Dm.AlbumokTable.BOF Then
    Begin
      Szamlalo:=Dm.AlbumokTable.RecordCount;
      Dm.AlbumokTable.Last;
    End;
    iKovBorito.Picture:=BoritoImage.Picture;
    BoritoImage.Picture:=iElozoBorito.Picture;
    Dm.SQLFrissit;
    Dm.ElozoKep;
    Key:=0;
  End;

  If (Key = ALBUMELORE) Then
  Begin
    Inc(Szamlalo);
    RxGIFAnimator2.Animate:=True;
    Dm.AlbumokTable.Next;
    If Dm.AlbumokTable.EOF Then
    Begin
      Szamlalo:=1;
      Dm.AlbumokTable.First;
    End;
    iElozoBorito.Picture:=BoritoImage.Picture;
    BoritoImage.Picture:=iKovBorito.Picture;
    Dm.SQLFrissit;
    Dm.KovKep;
    Key:=0;
  End;

  If (Key = SZAMELOZO) Then
  Begin
    If (Not Dm.SQLSzamok.BOF) Then Dm.SQLSzamok.Prior;
    Key:=0;
  End;

  If (Key = SZAMKOVETKEZO) Then
  Begin
    If (Not Dm.SQLSzamok.EOF) Then Dm.SQLSzamok.Next;
    Key:=0;
  End;

  If (Key = LISTATORLES) Then
  Begin
    ListaTorlese;
    Key:=0;
  End;

  If (Key = HANGNOVEL) Then
  Begin
    If IsWinAmpRunning Then Winamp.VolumeUpByOne;
    Key:=0;
  End;

  If (Key = HANGCSOKKENT) Then
  Begin
    If IsWinAmpRunning Then Winamp.VolumeDownByOne;
    Key:=0;
  End;

  If (Key = KILEPES) Then
  Begin
    // Lejátszás megszakítása
    If IsWinAmpRunning And (Winamp.WinampStatus <> WAStop) Then
    Begin
      WinampTimer.Enabled:=False;
      Winamp.FileName:='';
      Winamp.Stop;
    End;
    KilepMenuClick(Sender);
  End;

  HatterTimer.Enabled:=True;
end;

procedure TFormMusicBox.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If (Key = SZAMKIVALASZT) Then
  Begin
    If (Credit <= 0) Then Exit;
    Dec(Credit);
    CreditKiir(True);
    PlayList.Add(Dm.SQLSzamok.FieldByName('ELOADO').asString+' - '+
      Dm.SQLSzamok.FieldByName('SZAMCIM').asString+' ['+Dm.SQLSzamok.FieldByName('PERC').asString);
    PlayListFile.Add(Dm.SQLSzamok.FieldByName('UTVONAL').asString);
    PlayListStatus.Add('0');
    PlayListFrissit;
    If (Not WinampTimer.Enabled) Then WinampTimer.Enabled:=True;
    Key:=0;
  End;

  If (Key = PENZ_50) Then
  Begin
    Credit1Click(Sender);
    Key:=0;
  End;

  If (Key = PENZ_100) Then
  Begin
    Credit3Click(Sender);
    Key:=0;
  End;
end;

//Playlist törlése
procedure TFormMusicBox.ListaTorlese;
begin
  WinampTimer.Enabled:=False;
  If IsWinAmpRunning And (Winamp.WinampStatus = WAPlaying) Then
  Begin
    WinampTimer.Enabled:=False;
    Winamp.FileName:='';
    Winamp.Stop;
  End;
  PlayList.Clear;
  PlayListFile.Clear;
  PlayListStatus.Clear;
  PlayListFrissit;
  LabelAktualis.Caption:='';
  LabelAktualis.Visible:=False;
  Bevel8.Visible:=False;
  If LineInVolume.Mentve Then
  Begin
    LineInVolume.Mentve:=False;
    LineInVolume.Irany:=LINEINUP;
    VolumeTimer.Tag:=0;
    VolumeTimer.Enabled:=True;
  End;
end;

procedure TFormMusicBox.KilepMenuClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMusicBox.FormDestroy(Sender: TObject);
begin
  PlayList.Free;
  PlayListFile.Free;
  PlayListStatus.Free;
end;

//File másolása
Procedure TFormMusicBox.FileCopy(Const SourceFileName,Targetfilename : String);
Var S,T : TFileStream;
Begin
  S:=TFileStream.Create(Sourcefilename,fmOpenRead);
  Try
    T:=TFileStream.Create(TargetfileName,fmOpenWrite Or fmCreate);
    Try
      T.CopyFrom(S,S.Size);
    Finally;
      T.Free;
    End;
  Finally
    S.Free;
  End;
End;

//adatbázisok visszatöltése
procedure TFormMusicBox.DBToltes;
Var Honnan,Hova : String;
Begin
  //útvonalak megállapítása
  Hova:=ExtractFilePath(paramstr(0));
  Honnan:=ExtractFilePath(paramstr(0))+MentesekDir+'\';
  //Albumok.dbf másolása
  Filecopy(Honnan+DBAlbumNev+DbKit,Hova+DBAlbumNev+DbKit);
  //Albumok.mdx másolása
  Filecopy(Honnan+DBAlbumNev+IndKit,Hova+DBAlbumNev+IndKit);
  //Szamok.dbf másolása
  Filecopy(Honnan+DBSzamokNev+DbKit,Hova+DBSzamokNev+DbKit);
  //Szamok.mdx másolása
  Filecopy(Honnan+DBSzamokNev+IndKit,Hova+DBSzamokNev+IndKit);
End;

//adatbázisok mentése
procedure TFormMusicBox.DBMentes;
Var Honnan,Hova : String;
Begin
  //útvonalak megállapítása
  Honnan:=ExtractFilePath(paramstr(0));
  Hova:=ExtractFilePath(paramstr(0))+MentesekDir+'\';
  //Albumok.dbf másolása
  Filecopy(Honnan+DBAlbumNev+DbKit,Hova+DBAlbumNev+DbKit);
  //Albumok.mdx másolása
  Filecopy(Honnan+DBAlbumNev+IndKit,Hova+DBAlbumNev+IndKit);
  //Szamok.dbf másolása
  Filecopy(Honnan+DBSzamokNev+DbKit,Hova+DBSzamokNev+DbKit);
  //Szamok.mdx másolása
  Filecopy(Honnan+DBSzamokNev+IndKit,Hova+DBSzamokNev+IndKit);
End;

// Playlist frissítése
procedure TFormMusicBox.PlayListFrissit;
Begin
  If (PlayList.Count > 0) Then
  Begin
    //a végérõl levágjuk a z idõt pl.: [07:14/
    PLLabel1.Caption:='1. ';
    PLLabel1.Caption:=PLLabel1.Caption+Copy(PlayList.Strings[0],0,Length(PlayList.Strings[0])-7);
    PLLabel1.Visible:=True;
  End
  Else PLLabel1.Visible:=False; //ha már minden le van játsza eltüntetjük

  If (PlayList.Count > 1) Then
  Begin
    PLLabel2.Caption:='2. ';
    PLLabel2.Caption:=PLLabel2.Caption+Copy(PlayList.Strings[1],0,Length(PlayList.Strings[1])-7);
    PLLabel2.Visible:=True;
  End
  Else PLLabel2.Visible:=False;

  If (PlayList.Count > 2) Then
  Begin
    PLLabel3.Caption:='3. ';
    PLLabel3.Caption:=PLLabel3.Caption+Copy(PlayList.Strings[2],0,Length(PlayList.Strings[2])-7);
    PLLabel3.Visible:=True;
  End
  Else PLLabel3.Visible:=False;

  //mentés
  SavePlayList;
End;

procedure TFormMusicBox.SavePlayList;
Begin
  //lista mentése
  //átmenetileg tárolva 3 fájlban áramszünet ill. kikapcsolás idejére
  PlayList.SaveToFile(ExtractFilePath(ParamStr(0))+'Playlist.dat');
  PlayListFile.SaveTofile(ExtractFilePath(ParamStr(0))+'PlayListFile.dat');
  PlayListStatus.SaveTofile(ExtractFilePath(ParamStr(0))+'PlayListStatus.dat');
End;

//kiírjuk, hogy mennyi credit-ünk van
procedure TFormMusicBox.CreditKiir(IniNeed:Boolean);
Var FileName : String;
    FileIni  : TIniFile;
Begin
  CreditLabel.Caption:=IntToStr(Credit);

  If IniNeed Then
  Begin
    FileName:=ExtractFilePath(ParamStr(0))+IniFileNev+'.ini';
    FileIni:=TIniFile.Create(FileName);
    Try
      With FileIni Do
      Begin
        WriteInteger('Play','Credit',Credit);
        WriteInteger('Cash','Cash50',Cash50);
        WriteInteger('Cash','Cash100',Cash100);
      End;
    Finally
      FreeAndNil(FileIni);
    End;
  End;
End;

procedure TFormMusicBox.Credit1Click(Sender: TObject);
begin
  Inc(Cash50);
  Inc(Credit,CreditToCash50);
  CreditKiir(True);
end;

procedure TFormMusicBox.Credit3Click(Sender: TObject);
begin
  Inc(Cash100);
  Inc(Credit,CreditToCash100);
  CreditKiir(True);
end;

procedure TFormMusicBox.FormClose(Sender: TObject; var Action: TCloseAction);
Var Utvonal : String;
    Vol     : DWord;
begin
  LCDTimer.Enabled:=False;
  RxGIFAnimator1.Animate:=False;
  RxGIFAnimator2.Animate:=False;
  Dm.SzamokToroltRekordEl;
  //nyitva vannak az adatbázisok?
  If Dm.SQLSzamok.Active Then Dm.SQLSzamok.Close;
  If Dm.SzamokTable.Active Then Dm.SzamokTable.Close;
  If Dm.AlbumokTable.Active Then Dm.AlbumokTable.Close;

  Utvonal:=ExtractFilePath(paramstr(0))+MentesekDir;
  // létezik a mentés könyvtár?
  If (Not DirectoryExists(Utvonal)) Then
  Begin
    // létre tudjuk hozni ?
    If (Not CreateDir(Utvonal)) Then
    Begin
      If IsWinAmpRunning Then Winamp.CloseWinAmp;
      Raise Exception.Create('Nem tudtam létrehozni a(z) "'+Utvonal+'" könyvtárat!'+
        #13+'Az adatok nem lettek mentve !');
    End
    Else DBMentes;  // ha létre -> mentés
  End
  Else DBMentes; // ha létezik -> mentés

  // winamp kikapcsolása
  If IsWinAmpRunning Then Winamp.CloseWinAmp;

  If LineInVolume.Mentve Then
  Begin
    LineInVolume.Mentve:=False;
    Vol:=MakeLong(LineInVolume.Left,LineInVolume.Right);
    LineInVolume.SetVolume(Vol);
  End;

  Self.Visible:=False;
  If ShutDown And (FormLeAllit.ShowModal <> idCancel) Then
  Begin
    //Összes program bezárása
    ExitWindowsEx(EWX_FORCE,0);
    //Kilépés a rendszerbõl
    ExitWindowsEx(EWX_SHUTDOWN,0);
  End;
end;

procedure TFormMusicBox.Albumfelvitele1Click(Sender: TObject);
Var FileName : String;
begin
  HatterTimer.Enabled:=False;
  FileName:=ExtractFilePath(ParamStr(0));
  FormFelvitel.ShowModal;
  If (FileName <> GetCurrentDir) Then SetCurrentDir(FileName);
  Dm.AlbumokTable.First;
  Dm.KezdoKepek;
  HatterTimer.Enabled:=True;
end;

procedure TFormMusicBox.Mdostsok1Click(Sender: TObject);
Var FileName : String;
begin
  HatterTimer.Enabled:=False;
  FileName:=ExtractFilePath(ParamStr(0));
  FormKarbantart.ShowModal;
  If (FileName <> GetCurrentDir) Then SetCurrentDir(FileName);
  Dm.AlbumokTable.First;
  Dm.SQLFrissit;
  HatterTimer.Enabled:=True;
end;

procedure TFormMusicBox.Statisztika1Click(Sender: TObject);
begin
  HatterTimer.Enabled:=False;
  FormStatisztika.ShowModal;
  Dm.SQLFrissit;
  HatterTimer.Enabled:=True;
end;

procedure TFormMusicBox.ProgramBeallitMenuClick(Sender: TObject);
begin
  HatterTimer.Enabled:=False;
  If (FormBeallitas.ShowModal = mrOK) Then
  Begin
    BeallitasBetolt;
    BetuSzinAtallit;
  End;
  HatterTimer.Enabled:=True;
end;

//a feliratok színének beállítása
procedure TFormMusicBox.BetuSzinAtallit;
begin
  Label1.Font.Color:=BetuSzin;
  Label3.Font.Color:=BetuSzin;
  LabelAktualis.Font.Color:=BetuSzin;
  PLLabel1.Font.Color:=BetuSzin;
  PLLabel2.Font.Color:=BetuSzin;
  PLLabel3.Font.Color:=BetuSzin;
  AlbumLabel.Font.Color:=BetuSzin;
  CreditLabel.Font.Color:=BetuSzin;
  RePaint;
end;

procedure TFormMusicBox.WinampTimerTimer(Sender: TObject);
Var Aktiv : Boolean;
    Index : String;
begin
  // idõzítés kikapcsolása
  WinampTimer.Enabled:=False;

  // ha lejátsz a winamp
  If (Winamp.WinampStatus = WAPlaying) Then
  Begin
    //ha éppen lejátsz a szám lejátszásának idejének frissítése
    LabelAktualis.Caption:=PlayList.Strings[0]+'/'+Copy(FormatDateTime('hh:nn:ss',Winamp.SongPosition / (24 * 60 * 60 * 1000)),4,5)+']';
    WinampTimer.Enabled:=True;
    Exit;
  End;

  //Elsõ szám adminisztrálása
  //ha le volt játszva
  If (PlayList.Count > 0) And (PlayListStatus.Strings[0] = '2') Then
  Begin
    //adatbázis állapotának mentése
    Aktiv:=Dm.SzamokTable.Active;
    Index:=Dm.SzamokTable.IndexName;
    //kinyitás indexváltás
    If (Not Dm.SzamokTable.Active) Then Dm.SzamokTable.Open;
    Dm.SzamokTable.IndexName:='Utvonal';
    //rákeresés a keresett rekordra (tquery-t nem lehet írni :-( )
    If Dm.SzamokTable.FindKey([PlayListFile.Strings[0]]) Then
    Begin
      //Jatszva növelése
      Dm.SzamokTable.Edit;
      Dm.SzamokTable.FieldByName('JATSZVA').asInteger:=Dm.SzamokTable.FieldByName('JATSZVA').asInteger+1;
      Dm.SzamokTable.Post;
    End;
    //bezárás, indexváltás
    Dm.SzamokTable.Active:=Aktiv;
    Dm.SzamokTable.IndexName:=Index;
    //Lejátszott szám törlése a listából
    PlayList.Delete(0);
    PlayListFile.Delete(0);
    PlayListStatus.Delete(0);
    PlayListFrissit;
    //PlayList törlése
    Winamp.FileName:='';
  End;

  // ha üres a lista (ez volt az utolsó szám) -> kilépés
  If (PlayList.Count < 1) Then
  Begin
    LabelAktualis.Caption:='';
    LabelAktualis.Visible:=False;
    Bevel8.Visible:=False;
    If LineInVolume.Mentve Then
    Begin
      LineInVolume.Mentve:=False;
      LineInVolume.Irany:=LINEINUP;
      VolumeTimer.Tag:=0;
      VolumeTimer.Enabled:=True;
    End;
    Exit;
  End;

  //fut még a winamp? mert ha nem start
  If (Not IsWinAmpRunning) Then Winamp.StartWinAmp;
  If FileExists(PlayListFile.Strings[0]) Then
  Begin
    If Not LineInVolume.Mentve Then
    Begin
      LineInVolume.Mentve:=True;
      LineInVolume.GetVolume;
      LineInVolume.Irany:=LINEINDOWN;
      VolumeTimer.Tag:=0;
      VolumeTimer.Enabled:=True;
    End;
    // Lejátszandó file betöltése
    Winamp.FileName:=PlayListFile.Strings[0];
    // Lejátszás indítása
    While (Winamp.WinampStatus <> WAPlaying) Do Winamp.Play;
  End
  Else Begin
    PlayList.Delete(0);
    PlayListFile.Delete(0);
    PlayListStatus.Delete(0);
    PlayListFrissit;
    Credit1Click(Sender);
  End;
  //fókusz a gridre
  DBGridSzamok.SetFocus;
  // idõzítõ visszakapcsolása
  WinampTimer.Enabled:=True;
end;

procedure TFormMusicBox.WinampStartPlay(Sender: TObject);
begin
  //az átadott szám státusa 0 -> 1
  PlayListStatus.Strings[0]:='1';
  //felirat kezdeti értéke
  LabelAktualis.Caption:=PlayList.Strings[0]+'/'+Copy(FormatDateTime('hh:nn:ss',Winamp.SongPosition / (24 * 60 * 60 * 1000)),4,5)+']';
  LabelAktualis.Visible:=True;
  Bevel8.Visible:=True;
end;

//ha leáll a lejátszás
procedure TFormMusicBox.WinampStopPlay(Sender: TObject);
Var Timer : Boolean;
begin
  Timer:=WinampTimer.Enabled;
  WinampTimer.Enabled:=False;
  //ha végevan a számnak, az átadott szám státusa: 2
  If (PlayList.Count > 0) And (Winamp.FileName <> #0) Then
  Begin
    PlayListStatus.Strings[0]:='2';
  End;
  WinampTimer.Enabled:=Timer;
end;

procedure TFormMusicBox.LCDTimerTimer(Sender: TObject);
Var Rand : Integer;
begin
  Randomize;
  Rand:=Random(4);
  Case Rand Of
    0 : LCDScreen.LCDAnimator:=LCDAnimator;
    1 : LCDScreen.LCDAnimator:=CycleLCDAnimator;
    2 : LCDScreen.LCDAnimator:=GravityLCDAnimator;
    3 : LCDScreen.LCDAnimator:=FlashLCDAnimator;
    4 : LCDScreen.LCDAnimator:=WaveLCDAnimator;
  End;
end;

procedure TFormMusicBox.RxGIFAnimator1FrameChanged(Sender: TObject);
begin
  If (RxGIFAnimator1.FrameIndex = 0) Then RxGIFAnimator1.Animate:=False;
end;

procedure TFormMusicBox.RxGIFAnimator2FrameChanged(Sender: TObject);
begin
  If (RxGIFAnimator2.FrameIndex = 0) Then RxGIFAnimator2.Animate:=False;
end;

procedure TFormMusicBox.HatterTimerTimer(Sender: TObject);
begin
  If (PlayList.Count <= 0) Then
  Begin
    HatterTimer.Enabled:=False;
    iSegedKep.Picture:=Nil;
    HatterEloreHatra(True);
  End;
end;

procedure TFormMusicBox.HatterEloreHatra(Ertek: Boolean);
begin
  If Ertek Then
  Begin
    iSegedKep.Picture:=Nil;
    LCDTimer.Enabled:=False;
    LCDScreen.Enabled:=False;
    Image1.BringToFront;
    Image4.BringToFront;
    TransparenetBeallit(False);
    RandTimer.Enabled:=True;
    Self.DoubleBuffered:=True;
  End
  Else Begin
    RandTimer.Enabled:=False;
    FelTimer.Enabled:=False;
    LeTimer.Enabled:=False;
    TransparenetBeallit(True);
    Image1.SendToBack;
    Image4.SendToBack;
    Image4.Visible:=False;
    LCDScreen.Enabled:=True;
    LCDTimer.Enabled:=True;
    iSegedKep.Picture:=Nil;
  End;
  LCDScreen.Visible:=(Not Ertek);
  DBGridSzamok.Visible:=(Not Ertek);
  Panel1.Visible:=(Not Ertek);
  Panel2.Visible:=(Not Ertek);
end;

procedure TFormMusicBox.RandTimerTimer(Sender: TObject);
Var Rand : Integer;
begin
  SavePlace:=Dm.AlbumokTable.GetBookmark;
  Image4.Picture:=iSegedKep.Picture;
  If (Image4.Picture <> Nil) Then
  Begin
    RandTimer.Enabled:=False;
    Image4.Height:=0;
    Image4.Width:=0;
    Image4.Top:=Self.ClientHeight Div 2;
    Image4.Left:=Self.ClientWidth Div 2;
    Image4.Visible:=True;
    FelTimer.Enabled:=True;
  End;
  Randomize;
  Rand:=Random(Dm.AlbumokTable.RecordCount);
  Dm.AlbumokTable.MoveBy(Rand);
  If FileExists(Dm.AlbumokTable.FieldByName('Borito').asString) Then
  Begin
    Try
      iSegedKep.Picture.LoadFromFile(Dm.AlbumokTable.FieldByName('Borito').asString);
    Except
      On EInvalidGraphic Do iSegedKep.Picture:=Nil;
    End;
  End Else iSegedKep.Picture:=Nil;
  If (SavePlace <> Nil) Then
  Begin
    Dm.AlbumokTable.GotoBookmark(SavePlace);
    Dm.AlbumokTable.FreeBookmark(SavePlace);
  End;
end;

procedure TFormMusicBox.FelTimerTimer(Sender: TObject);
begin
  If (Image4.Width < 40) Then
  Begin
    Image4.Top:=Image4.Top-5;
    Image4.Left:=Image4.Left-5;
    Image4.Height:=Image4.Height+10;
    Image4.Width:=Image4.Width+10;
    Exit;
  End;
  If (Image4.Width >= 40) And (Image4.Width < 240) Then
  Begin
    Image4.Top:=Image4.Top-10;
    Image4.Left:=Image4.Left-10;
    Image4.Height:=Image4.Height+20;
    Image4.Width:=Image4.Width+20;
    Exit;
  End;
  If (Image4.Width >= 240) Then
  Begin
    FelTimer.Enabled:=False;
    LeTimer.Enabled:=True;
  End;
end;

procedure TFormMusicBox.LeTimerTimer(Sender: TObject);
begin
  If (Image4.Width > 40) Then
  Begin
    Image4.Top:=Image4.Top+10;
    Image4.Left:=Image4.Left+10;
    Image4.Height:=Image4.Height-20;
    Image4.Width:=Image4.Width-20;
    Exit;
  End;
  If (Image4.Width <= 40) And (Image4.Width > 0) Then
  Begin
    Image4.Top:=Image4.Top+5;
    Image4.Left:=Image4.Left+5;
    Image4.Height:=Image4.Height-10;
    Image4.Width:=Image4.Width-10;
    Exit;
  End;
  If (Image4.Width <= 0) Then
  Begin
    LeTimer.Enabled:=False;
    RandTimer.Enabled:=True;
  End;
end;

procedure TFormMusicBox.TransparenetBeallit(Ertek: Boolean);
begin
  Label1.Transparent:=Ertek;
  CreditLabel.Transparent:=Ertek;
  Label3.Transparent:=Ertek;
  PLLabel1.Transparent:=Ertek;
  PLLabel2.Transparent:=Ertek;
  PLLabel3.Transparent:=Ertek;
  LabelAktualis.Transparent:=Ertek;
  RxGIFAnimator1.Transparent:=Ertek;
  RxGIFAnimator2.Transparent:=Ertek;
  AlbumLabel.Transparent:=Ertek;
end;

end.
