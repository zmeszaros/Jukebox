{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit DataModul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBITYPES;

type
  TDM = class(TDataModule)
    SzamokDataSource: TDataSource;
    AlbumokDataSource: TDataSource;
    SzamokTable: TTable;
    AlbumokTable: TTable;
    SQLSzamok: TQuery;
    procedure SzamokTableAfterPost(DataSet: TDataSet);
    procedure SzamokTableAfterDelete(DataSet: TDataSet);
    procedure AlbumokTableAfterDelete(DataSet: TDataSet);
    procedure AlbumokTableAfterPost(DataSet: TDataSet);
  public
    Procedure KovKep;
    Procedure ElozoKep;
    Procedure AktualisKep;
    Procedure KezdoKepek;
    Procedure AlbumokToroltRekordEl;
    Procedure SzamokToroltRekordEl;
    Procedure SQLTorol;
    Procedure SQLLekerdez;
    Procedure SQLFrissit;
    Procedure SQLLejatszva;
    Procedure AlbumokTablaKeszit;
    Procedure SzamokTablaKeszit;
  end;

var
  DM: TDM;

implementation

uses FoUnit;

{$R *.DFM}

procedure TDM.SQLLekerdez;
begin
  With SQLSzamok.SQL Do
  Begin
    Clear;
    If AlbumokTable.Eof And AlbumokTable.Bof Then Exit
    Else Add('SELECT DISTINCT * FROM Szamok WHERE albumszam = '+AlbumokTable.FieldByName('Sorszam').asString);
  End;
  SQLSzamok.Prepare;
  SQLSzamok.Open;
end;

procedure TDM.SQLFrissit;
begin
  SQLLekerdez;

  If (AlbumokTable.RecordCount > 0) Then
    FormMusicBox.AlbumLabel.Caption:='['+IntToStr(AlbumokTable.RecordCount)+'/'+IntToStr(FormMusicBox.Szamlalo)+'] '+AlbumokTable.FieldByName('Eloado').asString+' - '+AlbumokTable.FieldByName('Cim').asString
  Else FormMusicBox.AlbumLabel.Caption:='';
  FormMusicBox.AlbumLabel.Refresh;
end;

procedure TDM.SQLTorol;
begin
  With SQLSzamok.SQL Do
  Begin
    Clear;
    If AlbumokTable.Eof And AlbumokTable.Bof Then Exit
    Else Add('DELETE FROM Szamok WHERE albumszam = '+AlbumokTable.FieldByName('Sorszam').asString);
  End;
  SQLSzamok.Close;
  SQLSzamok.Prepare;
  SQLSzamok.ExecSQL;
end;

procedure TDM.SzamokTableAfterPost(DataSet: TDataSet);
begin
  SzamokTable.FlushBuffers;
end;

procedure TDM.SzamokTableAfterDelete(DataSet: TDataSet);
begin
  SzamokTable.FlushBuffers;
end;

procedure TDM.AlbumokTableAfterDelete(DataSet: TDataSet);
begin
  AlbumokTable.FlushBuffers;
end;

procedure TDM.AlbumokTableAfterPost(DataSet: TDataSet);
begin
  AlbumokTable.FlushBuffers;
end;

procedure TDM.AlbumokToroltRekordEl;
Var Aktiv : Boolean;
begin
  Aktiv:=AlbumokTable.Active;
  If (Not AlbumokTable.Active) Then AlbumokTable.Open;
  If (DBIPackTable(AlbumokTable.DbHandle,AlbumokTable.Handle,PChar(AlbumokTable.TableName),szDBASE,TRUE) = DBIERR_NONE) Then
  Begin
    AlbumokTable.FlushBuffers;
    AlbumokTable.Refresh;
  End;
  AlbumokTable.Active:=Aktiv;
end;

procedure TDM.SzamokToroltRekordEl;
Var Aktiv : Boolean;
begin
  Aktiv:=SzamokTable.Active;
  If (Not SzamokTable.Active) Then SzamokTable.Open;
  If (DBIPackTable(SzamokTable.DbHandle,SzamokTable.Handle,PChar(SzamokTable.TableName),szDBASE,TRUE) = DBIERR_NONE) Then
  Begin
    SzamokTable.FlushBuffers;
    SzamokTable.Refresh;
  End;
  SzamokTable.Active:=Aktiv;
end;

procedure TDM.SQLLejatszva;
begin
  With SQLSzamok.SQL Do
  Begin
    Clear;
    If AlbumokTable.Eof And AlbumokTable.Bof Then Exit
    Else Add('SELECT DISTINCT * FROM Szamok WHERE jatszva > 0 ORDER BY jatszva DESC');
  End;
  SQLSzamok.Prepare;
  SQLSzamok.Open;
end;

procedure TDM.AlbumokTablaKeszit;
begin
  If (Not AlbumokTable.Exists) Then
  Begin
    AlbumokTable.Close;
    AlbumokTable.TableName:=DBALBUMNEV;
    AlbumokTable.TableType:=ttDBase;
    With AlbumokTable.FieldDefs Do
    Begin
      Clear;
      With AddFieldDef Do
      Begin
        Name:='Eloado';
        DataType:=ftString;
        Size:=50;
        Required:=False;
      End;
      With AddFieldDef Do
      Begin
        Name:='Cim';
        DataType:=ftString;
        Size:=50;
        Required:=False;
      End;
      With AddFieldDef Do
      Begin
        Name:='Borito';
        DataType:=ftString;
        Size:=100;
        Required:=False;
      End;
      With AddFieldDef Do
      Begin
        Name:='Sorszam';
        DataType:=ftInteger;
        Required:=True;
      End;
    End;
    With AlbumokTable.IndexDefs Do
    Begin
      Clear;
      With AddIndexDef Do
      Begin
        Name:='Sorszam';
        Fields:='Sorszam';
        Options:=[ixExpression];
      End;
    End;
    AlbumokTable.CreateTable;
  End;
end;

procedure TDM.SzamokTablaKeszit;
begin
  If (Not SzamokTable.Exists) Then
  Begin
    SzamokTable.Close;
    SzamokTable.TableName:=DBSZAMOKNEV;
    SzamokTable.TableType:=ttDBase;
    With SzamokTable.FieldDefs Do
    Begin
      Clear;
      With AddFieldDef Do
      Begin
        Name:='Albumszam';
        DataType:=ftInteger;
        Required:=True;
      End;
      With AddFieldDef Do
      Begin
        Name:='Szamindex';
        DataType:=ftInteger;
        Required:=True;
      End;
      With AddFieldDef Do
      Begin
        Name:='Eloado';
        DataType:=ftString;
        Size:=50;
        Required:=False;
      End;
      With AddFieldDef Do
      Begin
        Name:='Utvonal';
        DataType:=ftString;
        Size:=100;
        Required:=True;
      End;
      With AddFieldDef Do
      Begin
        Name:='Jatszva';
        DataType:=ftInteger;
        Required:=False;
      End;
      With AddFieldDef Do
      Begin
        Name:='Perc';
        DataType:=ftString;
        Size:=5;
        Required:=False;
     End;
      With AddFieldDef Do
      Begin
        Name:='Szamcim';
        DataType:=ftString;
        Size:=50;
        Required:=False;
      End;
    End;
    With SzamokTable.IndexDefs Do
    Begin
      Clear;
      With AddIndexDef Do
      Begin
        Name:='Albumszam';
        Fields:='Albumszam';
        Options:=[ixExpression];
      End;
      With AddIndexDef Do
      Begin
        Name:='Utvonal';
        Fields:='Utvonal';
        Options:=[ixExpression];
      End;
    End;
    SzamokTable.CreateTable;
  End;
end;

procedure TDM.KezdoKepek;
begin
  SQLFrissit;

  AktualisKep;
  ElozoKep;
  KovKep;
end;

procedure TDM.AktualisKep;
begin
  If FileExists(AlbumokTable.FieldByName('Borito').asString) Then
  Begin
    Try
      FormMusicBox.BoritoImage.Picture.LoadFromFile(AlbumokTable.FieldByName('Borito').asString);
    Except
      On EInvalidGraphic Do FormMusicBox.BoritoImage.Picture:=Nil;
    End;
  End Else FormMusicBox.BoritoImage.Picture:=Nil;
  FormMusicBox.BoritoImage.Refresh;
end;

Procedure TDM.KovKep;
Var SavePlace : TBookmark;
begin
  SavePlace:=AlbumokTable.GetBookmark;
  AlbumokTable.Next;
  If AlbumokTable.EOF Then AlbumokTable.First;
  If FileExists(AlbumokTable.FieldByName('Borito').asString) Then
  Begin
    Try
      FormMusicBox.iKovBorito.Picture.LoadFromFile(AlbumokTable.FieldByName('Borito').asString);
    Except
      On EInvalidGraphic Do FormMusicBox.iKovBorito.Picture:=Nil;
    End;
  End Else FormMusicBox.iKovBorito.Picture:=Nil;
  FormMusicBox.iKovBorito.Refresh;
  AlbumokTable.GotoBookmark(SavePlace);
  AlbumokTable.FreeBookmark(SavePlace);
end;

procedure TDM.ElozoKep;
Var SavePlace : TBookmark;
begin
  SavePlace:=AlbumokTable.GetBookmark;
  AlbumokTable.Prior;
  If AlbumokTable.BOF Then AlbumokTable.Last;
  If FileExists(AlbumokTable.FieldByName('Borito').asString) Then
  Begin
    Try
      FormMusicBox.iElozoBorito.Picture.LoadFromFile(AlbumokTable.FieldByName('Borito').asString);
    Except
      On EInvalidGraphic Do FormMusicBox.iElozoBorito.Picture:=Nil;
    End;
  End Else FormMusicBox.iElozoBorito.Picture:=Nil;
  FormMusicBox.iElozoBorito.Refresh;
  AlbumokTable.GotoBookmark(SavePlace);
  AlbumokTable.FreeBookmark(SavePlace);
end;

end.
