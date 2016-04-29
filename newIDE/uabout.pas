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
    Label1: TStaticText;
    Label2: TStaticText;
    LabelWebsite: TStaticText;
    LabelDetails: TStaticText;
    LabelGithubSite: TStaticText;
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
  OpenURL(TStaticText(Sender).Caption);
end;

procedure TfAbout.LabelWebsiteClick(Sender: TObject);
begin
  OpenURL(TStaticText(Sender).Caption);
end;

end.

