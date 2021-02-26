unit Unit12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Data.DB, Data.Win.ADODB;

type
  TForm12 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure DBLookupComboBox1Click(Sender: TObject);
    //procedure DBLookupComboBox2Click(Sender: TObject);
    //procedure DBLookupComboBox3Click(Sender: TObject);
    //procedure DBLookupComboBox4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    //procedure DateTimePicker1Change(Sender: TObject);
    //procedure DateTimePicker2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  fio, diag_1, diag_2, diag_3, date_1, date_2: string;

implementation
uses Unit8;
{$R *.dfm}

procedure TForm12.Button1Click(Sender: TObject);
begin
With ADOQuery3 do
 begin
    SQL.Clear;
    SQL.Add('INSERT INTO patient_card (���, �����������, �������, �������_1, �������_2, �������_3, �������) VALUES (:���, :�����������, :�������, :�������_1, :�������_2, :�������_3, :�������)');
    Parameters.ParamByName('���').Value:= dblookupcombobox1.keyvalue;
    Parameters.ParamByName('�����������').Value:= Trim(date_1);
    Parameters.ParamByName('�������').Value:= Trim(date_2);
    Parameters.ParamByName('�������_1').Value:= Trim(diag_1);
    Parameters.ParamByName('�������_2').Value:= Trim(diag_2);
    Parameters.ParamByName('�������_3').Value:= Trim(diag_3);
    Parameters.ParamByName('�������').Value:= Trim(Edit1.Text);
    ExecSQL;
 end;
 With Form8.ADOQuery2 do
 begin
  SQL.Clear;
  SQL.Add('select t1.fio as ���, t1.post as �����������, t1.vip as �������, t1.name_1 as �������_1, t1.name_2 as �������_2, d.�������� as �������_3 from select_2 t1, diagnosis d where t1.diagnoz=d.id;');
  Open;
 end;
 Close;
 button3.Visible := true;
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  Form12.Close;
  Form8.Show;
  button1.Visible := true;
  button3.Visible := true;
end;

procedure TForm12.Button3Click(Sender: TObject);
begin

button1.Visible := true;
end;

{procedure TForm12.DateTimePicker1Change(Sender: TObject);
begin
date_1:=DateToStr(DateTimePicker1.Date);
end;

procedure TForm12.DateTimePicker2Change(Sender: TObject);
begin
date_2:=DateToStr(DateTimePicker2.Date);
end;

procedure TForm12.DBLookupComboBox1Click(Sender: TObject);
begin
fio:= DBLookupComboBox1.Text;
end;

procedure TForm12.DBLookupComboBox2Click(Sender: TObject);
begin
diag_1:= DBLookupComboBox1.Text;
end;

procedure TForm12.DBLookupComboBox3Click(Sender: TObject);
begin
diag_2:= DBLookupComboBox1.Text;
end;

procedure TForm12.DBLookupComboBox4Click(Sender: TObject);
begin
diag_3:= DBLookupComboBox1.Text;
end; }

procedure TForm12.FormCreate(Sender: TObject);
begin
  ADOQuery1.Active := true;
  ADOQuery2.Active := true;
  button1.Visible := true;
  button3.Visible := true;
end;

end.
