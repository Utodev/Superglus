program Superglus;

uses
  Forms,
  UMain in 'UMain.pas' {fMain},
  UOptions in 'UOptions.pas' {fOptions},
  UAbout in 'UAbout.pas' {fAbout},
  UInifile in 'UInifile.pas',
  URunDOS in 'URunDOS.pas',
  UCodeGen in 'UCodeGen.pas' {fCodeGen},
  dlgSearchText in 'dlgSearchText.pas' {TextSearchDialog},
  dlgConfirmReplace in 'dlgConfirmReplace.pas' {ConfirmReplaceDialog},
  dlgReplaceText in 'dlgReplaceText.pas' {TextReplaceDialog},
  UHelpBrowser in 'UHelpBrowser.pas' {fHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Superglus';
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfOptions, fOptions);
  Application.CreateForm(TfAbout, fAbout);
  Application.CreateForm(TfCodeGen, fCodeGen);
  Application.CreateForm(TConfirmReplaceDialog, ConfirmReplaceDialog);
  Application.CreateForm(TfHelp, fHelp);
  Application.Run;
end.
