object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Tarefa 2'
  ClientHeight = 193
  ClientWidth = 624
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
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object lbTempoThread1: TLabel
    Left = 8
    Top = 8
    Width = 63
    Height = 15
    Caption = 'Tempo (ms)'
  end
  object lbTempoThread2: TLabel
    Left = 8
    Top = 80
    Width = 63
    Height = 15
    Caption = 'Tempo (ms)'
  end
  object pbThread1: TProgressBar
    Left = 8
    Top = 58
    Width = 608
    Height = 17
    TabOrder = 0
  end
  object pbThread2: TProgressBar
    Left = 8
    Top = 130
    Width = 608
    Height = 17
    TabOrder = 1
  end
  object btIniciar: TButton
    Left = 8
    Top = 153
    Width = 81
    Height = 32
    Caption = 'Iniciar'
    TabOrder = 2
    OnClick = btIniciarClick
  end
  object edTempoThread1: TEdit
    Left = 8
    Top = 29
    Width = 81
    Height = 23
    MaxLength = 5
    TabOrder = 3
    OnKeyPress = edTempoThread1KeyPress
  end
  object edTempoThread2: TEdit
    Left = 8
    Top = 101
    Width = 81
    Height = 23
    MaxLength = 5
    TabOrder = 4
    OnKeyPress = edTempoThread2KeyPress
  end
end
