object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Prova Delphi App'
  ClientHeight = 581
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = Tarefas
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  TextHeight = 15
  object Tarefas: TMainMenu
    Left = 224
    Top = 312
    object miTarefa1: TMenuItem
      Caption = 'Tarefa 1'
      OnClick = miTarefa1Click
    end
    object miTarefa2: TMenuItem
      Caption = 'Tarefa 2'
      OnClick = miTarefa2Click
    end
    object miTarefa3: TMenuItem
      Caption = 'Tarefa 3'
      OnClick = miTarefa3Click
    end
  end
end
