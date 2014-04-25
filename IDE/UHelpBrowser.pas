unit UHelpBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, Buttons, ExtCtrls;

type
  TfHelp = class(TForm)
    WebBrowser: TWebBrowser;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowHelp(Topic: String);

    { Public declarations }
  end;

var
  fHelp: TfHelp;

implementation

uses UMain;

{$R *.dfm}

{ TUHelp }

procedure TfHelp.ShowHelp(Topic: String);
begin
  if Topic = '' then WebBrowser.Navigate(HelpBasePath)
                else WebBrowser.Navigate(Topic);
end;

procedure TfHelp.SpeedButton1Click(Sender: TObject);
begin
try
 WebBrowser.GoBack;
except
end;
end;

procedure TfHelp.SpeedButton2Click(Sender: TObject);
begin
try
 WebBrowser.GoForward;
except
end;
end;

end.
