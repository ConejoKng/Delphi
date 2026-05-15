object DM: TDM
  Height = 368
  Width = 637
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\DB\SISTEMACLINICA.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 16
  end
  object dsPaciente: TDataSource
    DataSet = tdPaciente
    Left = 128
    Top = 40
  end
  object dsAgendamento: TDataSource
    DataSet = tdAgendamento
    Left = 448
    Top = 48
  end
  object tdPaciente: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM PACIENTE ORDER BY ID ASC')
    Left = 48
    Top = 32
    object tdPacienteID: TIntegerField
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tdPacienteCPF: TStringField
      DisplayWidth = 14
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object tdPacienteNOME: TStringField
      DisplayWidth = 29
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 80
    end
    object tdPacienteCELULAR: TStringField
      DisplayWidth = 14
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 16
    end
    object tdPacienteDATA_CADASTRO: TDateField
      DisplayWidth = 15
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
  object tdAgendamento: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM AGENDAMENTO')
    Left = 552
    Top = 56
  end
  object insertPaciente: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'INSERT INTO PACIENTE (CPF, NOME, CELULAR, DATA_CADASTRO)'
      'VALUES (:CPF, :NOME, :CELULAR, :DATA_CADASTRO);')
    Left = 40
    Top = 200
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 14
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 80
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'DATA_CADASTRO'
        ParamType = ptInput
      end>
  end
  object insertAgendamento: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'INSERT INTO AGENDAMENTO '
      '(ID_PACIENTE, DATA, HORA, ESPECIALIDADE, MEDICO)'
      'VALUES'
      '(:ID_PACIENTE, :DATA, :HORA, :ESPECIALIDADE, :MEDICO);')
    Left = 552
    Top = 192
    ParamData = <
      item
        Name = 'ID_PACIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'HORA'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Name = 'ESPECIALIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Name = 'MEDICO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end>
  end
  object tdPacienteFiltroId: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM PACIENTE WHERE ID = :ID')
    Left = 40
    Top = 120
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object tdPacienteFiltroNome: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM PACIENTE WHERE NOME LIKE :NOME')
    Left = 160
    Top = 112
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
end
