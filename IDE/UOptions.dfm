object fOptions: TfOptions
  Left = 261
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Opciones'
  ClientHeight = 316
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 392
    Height = 313
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      object ECompiler: TLabel
        Left = 16
        Top = 8
        Width = 63
        Height = 13
        Caption = 'Compilador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 73
        Height = 13
        Caption = 'Ensamblador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 83
        Height = 13
        Caption = 'Preprocesador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EInterpreter: TLabel
        Left = 200
        Top = 8
        Width = 56
        Height = 13
        Caption = 'Interprete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 200
        Top = 48
        Width = 98
        Height = 13
        Caption = 'Librer'#237'a de Inicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Browse1: TSpeedButton
        Left = 156
        Top = 24
        Width = 23
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BrowseClick
      end
      object Browse2: TSpeedButton
        Left = 156
        Top = 64
        Width = 23
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BrowseClick
      end
      object Browse3: TSpeedButton
        Left = 156
        Top = 104
        Width = 23
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BrowseClick
      end
      object Browse4: TSpeedButton
        Left = 341
        Top = 24
        Width = 23
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BrowseClick
      end
      object Browse5: TSpeedButton
        Left = 341
        Top = 64
        Width = 23
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BrowseClick
      end
      object Browse6: TSpeedButton
        Left = 340
        Top = 104
        Width = 23
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BrowseClick
      end
      object Label1: TLabel
        Left = 200
        Top = 88
        Width = 82
        Height = 13
        Caption = 'Empaquetador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 136
        Width = 72
        Height = 13
        Hint = 'Carpeta o URL donde esta la documentacion de Supergl'#250's'
        Caption = 'Home Ayuda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditCompiler: TEdit
        Left = 16
        Top = 24
        Width = 141
        Height = 21
        TabOrder = 0
        Text = 'spg.exe'
      end
      object EditAssembler: TEdit
        Left = 16
        Top = 64
        Width = 141
        Height = 21
        TabOrder = 1
        Text = 'glulxa.exe'
      end
      object EditPreprocesor: TEdit
        Left = 16
        Top = 104
        Width = 141
        Height = 21
        TabOrder = 2
        Text = 'txtpaws.exe'
      end
      object EditInterpreter: TEdit
        Left = 200
        Top = 24
        Width = 141
        Height = 21
        TabOrder = 3
        Text = 'glulxe.exe'
      end
      object EditLibrary: TEdit
        Left = 200
        Top = 64
        Width = 141
        Height = 21
        TabOrder = 4
        Text = 'LIBRARY.INI'
      end
      object CheckPreprocessor: TCheckBox
        Left = 16
        Top = 192
        Width = 121
        Height = 17
        Hint = 'Preprocesar el fuente de entrada'
        Caption = 'Usar preprocesador'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object EditPacker: TEdit
        Left = 200
        Top = 104
        Width = 141
        Height = 21
        TabOrder = 6
        Text = 'blc.exe'
      end
      object CheckDelTmpFiles: TCheckBox
        Left = 16
        Top = 216
        Width = 145
        Height = 17
        Hint = 
          'Borra los ficheros intermedios al compilar si la compilacion tuv' +
          'o exito'
        Caption = 'Borrar ficheros temporales'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object EdithelpBasePath: TEdit
        Left = 16
        Top = 152
        Width = 345
        Height = 21
        TabOrder = 8
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Informaci'#243'n'
      ImageIndex = 1
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 130
        Height = 13
        Caption = 'Directorio de la librer'#237'a PGL'
      end
      object Label5: TLabel
        Left = 8
        Top = 56
        Width = 84
        Height = 13
        Caption = 'Plugins instalados'
      end
      object ECoreLibraryPath: TEdit
        Left = 8
        Top = 24
        Width = 361
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object ListPlugins: TListBox
        Left = 8
        Top = 80
        Width = 361
        Height = 89
        Color = clBtnFace
        ItemHeight = 13
        TabOrder = 1
      end
    end
  end
  object BOK: TButton
    Left = 214
    Top = 271
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    ModalResult = 1
    TabOrder = 1
  end
  object BCancel: TButton
    Left = 302
    Top = 271
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object BrowseDialog: TOpenDialog
    Filter = 
      'Ficheros ejecutables|*.exe;*.com;*.bat|Todos los archivos (*.*)|' +
      '*.*'
    Left = 24
    Top = 264
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [fdNoFaceSel, fdNoSimulations, fdNoStyleSel]
    Left = 52
    Top = 264
  end
end
