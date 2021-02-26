unit Unit11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBCtrls;

type
  TForm11 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit4: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DBLookupComboBox2: TDBLookupComboBox;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure DBLookupComboBox1Click(Sender: TObject);
    //procedure DBLookupComboBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  dep, cham : string;

implementation
uses Unit8;
{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin
With ADOQuery3 do
 begin
    SQL.Clear;
    SQL.Add('INSERT INTO patient (ФИО, Отделение, Палата, Карта_больного) VALUES (:ФИО, :Отделение, :Палата, :Карта_больного)');
    Parameters.ParamByName('ФИО').Value:= Trim(Edit1.Text);
    Parameters.ParamByName('Отделение').Value:= dblookupcombobox1.keyvalue ;
    Parameters.ParamByName('Палата').Value:= dblookupcombobox2.keyvalue ;
    Parameters.ParamByName('Карта_больного').Value:= Trim(Edit4.Text);
    ExecSQL;
 end;
 With Form8.ADOQuery2 do
 begin
  SQL.Clear;
  SQL.Add('select patient.ФИО, department.Название as Отделение, patient.Палата, patient.Карта_больного from patient inner join department on department.id = patient.Отделение');
  Open;
 end;
 Close;
 button3.Visible := true;
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
  Form11.Close;
  Form8.Show;
  button1.Visible := true;
  button3.Visible := true;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
With ADOQuery3 do
 begin
    SQL.Clear;
    SQL.Add('update patient set ФИО = :ФИО, Отделение = :Отделение, Палата = :Палата, Карта_больного = :Карта_больного where id = id');
    Parameters.ParamByName('ФИО').Value:= Trim(Edit1.Text);
    Parameters.ParamByName('Отделение').Value:= dblookupcombobox1.keyvalue ;
    Parameters.ParamByName('Палата').Value:= dblookupcombobox2.keyvalue ;
    Parameters.ParamByName('Карта_больного').Value:= Trim(Edit4.Text);
    ExecSQL;
 end;
 With Form8.ADOQuery2 do
 begin
  SQL.Clear;
  SQL.Add('select patient.ФИО, department.Название as Отделение, patient.Палата, patient.Карта_больного from patient inner join department on department.id = patient.Отделение');
  Open;
 end;
 Close;
button1.Visible := true;
end;

{procedure TForm11.DBLookupComboBox1Click(Sender: TObject);
begin
dep:= DBLookupComboBox1.Text;
end;

procedure TForm11.DBLookupComboBox2Click(Sender: TObject);
begin
cham:= DBLookupComboBox1.Text;
end; }

procedure TForm11.FormCreate(Sender: TObject);
begin
  ADOQuery1.Active := true;
  ADOQuery2.Active := true;
end;

end.
