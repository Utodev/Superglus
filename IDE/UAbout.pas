unit UAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ShellApi;

type
  TfAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image: TImage;
    LabelURL: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure LabelURLClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbout: TfAbout;

implementation

{$R *.dfm}

procedure TfAbout.SpeedButton1Click(Sender: TObject);
begin
 Close();
end;

procedure TfAbout.LabelURLClick(Sender: TObject);
var s :ShortString;
begin
 S := LabelURL.Caption + #0;
 ShellExecute(Handle,'OPEN',@S[1],'','',SW_MAXIMIZE);
 Close();
end;

procedure TfAbout.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#27 then Close();
end;

end.
