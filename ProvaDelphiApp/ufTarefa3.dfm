object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 3'
  ClientHeight = 442
  ClientWidth = 680
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
  OnShow = FormShow
  TextHeight = 15
  object lbTituloGrid: TLabel
    Left = 8
    Top = 8
    Width = 102
    Height = 15
    Caption = 'Valores por projeto:'
  end
  object lbTotal: TLabel
    Left = 571
    Top = 325
    Width = 41
    Height = 15
    Caption = 'Total R$'
  end
  object lbTotalDivisoes: TLabel
    Left = 571
    Top = 383
    Width = 86
    Height = 15
    Caption = 'Total divis'#245'es R$'
  end
  object btObeterTotal: TButton
    Left = 489
    Top = 345
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 0
    OnClick = btObeterTotalClick
  end
  object btObterTotalDivisoes: TButton
    Left = 440
    Top = 404
    Width = 125
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 1
    OnClick = btObterTotalDivisoesClick
  end
  object edTotal: TEdit
    Left = 570
    Top = 346
    Width = 102
    Height = 23
    ReadOnly = True
    TabOrder = 2
  end
  object edTotalDivisoes: TEdit
    Left = 571
    Top = 404
    Width = 101
    Height = 23
    ReadOnly = True
    TabOrder = 3
  end
  object dgProjeto: TDBGrid
    Left = 8
    Top = 29
    Width = 664
    Height = 290
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
