unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Unit9, Unit10, Unit11, Unit12, Unit13,
  Unit14, Vcl.StdCtrls;

type
  TForm8 = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet1: TTabSheet;
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    ADOQuery6: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DBGrid6: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

//add pat_card
procedure TForm8.Button10Click(Sender: TObject);
begin
  Form12.Show;
  Form12.Button3.Visible := false;
end;

//edit pat_card
procedure TForm8.Button12Click(Sender: TObject);
begin
  Form12.Show;
  Form12.Button1.Visible := false;
  Form12.DBLookupComboBox1.KeyValue := DBGrid4.DataSource.DataSet.Fields[0].AsString;
  Form12.DateTimePicker1.DateTime := DBGrid4.DataSource.DataSet.Fields[1].AsDateTime;
  Form12.DateTimePicker2.DateTime := DBGrid4.DataSource.DataSet.Fields[2].AsDateTime;
  Form12.DBLookupComboBox1.KeyValue := DBGrid4.DataSource.DataSet.Fields[3].AsString;
  Form12.DBLookupComboBox2.KeyValue := DBGrid4.DataSource.DataSet.Fields[4].AsString;
  Form12.DBLookupComboBox3.KeyValue := DBGrid4.DataSource.DataSet.Fields[5].AsString;
  Form12.Edit1.Text := DBGrid4.DataSource.DataSet.Fields[6].AsString;
end;

//ass diagnosis
procedure TForm8.Button13Click(Sender: TObject);
begin
  Form13.Show;
  Form13.Button3.Visible := false;
end;

//edit diagnosis
procedure TForm8.Button15Click(Sender: TObject);
begin
  Form13.Show;
  Form13.Button1.Visible := false;
  Form13.Edit1.Text := DBGrid5.DataSource.DataSet.Fields[1].AsString;
  Form13.Edit2.Text := DBGrid5.DataSource.DataSet.Fields[2].AsString;
end;

//add chamber
procedure TForm8.Button16Click(Sender: TObject);
begin
  Form14.Show;
  Form14.Button3.Visible := false;
end;

//edit chamber
procedure TForm8.Button18Click(Sender: TObject);
begin
  Form14.Show;
  Form14.Button1.Visible := false;
  Form14.Edit1.Text := DBGrid6.DataSource.DataSet.Fields[0].AsString;
  Form14.DBLookupComboBox1.KeyValue := DBGrid6.DataSource.DataSet.Fields[1].AsString;
end;

//add department
procedure TForm8.Button1Click(Sender: TObject);
begin
  Form9.Show;
  Form9.Button3.Visible := false;
end;

//edit department
procedure TForm8.Button3Click(Sender: TObject);
begin
  Form9.Show;
  Form9.Button1.Visible := false;
  Form9.Edit1.Text := DBGrid1.DataSource.DataSet.Fields[1].AsString;
end;

//add doctor
procedure TForm8.Button4Click(Sender: TObject);
begin
  Form10.Show;
  Form10.Button3.Visible := false;
end;

//edit doctor
procedure TForm8.Button6Click(Sender: TObject);
begin
  Form10.Show;
  Form10.Button1.Visible := false;
  Form10.Edit1.Text := DBGrid2.DataSource.DataSet.Fields[0].AsString;
  Form10.Edit2.Text := DBGrid2.DataSource.DataSet.Fields[1].AsString;
  Form10.DBLookupComboBox1.KeyValue := DBGrid2.DataSource.DataSet.Fields[2].AsString;
  Form10.Edit4.Text := DBGrid2.DataSource.DataSet.Fields[3].AsString;
end;

//add patient
procedure TForm8.Button7Click(Sender: TObject);
begin
  Form11.Show;
  Form11.Button3.Visible := false;
end;

//edit patient
procedure TForm8.Button9Click(Sender: TObject);
begin
  Form11.Show;
  Form11.Button1.Visible := false;
  Form11.Edit1.Text := DBGrid3.DataSource.DataSet.Fields[0].AsString;
  Form11.DBLookupComboBox1.KeyValue := DBGrid3.DataSource.DataSet.Fields[1].AsString;
  Form11.DBLookupComboBox2.KeyValue := DBGrid3.DataSource.DataSet.Fields[2].AsString;
  Form11.Edit4.Text := DBGrid3.DataSource.DataSet.Fields[3].AsString;
end;

procedure TForm8.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Form8.Close;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  ADOQuery1.SQL.Clear;  //department
  ADOQuery1.SQL.Add('select * from department');
  ADOQuery1.Active := true;
  ADOQuery2.SQL.Clear;  //doctor
  ADOQuery2.SQL.Add('select doctor.ФИО, doctor.Специальность, department.Название as Отделение, doctor.Стаж from doctor inner join department on department.id = doctor.Отделение');
  ADOQuery2.Active := true;
  ADOQuery3.SQL.Clear;  //patient
  ADOQuery3.SQL.Add('select patient.ФИО, department.Название as Отделение, patient.Палата, patient.Карта_больного from patient inner join department on department.id = patient.Отделение');
  ADOQuery3.Active := true;
  ADOQuery4.SQL.Clear;  //patient_card
  //ADOQuery4.SQL.Add('select patient_card.id, patient.ФИО as ФИО, patient_card.Поступление, patient_card.Выписка, patient_card.Диагноз_1, patient_card.Диагноз_2, patient_card.Диагноз_3, patient_card.Лечение from patient_card inner join patient on patient.id = patient_card.ФИО');
  ADOQuery4.SQL.Add('select t1.fio, t1.post, t1.vip, t1.name_1, t1.name_2, d.Название from select_2 t1, diagnosis d where t1.diagnoz=d.id;');
  ADOQuery4.Active := true;
  ADOQuery5.SQL.Clear;  //diagnosis
  ADOQuery5.SQL.Add('select * from diagnosis');
  ADOQuery5.Active := true;
  ADOQuery6.SQL.Clear;  //chamber
  ADOQuery6.SQL.Add('select chamber.№, department.Название as Отделение from chamber inner join department on department.id=chamber.Отделение');
  ADOQuery6.Active := true;
end;

end.
