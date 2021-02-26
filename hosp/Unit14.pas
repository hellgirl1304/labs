unit Unit14;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB;

type
  TForm14 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;
  dep: string;

implementation
uses Unit8;
{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
  button3.Visible := true;
end;

procedure TForm14.Button2Click(Sender: TObject);
begin
  Form14.Close;
  Form8.Show;
  button1.Visible := true;
  button3.Visible := true;
end;


procedure TForm14.Button3Click(Sender: TObject);
begin
button1.Visible := true;
end;

{procedure TForm14.DBLookupComboBox1Click(Sender: TObject);
begin
  dep:= DBLookupComboBox1.Text;
end; }

procedure TForm14.FormCreate(Sender: TObject);
begin
  ADOQuery1.Active := true;
end;

end.
