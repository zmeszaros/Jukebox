Unit ResolutionUnit;

Interface

Uses Windows, Classes, Graphics, Forms;

Const Bitek  : Array[0..2] Of Integer = (8,16,32);
      ResXek : Array[0..0] Of Integer = (800);
      ResYok : Array[0..0] Of Integer = (600);

Type
  TDevTul = Record
    FBits : Cardinal;
    FHRes : Cardinal;
    FVRes : Cardinal;
  End;

  TResolution = Class(TPersistent)
  Private
    FModeNum   : LongInt;
    FAktDevTul : TDevTul;
    FOldDevTul : TDevTul;
    FModes     : Array[0..255] Of TDevMode;
    Procedure ResVissza;
    Procedure GetResolutions;
    Function SetResolution(Width,Height,Bits: Cardinal): Boolean;
  Published
    Property AktDevTul : TDevTul Read FAktDevTul;
    Property OldDevTul : TDevTul Read FOldDevTul;
  Public
    Function BestOfRes : Boolean;
    Constructor Create;
    Destructor Destroy; Override;
  End;

Implementation

{ TResolution }

Constructor TResolution.Create;
Var DC : THandle;
Begin
  Inherited Create;
  DC:=GetDC(GetDesktopWindow);
  With FOldDevTul Do
  Begin
    FBits:=GetDeviceCaps(DC,BITSPIXEL);
    FHRes:=GetDeviceCaps(DC,HORZRES);
    FVRes:=GetDeviceCaps(DC,VERTRES);
  End;
  FAktDevTul:=FOldDevTul;
  GetResolutions;
End;

Destructor TResolution.Destroy;
Begin
  Self.ResVissza;
  Inherited;
End;

Procedure TResolution.GetResolutions;
Var DM : TDevMode;
    Ok : Boolean;
Begin
  FModeNum:=(-1);
  OK:=True;
  While OK Do
  Begin
    Inc(FModeNum);
    OK:=EnumDisplaySettings(Nil,FModeNum,DM);
    If OK Then FModes[FModeNum]:=DM;
  End;
End;

Function TResolution.BestOfRes : Boolean;
Var I,J : Integer;
    OK  : Boolean;
Begin
  For I:=High(ResXek) DownTo Low(ResXek) Do
  Begin
    For J:=High(Bitek) DownTo Low(Bitek) Do
    Begin
      OK:=Self.SetResolution(ResXek[I],ResYok[I],Bitek[J]);
      If OK Then Break;
    End;
    If OK Then Break;
  End;
  Result:=OK;
End;

Procedure TResolution.ResVissza;
Begin
  With FOldDevTul Do Self.SetResolution(FHRes,FVRes,FBits);
End;

Function TResolution.SetResolution(Width,Height,Bits: Cardinal): Boolean;
Var Found   : Boolean;
    Mode    : Integer;
    Change  : Integer;
    NewMode : TDevMode;
Begin
  If (FAktDevTul.FHRes = Width) And (FAktDevTul.FVRes = Height) And
     (FAktDevTul.FBits = Bits) Then
  Begin
    Result:=True;
    Exit;
  End;
  Found:=False;
  For Mode:=0 To FModeNum Do
  Begin
    NewMode:=TDevMode(FModes[Mode]);
    If (Width = NewMode.dmPelsWidth) And (Height = NewMode.dmPelsHeight)
        And (Bits = NewMode.dmBitsPerPel) Then
    Begin
      Found:=True;
      Break;
    End;
  End;
  If (Not Found) Then
  Begin
    Result:=False;
    Exit;
  End;
  With NewMode Do
  Begin
    dmSize:=SizeOf(NewMode);
    dmDisplayFrequency:=0;
    dmFields:=DM_PELSWIDTH Or DM_PELSHEIGHT Or DM_BITSPERPEL;
    dmDisplayFlags:=DM_BITSPERPEL And DM_PELSWIDTH And
      DM_PELSHEIGHT And DM_DISPLAYFLAGS;
  End;

  {$IFOPT R+}
    {$DEFINE CKRANGE}
    {$R-}
  {$ENDIF}

  Change:=ChangeDisplaySettings(NewMode, CDS_UPDATEREGISTRY);

  {$IFDEF CKRANGE}
    {$UNDEF CKRANGE}
    {$R+}
  {$ENDIF}

  Case Change Of
    DISP_CHANGE_SUCCESSFUL :
      Begin
        Result:=True;
        With FAktDevTul Do
        Begin
          FHRes:=Width;
          FVRes:=Height;
          FBits:=Bits;
        End;
      End;
    Else Result:=False;
  End;
End;

End.
