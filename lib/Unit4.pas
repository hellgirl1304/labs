unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  kid, ch : string;

implementation
uses Unit15;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin

With ADOQuery1 do
 begin
    Parameters.Clear;
    SQL.Clear;
    SQL.Add('INSERT INTO book (�����, ��������, ������������, ���_�������, ����������_�������) VALUES (:�����, :��������, :������������, :���_�������, :����������_�������)');
    Parameters.ParamByName('�����').Value:= Trim(Edit1.Text);
    Parameters.ParamByName('��������').Value:= Trim(Edit2.Text);
    Parameters.ParamByName('������������').Value:= Trim(Edit3.Text);
    Parameters.ParamByName('���_�������').Value:= Trim(Edit4.Text);
    Parameters.ParamByName('����������_�������').Value:= Trim(Edit5.Text);
    ExecSQL;
 end;
 With Form1.ADOQuery3 do
 begin
  SQL.Clear;
  SQL.Add('select * from book');
  Open;
 end;
 With Form1.ADOQuery1 do
 begin
  SQL.Clear;
  SQL.Add('select book.��������, author.��� as �����, bookshelf.�������� as �����, ranking.���������� from ranking, book, bookshelf, author where book.����� = ranking.�����_����� and author.����� = ranking.�����_������ and bookshelf.���� = ranking.����_�����');
  Open;
 end;
 Close;
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  button3.Visible := true;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Form4.Close;
  //Hide;
  Form1.Show;
  button1.Visible := true;
  button3.Visible := true;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
kid := edit1.Text;
With ADOQuery1 do
 begin
    Parameters.Clear;
    SQL.Clear;
    SQL.Add('update book set ����� = :�����, �������� = :��������, ������������ = :������������, ���_������� = :���_�������, ����������_������� = :����������_������� where �����= '+kid);
    Parameters.ParamByName('�����').Value:= Trim(ch);
    Parameters.ParamByName('��������').Value:= Trim(Edit2.Text);
    Parameters.ParamByName('������������').Value:= Trim(Edit3.Text);
    Parameters.ParamByName('���_�������').Value:= Trim(Edit4.Text);
    Parameters.ParamByName('����������_�������').Value:= Trim(Edit5.Text);
    ExecSQL;
 end;
 With Form1.ADOQuery3 do
 begin
  SQL.Clear;
  SQL.Add('select * from book');
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

procedure TForm4.Edit1Change(Sender: TObject);
begin
 ch := edit1.Text;
end;

procedure TForm4.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in [#8,'0'..'9']) then Key := #0;
end;

procedure TForm4.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in [#8,'0'..'9']) then Key := #0;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
button1.Visible := true;
button3.Visible := true;
end;

end.
