unit UInifile;

interface

procedure LoadInifile();
procedure SaveInifile();

implementation

uses Inifiles, SysUtils, UMain, Forms, UOptions, StdCtrls;


procedure LoadInifile();
var Ini : TInifile;
    i : integer;
begin
 Ini := TIniFile.Create(ChangeFileExt(Application.Exename,'.ini'));
 try
   InterpreterString := Ini.ReadString('CONFIG','Interpreter','glulxe.exe');
   CompilerString := Ini.ReadString('CONFIG','Compiler','spg.exe');
   LibraryString := Ini.ReadString('CONFIG','Library','init.lib');
   AssemblerString := Ini.ReadString('CONFIG','Assembler','glulxa.exe');
   PreprocessorString := Ini.ReadString('CONFIG','Preprocessor','txtpaws.exe');
   HelpBasePath := Ini.ReadString('CONFIG','Help','http://www.caad.es/superglus/doku.php/');

   UsePreProcessor := Ini.ReadBool('CONFIG','UsePreprocessor',true);
   DelTempFiles := Ini.ReadBool('CONFIG','DelTempFiles',true);
   PackerString := Ini.ReadString('CONFIG','Packer','blc.exe');
   for i := 0 to 3 do
    RecentFiles[i] := Ini.ReadString('RecentFiles','File'+IntToStr(i),'');

   fOptions.EditCompiler.text:= CompilerString;
   fOptions.EditInterpreter.text:= InterpreterString;
   fOptions.EditLibrary.Text:= LibraryString;
   fOptions.EditPreprocesor.Text:= PreprocessorString;
   fOptions.EditAssembler.Text:= AssemblerString;
   fOptions.CheckPreprocessor.Checked:= UsePreProcessor;
   fOptions.EditPacker.Text := PackerString;
   fOptions.EdithelpBasePath.Text := HelpBasePath;

   fOptions.CheckDelTmpFiles.Checked := DelTempFiles;
   fOptions.CheckPreprocessor.Checked := UsePreProcessor;

   UOptions.optionsFont := fMain.Font;


 finally
  Ini.Free();
 end;
end;

procedure SaveInifile();
var Ini : TInifile;
    i : Integer;
begin
 Ini := TIniFile.Create(ChangeFileExt(Application.Exename,'.ini'));
 try
  CompilerString := fOptions.EditCompiler.text;
  InterpreterString := fOptions.EditInterpreter.text;
  LibraryString := fOptions.EditLibrary.Text;
  PreprocessorString := fOptions.EditPreprocesor.Text;
  AssemblerString := fOptions.EditAssembler.Text;
  UsePreProcessor := fOptions.CheckPreprocessor.Checked;
  DelTempFiles := fOptions.CheckDelTmpFiles.Checked;
  PackerString := fOptions.EditPacker.Text;
  HelpBasePath := fOptions.EdithelpBasePath.Text;

  Ini.WriteString('CONFIG','Interpreter',InterpreterString);
  Ini.WriteString('CONFIG','Compiler',CompilerString);
  Ini.WriteString('CONFIG','Library',LibraryString );
  Ini.WriteString('CONFIG','Assembler',AssemblerString);
  Ini.WriteString('CONFIG','Preprocessor',PreprocessorString);
  Ini.WriteBool('CONFIG','UsePreprocessor',UsePreProcessor);
  Ini.WriteBool('CONFIG','DelTempFiles',DelTempFiles);
  Ini.WriteString('CONFIG','Packer',PackerString);
  Ini.WriteString('CONFIG','Help',HelpBasePath);


  Ini.WriteString('EDITOR', 'FontName',UOptions.optionsFont.Name);
  Ini.WriteInteger('EDITOR', 'FontSize', UOptions.optionsFont.Size);



  for i := 0 to 3 do Ini.WriteString('RecentFiles','File'+IntToStr(i),RecentFiles[i]);

 finally
  Ini.Free();
 end;
end;


end.
