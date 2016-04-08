        unit uoptions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, Menus, UConfig, DefaultTranslator;

type

  { TfOptions }

  TfOptions = class(TForm)
    BBrowseCompiler: TButton;
    BBrowseAssembler: TButton;
    BBrowseLinker: TButton;
    BBrowseInterpreter: TButton;
    BBrowseStartDatabase: TButton;
    BOk: TButton;
    BCancel: TButton;
    BBrowsePreprocessor: TButton;
    checkDeleteTempFiles: TCheckBox;
    checkOpenAllTabs: TCheckBox;
    checkShowToolbar: TCheckBox;
    checkSaveBeforeRun: TCheckBox;
    ComboBoxLang: TComboBox;
    EditAssembler: TEdit;
    EditLinker: TEdit;
    EditInterpreter: TEdit;
    EditPreprocessor: TEdit;
    EditHelpURL: TEdit;
    EditCompiler: TEdit;
    EditPreprocessorParameters: TEdit;
    EditStartDatabase: TEdit;
    GroupBoxCompilerOptions: TGroupBox;
    GroupBoxEditor: TGroupBox;
    LabelAssembler: TLabel;
    LabelLinker: TLabel;
    LabelInterpreter: TLabel;
    LabelLang: TLabel;
    LabelCompiler: TLabel;
    LabelPreprocessor: TLabel;
    LabelHelpURL: TLabel;
    LabelPreprocessorParameters: TLabel;
    LabelStartDatabase: TLabel;
    OpenDialogOptions: TOpenDialog;
    procedure BBrowseAssemblerClick(Sender: TObject);
    procedure BBrowseCompilerClick(Sender: TObject);
    procedure BBrowseInterpreterClick(Sender: TObject);
    procedure BBrowseLinkerClick(Sender: TObject);
    procedure BBrowsePreprocessorClick(Sender: TObject);
    procedure BBrowseStartDatabaseClick(Sender: TObject);
    procedure ComboBoxLangChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveToConfig(var Config: TConfig);
  private
    procedure LoadFromConfig();
    var LanguageChanged : Boolean;
  public
    { public declarations }
  end;

var
  fOptions: TfOptions;

implementation

{$R *.lfm}

uses UMain, UGlobals;

{ TfOptions }

procedure TfOptions.LoadFromConfig();
begin
 checkShowToolbar.Checked :=  fMain.Config.ShowToolBar;
 checkDeleteTempFiles.Checked:= fMain.Config.DeleteTempFiles;
 checkSaveBeforeRun.Checked:=fMain.Config.SaveBeforeRun;
 checkOpenAllTabs.Checked:=fMain.Config.OpenAllTabs;

 EditCompiler.Text:= fMain.Config.CompilerPath;
 EditLinker.Text := fMain.Config.LinkerPath;
 EditAssembler.Text := fMain.Config.AssemblerPath;
 EditInterpreter.Text := fMain.Config.InterpreterPath;
 EditHelpURL.Text:= fMain.Config.HelpBaseURL;
 EditPreprocessor.Text:= fMain.Config.PreprocessorPath;
 EditStartDatabase.Text:= fMain.Config.StartDatabasePath;
 EditPreprocessorParameters.Text:=fMain.Config.PreprocessorParameters;

 ComboBoxLang.ItemIndex := 0;
 if fMain.Config.Lang = 'es' then  ComboBoxLang.ItemIndex := 2 else if fMain.Config.Lang = 'en' then ComboBoxLang.ItemIndex := 1;

end;

procedure TfOptions.SaveToConfig(var Config: TConfig);
begin
  Config.ShowToolBar := checkShowToolbar.Checked;
  Config.DeleteTempFiles := checkDeleteTempFiles.Checked;
  Config.SaveBeforeRun := checkSaveBeforeRun.Checked;
  Config.OpenAllTabs := checkOpenAllTabs.Checked;



   Config.CompilerPath := EditCompiler.Text;
   Config.LinkerPath:=EditLinker.Text;
   Config.AssemblerPath:=EditAssembler.Text;
   Config.InterpreterPath:=EditInterpreter.Text;
   Config.HelpBaseURL := EditHelpURL.Text;
   Config.PreprocessorPath := EditPreprocessor.Text;
   Config.StartDatabasePath := EditStartDatabase.Text;
   Config.PreprocessorParameters := EditPreprocessorParameters.Text;

   if LanguageChanged then
      case ComboBoxLang.ItemIndex of
      0 : Config.Lang := '';
      1 : Config.Lang := 'en';
      2:  Config.Lang := 'es';
      end;

end;



procedure TfOptions.FormShow(Sender: TObject);
begin
  ComboBoxLang.Items.Text := S_LANGUAGES;
  LanguageChanged:=false;
  LoadFromConfig();
end;

procedure TfOptions.ComboBoxLangChange(Sender: TObject);
begin
  LanguageChanged:=true;
end;

procedure TfOptions.BBrowsePreprocessorClick(Sender: TObject);
begin
  if OpenDialogOptions.Execute then EditPreprocessor.Text:=OpenDialogOptions.FileName;
end;

procedure TfOptions.BBrowseStartDatabaseClick(Sender: TObject);
begin
  if OpenDialogOptions.Execute then EditStartDatabase.Text:=OpenDialogOptions.FileName;
end;

procedure TfOptions.BBrowseCompilerClick(Sender: TObject);
begin
  if OpenDialogOptions.Execute then EditCompiler.Text:=OpenDialogOptions.FileName;
end;

procedure TfOptions.BBrowseAssemblerClick(Sender: TObject);
begin
  if OpenDialogOptions.Execute then EditAssembler.Text:=OpenDialogOptions.FileName;
end;

procedure TfOptions.BBrowseInterpreterClick(Sender: TObject);
begin
  if OpenDialogOptions.Execute then EditInterpreter.Text:=OpenDialogOptions.FileName;
end;

procedure TfOptions.BBrowseLinkerClick(Sender: TObject);
begin
  if OpenDialogOptions.Execute then EditLinker.Text:=OpenDialogOptions.FileName;
end;


end.

