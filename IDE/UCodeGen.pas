unit UCodeGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, ToolWin, Buttons, SynEdit,
  SynMemo;

type
  TfCodeGen = class(TForm)
    PageControl: TPageControl;
    TabSheetConditions: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Verb: TEdit;
    Label2: TLabel;
    Noun: TEdit;
    PrepositionCheck: TCheckBox;
    Preposition: TEdit;
    AdverbCheck: TCheckBox;
    Adverb: TEdit;
    Noun2Check: TCheckBox;
    Noun2: TEdit;
    GroupBox2: TGroupBox;
    LocationCheck: TCheckBox;
    Location: TEdit;
    Label3: TLabel;
    ObjConditions: TGroupBox;
    GroupBox4: TGroupBox;
    Panel1: TPanel;
    ObjConCheck1: TCheckBox;
    ObjConObj1: TEdit;
    ObjConCondition1: TComboBox;
    ObjConLocation1: TEdit;
    ObjConFaliure1: TEdit;
    label89: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    ObjConCheck2: TCheckBox;
    ObjConObj2: TEdit;
    ObjConCondition2: TComboBox;
    ObjConLocation2: TEdit;
    ObjConFaliure2: TEdit;
    Panel3: TPanel;
    Label6: TLabel;
    ObjConCheck3: TCheckBox;
    ObjConObj3: TEdit;
    ObjConCondition3: TComboBox;
    ObjConLocation3: TEdit;
    ObjConFaliure3: TEdit;
    Panel4: TPanel;
    FlagConCheck1: TCheckBox;
    FlagConFlag1: TEdit;
    FlagConRelation1: TComboBox;
    FlagConValue1: TEdit;
    Label7: TLabel;
    FlagConFaliure1: TEdit;
    Panel5: TPanel;
    Label8: TLabel;
    FlagConCheck2: TCheckBox;
    FlagConFlag2: TEdit;
    FlagConRelation2: TComboBox;
    FlagConValue2: TEdit;
    FlagConFaliure2: TEdit;
    Panel6: TPanel;
    Label9: TLabel;
    FlagConCheck3: TCheckBox;
    FlagConFlag3: TEdit;
    FlagConRelation3: TComboBox;
    FlagConValue3: TEdit;
    FlagConFaliure3: TEdit;
    TabSheetActions: TTabSheet;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Panel8: TPanel;
    AcObjCheck2: TCheckBox;
    AcObj2: TEdit;
    Panel7: TPanel;
    AcObjAppear2: TRadioButton;
    AcObjDisappear2: TRadioButton;
    AcObjAppearAT2: TRadioButton;
    AcObjAppearATLoc2: TEdit;
    Panel9: TPanel;
    AcObjCheck3: TCheckBox;
    AcObj3: TEdit;
    Panel10: TPanel;
    AcObjAppear3: TRadioButton;
    AcObjDisappear3: TRadioButton;
    AcObjAppearAT3: TRadioButton;
    AcObjAppearATLoc3: TEdit;
    Panel11: TPanel;
    AcObjCheck1: TCheckBox;
    AcObj1: TEdit;
    Panel12: TPanel;
    AcObjAppear1: TRadioButton;
    AcObjDisappear1: TRadioButton;
    AcObjAppearAT1: TRadioButton;
    AcObjAppearATLoc1: TEdit;
    Panel13: TPanel;
    AcFlgCheck1: TCheckBox;
    AcFlgNum1: TEdit;
    AcFlgAction1: TComboBox;
    AcFlgValue1: TEdit;
    Panel14: TPanel;
    AcFlgCheck2: TCheckBox;
    AcFlgNum2: TEdit;
    AcFlgAction2: TComboBox;
    AcFlgValue2: TEdit;
    Panel15: TPanel;
    AcFlgCheck3: TCheckBox;
    AcFlgNum3: TEdit;
    AcFlgAction3: TComboBox;
    AcFlgValue3: TEdit;
    Panel16: TPanel;
    AcFlgCheck4: TCheckBox;
    AcFlgNum4: TEdit;
    AcFlgAction4: TComboBox;
    AcFlgValue4: TEdit;
    Panel17: TPanel;
    AcConCheck1: TCheckBox;
    AcConCon1: TEdit;
    AcConAction1: TComboBox;
    AcConLoc1: TEdit;
    Panel18: TPanel;
    AcConCheck2: TCheckBox;
    AcConCon2: TEdit;
    AcConAction2: TComboBox;
    AcConLoc2: TEdit;
    Panel19: TPanel;
    AcConCheck3: TCheckBox;
    AcConCon3: TEdit;
    AcConAction3: TComboBox;
    AcConLoc3: TEdit;
    Panel20: TPanel;
    AcConCheck4: TCheckBox;
    AcConCon4: TEdit;
    AcConAction4: TComboBox;
    AcConLoc4: TEdit;
    TabSheetGenCode: TTabSheet;
    ButtonClean: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    GroupBox3: TGroupBox;
    CheckAdditionalWords: TCheckBox;
    CheckFlagConFirst: TCheckBox;
    GroupBox8: TGroupBox;
    Label10: TLabel;
    PuzzleTitle: TEdit;
    Label4: TLabel;
    TextOnSuccess: TEdit;
    TextOnFaliureLoc: TEdit;
    Label11: TLabel;
    ToolBar: TToolBar;
    ButtonOpenPuzzle: TSpeedButton;
    ButtonSavePuzzle: TSpeedButton;
    ButtonGenerateCode: TSpeedButton;
    CodeMemo: TSynMemo;
    procedure SetEditBox(Name: String; Text : String);
    procedure SetEditBoxVisible(Name: String; Text : String);
    procedure SetComboBox(Name: String; Text : String);
    procedure SetRadioButton(Name: String; Checked : Boolean);
    procedure SetCheckBox(Name: String; Checked : Boolean);
    procedure ConCheckClick(Sender: TObject);
    procedure ConRadioClick(Sender: TObject; value : boolean);

    procedure CodeGen();
    procedure CodeGenSuccess();
    procedure CodeGenFaliureOnObjects();
    procedure CodeGenFaliureOnFlags();
    procedure CodeGenFailureOnLocation();

    procedure ObjConCondition1Change(Sender: TObject);
    procedure AcConAction1Change(Sender: TObject);
    procedure AcObjAppearAT(Sender: TObject);
    procedure ButtonClipBoardClick(Sender: TObject);
    procedure ButtonCleanClick(Sender: TObject);
    procedure ButtonSavePuzzleClick(Sender: TObject);
    procedure ButtonOpenPuzzleClick(Sender: TObject);
    procedure ButtonGenerateCodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCodeGen: TfCodeGen;

