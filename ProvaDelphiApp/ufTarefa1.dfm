object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tarefa 1'
  ClientHeight = 472
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object lbTabelas: TLabel
    Left = 215
    Top = 24
    Width = 38
    Height = 15
    Caption = 'Tabelas'
  end
  object lbColunas: TLabel
    Left = 8
    Top = 24
    Width = 43
    Height = 15
    Caption = 'Colunas'
  end
  object lbCondicoes: TLabel
    Left = 420
    Top = 24
    Width = 56
    Height = 15
    Caption = 'Condi'#231#245'es'
  end
  object Label1: TLabel
    Left = 8
    Top = 256
    Width = 62
    Height = 15
    Caption = 'SQL Gerado'
  end
  object meColunas: TMemo
    Left = 8
    Top = 45
    Width = 200
    Height = 188
    TabOrder = 0
  end
  object meTabelas: TMemo
    Left = 214
    Top = 45
    Width = 200
    Height = 188
    TabOrder = 1
  end
  object meCondicoes: TMemo
    Left = 420
    Top = 45
    Width = 200
    Height = 188
    TabOrder = 2
  end
  object btGeraSQL: TButton
    Left = 640
    Top = 104
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btGeraSQLClick
  end
  object meSQLGerado: TMemo
    Left = 8
    Top = 276
    Width = 721
    Height = 188
    ReadOnly = True
    TabOrder = 4
  end
end
