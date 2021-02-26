unit Unit13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm13 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
uses Unit8;
{$R *.dfm}

procedure TForm13.Button1Click(Sender: TObject);
begin
  button3.Visible := true;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  Form13.Close;
  Form8.Show;
  button1.Visible := true;
  button3.Visible := true;
end;

procedure TForm13.Button3Click(Sender: TObject);
begin
button1.Visible := true;
end;

end.