implementation

uses inifiles, UMain;


{$R *.dfm}

procedure TfCodeGen.ConCheckClick(Sender: TObject);
var i : integer;

begin
  for i := 0 to (Sender as TCheckBox).Parent.ControlCount - 1 do
    begin
      if   (Sender as TCheckbox).Parent.Controls[i] is TEdit then ((Sender as TCheckbox).Parent.Controls[i] as TEdit).Enabled := (Sender as TCheckBox).Checked;
      if   (Sender as TCheckbox).Parent.Controls[i] is TComboBox then begin
                                                                        ((Sender as TCheckbox).Parent.Controls[i] as TComboBox).Enabled := (Sender as TCheckBox).Checked;
                                                                        if ((Sender as TCheckbox).Parent.Controls[i] as TComboBox).ItemIndex < 0 then ((Sender as TCheckbox).Parent.Controls[i] as TComboBox).ItemIndex := 0;
                                                                      end;
      if   (Sender as TCheckbox).Parent.Controls[i] is TRadioButton then ((Sender as TCheckbox).Parent.Controls[i] as TRadioButton).Enabled := (Sender as TCheckbox).Checked;
      if (Sender as TCheckbox).Parent.Controls[i] is TPanel then
       ConRadioClick(((Sender as TCheckbox).Parent.Controls[i] as TPanel).Controls[0], (Sender as TCheckbox).Checked);
    end;
