unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  kid, ch : string;

implementation
uses Unit15;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin

//Edit1.Text := '';
//Edit2.Text := '';
With ADOQuery1 do
 begin
    Parameters.Clear;
    SQL.Clear;
    SQL.Add('INSERT INTO author (���, �����_����������) VALUES (:���, :�����_����������)');
    Parameters.ParamByName('���').Value:= Trim(Edit1.Text);
    Parameters.ParamByName('�����_����������').Value:= Trim(Edit2.Text);
    ExecSQL;
 end;
 With Form1.ADOQuery4 do
 begin
  SQL.Clear;
  SQL.Add('select * from author');
  Open;
 end;
 With Form1.ADOQuery1 do
 begin
  SQL.Clear;
  SQL.Add('select book.��������, author.��� as �����, bookshelf.�������� as �����, ranking.���������� from ranking, book, bookshelf, author where book.����� = ranking.�����_����� and author.����� = ranking.�����_������ and bookshelf.���� = ranking.����_�����');
  Open;
 end;
 Close;
edit1.Text := '';
edit2.Text := '';
  button3.Visible := true;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  Form5.Close;
  //Hide;
  Form1.Show;
  button1.Visible := true;
  button3.Visible := true;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
kid := Form1.DBGrid4.DataSource.DataSet.Fields[0].AsString;
With ADOQuery1 do
 begin
    Parameters.Clear;
    SQL.Clear;
    SQL.Add('update author set ��� = :���, �����_���������� = :�����_���������� where ����� = ' + kid);
    Parameters.ParamByName('���').Value:= Trim(Edit1.Text);
    Parameters.ParamByName('�����_����������').Value:= Trim(Edit2.Text);
    ExecSQL;
 end;
 With Form1.ADOQuery4 do
 begin
  SQL.Clear;
  SQL.Add('select * from author');
  Open;
 end;
 With Form1.ADOQuery1 do
 begin
  SQL.Clear;
  SQL.Add('select book.��������, author.��� as �����, bookshelf.�������� as �����, ranking.���������� from ranking, book, bookshelf, author where book.����� = ranking.�����_����� and author.����� = ranking.�����_������ and bookshelf.���� = ranking.����_�����');
  Open;
 end;
 Close;
  button1.Visible := true;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
button1.Visible := true;
button3.Visible := true;
end;

end.
