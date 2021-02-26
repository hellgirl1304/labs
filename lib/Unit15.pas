unit Unit15;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Unit2, Unit3, Unit4, Unit5;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    TabSheet5: TTabSheet;
    DataSource5: TDataSource;
    DBGrid5: TDBGrid;
    ADOQuery5: TADOQuery;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


{add author}
procedure TForm1.BitBtn10Click(Sender: TObject);
begin
  Form5.Button3.Visible := false;
  Form5.Show;
end;

{edit author}
procedure TForm1.BitBtn11Click(Sender: TObject);
begin
  Form5.Button1.Visible := false;
  Form5.Edit1.Text := DBGrid4.DataSource.DataSet.FieldByName('���').AsString;
  Form5.Edit2.Text := DBGrid4.DataSource.DataSet.FieldByName('�����_����������').AsString;
  Form5.Show;
end;

//delete author
procedure TForm1.BitBtn12Click(Sender: TObject);
begin
  dbgrid4.DataSource.DataSet.Delete;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.Add('select * from author');
  ADOQuery4.Active := true;
end;

{add ranking}
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Form2.Button3.Visible := false;
  Form2.Show;
end;

{edit ranking}
procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Form2.Button1.Visible := false;
  Form2.DBLookupComboBox1.KeyValue := dbgrid1.DataSource.DataSet.Fields[0].AsString; //DBGrid1.DataSource.DataSet.FieldByName('��������').AsString;
  Form2.DBLookupComboBox2.KeyValue := dbgrid1.DataSource.DataSet.Fields[1].AsString; //DBGrid1.DataSource.DataSet.FieldByName('�����').AsString;
  Form2.DBLookupComboBox3.KeyValue := dbgrid1.DataSource.DataSet.Fields[2].AsString; //DBGrid1.DataSource.DataSet.FieldByName('�����').AsString;
  Form2.Edit1.Text := DBGrid1.DataSource.DataSet.FieldByName('����������').AsString;
  Form2.Show;
end;

//delete ranking
procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  dbgrid1.DataSource.DataSet.Delete;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select book.��������, author.��� as �����, bookshelf.�������� as �����, ranking.���������� from ranking, book, bookshelf, author where book.����� = ranking.�����_����� and author.����� = ranking.�����_������ and bookshelf.���� = ranking.����_�����');
  ADOQuery1.Active := true;
end;

{add book}
procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  Form3.Button3.Visible := false;
  Form3.Show;
end;

{edit bookshelf}
procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  Form3.Button1.Visible := false;
  Form3.Edit1.Text := DBGrid2.DataSource.DataSet.FieldByName('����').AsString;
  Form3.Edit2.Text := DBGrid2.DataSource.DataSet.FieldByName('��������').AsString;
  Form3.Edit3.Text := DBGrid2.DataSource.DataSet.FieldByName('�����_����������').AsString;
  Form3.Show;
end;

//delete bookshelf
procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  dbgrid2.DataSource.DataSet.Delete;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('select * from bookshelf');
  ADOQuery2.Active := true;
end;

{add book}
procedure TForm1.BitBtn7Click(Sender: TObject);
begin
  Form4.Button3.Visible := false;
  Form4.Show;
end;

{edit book}
procedure TForm1.BitBtn8Click(Sender: TObject);
begin
  Form4.Button1.Visible := false;
  Form4.Edit1.Text := DBGrid3.DataSource.DataSet.FieldByName('�����').AsString;
  Form4.Edit2.Text := DBGrid3.DataSource.DataSet.FieldByName('��������').AsString;
  Form4.Edit3.Text := DBGrid3.DataSource.DataSet.FieldByName('������������').AsString;
  Form4.Edit4.Text := DBGrid3.DataSource.DataSet.FieldByName('���_�������').AsString;
  Form4.Edit5.Text := DBGrid3.DataSource.DataSet.FieldByName('����������_�������').AsString;
  Form4.Show;
end;

//delete book
procedure TForm1.BitBtn9Click(Sender: TObject);
begin
  dbgrid3.DataSource.DataSet.Delete;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Add('select * from book');
  ADOQuery3.Active := true;
end;

//ddl/dml
procedure TForm1.Button1Click(Sender: TObject);
begin
 adoquery5.SQL.Clear;
 adoquery5.SQL.Text := Edit1.Text;
 adoquery5.Active := true;
 adoquery5.ExecSQL;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select book.��������, author.��� as �����, bookshelf.�������� as �����, ranking.���������� from ranking, book, bookshelf, author where book.����� = ranking.�����_����� and author.����� = ranking.�����_������ and bookshelf.���� = ranking.����_�����');
  ADOQuery1.Active := true;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('select * from bookshelf');
  ADOQuery2.Active := true;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Add('select * from book');
  ADOQuery3.Active := true;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.Add('select * from author');
  ADOQuery4.Active := true;
  radiobutton1.Caption := 'DDL/DML';
  edit1.Text := '';
  label1.Caption := '���� �������:';
end;

{ddl/dml}
procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  label1.Visible := true;
  edit1.Visible := true;
  button1.Visible := true;
end;

{ddl/dml}
procedure TForm1.RadioButton1DblClick(Sender: TObject);
begin
  radiobutton1.Checked := false;
  label1.Visible := false;
  edit1.Visible := false;
  button1.Visible := false;
end;

end.
