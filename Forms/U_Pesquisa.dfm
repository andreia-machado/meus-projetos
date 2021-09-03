object Frm_pesquisa: TFrm_pesquisa
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio de consulta'
  ClientHeight = 485
  ClientWidth = 767
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 73
    Align = alTop
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 184
      Top = 16
      Width = 159
      Height = 16
      Caption = 'Digite o c'#243'digo ou nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 94
      Height = 16
      Caption = 'Pesquisar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ed_pesquisa: TEdit
      Left = 184
      Top = 43
      Width = 329
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object bt_pesquisar: TBitBtn
      Left = 536
      Top = 27
      Width = 90
      Height = 40
      Caption = '&Pesquisar'
      TabOrder = 1
      OnClick = bt_pesquisarClick
    end
    object cb_opcao: TComboBox
      Left = 8
      Top = 43
      Width = 145
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        'codigo'
        'cidadeSede')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 432
    Width = 767
    Height = 53
    Align = alBottom
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 767
    Height = 359
    Align = alClient
    DataSource = Frm_cadastro.Ds_cadastro
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 184
    Top = 438
    Width = 372
    Height = 39
    DataSource = Frm_cadastro.Ds_cadastro
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 3
  end
end
