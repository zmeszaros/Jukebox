unit FormOpenUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Outline, DirOutln, StdCtrls, Buttons, FileCtrl;

type
  TFormOpen = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelDir: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOpen: TFormOpen;

implementation

{$R *.DFM}

procedure TFormOpen.FormActivate(Sender: TObject);
begin
  LabelDir.Caption:=GetCurrentDir;
end;

end.
