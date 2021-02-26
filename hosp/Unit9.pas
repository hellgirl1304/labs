unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form9: TForm9;
  kid : string;

implementation
uses Unit8;
{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
With ADOQuery1 do
 begin
    SQL.Clear;
    SQL.Add('INSERT INTO department (Название) VALUES (:Название)');
    Parameters.ParamByName('Название').Value:= Trim(Edit1.Text);
    ExecSQL;
 end;
 With Form8.ADOQuery1 do
 begin
  SQL.Clear;
  SQL.Add('select * from department');
  Open;
 end;
 Close;
 button3.Visible := true;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  Form9.Close;
  Form8.Show;
  button1.Visible := true;
  button3.Visible := true;
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
kid := form8.DBGrid1.DataSource.DataSet.Fields[0].AsString;
With ADOQuery1 do
 begin
    SQL.Clear;
    SQL.Add('update department set Название = :Название where id = ' + kid);
    Parameters.ParamByName('Название').Value:= Trim(Edit1.Text);
    ExecSQL;
 end;
 With Form8.ADOQuery1 do
 begin
  SQL.Clear;
  SQL.Add('select * from department');
  Open;
 end;
 Close;
 button1.Visible := true;
end;

end.
