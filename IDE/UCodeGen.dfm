object fCodeGen: TfCodeGen
  Left = 214
  Top = 162
  BorderStyle = bsToolWindow
  Caption = 'Generador de C'#243'digo'
  ClientHeight = 573
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 29
    Width = 792
    Height = 544
    ActivePage = TabSheetGenCode
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabSheetConditions: TTabSheet
      Caption = 'Condiciones'
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 153
        Height = 321
        Caption = 'Vocabulario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 28
          Height = 13
          Caption = 'Verbo'
        end
        object Label2: TLabel
          Left = 8
          Top = 72
          Width = 37
          Height = 13
          Caption = 'Nombre'
        end
        object Verb: TEdit
          Left = 8
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object Noun: TEdit
          Left = 8
          Top = 88
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object PrepositionCheck: TCheckBox
          Left = 8
          Top = 128
          Width = 121
          Height = 17
          Hint = 
            'NOTA: restringir las acciones por palabras adicionales puede res' +
            'tar jugabilidad, por lo cual s'#243'lo se recomeinda en caso de que s' +
            'ea expresamente necesario que el jugador indique estas palabras ' +
            'en el sentido del puzzle.'
          Caption = 'Requiere preposicion'
          TabOrder = 2
        end
        object Preposition: TEdit
          Left = 8
          Top = 144
          Width = 121
          Height = 21
          Hint = 
            'NOTA: restringir las acciones por palabras adicionales puede res' +
            'tar jugabilidad, por lo cual s'#243'lo se recomeinda en caso de que s' +
            'ea expresamente necesario que el jugador indique estas palabras ' +
            'en el sentido del puzzle.'
          TabOrder = 3
        end
        object AdverbCheck: TCheckBox
          Left = 8
          Top = 184
          Width = 121
          Height = 17
          Hint = 
            'NOTA: restringir las acciones por palabras adicionales puede res' +
            'tar jugabilidad, por lo cual s'#243'lo se recomeinda en caso de que s' +
            'ea expresamente necesario que el jugador indique estas palabras ' +
            'en el sentido del puzzle.'
          Caption = 'Requiere Adverbio'
          TabOrder = 4
        end
        object Adverb: TEdit
          Left = 8
          Top = 200
          Width = 121
          Height = 21
          Hint = 
            'NOTA: restringir las acciones por palabras adicionales puede res' +
            'tar jugabilidad, por lo cual s'#243'lo se recomeinda en caso de que s' +
            'ea expresamente necesario que el jugador indique estas palabras ' +
            'en el sentido del puzzle.'
          TabOrder = 5
        end
        object Noun2Check: TCheckBox
          Left = 8
          Top = 240
          Width = 121
          Height = 17
          Hint = 
            'NOTA: restringir las acciones por palabras adicionales puede res' +
            'tar jugabilidad, por lo cual s'#243'lo se recomeinda en caso de que s' +
            'ea expresamente necesario que el jugador indique estas palabras ' +
            'en el sentido del puzzle.'
          Caption = 'Requiere 2'#186' Nombre'
          TabOrder = 6
        end
        object Noun2: TEdit
          Left = 8
          Top = 256
          Width = 121
          Height = 21
          Hint = 
            'NOTA: restringir las acciones por palabras adicionales puede res' +
            'tar jugabilidad, por lo cual s'#243'lo se recomeinda en caso de que s' +
            'ea expresamente necesario que el jugador indique estas palabras ' +
            'en el sentido del puzzle.'
          TabOrder = 7
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 336
        Width = 153
        Height = 177
        Caption = 'Localidad'
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 48
          Width = 46
          Height = 13
          Caption = 'Localidad'
        end
        object Label11: TLabel
          Left = 8
          Top = 104
          Width = 103
          Height = 13
          Caption = 'Texto si no se cumple'
        end
        object LocationCheck: TCheckBox
          Left = 8
          Top = 24
          Width = 137
          Height = 17
          Caption = 'Puzzle ligado a localidad'
          TabOrder = 0
        end
        object Location: TEdit
          Left = 8
          Top = 64
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object TextOnFaliureLoc: TEdit
          Left = 8
          Top = 120
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
      object ObjConditions: TGroupBox
        Left = 176
        Top = 8
        Width = 593
        Height = 249
        Caption = 'Condiciones ligadas a objetos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Panel1: TPanel
          Left = 16
          Top = 24
          Width = 561
          Height = 65
          TabOrder = 0
          object label89: TLabel
            Left = 16
            Top = 36
            Width = 106
            Height = 13
            Caption = 'Texto si no se cumple:'
          end
          object ObjConCheck1: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'El objeto '
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object ObjConObj1: TEdit
            Left = 128
            Top = 8
            Width = 137
            Height = 21
            Hint = 'Introduce el objeto que requiere el puzzle de un modo u otro.'
            Enabled = False
            TabOrder = 1
          end
          object ObjConCondition1: TComboBox
            Left = 280
            Top = 8
            Width = 113
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnChange = ObjConCondition1Change
            Items.Strings = (
              'lo llevamos'
              'lo llevamos puesto'
              'esta presente'
              'esta ausente'
              'en esta localidad'
              'en la localidad ->')
          end
          object ObjConLocation1: TEdit
            Left = 408
            Top = 8
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
            Visible = False
          end
          object ObjConFaliure1: TEdit
            Left = 128
            Top = 36
            Width = 425
            Height = 21
            Enabled = False
            TabOrder = 4
          end
        end
        object Panel2: TPanel
          Left = 16
          Top = 96
          Width = 561
          Height = 65
          TabOrder = 1
          object Label5: TLabel
            Left = 16
            Top = 36
            Width = 106
            Height = 13
            Caption = 'Texto si no se cumple:'
          end
          object ObjConCheck2: TCheckBox
            Left = 8
            Top = 8
            Width = 161
            Height = 17
            Caption = 'El objeto '
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object ObjConObj2: TEdit
            Left = 128
            Top = 8
            Width = 137
            Height = 21
            Hint = 'Introduce el objeto que requiere el puzzle de un modo u otro.'
            Enabled = False
            TabOrder = 1
          end
          object ObjConCondition2: TComboBox
            Left = 280
            Top = 8
            Width = 113
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnChange = ObjConCondition1Change
            Items.Strings = (
              'lo llevamos'
              'lo llevamos puesto'
              'esta presente'
              'esta ausente'
              'en esta localidad'
              'en la localidad ->')
          end
          object ObjConLocation2: TEdit
            Left = 408
            Top = 8
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
            Visible = False
          end
          object ObjConFaliure2: TEdit
            Left = 128
            Top = 36
            Width = 425
            Height = 21
            Enabled = False
            TabOrder = 4
          end
        end
        object Panel3: TPanel
          Left = 16
          Top = 168
          Width = 561
          Height = 65
          TabOrder = 2
          object Label6: TLabel
            Left = 16
            Top = 36
            Width = 106
            Height = 13
            Caption = 'Texto si no se cumple:'
          end
          object ObjConCheck3: TCheckBox
            Left = 8
            Top = 8
            Width = 161
            Height = 17
            Caption = 'El objeto '
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object ObjConObj3: TEdit
            Left = 128
            Top = 8
            Width = 137
            Height = 21
            Hint = 'Introduce el objeto que requiere el puzzle de un modo u otro.'
            Enabled = False
            TabOrder = 1
          end
          object ObjConCondition3: TComboBox
            Left = 280
            Top = 8
            Width = 113
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnChange = ObjConCondition1Change
            Items.Strings = (
              'lo llevamos'
              'lo llevamos puesto'
              'esta presente'
              'esta ausente'
              'en esta localidad'
              'en la localidad ->')
          end
          object ObjConLocation3: TEdit
            Left = 408
            Top = 8
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
            Visible = False
          end
          object ObjConFaliure3: TEdit
            Left = 128
            Top = 36
            Width = 425
            Height = 21
            Enabled = False
            TabOrder = 4
          end
        end
      end
      object GroupBox4: TGroupBox
        Left = 176
        Top = 264
        Width = 593
        Height = 249
        Caption = 'Condiciones ligadas a flags'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Panel4: TPanel
          Left = 16
          Top = 24
          Width = 561
          Height = 65
          TabOrder = 0
          object Label7: TLabel
            Left = 16
            Top = 36
            Width = 106
            Height = 13
            Caption = 'Texto si no se cumple:'
          end
          object FlagConCheck1: TCheckBox
            Left = 8
            Top = 8
            Width = 81
            Height = 17
            Caption = 'El flag'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object FlagConFlag1: TEdit
            Left = 128
            Top = 8
            Width = 137
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object FlagConRelation1: TComboBox
            Left = 280
            Top = 8
            Width = 113
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'es igual a'
              'es distinto de'
              'es mayor que'
              'es menor que')
          end
          object FlagConValue1: TEdit
            Left = 408
            Top = 8
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
          end
          object FlagConFaliure1: TEdit
            Left = 128
            Top = 36
            Width = 425
            Height = 21
            Enabled = False
            TabOrder = 4
          end
        end
        object Panel5: TPanel
          Left = 16
          Top = 96
          Width = 561
          Height = 65
          TabOrder = 1
          object Label8: TLabel
            Left = 16
            Top = 36
            Width = 106
            Height = 13
            Caption = 'Texto si no se cumple:'
          end
          object FlagConCheck2: TCheckBox
            Left = 8
            Top = 8
            Width = 81
            Height = 17
            Caption = 'El flag'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object FlagConFlag2: TEdit
            Left = 128
            Top = 8
            Width = 137
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object FlagConRelation2: TComboBox
            Left = 280
            Top = 8
            Width = 113
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'es igual a'
              'es distinto de'
              'es mayor que'
              'es menor que')
          end
          object FlagConValue2: TEdit
            Left = 408
            Top = 8
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
          end
          object FlagConFaliure2: TEdit
            Left = 128
            Top = 36
            Width = 425
            Height = 21
            Enabled = False
            TabOrder = 4
          end
        end
        object Panel6: TPanel
          Left = 16
          Top = 168
          Width = 561
          Height = 65
          TabOrder = 2
          object Label9: TLabel
            Left = 16
            Top = 36
            Width = 106
            Height = 13
            Caption = 'Texto si no se cumple:'
          end
          object FlagConCheck3: TCheckBox
            Left = 8
            Top = 8
            Width = 81
            Height = 17
            Caption = 'El flag'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object FlagConFlag3: TEdit
            Left = 128
            Top = 8
            Width = 137
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object FlagConRelation3: TComboBox
            Left = 280
            Top = 8
            Width = 113
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'es igual a'
              'es distinto de'
              'es mayor que'
              'es menor que')
          end
          object FlagConValue3: TEdit
            Left = 408
            Top = 8
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
          end
          object FlagConFaliure3: TEdit
            Left = 128
            Top = 36
            Width = 425
            Height = 21
            Enabled = False
            TabOrder = 4
          end
        end
      end
    end
    object TabSheetActions: TTabSheet
      Caption = 'Acciones'
      ImageIndex = 1
      object GroupBox5: TGroupBox
        Left = 8
        Top = 8
        Width = 761
        Height = 209
        Caption = 'Acciones sobre objetos'
        TabOrder = 0
        object Panel8: TPanel
          Left = 8
          Top = 80
          Width = 745
          Height = 57
          TabOrder = 0
          object AcObjCheck2: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'Acci'#243'n sobre objeto'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcObj2: TEdit
            Left = 8
            Top = 28
            Width = 185
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object Panel7: TPanel
            Left = 224
            Top = 13
            Width = 513
            Height = 33
            TabOrder = 2
            object AcObjAppear2: TRadioButton
              Left = 120
              Top = 8
              Width = 113
              Height = 17
              Caption = 'Aparece'
              Enabled = False
              TabOrder = 0
              OnClick = AcObjAppearAT
            end
            object AcObjDisappear2: TRadioButton
              Left = 8
              Top = 8
              Width = 105
              Height = 17
              Caption = 'Desaparece'
              Enabled = False
              TabOrder = 1
              OnClick = AcObjAppearAT
            end
            object AcObjAppearAT2: TRadioButton
              Left = 216
              Top = 8
              Width = 129
              Height = 17
              Caption = 'Aparece en locallidad'
              Enabled = False
              TabOrder = 2
              OnClick = AcObjAppearAT
            end
            object AcObjAppearATLoc2: TEdit
              Left = 352
              Top = 7
              Width = 153
              Height = 21
              Enabled = False
              TabOrder = 3
              Visible = False
            end
          end
        end
        object Panel9: TPanel
          Left = 8
          Top = 144
          Width = 745
          Height = 57
          TabOrder = 1
          object AcObjCheck3: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'Acci'#243'n sobre objeto'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcObj3: TEdit
            Left = 8
            Top = 28
            Width = 185
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object Panel10: TPanel
            Left = 224
            Top = 13
            Width = 513
            Height = 33
            TabOrder = 2
            object AcObjAppear3: TRadioButton
              Left = 120
              Top = 8
              Width = 113
              Height = 17
              Caption = 'Aparece'
              Enabled = False
              TabOrder = 0
              OnClick = AcObjAppearAT
            end
            object AcObjDisappear3: TRadioButton
              Left = 8
              Top = 8
              Width = 105
              Height = 17
              Caption = 'Desaparece'
              Enabled = False
              TabOrder = 1
              OnClick = AcObjAppearAT
            end
            object AcObjAppearAT3: TRadioButton
              Left = 216
              Top = 8
              Width = 129
              Height = 17
              Caption = 'Aparece en locallidad'
              Enabled = False
              TabOrder = 2
              OnClick = AcObjAppearAT
            end
            object AcObjAppearATLoc3: TEdit
              Left = 352
              Top = 7
              Width = 153
              Height = 21
              Enabled = False
              TabOrder = 3
              Visible = False
            end
          end
        end
        object Panel11: TPanel
          Left = 8
          Top = 16
          Width = 745
          Height = 57
          TabOrder = 2
          object AcObjCheck1: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'Acci'#243'n sobre objeto'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcObj1: TEdit
            Left = 8
            Top = 28
            Width = 185
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object Panel12: TPanel
            Left = 224
            Top = 13
            Width = 513
            Height = 33
            TabOrder = 2
            object AcObjAppear1: TRadioButton
              Left = 120
              Top = 8
              Width = 113
              Height = 17
              Caption = 'Aparece'
              Enabled = False
              TabOrder = 0
              OnClick = AcObjAppearAT
            end
            object AcObjDisappear1: TRadioButton
              Left = 8
              Top = 8
              Width = 105
              Height = 17
              Caption = 'Desaparece'
              Enabled = False
              TabOrder = 1
              OnClick = AcObjAppearAT
            end
            object AcObjAppearAT1: TRadioButton
              Left = 216
              Top = 8
              Width = 129
              Height = 17
              Caption = 'Aparece en locallidad'
              Enabled = False
              TabOrder = 2
              OnClick = AcObjAppearAT
            end
            object AcObjAppearATLoc1: TEdit
              Left = 352
              Top = 7
              Width = 153
              Height = 21
              Enabled = False
              TabOrder = 3
              Visible = False
            end
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 224
        Width = 761
        Height = 137
        Caption = 'Acciones sobre flags'
        TabOrder = 1
        object Panel13: TPanel
          Left = 8
          Top = 16
          Width = 161
          Height = 113
          TabOrder = 0
          object AcFlgCheck1: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'Acci'#243'n sobre flag'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcFlgNum1: TEdit
            Left = 8
            Top = 28
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object AcFlgAction1: TComboBox
            Left = 8
            Top = 52
            Width = 145
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'a'#241'adir'
              'restar'
              'asignar')
          end
          object AcFlgValue1: TEdit
            Left = 8
            Top = 76
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
          end
        end
        object Panel14: TPanel
          Left = 203
          Top = 16
          Width = 161
          Height = 113
          TabOrder = 1
          object AcFlgCheck2: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'Acci'#243'n sobre flag'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcFlgNum2: TEdit
            Left = 8
            Top = 28
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object AcFlgAction2: TComboBox
            Left = 8
            Top = 52
            Width = 145
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'a'#241'adir'
              'restar'
              'asignar')
          end
          object AcFlgValue2: TEdit
            Left = 8
            Top = 76
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
          end
        end
        object Panel15: TPanel
          Left = 396
          Top = 16
          Width = 161
          Height = 113
          TabOrder = 2
          object AcFlgCheck3: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'Acci'#243'n sobre flag'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcFlgNum3: TEdit
            Left = 8
            Top = 28
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object AcFlgAction3: TComboBox
            Left = 8
            Top = 52
            Width = 145
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'a'#241'adir'
              'restar'
              'asignar')
          end
          object AcFlgValue3: TEdit
            Left = 8
            Top = 76
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
          end
        end
        object Panel16: TPanel
          Left = 592
          Top = 16
          Width = 161
          Height = 113
          TabOrder = 3
          object AcFlgCheck4: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'Acci'#243'n sobre flag'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcFlgNum4: TEdit
            Left = 8
            Top = 28
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object AcFlgAction4: TComboBox
            Left = 8
            Top = 52
            Width = 145
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'a'#241'adir'
              'restar'
              'asignar')
          end
          object AcFlgValue4: TEdit
            Left = 8
            Top = 76
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 376
        Width = 761
        Height = 137
        Caption = 'Acciones sobre conexiones'
        TabOrder = 2
        object Panel17: TPanel
          Left = 8
          Top = 16
          Width = 161
          Height = 113
          TabOrder = 0
          object AcConCheck1: TCheckBox
            Left = 8
            Top = 8
            Width = 145
            Height = 17
            Caption = 'Acci'#243'n sobre conexi'#243'n'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcConCon1: TEdit
            Left = 8
            Top = 28
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object AcConAction1: TComboBox
            Left = 8
            Top = 52
            Width = 145
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnChange = AcConAction1Change
            Items.Strings = (
              'destruir'
              'crear destino')
          end
          object AcConLoc1: TEdit
            Left = 8
            Top = 76
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
            Visible = False
          end
        end
        object Panel18: TPanel
          Left = 202
          Top = 16
          Width = 161
          Height = 113
          TabOrder = 1
          object AcConCheck2: TCheckBox
            Left = 8
            Top = 8
            Width = 145
            Height = 17
            Caption = 'Acci'#243'n sobre conexi'#243'n'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcConCon2: TEdit
            Left = 8
            Top = 28
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object AcConAction2: TComboBox
            Left = 8
            Top = 52
            Width = 145
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnChange = AcConAction1Change
            Items.Strings = (
              'destruir'
              'crear destino'
              '')
          end
          object AcConLoc2: TEdit
            Left = 8
            Top = 76
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
            Visible = False
          end
        end
        object Panel19: TPanel
          Left = 395
          Top = 16
          Width = 161
          Height = 113
          TabOrder = 2
          object AcConCheck3: TCheckBox
            Left = 8
            Top = 8
            Width = 145
            Height = 17
            Caption = 'Acci'#243'n sobre conexi'#243'n'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcConCon3: TEdit
            Left = 8
            Top = 28
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object AcConAction3: TComboBox
            Left = 8
            Top = 52
            Width = 145
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnChange = AcConAction1Change
            Items.Strings = (
              'destruir'
              'crear destino'
              '')
          end
          object AcConLoc3: TEdit
            Left = 8
            Top = 76
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
            Visible = False
          end
        end
        object Panel20: TPanel
          Left = 591
          Top = 16
          Width = 161
          Height = 113
          TabOrder = 3
          object AcConCheck4: TCheckBox
            Left = 8
            Top = 8
            Width = 145
            Height = 17
            Caption = 'Acci'#243'n sobre conexi'#243'n'
            TabOrder = 0
            OnClick = ConCheckClick
          end
          object AcConCon4: TEdit
            Left = 8
            Top = 28
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object AcConAction4: TComboBox
            Left = 8
            Top = 52
            Width = 145
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnChange = AcConAction1Change
            Items.Strings = (
              'destruir'
              'crear destino'
              '')
          end
          object AcConLoc4: TEdit
            Left = 8
            Top = 76
            Width = 145
            Height = 21
            Enabled = False
            TabOrder = 3
            Visible = False
          end
        end
      end
    end
    object TabSheetGenCode: TTabSheet
      Caption = 'Generar'
      ImageIndex = 2
      object ButtonClean: TButton
        Left = 8
        Top = 480
        Width = 75
        Height = 25
        Hint = 'Limpiar'
        Caption = 'Limpiar'
        TabOrder = 0
        OnClick = ButtonCleanClick
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 128
        Width = 752
        Height = 65
        Hint = 
          'Si no entiendes lo que esto significa lim'#237'tate a dejarlas desmar' +
          'cadas.'
        Caption = 'Opciones avanzadas'
        TabOrder = 1
        object CheckAdditionalWords: TCheckBox
          Left = 16
          Top = 16
          Width = 265
          Height = 17
          Hint = 
            'A'#241'ade a las entradas que controlan los casos de fallo las codici' +
            'ones basadas en preposiciones, adverbios, segundos nombres, etc.' +
            ' , en caso de existir.'
          Caption = 'Incluir palabras adicionales en entradas sin '#233'xito'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object CheckFlagConFirst: TCheckBox
          Left = 16
          Top = 40
          Width = 361
          Height = 17
          Hint = 
            'Habitualmente las primeras entradas para los casos de no '#233'xito s' +
            'e basan en las condiciones de flag. Si desea que sea m'#225's importa' +
            'nte alguna condicion basada en objeto utilice esta opci'#243'n.'
          Caption = 
            'Evaluar condiciones de flag antes que de objeto en entradas sin ' +
            #233'xito'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
        end
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 16
        Width = 750
        Height = 105
        Caption = 'General'
        TabOrder = 2
        object Label10: TLabel
          Left = 16
          Top = 20
          Width = 78
          Height = 13
          Caption = 'T'#237'tulo del puzzle'
        end
        object Label4: TLabel
          Left = 16
          Top = 60
          Width = 131
          Height = 13
          Caption = 'Texto cuando se tiene '#233'xito'
        end
        object PuzzleTitle: TEdit
          Left = 16
          Top = 36
          Width = 726
          Height = 21
          TabOrder = 0
        end
        object TextOnSuccess: TEdit
          Left = 16
          Top = 76
          Width = 726
          Height = 21
          TabOrder = 1
        end
      end
      object CodeMemo: TSynMemo
        Left = 8
        Top = 200
        Width = 753
        Height = 273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 3
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Highlighter = fMain.CodeHighlighter
      end
    end
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 29
    TabOrder = 1
    object ButtonOpenPuzzle: TSpeedButton
      Left = 0
      Top = 2
      Width = 23
      Height = 22
      Hint = 'Abrir puzzle'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF91919191919191919191919191919191919191919191
        9191919191919191919191919191919191919191919191919191FF00FF29ABD7
        35B3DC23A9D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF919191B2B2B2B9B9B9B0B0B091919191919191919191
        9191919191919191919191919191919191919191919191919191FF00FF29ABD7
        AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF919191B2B2B2F4F4F4EDEDEDC6C6C6C6C6C6C6C6C6BA
        BABAB1B1B1919191919191919191919191919191919191919191FF00FF29ABD7
        A6E9F59EFFFF97FCFF99FBFF95F7FF8DF2FE83EAFA49C2E449C2E43AB8DFFF00
        FFFF00FFFF00FFFF00FF919191B2B2B2E8E8E8FAFAFAF8F8F8F7F7F7F4F4F4F0
        F0F0E9E9E9C6C6C6C6C6C6BDBDBD919191919191919191919191FF00FF29ABD7
        8BD7ECABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF52DAF
        DBFF00FFFF00FFFF00FF919191B2B2B2D8D8D8FAFAFAF5F5F5F3F3F3F3F3F3F3
        F3F3F2F2F2F2F2F2F4F4F4DEDEDEB6B6B6919191919191919191FF00FF29ABD7
        29ABD7AAF0FA91FAFF91F6FF90F5FF8EF4FF8DF2FE8BF1FE8CF1FF77DFF656CA
        EAFF00FFFF00FFFF00FF919191B2B2B2B2B2B2EFEFEFF6F6F6F3F3F3F3F3F3F2
        F2F2F0F0F0EFEFEFF0F0F0E0E0E0CDCDCD919191919191919191FF00FF29ABD7
        7BE5F429ABD79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF72DDF579E1
        F62CB0DAFF00FFFF00FF919191B2B2B2E4E4E4B2B2B2FAFAFAF4F4F4F3F3F3F2
        F2F2F0F0F0EFEFEFF0F0F0DEDEDEE1E1E1B6B6B6919191919191FF00FF29ABD7
        93F9FD29ABD7A8E9F5A8F0FAA4F1FBA1F7FF8CF3FF8AF1FE8CF1FF70DAF30574
        0B58CDEAFF00FFFF00FF919191B2B2B2F5F5F5B2B2B2E9E9E9EFEFEFF0F0F0F5
        F5F5F1F1F1EFEFEFF0F0F0DBDBDB636363CFCFCF919191919191FF00FF29ABD7
        9DFEFF86F2FB29ABD729ABD729ABD729ABD7AFF2FB90F4FF88F2FF05740B5BE7
        8C05740B1FA8D6FF00FF919191B2B2B2FAFAFAEFEFEFB2B2B2B2B2B2B2B2B2B2
        B2B2F1F1F1F2F2F2F0F0F0636363D1D1D1636363AFAFAF919191FF00FF29ABD7
        9AFCFF96FBFF95FBFF95FAFF90F7FF6CDEF329ABD79FE3F405740B50D77A45D2
        6C31C14F05740BFF00FF919191B2B2B2F8F8F8F7F7F7F7F7F7F7F7F7F4F4F4DE
        DEDEB2B2B2E4E4E4636363C1C1C1BBBBBBAAAAAA636363919191FF00FF29ABD7
        9BFDFF94FAFF92F8FF91F6FF92F7FF93F9FF84EFFD29ABD729ABD7168C2330C1
        4C16982434AFDAFF00FF919191B2B2B2F9F9F9F6F6F6F5F5F5F3F3F3F4F4F4F6
        F6F6EEEEEEB2B2B2B2B2B2797979AAAAAA848484B6B6B6919191FF00FF29ABD7
        A4FFFF94FCFF92F9FF93F8FF8FEDFA90ECFA95EEFC96F1FD9AF4FF0C81161AAF
        2C088310FF00FFFF00FF919191B2B2B2FBFBFBF8F8F8F6F6F6F5F5F5ECECECEB
        EBEBEDEDEDF0F0F0F2F2F26F6F6F989898717171919191919191FF00FF25A8D6
        29ABD79EF5FB9FF7FD86EAF82BAED925A8D628ABD72AACD832B0DA0C90170EA0
        1AFF00FFFF00FFFF00FF919191B0B0B0B2B2B2F2F2F2F4F4F4E9E9E9B5B5B5B0
        B0B0B2B2B2B3B3B3B6B6B67C7C7C8A8A8A919191919191919191FF00FFFF00FF
        FF00FF29ABD730AED92CADD8FF00FFFF00FFFF00FFFF00FF0A89120EA11A0881
        0FFF00FFFF00FFFF00FF919191919191919191B2B2B2B5B5B5B4B4B491919191
        91919191919191917676768B8B8B6F6F6F919191919191919191FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF05710A09790F0B89160A8C13067A0DFF00
        FFFF00FFFF00FFFF00FF91919191919191919191919191919191919191919161
        6161686868767676797979696969919191919191919191919191FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF91919191919191919191919191919191919191919191
        9191919191919191919191919191919191919191919191919191}
      NumGlyphs = 2
      OnClick = ButtonOpenPuzzleClick
    end
    object ButtonSavePuzzle: TSpeedButton
      Left = 23
      Top = 2
      Width = 23
      Height = 22
      Hint = 'Guardar puzzle'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        AD5A59AA5454A24D4EAA9595C1C8C7CCCBCACECBCACAC8C7C6CAC9B79E9E9840
        41994444A65151FF00FF9191919191916262625C5C5C565656969696C7C7C7CB
        CBCBCBCBCBC8C8C8CACACAA0A0A04949494D4D4D595959919191FF00FFBC7871
        CF6666D26868B95A5B9B8080BEA1A0E2D0CEFEF9F5FFFDFAF2F6F4D2B3B3962D
        2C993232C25B5BB058599191917C7C7C707070727272636363828282A3A3A3D1
        D1D1F8F8F8FCFCFCF5F5F5B5B5B53A3A3A3F3F3F656565616161FF00FFBB7871
        CB6565CE6767B85D5D9E7B7C9D4343B77675E7DFDDFDFBF9FEFFFDD9BAB9962E
        2E993333C05A5AAF58599191917C7C7C6F6F6F7171716666667E7E7E4C4C4C7B
        7B7BDFDFDFFBFBFBFFFFFFBCBCBC3B3B3B3F3F3F646464606060FF00FFBB7871
        CB6565CE6667B85D5DA884839939399B3636CDBCBBF2F0EEFFFFFFE2C3C1962D
        2D983333C05A5AAF58599191917C7C7C6F6F6F70707066666686868644444442
        4242BDBDBDF0F0F0FFFFFFC5C5C53B3B3B3F3F3F646464606060FF00FFBB7871
        CB6565CE6666B75C5CB28F8E9F4848943232A69A9AD5DBD8FAFFFEE6C9C8932B
        2B963030BF5959AF58599191917C7C7C6F6F6F7070706565659191915151513E
        3E3E9B9B9BDADADAFEFEFECBCBCB3939393D3D3D636363606060FF00FFBB7871
        CB6565CF6666BB5C5CC3908FC29695B38686AA8D8EBAA2A1E1CAC8DCA9A9A33A
        3AA43E3EC35D5DAE57589191917C7C7C6F6F6F70707065656594949499999989
        89898F8F8FA3A3A3CBCBCBADADAD4646464A4A4A676767606060FF00FFBB7871
        CC6566CB6464CB6464CB6364CC6767CD6767CC6464C85B5BC95E5ECA6161CC65
        65CD6666CF6868AC56579191917C7C7C6F6F6F6E6E6E6E6E6E6D6D6D71717171
        71716E6E6E6666666969696B6B6B6F6F6F7070707272725E5E5EFF00FFBC7972
        B75351B25B57C68684D2A4A2D5ABAAD5AAA9D5ABAAD5A5A4D5A8A7D5AAA9D6AE
        ACD39C9CCD6666AC55569191917D7D7D5D5D5D6262628B8B8BA7A7A7AEAEAEAD
        ADADAEAEAEA8A8A8ABABABADADADB0B0B0A0A0A07070705E5E5EFF00FFBC7871
        B14F4CE4CDCBFAF7F7F8F4F3F9F5F4F9F5F4F9F5F4F9F6F5F9F5F4F9F5F4FBFB
        FADEBEBDC45C5DAD56579191917C7C7C595959CECECEF7F7F7F4F4F4F5F5F5F5
        F5F5F5F5F5F6F6F6F5F5F5F5F5F5FBFBFBC0C0C06767675F5F5FFF00FFBC7871
        B3514EEBD7D6FCFBFAF7F0EFF7F1F0F7F1F0F7F1F0F7F1F0F7F1F0F6F1F0FBF9
        F8DEBCBBC35B5BAD56579191917C7C7C5A5A5AD8D8D8FBFBFBF0F0F0F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F9F9F9BEBEBE6565655F5F5FFF00FFBC7871
        B3514EEBD7D4F0EFEFD8D5D4DAD7D7DAD7D7DAD7D7DAD7D7DAD7D7D8D5D5ECEC
        EBE0BDBCC25B5BAD56579191917C7C7C5A5A5AD8D8D8EFEFEFD5D5D5D7D7D7D7
        D7D7D7D7D7D7D7D7D7D7D7D5D5D5ECECECBFBFBF6565655F5F5FFF00FFBC7871
        B3514EEBD7D5F3F1F1DEDAD9DFDBDBDFDBDBDFDBDBDFDBDBDFDBDBDDDAD9EEEE
        EEE0BDBCC35B5BAD56579191917C7C7C5A5A5AD8D8D8F1F1F1DADADADBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDADADAEEEEEEBFBFBF6565655F5F5FFF00FFBC7871
        B3514EEAD7D5F5F4F3E4DFDEE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E4DFDFF2F1
        F0DFBDBBC35B5BAD56579191917C7C7C5A5A5AD8D8D8F4F4F4DFDFDFE1E1E1E1
        E1E1E1E1E1E1E1E1E1E1E1DFDFDFF1F1F1BFBFBF6565655F5F5FFF00FFBC7871
        B3514EEBD7D6F1F0EFD9D5D5DAD8D7DAD8D7DAD8D7DAD8D7DAD8D7D8D5D5EDEC
        EBE1BEBDC35B5BAD56579191917C7C7C5A5A5AD8D8D8F0F0F0D5D5D5D8D8D8D8
        D8D8D8D8D8D8D8D8D8D8D8D5D5D5ECECECC0C0C06565655F5F5FFF00FFBC7870
        B3514EE9D6D4FEFBFBFAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FDFA
        F9DEBCBBC35C5CAD56579191917C7C7C5A5A5AD7D7D7FBFBFBF3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F3F3F3FAFAFABEBEBE6666665F5F5FFF00FFFF00FF
        A8504CC9B6B5D3D5D4D1CECED1CECED1CECED1CECED1CECED1CECED1CECED3D4
        D4CBAEADA34D4EFF00FF919191919191585858B7B7B7D5D5D5CECECECECECECE
        CECECECECECECECECECECECECECED4D4D4B0B0B0565656919191}
      NumGlyphs = 2
      OnClick = ButtonSavePuzzleClick
    end
    object ButtonGenerateCode: TSpeedButton
      Left = 46
      Top = 2
      Width = 23
      Height = 22
      Hint = 'Generar C'#243'digo'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9EC4B4B4B4B4B4BD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E94B4B4B4B
        4B4BE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F0000DF0000BF2A4B4B4BD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DC0C0C0A5
        A5A54B4B4BE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F0000DF0000DF0000BF2A4B4B4BD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DC0C0C0C0
        C0C0A5A5A54B4B4BE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F0000DF0000DF0000DF0000BF2A4B4B4BD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DC0C0C0C0
        C0C0C0C0C0A5A5A54B4B4BE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DC0C0C0DC
        DCDCC0C0C0C0C0C0A5A5A54B4B4BE9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B
        4BD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DDDDDDDC0
        C0C0DCDCDCC0C0C0C0C0C0A5A5A54B4B4BE9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF
        2A4B4B4BD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DDDDDDDDD
        DDDDC0C0C0DCDCDCC0C0C0C0C0C0A5A5A54B4B4BE9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF
        00007F00D8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DE9E9E9DC
        DCDCDDDDDDC0C0C0DCDCDCC0C0C0C0C0C06D6D6DE9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F0055FFAA00FF0900FF0900FF2A00DF0055FFAA007F
        00D8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DE9E9E9DC
        DCDCDCDCDCDDDDDDC0C0C0E9E9E96D6D6DE9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F00AAFF2A00FF0900FF0900FF0900FF2A007F00D8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DE0E0E0DC
        DCDCDCDCDCDCDCDCDDDDDD6D6D6DE9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F00AAFF2A00FF0900FF09AAFF2A007F00D8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DE0E0E0DC
        DCDCDCDCDCE0E0E06D6D6DE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F00AAFFAA00FF09AAFF2A007F00D8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DEBEBEBDC
        DCDCE0E0E06D6D6DE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F00AAFFAAAAFFAA007F00D8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DEBEBEBEB
        EBEB6D6D6DE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC007F00AAFFAA007F00D8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DEBEBEB6D
        6D6DE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9EC007F00D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E96D6D6DE9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9}
      NumGlyphs = 2
      OnClick = ButtonGenerateCodeClick
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.puz'
    Filter = 'Archivos de puzzle (*.puz)|*.puz|Todos los archivos (*.*)|*.*'
    Left = 496
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.puz'
    Filter = 'Archivos de puzzle (*.puz)|*.puz|Todos los archivos (*.*)|*.*'
    Left = 528
  end
end
