unit UAbout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TfAbout }

  TfAbout = class(TForm)
    Image: TImage;
    Label1: TLabel;
    Label2: TLabel;
    LabelWebsite: TLabel;
    LabelDetails: TLabel;
    LabelGithubSite: TLabel;
    procedure ImageClick(Sender: TObject);
    procedure LabelGithubSiteClick(Sender: TObject);
    procedure LabelWebsiteClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fAbout: TfAbout;

implementation

uses lclintf;

{$R *.lfm}

{ TfAbout }

procedure TfAbout.ImageClick(Sender: TObject);
begin

end;

procedure TfAbout.LabelGithubSiteClick(Sender: TObject);
begin
  OpenURL(TLabel(Sender).Caption);
end;

procedure TfAbout.LabelWebsiteClick(Sender: TObject);
begin
  OpenURL(TLabel(Sender).Caption);
end;

end.

