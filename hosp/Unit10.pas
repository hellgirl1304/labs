unit Unit10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBCtrls;

type
  TForm10 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    //procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  dep:string;

implementation
uses Unit8;
{$R *.dfm}

//add
procedure TForm10.Button1Click(Sender: TObject);
begin
  With ADOQuery2 do
 begin
    SQL.Clear;
    SQL.Add('INSERT INTO doctor (ФИО, Специальность, Отделение, Стаж) VALUES (:ФИО, :Специальность, :Отделение, :Стаж)');
    Parameters.ParamByName('ФИО').Value:= Trim(Edit1.Text);
    Parameters.ParamByName('Специальность').Value:= Trim(Edit2.Text);
    Parameters.ParamByName('Отделение').Value:= dblookupcombobox1.KeyValue;
    Parameters.ParamByName('Стаж').Value:= Trim(Edit4.Text);
    ExecSQL;
 end;
 With Form8.ADOQuery2 do
 begin
  SQL.Clear;
  SQL.Add('select doctor.ФИО, doctor.Специальность, department.Название as Отделение, doctor.Стаж from doctor inner join department on department.id = doctor.Отделение');
  Open;
 end;
 Close;
 button3.Visible := true;
end;

//cancle
procedure TForm10.Button2Click(Sender: TObject);
begin
  Form10.Close;
  Form8.Show;
  button1.Visible := true;
  button3.Visible := true;
end;

//edit
procedure TForm10.Button3Click(Sender: TObject);
begin
With ADOQuery2 do
 begin
    SQL.Clear;
    SQL.Add('update doctor set ФИО = :ФИО, Специальность = :Специальность, Отделение = :Отделение, Стаж = :Стаж where id = id');
    Parameters.ParamByName('ФИО').Value:= Trim(Edit1.Text);
    Parameters.ParamByName('Специальность').Value:= Trim(Edit2.Text);
    Parameters.ParamByName('Отделение').Value:= dblookupcombobox1.KeyValue;
    Parameters.ParamByName('Стаж').Value:= Trim(Edit4.Text);
    ExecSQL;
 end;
 With Form8.ADOQuery2 do
 begin
  SQL.Clear;
  SQL.Add('select doctor.ФИО, doctor.Специальность, department.Название as Отделение, doctor.Стаж from doctor inner join department on department.id = doctor.Отделение');
  Open;
 end;
 Close;
 button1.Visible := true;
end;

{procedure TForm10.DBLookupComboBox1Click(Sender: TObject);
begin
 dep:= DBLookupComboBox1.Text;
end;}

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Form8.Show;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  ADOQuery1.Active := false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select * from department');
  ADOQuery1.Active := true;

end;

end.
