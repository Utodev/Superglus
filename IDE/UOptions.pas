unit UOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, SynEditOptionsDialog,SynEdit, Synmemo;

type
  TfOptions = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ECompiler: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EInterpreter: TLabel;
    Label6: TLabel;
    Browse1: TSpeedButton;
    Browse2: TSpeedButton;
    Browse3: TSpeedButton;
    Browse4: TSpeedButton;
    Browse5: TSpeedButton;
    Browse6: TSpeedButton;
    Label1: TLabel;
    EditCompiler: TEdit;
    EditAssembler: TEdit;
    EditPreprocesor: TEdit;
    EditInterpreter: TEdit;
    EditLibrary: TEdit;
    CheckPreprocessor: TCheckBox;
    EditPacker: TEdit;
    CheckDelTmpFiles: TCheckBox;
    BrowseDialog: TOpenDialog;
    Label4: TLabel;
    ECoreLibraryPath: TEdit;
    Label5: TLabel;
    ListPlugins: TListBox;
    BOK: TButton;
    BCancel: TButton;
    FontDialog: TFontDialog;
    Label7: TLabel;
    EdithelpBasePath: TEdit;
    procedure BrowseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonFontClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOptions: TfOptions;
  optionsFont : TFont;

implementation

{$R *.dfm}

procedure TfOptions.BrowseClick(Sender: TObject);
begin
 if (Sender as TSpeedButton).Name =  'Browse5' then BrowseDialog.Filter:= 'Todos los archivos(*.*)|*.*'
                                               else BrowseDialog.Filter:= 'Ficheros ejecutables|*.exe;*.com;*.bat|Todos los archivos (*.*)|*.*';
 if BrowseDialog.Execute then begin
  if (Sender as TSpeedButton).Name =  'Browse1' then EditCompiler.Text := BrowseDialog.FileName else
  if (Sender as TSpeedButton).Name =  'Browse2' then EditAssembler.Text := BrowseDialog.FileName else
  if (Sender as TSpeedButton).Name =  'Browse3' then EditPreprocesor.Text := BrowseDialog.FileName else
  if (Sender as TSpeedButton).Name =  'Browse4' then EditInterpreter.Text := BrowseDialog.FileName else
  if (Sender as TSpeedButton).Name =  'Browse5' then EditLibrary.Text := BrowseDialog.FileName else
  if (Sender as TSpeedButton).Name =  'Browse6' then EditPacker.Text := BrowseDialog.FileName;
 end;
end;
                           { TODO : Se deberia poder elegir si queremos que grabe o no grabe al ejecutar, probablemente usando un fichero temporal para compilar en lugar del 'original' }
procedure TfOptions.FormShow(Sender: TObject);
var SR: TSearchrec;
    CoreLibPath:AnsiString;
begin
 CoreLibPath := GetEnvironmentVariable('SPGLIBPATH');
 if CoreLibPath = '' then CoreLibPath := ExtractFilePath(EditCompiler.Text);
 if CoreLibPath = '' then CoreLibPath := ExtractFilePath(Application.ExeName);
 ECoreLibraryPath.Text := CoreLibPath;
 ListPlugins.Clear();
 if FindFirst(CoreLibPath+'\pgl\*.plu', faAnyFile, sr) = 0 then
  repeat
   ListPlugins.Items.Add(SR.Name);
  until FindNext(SR) <>0;
 FindClose(SR);


end;

procedure TfOptions.ButtonFontClick(Sender: TObject);
begin
  FontDialog.Font := optionsFont;
  if (FontDialog.Execute)  then
  begin
      optionsFont := FontDialog.Font;
  end;
end;

procedure TfOptions.FormCreate(Sender: TObject);
var EditBox : TSynMemo;

begin

end;

end.