end;

procedure TfCodeGen.ConRadioClick(Sender: TObject; value : boolean);
var i : integer;

begin
  for i := 0 to (Sender as TWinControl).Parent.ControlCount - 1 do
    begin
      if   (Sender as TWinControl).Parent.Controls[i] is TEdit then ((Sender as TWinControl).Parent.Controls[i] as TEdit).Enabled := Value;
      if   (Sender as TWinControl).Parent.Controls[i] is TComboBox then begin
                                                                        ((Sender as TWinControl).Parent.Controls[i] as TComboBox).Enabled := Value;
                                                                        ((Sender as TWinControl).Parent.Controls[i] as TComboBox).ItemIndex := 0;
                                                                      end;
      if   (Sender as TWinControl).Parent.Controls[i] is TRadioButton then ((Sender as TWinControl).Parent.Controls[i] as TRadioButton).Enabled := Value;
    end;
end;


procedure TfCodeGen.ObjConCondition1Change(Sender: TObject);
var EditLocation : TControl;
    SenderName : String;
    LocationEDitName: String;
begin
 SenderName := (Sender as TComboBox).Name;
 LocationEDitName := 'ObjConlocation' + Copy(Sendername,Length(SenderName),1);
 EditLocation := (Sender as TComboBox).Parent.FindChildControl(LocationEDitName);
 (Editlocation as TEdit).Visible := (Sender as TCombobox).ItemIndex = 5 ;

end;

procedure TfCodeGen.AcConAction1Change(Sender: TObject);
var EditLocation : TControl;
    SenderName : String;
    LocationEDitName: String;
begin
 SenderName := (Sender as TComboBox).Name;
 LocationEDitName := 'AcConLoc' + Copy(Sendername,Length(SenderName),1);
 EditLocation := (Sender as TComboBox).Parent.FindChildControl(LocationEDitName);
 (Editlocation as TEdit).Visible := (Sender as TCombobox).ItemIndex = 1;
end;

procedure TfCodeGen.AcObjAppearAT(Sender: TObject);
var EditLocation : TControl;
    SenderName : String;
    LocationEDitName: String;
    CheckedSourcename: String;
begin
 SenderName := (Sender as TRadioButton).Name;
 LocationEDitName := 'AcObjAppearATLoc' + Copy(Sendername,Length(SenderName),1);
 CheckedSourcename := 'AcObjAppearAT' + Copy(Sendername,Length(SenderName),1);
 EditLocation := (Sender as TRadioButton).Parent.FindChildControl(LocationEDitName);
 (Editlocation as TEdit).Visible := ((Sender as TRadioButton).Parent.FindChildControl(CheckedSourcename) as TRadioButton).Checked ;
end;

procedure TfCodeGen.SetEditBox(Name: String; Text : String);
var c: integer;
begin
 for c := 0 to fCodeGen.ComponentCount - 1 do
  if (fCodeGen.Components[c] is TEdit) and ((fCodeGen.Components[c] as TEdit).Name = name) then
   (fCodeGen.Components[c] as TEdit).Text := Text;
end;

procedure TfCodeGen.SetEditBoxVisible(Name: String; Text : String);
var c: integer;
begin
 for c := 0 to fCodeGen.ComponentCount - 1 do
  if (fCodeGen.Components[c] is TEdit) and ((fCodeGen.Components[c] as TEdit).Name = name) then
   (fCodeGen.Components[c] as TEdit).Visible := (Text='1');
end;


procedure TfCodeGen.SetComboBox(Name: String; Text : String);
var c: integer;
begin
 for c := 0 to fCodeGen.ComponentCount - 1 do
  if (fCodeGen.Components[c] is TComboBox) and ((fCodeGen.Components[c] as TComboBox).Name = name) then
   (fCodeGen.Components[c] as TComboBox).itemindex := StrToint(Text);

