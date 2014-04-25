unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, StdCtrls, Menus,
  ExtCtrls, SynEditMiscClasses, SynEditSearch, SynEditHighlighter,
  SynHighlighterAny, SynEdit, SynMemo, SynEditTypes, SynCompletionProposal;

type
  TfMain = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    MainMenu1: TMainMenu;
    MOpen: TMenuItem;
    MSave: TMenuItem;
    MSaveAs: TMenuItem;
    MSeparator1: TMenuItem;
    MQuit: TMenuItem;
    MOptions: TMenuItem;
    MPreferences: TMenuItem;
    MRun: TMenuItem;
    MCompile: TMenuItem;
    MCompileAndRun: TMenuItem;
    MHelp: TMenuItem;
    MAbout: TMenuItem;
    MEdit: TMenuItem;
    MCopy: TMenuItem;
    MCut: TMenuItem;
    MPaste: TMenuItem;
    MSeparator2: TMenuItem;
    MSearch: TMenuItem;
    MClose: TMenuItem;
    MUndo: TMenuItem;
    Panel: TPanel;
    BNew: TSpeedButton;
    BOpen: TSpeedButton;
    Bsave: TSpeedButton;
    BCut: TSpeedButton;
    BCopy: TSpeedButton;
    BPaste: TSpeedButton;
    BUndo: TSpeedButton;
    BRedo: TSpeedButton;
    BSearch: TSpeedButton;
    BReplace: TSpeedButton;
    BPrint: TSpeedButton;
    MRedo: TMenuItem;
    N1: TMenuItem;
    MReplace: TMenuItem;
    N2: TMenuItem;
    Mprint: TMenuItem;
    N3: TMenuItem;
    MNewProc: TMenuItem;
    MPrinterSetup: TMenuItem;
    PrinterSetupDialog: TPrinterSetupDialog;
    MHelpContents: TMenuItem;
    MNew: TMenuItem;
    BCompile: TSpeedButton;
    BRun: TSpeedButton;
    CompileBoxPop: TPopupMenu;
    PMHide: TMenuItem;
    Image: TImage;
    CompileBox: TListBox;
    PageControl: TPageControl;
    MReload: TMenuItem;
    StatusBar: TStatusBar;
    PopupMenu: TPopupMenu;
    PMCopy: TMenuItem;
    N4: TMenuItem;
    MInterrupt: TMenuItem;
    PMCut: TMenuItem;
    Pegar1: TMenuItem;
    N5: TMenuItem;
    MRecentFiles: TMenuItem;
    MTools: TMenuItem;
    MCodeGen: TMenuItem;
    N6: TMenuItem;
    MImportCodegen: TMenuItem;
    MFile: TMenuItem;
    BHelpContents: TSpeedButton;
    CodeHighlighter: TSynAnySyn;
    DataHighlighter: TSynAnySyn;
    VOChighlighter: TSynAnySyn;
    SynEditSearch: TSynEditSearch;
    MSearchNext: TMenuItem;
    SynAutoComplete: TSynAutoComplete;
    N7: TMenuItem;
    MFontUp: TMenuItem;
    MFontDown: TMenuItem;
    procedure MOpenClick(Sender: TObject);
    procedure MPreferencesClick(Sender: TObject);
    procedure MSaveClick(Sender: TObject);
    procedure MQuitClick(Sender: TObject);
    procedure EditBoxChange(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MSaveAsClick(Sender: TObject);
    procedure CreateRecentFilesMenu();
    procedure RecentFileClick(Sender: TObject);
    procedure MAboutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GenerateTranslation();
    procedure ReviewComponent(AControl: TComponent; var F: TextFile);
    procedure MCopyClick(Sender: TObject);
    procedure MCutClick(Sender: TObject);
    procedure MPasteClick(Sender: TObject);
    procedure MCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MUndoClick(Sender: TObject);
    procedure BOpenClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BCutClick(Sender: TObject);
    procedure BCopyClick(Sender: TObject);
    procedure BPasteClick(Sender: TObject);
    procedure BUndoClick(Sender: TObject);
    procedure MRedoClick(Sender: TObject);
    procedure MReplaceClick(Sender: TObject);
    procedure MprintClick(Sender: TObject);
    procedure BReplaceClick(Sender: TObject);
    procedure BSearchClick(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure MPrinterSetupClick(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure MNewClick(Sender: TObject);
    procedure MCompileClick(Sender: TObject);
    procedure MCompileAndRunClick(Sender: TObject);
    procedure MNewProcClick(Sender: TObject);
    procedure BCompileClick(Sender: TObject);
    procedure BRunClick(Sender: TObject);
    procedure BRedoClick(Sender: TObject);
    procedure PMHideClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SplitterMoved(Sender: TObject);
    procedure MReloadClick(Sender: TObject);
    procedure CompileBoxClick(Sender: TObject);
    procedure MHelpContentsClick(Sender: TObject);
    procedure HelpResponse(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure PMCopyClick(Sender: TObject);
    procedure PMCutClick(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure MInterruptClick(Sender: TObject);
    procedure ActualizeRecentFiles(Newfile: String; OldName : String = '');
   procedure LoadFile(Filename : String);
   procedure CloseFileEdited();
   procedure SaveFile(Filename : String);
   procedure SetPgcLanguage(Editor: TSynMemo);
   procedure SetVocLanguage(Editor: TSynMemo);
   procedure SetDataLanguage(Editor: TSynMemo);
   procedure SetNoneLanguage(Editor: TSynMemo);
   function CheckError(Error: String;Corrector:integer;IsTxtPaws:Boolean) : Boolean;
   function Compile(): Boolean;
   procedure GotoLine(Error:String; Corrector : integer; IsTxtpaws: Boolean);
    procedure MCodeGenClick(Sender: TObject);
    procedure BHelpContentsClick(Sender: TObject);
    procedure MImportCodegenClick(Sender: TObject);
    procedure MSearchClick(Sender: TObject);
    procedure ShowSearchReplaceDialog(AReplace:Boolean);
    procedure DoSearchReplaceText(AReplace: boolean;  ABackwards: boolean);
    procedure MSearchNextClick(Sender: TObject);
    procedure SynMemoClick(Sender: TObject);
    procedure MFontUpClick(Sender: TObject);
    procedure MFontDownClick(Sender: TObject);
    procedure SynMemoKeyPress(Sender: TObject; var Key: Char);
  public
  private
      FSearchFromCaret: boolean;

    { Public declarations }
  end;

var
  fMain: TfMain;

var InterpreterString : String;
    CompilerString : String;
    PreprocessorString :  String;
    LibraryString : String;
    AssemblerString : String;
    PackerString : String;
    UsePreProcessor : Boolean;
    DelTempFiles : Boolean;
    HelpBasePath: String;

    TempSourceFile : String;

    Executable : String;

    RecentFiles : array [0..3] of String;


    // variables para la busqueda y reemplazo
    gbSearchCaseSensitive: boolean;
    gbSearchFromCaret: boolean;
    gbSearchSelectionOnly: boolean;
    gbSearchTextAtCaret: boolean;
    gbSearchWholeWords: boolean;

    gsSearchText: string;
    gsSearchTextHistory: string;
    gsReplaceText: string;
    gsReplaceTextHistory: string;




implementation

uses UOptions, UAbout, UInifile, URunDOS, ShellAPI, UCodeGen, dlgSearchText,
  dlgConfirmReplace, dlgReplaceText, SynEditPrint, UHelpBrowser;

{$R *.dfm}


type TCondactType = (ctAction, ctCondition, ctTerminator);

type TCondact = record
                 Name : String;
                 CondactType : TCondactType;
                end;

const Blocks: array [0..9] of Array [1..2] of String =(
('DEF','Definiciones'),
('CTL','Con&trol'),
('LTX','&Localidades'),
('OTX','&Objetos'),
('CON','&Conexiones'),
('VOC','&Vocabulario'),
('STX','Msj. &Sistema'),
('MTX','&Msj. Usuario'),
('OBJ','O&bjetos [2]'),
('PRO 0','Tabla &Respuestas'));

const clCondition = clGreen;
      clAction = clBlue;
      clTerminator = clRed;
      clSlash = clBlue;
      clVoc = clMaroon ;
      clTXTPAws = clMaroon;
      clNumber = clPurple;



var  Modified : Boolean;


function getBlockDescriptionByName(BlockName:String) : String;
var i : integer;
begin
 Result := BlockName;
 for i := 0 to 9 do if Blocks[i,1]=BlockName then Result := Blocks[i,2];
 if Copy(BlockName,1,3) = 'PRO' then begin
  Result := 'P&' + Trim(Copy(BlockName,5,100));
  if AnsiUpperCase(Copy(Result,1,11)) = 'P&INTERRUPT' then
   Result := 'P&' + Trim(Copy(BlockName,15,100)) + ' [INT]';
 end;

 if Result = 'P&0' then Result := 'Tabla &Respuestas';
end;

function getBlockNameByDescription(BlockDesc:String) : String;
var i : integer;
begin
 if BlockDesc<>'Definiciones' then Result := BlockDesc
                              else Result := '';
 for i := 1 to 9 do if Blocks[i,2]=BlockDesc then Result := Blocks[i,1];
 if Pos('[INT]',BlockDesc) >0 then Result := 'PRO INTERRUPT ' + Copy(BlockDesc,3,Pos('[INT',BlockDesc)-3) else
   if Copy(BlockDESC,1,2) = 'P&' then Result := 'PRO ' + Copy(BlockDesc,3,100);
end;


procedure TfMain.LoadFile(Filename : String);
var S1, S2 :String;
    TS :  TTabSheet;
    EditBox : TSynMemo;
    TempBuffer : TStringList;
    TempBlockText : TstringList;
    i : integer;
    LastBlockName : String;
begin
   while Pos('&',Filename) >0 do Filename := Copy(Filename,1,Pos('&',FileName)-1) + Copy(Filename,Pos('&',FileName)+1,MaxInt);

   LastBlockName := '';
   TempBuffer := TStringList.Create();
   TempBlockText := TStringList.Create();
   EditBox := nil;
   try
    tempBuffer.LoadFromFile(Filename);
    tempBuffer.Insert(0,'/DEF');
    for i := 0 to TempBuffer.Count - 1 do
    begin
     S1:= TempBuffer[i];
     Application.ProcessMessages();
     S2 := Trim(S1);
     if ((length(s2)=4)  and (Copy(S2,1,1)='/') and (Copy(S2,2,1)>'9')) OR ((Length(S2)>5) AND (AnsiUpperCase(Copy(S2,1,5))= '/PRO ' )) then
       begin // Es un inicio de bloque

         if LastBlockName<>'' then begin
                                    EditBox.Lines.Text := TempBlockText.Text;
                                     if LastBlockName = 'PRO' then SetPgcLanguage(EditBox)
                                      else if LastBlockName = 'VOC' then SetVocLanguage(EditBox)
                                        else if LastBlockName = 'CTL' then SetNoneLanguage(EditBox)
                                       else SetDataLanguage(EditBox);
                                   TempBlockText.Clear();
                                  end;
         if Pos(';',S2) <> 0 then S2 := Copy(S2,1,Pos(';',S2)-1);
         S2 := Trim(S2);
         LastBlockName := Copy(Copy(S2,2,Length(S2)-1),1,3);

         TS := TTabSheet.Create(PageControl);
         TS.PageControl := PageControl;
         TS.Caption := getBlockDescriptionByName(Copy(S2,2,Length(S2)-1));
         EditBox := TSynMemo.Create(TS);
         EditBox.OnKeyPress := SynMemoKeyPress;
         EditBox.Parent := TS;
         EditBox.Font := UOptions.optionsFont;
         //EditBox.Font := fMain.Font;
         EditBox.Font.Color := clBlack;
         EditBox.Gutter.ShowLineNumbers := true;
         EditBox.Gutter.Color := $00E8B786;
         if Copy(Copy(S2,2,Length(S2)-1),1,3) = 'PRO' then SetPgcLanguage(EditBox)
              else if Copy(Copy(S2,2,Length(S2)-1),1,3) = 'VOC' then SetVocLanguage(EditBox)
                else if LastBlockName = 'CTL' then SetNoneLanguage(EditBox)
                  else SetDataLanguage(EditBox);
         EditBox.BorderStyle := bsNone;
         EditBox.PopupMenu := PopupMenu;
         EditBox.Align :=  alClient;
         EditBox.ScrollBars := ssBoth;
         EditBox.Gutter.Width := 40;
         EditBox.OnKeyDown := HelpResponse;
         EditBox.OnClick := SynMemoClick;
         EditBox.Visible := True;

       end {Fin de nuevo bloque}
         else
          if Assigned(EditBox) then TempBlockText.Add(S1);
     end;
     EditBox.Lines.Text := TempBlockText.Text;
     if LastBlockName = 'PRO' then SetPgcLanguage(EditBox)
       else if LastBlockName = 'VOC' then SetVocLanguage(EditBox)
        else SetDataLanguage(EditBox);
     finally
      TempBuffer.Free();
      TempBlockText.Free();
     end;

     MOpen.Enabled := False;
     BOPen.Enabled := False;
     FMain.Caption := 'Superglus 1.2 [' + ExtractFileName(Filename) + ']';
     MSave.Enabled := True;
     BSave.Enabled := True;
     MSaveAS.Enabled := True;

     Brun.Enabled := true;
     BCompile.Enabled := true;

     MEdit.Enabled := true;
     Mnew.Enabled := False;
     BNew.Enabled := False;


     MNewProc.Enabled := true;
     BCut.Enabled := True;
     BSearch.Enabled := True;
     BReplace.Enabled := True;
     BCopy.Enabled := True;
     BPaste.Enabled := True;
     BRedo.Enabled := True;
     BUndo.Enabled := True;
     BPrint.Enabled := True;
     MPrint.Enabled := True;
     MReload.Enabled := True;

     MRecentFiles.Enabled := false;

     MRun.Enabled := True;
     MTools.Enabled := True;
     MClose.Enabled := True;
     Modified := false;
     PageControl.Visible := True;

     if ExtractFileName(Filename) <> LibraryString then ActualizeRecentFiles(Filename);

end;

procedure TfMain.SaveFile(Filename : String);
var T:TextFile;
    i : integer;
    j : integer;
begin
 AssignFile(T,Filename);
 Rewrite(T);
 for i := 0 to PageControl.PageCount - 1 do
  begin
   if i<>0 then if getBlockNameByDescription(PageControl.Pages[i].Caption)<>'' then Writeln(T,'/' + getBlockNameByDescription(PageControl.Pages[i].Caption));
   for j := 0 to (PageControl.Pages[i].Controls[0] as TSynMemo).Lines.Count - 1
    do WriteLn(T,(PageControl.Pages[i].Controls[0] as TSynMemo).Lines[j]);
  end;
  CloseFile(T);
  Modified := false;
end;

procedure TfMain.MOpenClick(Sender: TObject);
begin
 if (Modified and (MessageDlg('Es posible que algunos cambios no hayan sido grabados.'#13#10'¿Está seguro?',mtConfirmation,[mbYes,mbNo],0)=mrYes))
  or (not Modified)
  then
   if OpenDialog.Execute then
    LoadFile(OpenDialog.FileName);
end;


procedure TfMain.SetDataLanguage(Editor: TSynMemo);
begin
 Editor.Highlighter := DataHighlighter;
end;

procedure Tfmain.SetNoneLanguage(Editor: TSynMemo);
begin
 Editor.Highlighter := nil;
end;


procedure TfMain.SetVocLanguage(Editor: TSynMemo);
begin
 Editor.Highlighter := VOChighlighter;
end;


procedure TfMain.SetPgcLanguage(Editor: TSynMemo);
begin
 Editor.Highlighter := CodeHighlighter;
end;


procedure TfMain.MPreferencesClick(Sender: TObject);
begin
 if fOptions.ShowModal() = mrOk then begin
  SaveInifile();
 end;
end;

procedure TfMain.MSaveClick(Sender: TObject);
begin
  SaveFile(OpenDialog.FileName);
end;

procedure TfMain.MQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TFMain.EditBoxChange(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  Modified := True;
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if Modified then
   if Application.MessageBox('Es posible que algunos cambios no hayan sido grabados.'#13#10'¿Está seguro?','Superglus',MB_YESNO) = IDNo
    then CanClose := False;
end;

procedure TfMain.MSaveAsClick(Sender: TObject);
var PreviousName : String;
begin
  PreviousName := OpenDialog.FileName;
  SaveDialog.Title := 'Guardar como';
  if SaveDialog.Execute then
   begin
    SaveFile(SaveDialog.FileName);
    OpenDialog.FileName := SaveDialog.FileName;
    Caption := 'Superglus 1.2 [' + ExtractFileName(SaveDialog.FileName) + ']';
    ActualizeRecentFiles(OpenDialog.FileName, PreviousName);
   end;
end;

procedure TfMain.MAboutClick(Sender: TObject);
begin
  fAbout.ShowModal();
end;



procedure TfMain.FormShow(Sender: TObject);
var i : integer;
begin
  GenerateTranslation();

  LoadInifile();
  OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);

  if FileExists('CodeHighLight.ini') then
    CodeHighlighter.LoadHighLighter('CodeHighLight.ini');

  if FileExists('DataHighLight.ini') then
    DataHighlighter.LoadHighLighter('DataHighLight.ini');

  if FileExists('VocHighLight.ini') then
    VOCHighlighter.LoadHighLighter('VocHighLight.ini');

  for i:=1 to ParamCount do
  begin
   if OpenDialog.FileName = '' then
     if FileExists(ParamStr(i)) then
     begin
       OpenDialog.FileName := ParamStr(i);
       LoadFile(OpenDialog.FileName)
     end;
  end;

  CreateRecentFilesMenu();

  FormResize(Sender);
  fHelp.ShowHelp('');


end;

procedure TfMain.MCopyClick(Sender: TObject);
begin
 (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).CopyToClipboard();
end;

procedure TfMain.MCutClick(Sender: TObject);
begin
 (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).CutToClipboard();
end;

procedure TfMain.MPasteClick(Sender: TObject);
begin
 (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).PasteFromClipboard();
end;

procedure TfMain.MCloseClick(Sender: TObject);
begin
 if (Modified and (MessageDlg('Es posible que algunos cambios no hayan sido grabados.'#13#10'¿Está seguro?',mtConfirmation,[mbYes,mbNo],0)=mrYes))
  or (not Modified)
  then CloseFileEdited();
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
var i : integer;
begin
     PageControl.Visible := False;
     for i := PageControl.PageCount - 1 downto 0 do begin
      (PageControl.Pages[i].Controls[0] as TSynMemo).Lines.Text := '';
      (PageControl.Pages[i].Controls[0] as TSynMemo).Free();
      PageControl.Pages[i].Free()
     end;
end;

procedure TfMain.MUndoClick(Sender: TObject);
begin
 (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).Undo;
end;

procedure TfMain.BOpenClick(Sender: TObject);
begin
  MOpen.Click();
end;

procedure TfMain.BsaveClick(Sender: TObject);
begin
  MSave.Click();
end;

procedure TfMain.BCutClick(Sender: TObject);
begin
  MCut.Click();
end;

procedure TfMain.BCopyClick(Sender: TObject);
begin
  MCopy.Click();
end;

procedure TfMain.BPasteClick(Sender: TObject);
begin
  MPaste.Click();
end;

procedure TfMain.BUndoClick(Sender: TObject);
begin
  MUndo.Click();
end;

procedure TfMain.MRedoClick(Sender: TObject);
begin
  (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).Redo;
end;

procedure TfMain.MReplaceClick(Sender: TObject);
begin
  ShowSearchReplaceDialog(TRUE);
end;

procedure TfMain.MprintClick(Sender: TObject);
var PRN : TSynEditPrint;
    SynEdit : TSynMemo;
begin
  SynEdit := (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo);
  PRN := TSynEditPrint.Create(Self);
  try
    PRN.Title := 'Superglus';
    PRN.Lines.Text := SynEdit.Lines.Text;
    PRN.Highlighter := nil;
    PRN.Wrap := True;
    PRN.Print();
  finally
    PRN.Free();
  end;
end;

procedure TfMain.BReplaceClick(Sender: TObject);
begin
  MReplace.Click();
end;

procedure TfMain.BSearchClick(Sender: TObject);
begin
  MSearch.Click();
end;

procedure TfMain.BPrintClick(Sender: TObject);
begin
  MPrint.Click();
end;

procedure TfMain.MPrinterSetupClick(Sender: TObject);
begin
  PrinterSetupDialog.Execute();
end;

procedure TfMain.BNewClick(Sender: TObject);
begin
  MNew.Click();
end;

procedure TfMain.MNewClick(Sender: TObject);
var TheLibrary:String;
begin
  if Pos('\',LibraryString) <1 then
    TheLibrary := ExtractFilePath(Application.ExeName) + '\' + LibraryString
    else TheLibrary := LibraryString;


  if not FileExists(TheLibrary) then begin
   ShowMessage('No se encontró la librería de inicio.');
   Exit;
  end;
  SaveDialog.FileName := '';
  SaveDialog.Title := 'Indique el nombre con el que guardar la nueva aventura:';
  if SaveDialog.Execute then
  begin
    LoadFile(TheLibrary);
    OpenDialog.FileName := SaveDialog.FileName;
    SaveFile(OpenDialog.FileName);
    FMain.Caption := 'Superglus 1.2 [' + ExtractFileName(SaveDialog.Filename) + ']';
  end;
end;

procedure TfMain.MCompileClick(Sender: TObject);
begin
  Compile();
end;

procedure TfMain.MCompileAndRunClick(Sender: TObject);
var InterpreterExe : String;
begin
  if Compile then
  begin
    CompileBox.Visible := false;
    InterpreterExe := InterpreterString;
    if (pos('\',InterpreterExe)<1) then InterpreterExe := ExpandFileName(ExtractFilePath(Application.ExeName) + '\' + InterpreterExe);
    if FileExists(InterpreterExe) then RunDosClassic(InterpreterExe, '"' + Executable + '"','"' + ExtractFilePath( Executable )+ '"' )
                                     else ShowMessage('Configuración errónea: no se encuentra el interprete');
 end;
end;

procedure TfMain.MNewProcClick(Sender: TObject);
var Caption : String;
    TS : TTabSheet;
    EditBox : TSynMemo;
    PrevCaption : String;
begin
 if Application.MessageBox('¿Desea crear un nuevo proceso?','Nuevo Proceso',MB_YESNO) = IDYES then
 begin
   if pos('[INT]',PageControl.Pages[PageControl.PageCount-1].Caption) >0 then PrevCaption := Copy(PageControl.Pages[PageControl.PageCount-1].Caption,1,Pos('[',PageControl.Pages[PageControl.PageCount-1].Caption)-2)
                                                                         else PrevCaption :=PageControl.Pages[PageControl.PageCount-1].Caption;

   Caption := IntToStr(StrToInt( Copy(PrevCaption,3,MaxLongint) )+1);

   TS := TTabSheet.Create(PageControl);
   TS.PageControl := PageControl;
   TS.Caption := 'P&' + Caption;
   EditBox := TSynMemo.Create(TS);
   EditBox.OnKeyPress := SynMemoKeyPress;
   EditBox.Parent := TS;
   EditBox.Align :=  alClient;
   EditBox.Font := UOPtions.optionsFont;
   EditBox.ScrollBars := ssBoth;
   EditBox.Visible := True;
   EditBox.Lines.Clear();
   EditBox.PopupMenu := PopupMenu;
   EditBox.Lines.Add(';*** Superglus Editor Proceso ' + Caption + ' ***');
   PageControl.ActivePage := PageControl.Pages[PageControl.PageCount-1];
   EditBox.SetFocus();

   EditBox.Font.Color := clBlack;
   EditBox.Gutter.Color := $00E8B786;
   EditBox.Gutter.ShowLineNumbers := true;
   SetPgcLanguage(EditBox);
  end;
end;

procedure TfMain.BCompileClick(Sender: TObject);
begin
  MCompile.Click();
end;

procedure TfMain.BRunClick(Sender: TObject);
begin
  MCompileAndRun.Click();
end;

procedure TfMain.BRedoClick(Sender: TObject);
begin
  MRedo.Click();
end;

procedure TfMain.PMHideClick(Sender: TObject);
begin
  CompileBox.Visible := False;
end;

procedure TfMain.FormResize(Sender: TObject);
begin
  Image.Left := fMain.ClientWidth DIV 2 - Image.Picture.Bitmap.Width DIV 2;
  Image.Top := fMain.Clientheight DIV 2 - Image.Picture.Bitmap.height DIV 2;
  BHelpContents.Left := Panel.Width - 40;
end;

function TfMain.CheckError(Error: String;Corrector:Integer; IsTxtPaws:Boolean) : Boolean;
begin
  Result := false;
  Error := AnsiUpperCase(Error);
  if Pos('ERROR',Error) > 0 then begin
                                   Result := True;
                                   GoToLine(Error, Corrector, IsTxtPaws);
                                 end;
end;

function TfMain.Compile(): Boolean;
var PreprocessorExe, CompilerExe, AssmblerExe, PackerExe : String;
begin
   Executable := '';

   DeleteFile(ChangeFileExt(OpenDialog.FileName,'.ulx'));
   DeleteFile(ChangeFileExt(OpenDialog.FileName,'.blb'));


   Result := false;
   TempSourceFile := ChangeFileExt(OpenDialog.FileName,'.TMP');
   SaveFile(TempSourceFile);
   CompileBox.Clear();
   CompileBox.Visible := True;
   if UsePreProcessor then begin
    CompileBox.Items.Add('-- Iniciando preprocesado de ' + TempSourceFile);

   PreprocessorExe := PreprocessorString;
   if Pos('\', PreprocessorExe) < 1 then
     PreprocessorExe := ExtractFilePath(Application.ExeName)  + PreprocessorExe;

      if FileExists(PreprocessorExe) then RunDOSInList('"' + PreprocessorExe + '" "' + TempSourceFile + '"',CompileBox, True,  ExtractFilePath(TempSourceFile))
                                      else begin
                                            ShowMessage('No se encuentra el preprocesador.');
                                            Exit
                                           end;
    CompileBox.Selected[CompileBox.Items.Count-9] := true;
    if CheckError(CompileBox.Items[CompileBox.Items.count-9],0, True) then begin
                                                                      DeleteFile(TempSourceFile);
                                                                      Exit;
                                                                     end;
 end;

 if UsePreProcessor then begin
                           CompileBox.Items.Add('-- Iniciando compilacion de ' + ChangeFileExt(TempSourceFile,'.sce'));
                           CompilerExe := CompilerString;
                           if pos('\', CompilerExe) < 1 then CompilerExe := ExtractFilePath(Application.ExeName) + CompilerExe ;


                           if FileExists(CompilerExe) then  RunDOSInList('"' + CompilerExe + '" "' + ChangeFileExt(TempSourceFile,'.sce') + '"',CompileBox, true)
                                                         else begin
                                                                Showmessage('No se encuentra el compilador.');
                                                                Exit
                                                              end;
                         end
                    else begin
                           CompileBox.Items.Add('-- Iniciando compilacion de ' + TempSourceFile);
                           CompilerExe := CompilerString;
                           if pos('\', CompilerExe) < 1 then CompilerExe := ExtractFilePath(Application.ExeName)  + CompilerExe;
                           if FileExists(CompilerExe) then RunDOSInList('"' + CompilerExe + '"  "' + TempSourceFile + '"',CompileBox, true)
                                                         else
                                                         begin
                                                           ShowMessage('No se encuentra el compilador.');
                                                           Exit
                                                         end;
                         end;

 CompileBox.Selected[CompileBox.Items.Count-1] := true;
 DeleteFile(TempSourceFile);
 if CheckError(CompileBox.Items[CompileBox.Items.count-1],0, False) then Exit;

 CompileBox.Items.Add('-- Iniciando ensamblado de ' + ChangeFileExt(OpenDialog.FileName,'.ula'));

 AssmblerExe := AssemblerString;
  if pos('\', AssmblerExe) < 1 then AssmblerExe := ExtractFilePath(Application.ExeName)  + AssmblerExe ;


 if FileExists(AssmblerExe) then RunDOSInList('"' + AssmblerExe + '" -i "' + ChangeFileExt(OpenDialog.FileName,'.ula') + '" -o "' + ChangeFileExt(OpenDialog.FileName,'.ulx') + '"',CompileBox, False)
                               else begin
                                     ShowMessage('No se encuentra el ensamblador.');
                                     Exit
                                    end;

 if not FileExists(ChangeFileExt(OpenDialog.FileName,'.ulx')) then begin
  CompileBox.Items.Add('Fichero ULX no generado, probablemente por conflictos con los plugins, o ficheros de librería pgl corruptos');
  Exit;
 end;

 Executable := ChangeFileExt(OpenDialog.FileName,'.ulx');

 if not FileExists(ChangeFileExt(OpenDialog.FileName,'.blc')) then
  ShowMessage('Aviso: No se encontró fichero BLC, empaquetado iblorb no realizado.')
 else begin
     DeleteFile(ChangeFileExt(OpenDialog.FileName,'.blb'));
     CompileBox.Items.Add('-- Iniciando empaquetado de ' + ChangeFileExt(OpenDialog.FileName, '.ulx'));

     PackerExe:= PackerString;
     if pos('\', PackerExe) < 1 then PackerExe := ExtractFilePath(Application.ExeName)  + PackerExe ;


     if FileExists(PackerExe) then RunDOSInList('"' + PackerExe + '" "' + ChangeFileExt(TempSourceFile,'.blc') + '"  "' + ChangeFileExt(TempSourceFile,'.blb') + '"' ,CompileBox, False)
                                 else begin
                                       ShowMessage('No se encuentra el empaquetador.');
                                       Exit
                                      end;

     CompileBox.Selected[CompileBox.Items.Count-1] := true;
     if not FileExists(ChangeFileExt(OpenDialog.FileName,'.blb')) then CompileBox.Items.Add('Aviso: Fallo en el empaquetado, fichero .blb no se ha creado.')
                                                                  else begin
                                                                        Executable := ChangeFileExt(OpenDialog.FileName, '.blb');
                                                                        CompileBox.Items.Add('Fichero .blb creado.')
                                                                       end;
 end;

 CompileBox.Items.Add('-- Aventura lista para jugar');
 if DelTempFiles then begin
  DeleteFile(ChangeFileExt(OpenDialog.FileName,'.ula'));
  DeleteFile(ChangeFileExt(OpenDialog.FileName,'.txi'));
  DeleteFile(ChangeFileExt(OpenDialog.FileName,'.txi.log'));
  DeleteFile(ChangeFileExt(OpenDialog.FileName,'.blc'));
  DeleteFile(ChangeFileExt(OpenDialog.FileName,'.tmp.log'));
  DeleteFile(ChangeFileExt(OpenDialog.FileName,'.ulx'));
  DeleteFile(ChangeFileExt(OpenDialog.FileName,'.blc.log'));
  if UsePreProcessor and (Pos('.SCE', AnsiUpperCase(OpenDialog.FileName))=0) then DeleteFile(ChangeFileExt(OpenDialog.FileName,'.sce'));
 end;

 CompileBox.Selected[CompileBox.Items.Count-1] := true;


 Result := true;
end;


procedure TfMain.GotoLine(Error:String; Corrector : integer; IsTxtPaws: Boolean);
var i, line : integer;
    s : string;
    count : integer;
    offset : integer;

begin
 if not IsTxtpaws then
 begin
     Error := Copy(Error, Pos('.',Error)+4, MaxLongint);
     i:= 1;
     s := '';
     while (i<=Length(Error)) and not (Error[i] in ['0'..'9']) do i := i + 1;
     while (i<=Length(Error)) and (Error[i] in ['0'..'9']) do begin
                                                               s := s + Error[i];
                                                               i := i + 1;
                                                              end;
 end
 else
 begin
  Error := Copy(Error, 1, Pos(',', Error) - 1);
  s := trim(Error);
 end;
 if s = '' then Exit; // Salimos sin colocar en la linea, no pudo ser
 line := StrToInt(s);

 if line = 0 then begin
                   (PageControl.Pages[0].Controls[0] as TSynMemo).CaretX := 0;
                   (PageControl.Pages[0].Controls[0] as TSynMemo).CaretY := 0;
                   Exit;
                   end;

 i := 0;
 count := 0;
 while (i<PageControl.PageCount) and (count < line) do
  begin
   count := count + (PageControl.Pages[i].Controls[0] as TSynMemo).Lines.Count + 1;
   i := i+ 1;
  end;
  i := i-1;

  if (count < line) then Exit; // Linea mas alla del final de fichero

  offset := line - (count-(PageControl.Pages[i].Controls[0] as TSynMemo).Lines.Count - 1) - Corrector;

  (PageControl.Pages[i].Controls[0] as TSynMemo).CaretX := 0;
  (PageControl.Pages[i].Controls[0] as TSynMemo).CaretY := offset;
  PageControl.ActivePage := PageControl.Pages[i];

  (PageControl.Pages[i].Controls[0] as TSynMemo).CaretY := offset;

(PageControl.Pages[i].Controls[0] as TSynMemo).ActiveLineColor := clRed;

end;


procedure TfMain.SplitterMoved(Sender: TObject);
begin
 if CompileBox.Height  > Trunc((fMain.ClientHeight / 100) * 29) then
  CompileBox.Height := Trunc((fMain.ClientHeight / 100) * 29);
end;

procedure TfMain.MReloadClick(Sender: TObject);
begin
 if (Modified and (MessageDlg('Es posible que algunos cambios no hayan sido grabados.'#13#10'¿Está seguro?',mtConfirmation,[mbYes,mbNo],0)=mrYes))
  or (not Modified) then
 begin
  CloseFileEdited();
  LoadFile(OpenDialog.FileName);
 end;

end;

procedure TfMain.CloseFileEdited();
var i : integer;
begin
     for i := PageControl.PageCount - 1 downto 0 do begin
      (PageControl.Pages[i].Controls[0] as TSynMemo).Lines.Text := '';
      (PageControl.Pages[i].Controls[0] as TSynMemo).Free();
      PageControl.Pages[i].Free()
     end;
     MClose.Enabled := False;
     MOpen.Enabled := True;
     Mnew.Enabled := True;
     Brun.Enabled := False;
     BCompile.Enabled := False;
     BNew.Enabled := true;
     BOpen.Enabled := True;
     MSave.Enabled := False;
     BSave.Enabled := False;
     MSaveAs.Enabled := False;
     MRun.Enabled := False;
     MTools.Enabled := False;
     MEdit.Enabled := False;
     BCopy.Enabled := False;
     BPaste.Enabled := False;
     BCut.Enabled := False;
     MNewProc.Enabled := False;
     Bredo.Enabled := False;
     BUndo.Enabled := False;
     BSearch.Enabled := False;
     BReplace.Enabled := False;
     BPrint.Enabled := False;
     MPrint.Enabled := False;
     MReload.Enabled := False;
     MRecentFiles.Enabled := true;


     Caption := 'SuperGlus Editor';
     PageControl.Visible := False;
end;



procedure TfMain.CompileBoxClick(Sender: TObject);
begin
  if Pos('ERROR',UpperCase(CompileBox.Items[CompileBox.ItemIndex]))<>0  then
   GotoLine(CompileBox.Items[CompileBox.ItemIndex],0, False);
end;

procedure TfMain.MHelpContentsClick(Sender: TObject);
begin
//  S := ExtractFilePath(Application.ExeName) + 'superglus.chm'#0;
//  ShellExecute(self.Handle, 'OPEN', @S[1],nil, nil, SW_MAXIMIZE);
  fHelp.ShowHelp('');
  fHelp.Show();

end;

procedure TfMain.HelpResponse(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var Sel, SelLine:String;
    Context: TstringList;
    i : integer;
    CurrentLine: integer;
    Found :  Boolean;
begin
 (Sender as TSynMemo).ActiveLineColor := clWhite;
 if key <> VK_F1 then exit;
 Context := TStringList.Create();


 CurrentLine :=(PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).CaretY -1;
 SelLine := (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).Lines[CurrentLine];
 if SelLine = '' then
 begin
  MHelpContents.Click();
  Exit
 end;

 Sel := '';
 i := (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).CaretX;
 while (i>=1) and (SelLine[i]<>' ') do
  begin
   Sel := SelLine[i] + Sel;
   I := i - 1;
  end;
 i := (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo).CaretX + 1;
 while (i<=Length(SelLine)) and (SelLine[i]<>' ') do
  begin
   Sel :=   Sel + SelLine[i];
   I := i + 1;
  end;

 Found := false;

 try
   Context.LoadFromFile(ExtractFilePath(Application.ExeName) + 'CONTEXT.HLP');
   for i := 0 to Context.Count - 1 do
    if pos(AnsiUpperCase(Sel),AnsiUpperCase(Context.Strings[i]))>0 then
     begin
      Sel := HelpBasePath;
      if NOT (HelpBasePath[Length(HelpBasePath)] in ['/','\']) then Sel := Sel + '/';
      Sel := Sel + 'condactos:' + Context.Strings[i]; ;
      fHelp.ShowHelp(Sel);
      fHelp.Show;
      Found := true;
     end;
     if not Found then
      MHelpContents.Click();
 finally
  Context.Free;
 end;

end;


procedure TfMain.PMCopyClick(Sender: TObject);
begin
 MCopyClick(Sender);
end;

procedure TfMain.PMCutClick(Sender: TObject);
begin
 MCutClick(Sender);
end;

procedure TfMain.Pegar1Click(Sender: TObject);
begin
 MPasteClick(Sender);
end;

procedure TfMain.PopupMenuPopup(Sender: TObject);
begin

 MInterrupt.Visible := Copy(PageControl.Pages[PageControl.ActivePageIndex].Caption,1,2) = 'P&';
 MInterrupt.Checked := Pos('[INT]',PageControl.Pages[PageControl.ActivePageIndex].Caption) > 0;

 MImportCodeGen.Visible := (Copy(PageControl.Pages[PageControl.ActivePageIndex].Caption,1,2) = 'P&') or (PageControl.Pages[PageControl.ActivePageIndex].Caption = 'Tabla &Respuestas');


end;

procedure TfMain.MInterruptClick(Sender: TObject);
var i : integer;
begin
 if MInterrupt.Checked then begin
  PageControl.Pages[PageControl.ActivePageIndex].Caption := Copy(PageControl.Pages[PageControl.ActivePageIndex].Caption,1,Pos('[',PageControl.Pages[PageControl.ActivePageIndex].Caption)-2);
  MInterrupt.Checked := false;
 end
 else
 begin
  for i := 0 to PageControl.PageCount - 1 do
   if Pos('[INT]',PageControl.Pages[i].Caption) > 0 then
    if MessageDlg('Ya existe otro proceso interrupción,'#13#10'la activación del presente supone la desactivación del otro.'#13#10'¿Está seguro?',mtConfirmation,[mbYes,mbNo],0)= mrNo
     then Exit
     else begin
           PageControl.Pages[i].Caption := Copy(PageControl.Pages[i].Caption,1,Pos('[',PageControl.Pages[i].Caption)-2);
           PageControl.Pages[PageControl.ActivePageIndex].Caption := PageControl.Pages[PageControl.ActivePageIndex].Caption + ' [INT]';
           MInterrupt.Checked := true;
           Exit;
          end;
PageControl.Pages[PageControl.ActivePageIndex].Caption := PageControl.Pages[PageControl.ActivePageIndex].Caption + ' [INT]';
MInterrupt.Checked := true;


 end;


end;

procedure TfMain.RecentFileClick(Sender: TObject);
var Filename : String;
begin
 try
  FileName := (Sender as TMenuItem).Caption;
  while Pos('&',Filename) >0 do Filename := Copy(Filename,1,Pos('&',FileName)-1) + Copy(Filename,Pos('&',FileName)+1,MaxInt);
  OpenDialog.FileName := FileName;
  ChDir(ExtractFilePath(OpenDialog.FileName));
  LoadFile(OpenDialog.FileName);
 except
  // No hacer nada
 end;
end;


procedure TfMain.ActualizeRecentFiles(Newfile: String; OldName : String = '');
var i :integer;
begin
  if OldName <> '' then begin
   for i :=0 to 3 do
    if RecentFiles[i] = OldName then RecentFiles[i] := NewFile;
   Exit;
  end;

  for i := 0 to 3 do if RecentFiles[i]=Newfile then Exit;

  RecentFiles[3] := RecentFiles[2];
  RecentFiles[2] := RecentFiles[1];
  RecentFiles[1] := RecentFiles[0];

  RecentFiles[0] := NewFile;

  SaveInifile();
  CreateRecentFilesMenu(); // Para que recargue el menú
end;

procedure TFMain.CreateRecentFilesMenu();
var i:integer;
    MenuItem : TMenuItem;
begin

 while MRecentFiles.Count >0 do MRecentFiles.Delete(0);

 for i := 0 to 3 do
 if RecentFiles[i]<>'' then begin
  MenuItem := TMenuItem.Create(MRecentFiles);
  MenuItem.Caption := RecentFiles[i];
  menuItem.OnClick := RecentFileClick;
  MRecentFiles.Add(MenuItem);
 end;

 if RecentFiles[0]='' then begin
  MRecentFiles.Visible := False;
  N5.Visible := False
 end;
end;


procedure TfMain.MCodeGenClick(Sender: TObject);
begin
 fCodeGen.ShowModal();
end;

procedure TfMain.BHelpContentsClick(Sender: TObject);
begin
 MHelpContents.Click();
end;

procedure TfMain.MImportCodegenClick(Sender: TObject);
begin
  fCodeGen.CodeMemo.SelectAll();
  fCodeGen.CodeMemo.CopyToClipboard();
  MPaste.Click();
end;

procedure TfMain.MSearchClick(Sender: TObject);
begin
  ShowSearchReplaceDialog(FALSE);
end;


procedure TfMain.ShowSearchReplaceDialog(AReplace: boolean);
var
  dlg: TTextSearchDialog;
  SynEditor : TSynMemo;

begin

  // Determinar SynEditor activo
  SynEditor:=  (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo);

  Statusbar.SimpleText := '';
  if AReplace then
    dlg := TTextReplaceDialog.Create(Self)
  else
    dlg := TTextSearchDialog.Create(Self);
  with dlg do
  try
    // Opciones de busqueda
    SearchCaseSensitive := gbSearchCaseSensitive;
    SearchFromCursor := gbSearchFromCaret;
    SearchInSelectionOnly := gbSearchSelectionOnly;
    // Empezar con última busqueda
    SearchText := gsSearchText;
    if gbSearchTextAtCaret then begin
      // Si hay algo seleccionado usarlo
      if SynEditor.SelAvail and (SynEditor.BlockBegin.Line = SynEditor.BlockEnd.Line)
      then
        SearchText := SynEditor.SelText
      else
        SearchText := SynEditor.GetWordAtRowCol(SynEditor.CaretXY);
    end;
    SearchTextHistory := gsSearchTextHistory;
    if AReplace then with dlg as TTextReplaceDialog do begin
      ReplaceText := gsReplaceText;
      ReplaceTextHistory := gsReplaceTextHistory;
    end;
    SearchWholeWords := gbSearchWholeWords;
    if ShowModal = mrOK then begin
      gbSearchSelectionOnly := SearchInSelectionOnly;
      gbSearchCaseSensitive := SearchCaseSensitive;
      gbSearchFromCaret := SearchFromCursor;
      gbSearchWholeWords := SearchWholeWords;
      gsSearchText := SearchText;
      gsSearchTextHistory := SearchTextHistory;
      if AReplace then with dlg as TTextReplaceDialog do begin
        gsReplaceText := ReplaceText;
        gsReplaceTextHistory := ReplaceTextHistory;
      end;
      fSearchFromCaret := gbSearchFromCaret;
      if gsSearchText <> '' then begin
        DoSearchReplaceText(AReplace, False);
        fSearchFromCaret := TRUE;
      end;
    end;
  finally
    dlg.Free;
  end;
end;


procedure TfMain.DoSearchReplaceText(AReplace: boolean;  ABackwards: boolean);
var
  Options: TSynSearchOptions;
  SynEditor : TSynMemo;
begin
  // Determinar SynEditor activo
  SynEditor:=  (PageControl.Pages[PageControl.ActivePageIndex].Controls[0] as TSynMemo);

  SynEditor.SearchEngine := SynEditSearch;

  Statusbar.SimpleText := '';
  if AReplace then
    Options := [ssoPrompt, ssoReplace, ssoReplaceAll]
  else
    Options := [];
  if ABackwards then
    Include(Options, ssoBackwards);
  if gbSearchCaseSensitive then
    Include(Options, ssoMatchCase);
  if not fSearchFromCaret then
    Include(Options, ssoEntireScope);
  if gbSearchSelectionOnly then
  begin
    if (not SynEditor.SelAvail) or SameText(SynEditor.SelText, gsSearchText) then
    begin
      if MessageDlg('No hay texto seleccionado. ¿Buscar en el texto completo?', mtWarning, [mbYes, mbNo], 0) = mrYes then
        gbSearchSelectionOnly := False
      else
        Exit;
    end
    else
      Include(Options, ssoSelectedOnly);
  end;
  if gbSearchWholeWords then
    Include(Options, ssoWholeWord);


  if SynEditor.SearchReplace(gsSearchText, gsReplaceText, Options) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    Statusbar.SimpleText := 'No se ha encontrado el texto';
    if ssoBackwards in Options then
      SynEditor.BlockEnd := SynEditor.BlockBegin
    else
      SynEditor.BlockBegin := SynEditor.BlockEnd;
    SynEditor.CaretXY := SynEditor.BlockBegin;
  end;

  if ConfirmReplaceDialog <> nil then
    ConfirmReplaceDialog.Free;
end;


procedure TfMain.MSearchNextClick(Sender: TObject);
begin
 if gsSearchText = '' then MSearch.Click()
 else
 begin
   gbSearchFromCaret := True;
   DoSearchReplaceText(False, False);
 end;  
end;


procedure TfMain.SynMemoClick(Sender: TObject);
begin
  (Sender as TSynMemo).ActiveLineColor := clWhite;
end;

procedure TfMain.MFontUpClick(Sender: TObject);
var i : integer;
begin
 for i:= 0 to PageControl.PageCount - 1 do
   (PageControl.Pages[i].Controls[0] as TSynMemo).Font.Size :=   (PageControl.Pages[i].Controls[0] as TSynMemo).Font.Size +1;
end;

procedure TfMain.MFontDownClick(Sender: TObject);
var i : integer;
begin
 for i:= 0 to PageControl.PageCount - 1 do
   (PageControl.Pages[i].Controls[0] as TSynMemo).Font.Size :=   (PageControl.Pages[i].Controls[0] as TSynMemo).Font.Size -1;

end;

procedure TfMain.SynMemoKeyPress(Sender: TObject; var Key: Char);
begin
  Modified := true;
end;




procedure TfMain.GenerateTranslation;
var F: TextFile;
    i : integer;
begin
  Exit; // Planning to do translation file, but finally gave up
  AssignFile(F, 'translation.txt');
  Rewrite(F);

  for i := 0 to Application.ComponentCount - 1 do
    ReviewComponent(Application.Components[i], F);



  CloseFile(F);


end;

procedure TfMain.ReviewComponent(AControl: TComponent; var F: TextFile);
var i : integer;
begin
  if AControl is TButton then WriteLn(F, (AControl as TButton).Name, '=' , (AControl as TButton).Caption) else
  if AControl is TLabel then WriteLn(F, (AControl as TLabel).Name, '=' , (AControl as TLabel).Caption) else
  if AControl is TMenuItem then WriteLn(F, (AControl as TMenuItem).Name, '=' , (AControl as TMenuItem).Caption) else
  if AControl is TPanel then  begin
   for i := 0 to (AControl as TPanel).ComponentCount - 1 do
    ReviewComponent((AControl as TPanel).Components[i], F);
  end else
  if AControl is TForm then  begin
   for i := 0 to (AControl as TForm).ComponentCount - 1 do
    ReviewComponent((AControl as TForm).Components[i], F);
  end else
  if AControl is TGroupBox then  begin
   for i := 0 to (AControl as TGroupBox).ComponentCount - 1 do
    ReviewComponent((AControl as TGroupBox).Components[i], F);
  end;
end;

end.
