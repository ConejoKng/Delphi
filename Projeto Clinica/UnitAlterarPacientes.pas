unit UnitAlterarPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TalterarPessoas = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    buscarId: TRadioButton;
    buscarNome: TRadioButton;
    grupoBoxBuscar: TGroupBox;
    DBGrid1: TDBGrid;
    txtBusca: TEdit;
    buscarCpf: TRadioButton;
    txtBuscaCpf: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure buscarIdClick(Sender: TObject);
    procedure buscarNomeClick(Sender: TObject);
    procedure txtBuscaChange(Sender: TObject);
    procedure buscarCpfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure conexaoBanco;
    procedure txtBuscaCpfChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  alterarPessoas: TalterarPessoas;

implementation

{$R *.dfm}

uses unitDM;

// Botões Filtro ---------------------------------

procedure TalterarPessoas.buscarCpfClick(Sender: TObject);
begin
  grupoBoxBuscar.Caption := 'Buscar por CPF';
  txtBusca.Visible := False;
  txtBuscaCpf.Visible := True;
end;

procedure TalterarPessoas.buscarIdClick(Sender: TObject);
begin
  txtBusca.NumbersOnly := True;
  txtBusca.Visible := True;
  txtBuscaCpf.Visible := False;
  grupoBoxBuscar.Caption := 'Buscar por ID';
end;

procedure TalterarPessoas.buscarNomeClick(Sender: TObject);
begin
  txtBusca.NumbersOnly := False;
  txtBusca.Visible := True;
  txtBuscaCpf.Visible := False;
  grupoBoxBuscar.Caption := ('Buscar por Nome');
end;

procedure TalterarPessoas.conexaoBanco;
begin
  dm.tdPaciente.Close;
  dm.tdPaciente.Open
end;

procedure TalterarPessoas.FormCreate(Sender: TObject);
begin
  conexaoBanco;
end;

// -----------------------------------------------

procedure TalterarPessoas.txtBuscaChange(Sender: TObject);
begin
  if buscarId.Checked then
  begin
    DM.tdPacienteFiltroId.Close;

    if Trim(txtBusca.Text) <> '' then
    begin
      DM.tdPacienteFiltroId.ParamByName('ID').AsInteger := StrToInt(txtBusca.Text);

      DM.tdPacienteFiltroId.Open;
    end;
  end;

  if buscarNome.Checked then
  begin
    DM.tdPacienteFiltroNome.Close;

    DM.tdPacienteFiltroNome.ParamByName('NOME').AsString := '%' + txtBusca.Text + '%';

    DM.tdPacienteFiltroNome.Open;
  end;
end;

procedure TalterarPessoas.txtBuscaCpfChange(Sender: TObject);
begin
  DM.tdPacienteFiltroCpf.Close;

  DM.tdPacienteFiltroCpf.ParamByName('CPF').AsString := '%' + txtBuscaCpf.Text + '%';

  DM.tdPacienteFiltroCpf.Open;
end;

procedure TalterarPessoas.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