end;


procedure TfCodeGen.SetCheckBox(Name: String; Checked : Boolean);
var c: integer;
begin
 for c := 0 to fCodeGen.ComponentCount - 1 do
  if (fCodeGen.Components[c] is TCheckBox) and ((fCodeGen.Components[c] as TCheckBox).Name = name) then
   (fCodeGen.Components[c] as TCheckBox).Checked := Checked;

end;

procedure TfCodeGen.SetRadioButton(Name: String; Checked : Boolean);
var c: integer;
begin
 for c := 0 to fCodeGen.ComponentCount - 1 do
  if (fCodeGen.Components[c] is TRadioButton) and ((fCodeGen.Components[c] as TRadioButton).Name = name) then
   (fCodeGen.Components[c] as TRadioButton).Checked := Checked;

end;


procedure TfCodeGen.ButtonClipBoardClick(Sender: TObject);
begin
 CodeMemo.SelectAll();
 CodeMemo.CopyToClipboard();
 CodeMemo.SelLength := 0;
 ShowMessage('Código copiado al portapapeles.');
end;

procedure TfCodeGen.ButtonCleanClick(Sender: TObject);
begin
 CodeMemo.Clear();
end;

procedure TfCodeGen.CodeGen();
begin

 with CodeMemo.Lines do
 begin

  Add(';****************************************************');
  Add(';Puzzle: ' + PuzzleTitle.Text);
  Add(';Generado automáticamente por Superglús IDE');
  Add(';****************************************************');

  CodeGenFailureOnLocation();

  if CheckFlagConFirst.Checked then begin
                                     CodeGenFaliureOnFlags();
                                     CodeGenFaliureOnObjects();
                                    end
                               else begin
                                     CodeGenFaliureOnObjects();
                                     CodeGenFaliureOnFlags();
                                    end;

  CodeGenSuccess();

  Add(';****************************************************');
 end;
end;


