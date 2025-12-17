program Jukebox;

uses
  Forms,
  Windows,
  SysUtils,
  ShellAPI,
  FoUnit in 'FoUnit.pas' {FormMusicBox},
  DataModul in 'DataModul.pas' {DM: TDataModule},
  FormFelvitelUnit in 'FormFelvitelUnit.pas' {FormFelvitel},
  FormOpenUnit in 'FormOpenUnit.pas' {FormOpen},
  FormSzamModositUnit in 'FormSzamModositUnit.pas' {FormSzamModosit},
  FormAlbModositUnit in 'FormAlbModositUnit.pas' {FormAlbModosit},
  FormKarbantartUnit in 'FormKarbantartUnit.pas' {FormKarbantart},
  FormSzamModosit2Unit in 'FormSzamModosit2Unit.pas' {FormSzamModosit2},
  FormStatisztikaUnit in 'FormStatisztikaUnit.pas' {FormStatisztika},
  FormBeallitasUnit in 'FormBeallitasUnit.pas' {FormBeallitas},
  ResolutionUnit in 'ResolutionUnit.pas',
  FormLeAllitUnit in 'FormLeAllitUnit.pas' {FormLeAllit};

{$R *.RES}

Var Resolution : TResolution;

// startmenü eltüntetése
Procedure HideTaskbar;
Var wndHandle : THandle;
    wndClass  : Array[0..50] Of Char;
Begin
  StrPCopy(@wndClass[0],'Shell_TrayWnd');
  wndHandle:=FindWindow(@wndClass[0],Nil);
  ShowWindow(wndHandle,SW_HIDE);
End;

// startmenü visszaállítása
Procedure ShowTaskbar;
Var wndHandle : THandle;
    wndClass  : Array[0..50] Of Char;
Begin
  StrPCopy(@wndClass[0],'Shell_TrayWnd');
  wndHandle:=FindWindow(@wndClass[0],Nil);
  ShowWindow(wndHandle,SW_RESTORE);
End;

Begin
  // TasBar eltüntetése
  HideTaskbar;
  // a felbontás átállítása 800x600-ra
  Resolution:=TResolution.Create;
  If (Not Resolution.BestOfRes) Then
  Begin
    Application.MessageBox('A felbontást(800x600) nem lehet beállítani!','HIBA',MB_OK);
    Exit;
  End;          
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormMusicBox, FormMusicBox);
  Application.CreateForm(TFormFelvitel, FormFelvitel);
  Application.CreateForm(TFormOpen, FormOpen);
  Application.CreateForm(TFormSzamModosit, FormSzamModosit);
  Application.CreateForm(TFormAlbModosit, FormAlbModosit);
  Application.CreateForm(TFormKarbantart, FormKarbantart);
  Application.CreateForm(TFormSzamModosit2, FormSzamModosit2);
  Application.CreateForm(TFormStatisztika, FormStatisztika);
  Application.CreateForm(TFormBeallitas, FormBeallitas);
  Application.CreateForm(TFormLeAllit, FormLeAllit);
  Application.Run;
  // felbontás visszaállítása
  FreeAndNil(Resolution);
  // TasBar visszaállítása
  ShowTaskbar;
end.