procedure TfCodeGen.CodeGenSuccess();
var i : char;
begin
 with CodeMemo.Lines do
 begin
  Add(Verb.Text + ' ' + Noun.Text + '; Solución del puzzle');
  if PrepositionCheck.Checked then Add(' PREP ' + Preposition.Text);
  if AdverbCheck.Checked then Add(' ADVERB ' + Adverb.Text);
  if Noun2Check.Checked then Add(' NOUN2 ' + Noun2.Text);

  if LocationCheck.Checked then Add(' AT ' + Location.Text);

  // Condiciones de flag
  for i := '1' to '3' do
   if (fCodeGen.FindComponent('FlagConCheck'+i) as TCheckBox).Checked then
    case (fCodeGen.FindComponent('FlagConRelation'+i) as TCombobox).ItemIndex of
      0: Add(' EQ ' + (fCodeGen.FindComponent('FlagConFlag'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('FlagConValue'+i) as TEdit).Text);
      1: Add(' NOTEQ ' + (fCodeGen.FindComponent('FlagConFlag'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('FlagConValue'+i) as TEdit).Text);
      2: Add(' GT ' + (fCodeGen.FindComponent('FlagConFlag'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('FlagConValue'+i) as TEdit).Text);
      3: Add(' LT ' + (fCodeGen.FindComponent('FlagConFlag'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('FlagConValue'+i) as TEdit).Text);
    end; {case}

  // Condiciones de objeto
  for i := '1' to '3' do
   if (fCodeGen.FindComponent('ObjConCheck'+i) as TCheckBox).Checked then
    case (fCodeGen.FindComponent('ObjConCondition'+i) as TCombobox).ItemIndex of
          0: Add(' CARRIED ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text);
          1: Add(' WORN ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text);
          2: Add(' PRESENT ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text);
          3: Add(' ABSENT ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text);
          4: Add(' ISAT ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text + ' ''@38' );
          5: Add(' ISAT ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('ObjConLocation'+i) as TEdit).Text);
    end; {case}

  // Acciones de objeto

  for i := '1' to '3' do
   if (fCodeGen.FindComponent('AcObjCheck'+i) as TCheckBox).Checked then
   begin
    if (fCodeGen.FindComponent('AcObjDisappear'+i) as TRadioButton).Checked then Add(' DESTROY ' + (fCodeGen.FindComponent('AcObj'+i) as TEdit).Text);
    if (fCodeGen.FindComponent('AcObjAppear'+i) as TRadioButton).Checked then Add(' CREATE ' + (fCodeGen.FindComponent('AcObj'+i) as TEdit).Text);
    if (fCodeGen.FindComponent('AcObjAppearAT'+i) as TRadioButton).Checked then Add(' PLACE ' + (fCodeGen.FindComponent('AcObj'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('AcObjAppearATLoc'+i) as TEdit).Text);
   end;

  // Acciones de flags
  for i := '1' to '4' do
   if (fCodeGen.FindComponent('AcFlgCheck'+i) as TCheckBox).Checked then
    case (fCodeGen.FindComponent('AcFlgAction'+i) as TCombobox).ItemIndex of
     0: Add(' PLUS ' + (fCodeGen.FindComponent('AcFlgNum'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('AcFlgValue'+i) as TEdit).Text);
     1: Add(' MINUS ' + (fCodeGen.FindComponent('AcFlgNum'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('AcFlgValue'+i) as TEdit).Text);
     2: Add(' LET ' + (fCodeGen.FindComponent('AcFlgNum'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('AcFlgValue'+i) as TEdit).Text);
    end; {case}

  // Acciones de conexiones
  for i := '1' to '4' do
   if (fCodeGen.FindComponent('AcConCheck'+i) as TCheckBox).Checked then
    case (fCodeGen.FindComponent('AcConAction'+i) as TCombobox).ItemIndex of
     0: Add(' SETEXIT _voc_' + AnsiUppercase((fCodeGen.FindComponent('AcConCon'+i) as TEdit).Text) + ' 0');
     1: Add(' SETEXIT _voc_' + AnsiUppercase((fCodeGen.FindComponent('AcConCon'+i) as TEdit).Text) + ' ' + (fCodeGen.FindComponent('AcConLoc'+i) as TEdit).Text);
    end; {case}

  //El texto
  Add(' WRITELN "' + TextOnSuccess.Text + '"');
  Add(' DONE');
  Add('');
 end;
end;

procedure TfCodeGen.CodeGenFaliureOnObjects();
var i : char;
begin
 with CodeMemo.Lines do
   for i:= '1' to '3' do
   if (fCodeGen.FindComponent('ObjConCheck'+i) as TCheckBox).Checked then
     begin
      Add(Verb.Text + ' ' + Noun.Text);
      if CheckAdditionalWords.Checked then if PrepositionCheck.Checked then Add(' PREP ' + Preposition.Text);
      if CheckAdditionalWords.Checked then if AdverbCheck.Checked then Add(' ADVERB ' + Adverb.Text);
      if CheckAdditionalWords.Checked then if Noun2Check.Checked then Add(' NOUN2 ' + Noun2.Text);
      if LocationCheck.Checked then Add(' AT ' + Location.Text);
      case (fCodeGen.FindComponent('ObjConCondition'+i) as TCombobox).ItemIndex of
          0: Add(' NOTCARR ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text);
          1: Add(' NOTWORN ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text);
          2: Add(' ABSENT ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text);
          3: Add(' PRESENT ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text);
          4: Add(' ISNOTAT ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text + ' ''@38' );
          5: Add(' ISNOTAT ' + (fCodeGen.FindComponent('ObjConObj'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('ObjConLocation'+i) as TEdit).Text);
      end; {case}
      Add(' WRITE "' + (fCodeGen.FindComponent('ObjConFaliure'+i) as Tedit).Text + '"');
      Add(' DONE');
      Add('');
    end;

end;

procedure TfCodeGen.CodeGenFaliureOnFlags();
var i : char;
begin
 with CodeMemo.Lines do
   for i:= '1' to '3' do
   if (fCodeGen.FindComponent('FlagConCheck'+i) as TCheckBox).Checked then
     begin
      Add(Verb.Text + ' ' + Noun.Text);
      if CheckAdditionalWords.Checked then if PrepositionCheck.Checked then Add(' PREP ' + Preposition.Text);
      if CheckAdditionalWords.Checked then if AdverbCheck.Checked then Add(' ADVERB ' + Adverb.Text);
      if CheckAdditionalWords.Checked then if Noun2Check.Checked then Add(' NOUN2 ' + Noun2.Text);
      if LocationCheck.Checked then Add(' AT ' + Location.Text);
      case (fCodeGen.FindComponent('FlagConRelation'+i) as TCombobox).ItemIndex of
      0: Add(' NOTEQ ' + (fCodeGen.FindComponent('FlagConFlag'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('FlagConValue'+i) as TEdit).Text);
      1: Add(' EQ ' + (fCodeGen.FindComponent('FlagConFlag'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('FlagConValue'+i) as TEdit).Text);
      2: Add(' LE ' + (fCodeGen.FindComponent('FlagConFlag'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('FlagConValue'+i) as TEdit).Text);
      3: Add(' GE ' + (fCodeGen.FindComponent('FlagConFlag'+i) as TEdit).Text + ' ' + (fCodeGen.FindComponent('FlagConValue'+i) as TEdit).Text);
      end; {case}
      Add(' WRITE "' + (fCodeGen.FindComponent('FlagConFaliure'+i) as Tedit).Text + '"');
      Add(' DONE');
      Add('');
    end;
end;


procedure TfCodeGen.CodeGenFailureOnLocation();
begin
if LocationCheck.Checked then
with CodeMemo.Lines do
 begin
  Add(Verb.Text + ' ' + Noun.Text);
  if CheckAdditionalWords.Checked then if PrepositionCheck.Checked then Add(' PREP ' + Preposition.Text);
  if CheckAdditionalWords.Checked then if AdverbCheck.Checked then Add(' ADVERB ' + Adverb.Text);
  if CheckAdditionalWords.Checked then if Noun2Check.Checked then Add(' NOUN2 ' + Noun2.Text);
  if LocationCheck.Checked then Add(' NOTAT ' + Location.Text);
  Add(' WRITE "' + TextOnFaliureLoc.Text + '"');
  Add(' DONE');
  Add('');
 end;
end;

procedure TfCodeGen.ButtonSavePuzzleClick(Sender: TObject);
var I:TInifile;
    c : integer;
begin
 if not SaveDialog.Execute then Exit;
 I := TInifile.Create(SaveDialog.FileName);

 try
  for c := 0 to fCodeGen.ComponentCount -1 do
   if (fCodeGen.Components[c] is TEdit) then begin
                                           I.WriteString('EditBoxes',(fCodeGen.Components[c] as TEdit).Name,(fCodeGen.Components[c] as TEdit).Text);
                                           I.WriteBool('EditBoxesVisible',(fCodeGen.Components[c] as TEdit).Name,(fCodeGen.Components[c] as TEdit).Visible);
                                          end else
    if (fCodeGen.Components[c] is TCheckBox) then I.WriteBool('CheckBoxes',(fCodeGen.Components[c] as TCheckBox).Name,(fCodeGen.Components[c] as TCheckBox).Checked) else
     if (fCodeGen.Components[c] is TRadioButton) then I.WriteBool('RadioButtons',(fCodeGen.Components[c] as TRadioButton).Name,(fCodeGen.Components[c] as TRadioButton).Checked) else
      if (fCodeGen.Components[c] is TComboBox) then I.WriteInteger('ComboBoxes',(fCodeGen.Components[c] as TCombobox).Name,(fCodeGen.Components[c] as TCombobox).ItemIndex);

 finally
  I.Free();
 end;
end;

procedure TfCodeGen.ButtonOpenPuzzleClick(Sender: TObject);
var i : TInifile;
    SL: TStringList;
    c : integer;
begin
 if not OpenDialog.Execute then Exit;

 SaveDialog.Filename := OpenDialog.Filename;



 I := TInifile.Create(OpenDialog.Filename);
 SL := TStringList.Create();

 try
   I.ReadSectionValues('EditBoxes', SL);
   for c:= 0 to SL.Count - 1 do
    SetEditBox(Sl.Names[c],
    Sl.Values[Sl.Names[c]]);

   I.ReadSectionValues('EditBoxesVisible', SL);
   for c:= 0 to SL.Count - 1 do
    SetEditBoxVisible(Sl.Names[c],
    Sl.Values[Sl.Names[c]]);


   I.ReadSectionValues('CheckBoxes', SL);
   for c:= 0 to SL.Count - 1 do
    SetCheckBox(Sl.Names[c],Sl.Values[Sl.Names[c]] = '1');

   I.ReadSectionValues('RadioButtons', SL);
   for c:= 0 to SL.Count - 1 do
    SetRadioButton(Sl.Names[c],Sl.Values[Sl.Names[c]] = '1');

   I.ReadSectionValues('ComboBoxes', SL);
   for c:= 0 to SL.Count - 1 do
    SetComboBox(Sl.Names[c],Sl.Values[Sl.Names[c]]);


  finally
   SL.free();
   I.Free();
  end;
end;

procedure TfCodeGen.ButtonGenerateCodeClick(Sender: TObject);
var i : char;
begin

// Controles iniciales de conformidad del formulario



 if PuzzleTitle.Text = '' then
   begin
     raise Exception.Create('Es necesario un título de puzzle.');
     Exit
   end;

 if LocationCheck.Checked then if TextOnFaliureLoc.Text='' then
   begin
     raise Exception.Create('Es necesario un texto a mostrar cuando la localidad no concuerde.');
     Exit
   end;

 if TextOnSuccess.Text = '' then
   begin
     raise Exception.Create('Es necesario un texto a mostrar cuando haya éxito.');
     Exit
   end;

 if Verb.Text = '' then
   begin
     raise Exception.Create('Es necesario un verbo.');
     Exit
   end;

 if Noun.Text = '' then
   begin
     raise Exception.Create('Es necesario un nombre.');
     Exit
   end;

// Control de conformidad de las condiciones basadas en objetos

  for i := '1' to '3' do
    begin
     if ((fCodeGen.FindComponent('ObjConCheck' + i) as TCheckBox).Checked) and (((fCodeGen.FindComponent('ObjConObj' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª condicion de objeto incompletos. Falta nombre de objeto.');
         Exit
       end;

     if ((fCodeGen.FindComponent('ObjConCheck' + i) as TCheckBox).Checked) and (((fCodeGen.FindComponent('ObjConFaliure' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª condicion de objeto incompletos. Falta texto en caso de fallo.');
         Exit
       end;

     if ((fCodeGen.FindComponent('ObjConCheck' + i) as TCheckBox).Checked) and (((fCodeGen.FindComponent('ObjConLocation' + i) as TEdit).Text = '')) and (((fCodeGen.FindComponent('ObjConLocation' + i) as TEdit).Visible))then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª condicion de objeto incompletos. Falta localidad.');
         Exit
       end;
    end; {for}

// Control de conformidad de las condiciones basadas en flags

  for i := '1' to '3' do
    begin
     if ((fCodeGen.FindComponent('FlagConCheck' + i) as TCheckBox).Checked) and (((fCodeGen.FindComponent('FlagConFlag' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª condicion de flag incompletos. Falta flag.');
         Exit
       end;

     if ((fCodeGen.FindComponent('FlagConCheck' + i) as TCheckBox).Checked) and (((fCodeGen.FindComponent('FlagConValue' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª condicion de flag incompletos. Falta valor.');
         Exit
       end;

     if ((fCodeGen.FindComponent('FlagConCheck' + i) as TCheckBox).Checked) and (((fCodeGen.FindComponent('FlagConFaliure' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª condicion de flag incompletos. Falta texto en caso de fallo.');
         Exit
       end;

    end; {for}

// Control de conformidad de la localidad

 if LocationCheck.Checked and (Location.Text = '') then
   begin
    raise Exception.Create('Si el puzzle esta ligado a localidad debe especificar una localidad.');
    Exit;
   end;

 if PrepositionCheck.Checked and (Preposition.Text = '') then
   begin
    raise Exception.Create('Falta preposición.');
    Exit;
   end;

 if AdverbCheck.Checked and (Adverb.Text = '') then
   begin
    raise Exception.Create('Falta adverbio.');
    Exit;
   end;

 if Noun2Check.Checked and (Noun2.Text = '') then
   begin
    raise Exception.Create('Falta segundo nombre.');
    Exit;
   end;

  // Chequeo de las acciones de objeto

  for i := '1' to '3' do
  begin

     if ((fCodeGen.FindComponent('AcObjCheck' + i) as TCheckBox).Checked) and (((fCodeGen.FindComponent('AcObj' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª accion de objeto incompletos. Falta objeto.');
         Exit
       end;

     if (
     (fCodeGen.FindComponent('AcObjCheck' + i) as TCheckBox).Checked) and
      ((fCodeGen.FindComponent('AcObj' + i) as TEdit).Text = '') and
      ((fCodeGen.FindComponent('AcObjDissapear' + i) as TRadioButton).Checked = false) and
      ((fCodeGen.FindComponent('AcObjAppear' + i) as TCheckBox).Checked = false) and
      ((fCodeGen.FindComponent('AcObjAppearAT' + i) as TCheckBox).Checked = false) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª acción de objeto incompletos. Falta acción.');
         Exit
       end;

      if (
     ((fCodeGen.FindComponent('AcObjCheck' + i) as TCheckBox).Checked) and
     ((fCodeGen.FindComponent('AcObjAppearAT' + i) as TRadioButton).Checked) and
     ((fCodeGen.FindComponent('AcObjAppearATLoc' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª acción de objeto incompletos. Falta localidad.');
         Exit
       end;
  end; {for}

// Acciones de flags
  for i := '1' to '4' do
  begin

    if (
     ((fCodeGen.FindComponent('AcFlgCheck' + i) as TCheckBox).Checked) and
     ((fCodeGen.FindComponent('AcFlgNum' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª acción de flag incompletos. Falta número de flag.');
         Exit
       end;

    if (
     ((fCodeGen.FindComponent('AcFlgCheck' + i) as TCheckBox).Checked) and
     ((fCodeGen.FindComponent('AcFlgValue' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª acción de flag incompletos. Falta valor.');
         Exit
       end;
  end; {for}

// Acciones de salidas
  for i := '1' to '4' do
  begin

    if (
     ((fCodeGen.FindComponent('AcConCheck' + i) as TCheckBox).Checked) and
     ((fCodeGen.FindComponent('AcConCon' + i) as TEdit).Text = '')) then
       begin
         raise Exception.Create('Datos de la ' + i + 'ª acción de conexiones incompletos. Falta direccion de conexión.');
         Exit
       end;

    if (
     ((fCodeGen.FindComponent('AcConCheck' + i) as TCheckBox).Checked) and
     ((fCodeGen.FindComponent('AcConLoc' + i) as TEdit).Text = '') and
     ((fCodeGen.FindComponent('AcConAction' + i) as TComboBox).ItemIndex = 1)) then
        begin
         raise Exception.Create('Datos de la ' + i + 'ª acción de flag incompletos. Falta localidad de destino.');
         Exit
       end;
  end; {for}



 CodeMemo.Clear();
 CodeGen();
 try
   PageControl.ActivePageIndex := 2;
  except
   on E:Exception do raise Exception.Create(E.Message);
  end;
end;

end.

