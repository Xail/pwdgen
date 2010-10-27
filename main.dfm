object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1089#1087#1080#1089#1082#1086#1074' '#1087#1072#1088#1086#1083#1077#1081
  ClientHeight = 479
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMode: TPageControl
    Left = 0
    Top = 0
    Width = 389
    Height = 479
    ActivePage = tsGenerator
    Align = alClient
    TabOrder = 0
    object tsGenerator: TTabSheet
      Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088
      object grpUserChars: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 375
        Height = 266
        Align = alClient
        Caption = #1053#1072#1073#1086#1088' '#1089#1080#1084#1074#1086#1083#1086#1074
        TabOrder = 0
        object rbUseStandard: TRadioButton
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 365
          Height = 17
          Action = StdSymSetAction
          Align = alTop
          TabOrder = 0
        end
        object grdpnlCharsets: TGridPanel
          Left = 2
          Top = 38
          Width = 371
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          ColumnCollection = <
            item
              Value = 33.501013996262340000
            end
            item
              Value = 33.332815787772000000
            end
            item
              Value = 33.166170215965660000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = chkDigits
              Row = 0
            end
            item
              Column = 1
              Control = chkLatLow
              Row = 0
            end
            item
              Column = 2
              Control = chkLatUpp
              Row = 0
            end
            item
              Column = 0
              Control = chkSymbols
              Row = 1
            end
            item
              Column = 1
              Control = chkCyrLow
              Row = 1
            end
            item
              Column = 2
              Control = chkCyrUpp
              Row = 1
            end>
          RowCollection = <
            item
              Value = 50.000000000000000000
            end
            item
              Value = 50.000000000000000000
            end>
          TabOrder = 1
          object chkDigits: TCheckBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 118
            Height = 13
            Align = alTop
            Caption = '0-9'
            TabOrder = 0
            OnClick = chkDigitsClick
          end
          object chkLatLow: TCheckBox
            AlignWithMargins = True
            Left = 127
            Top = 3
            Width = 117
            Height = 13
            Align = alTop
            Caption = 'a-z'
            TabOrder = 1
            OnClick = chkDigitsClick
          end
          object chkLatUpp: TCheckBox
            AlignWithMargins = True
            Left = 250
            Top = 3
            Width = 118
            Height = 13
            Align = alTop
            Caption = 'A-Z'
            TabOrder = 2
            OnClick = chkDigitsClick
          end
          object chkSymbols: TCheckBox
            AlignWithMargins = True
            Left = 3
            Top = 23
            Width = 118
            Height = 14
            Align = alTop
            Caption = '!@#$...'
            TabOrder = 3
            OnClick = chkDigitsClick
          end
          object chkCyrLow: TCheckBox
            AlignWithMargins = True
            Left = 127
            Top = 23
            Width = 117
            Height = 14
            Align = alTop
            Caption = #1072'-'#1103
            TabOrder = 4
            OnClick = chkDigitsClick
          end
          object chkCyrUpp: TCheckBox
            AlignWithMargins = True
            Left = 250
            Top = 23
            Width = 118
            Height = 14
            Align = alTop
            Caption = #1040'-'#1071
            TabOrder = 5
            OnClick = chkDigitsClick
          end
        end
        object rbUseCustom: TRadioButton
          AlignWithMargins = True
          Left = 5
          Top = 82
          Width = 365
          Height = 17
          Action = UsrSymSetAction
          Align = alTop
          TabOrder = 2
        end
        object pnlSelectedChars: TPanel
          Left = 2
          Top = 102
          Width = 371
          Height = 162
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlSelectedChars'
          TabOrder = 3
          object mmoSelectedChars: TMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 365
            Height = 156
            Align = alClient
            Enabled = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object grpLength: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 336
        Width = 375
        Height = 54
        Align = alBottom
        Caption = #1044#1083#1080#1085#1072' '#1087#1072#1088#1086#1083#1077#1081
        TabOrder = 1
        object lblFrom: TLabel
          Left = 5
          Top = 24
          Width = 14
          Height = 13
          Caption = #1054#1090
        end
        object lblTo: TLabel
          Left = 93
          Top = 24
          Width = 13
          Height = 13
          Caption = #1076#1086
        end
        object lblChars: TLabel
          Left = 183
          Top = 24
          Width = 35
          Height = 13
          Caption = #1079#1085#1072#1082#1086#1074
        end
        object seMin: TSpinEdit
          Left = 24
          Top = 21
          Width = 57
          Height = 22
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 5
          OnChange = seMinChange
        end
        object seMax: TSpinEdit
          Left = 120
          Top = 21
          Width = 57
          Height = 22
          MaxValue = 100
          MinValue = 1
          TabOrder = 1
          Value = 8
          OnChange = seMaxChange
        end
      end
      object grpAdditional: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 275
        Width = 375
        Height = 55
        Align = alBottom
        Caption = #1044#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1082' '#1087#1072#1088#1086#1083#1102
        TabOrder = 2
        object lblPrefix: TLabel
          Left = 5
          Top = 24
          Width = 52
          Height = 13
          Caption = #1055#1088#1077#1092#1092#1080#1082#1089
        end
        object lblSuffix: TLabel
          Left = 190
          Top = 24
          Width = 46
          Height = 13
          Caption = #1057#1091#1092#1092#1080#1082#1089
        end
        object edtPrefix: TEdit
          Left = 63
          Top = 21
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edtSuffix: TEdit
          Left = 242
          Top = 21
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
      object grpButtons: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 396
        Width = 375
        Height = 52
        Align = alBottom
        Caption = #1042#1099#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
        TabOrder = 3
        object PathLabel: TLabel
          AlignWithMargins = True
          Left = 86
          Top = 18
          Width = 96
          Height = 29
          Align = alClient
          Layout = tlCenter
          ExplicitWidth = 3
          ExplicitHeight = 13
        end
        object Button1: TButton
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 75
          Height = 29
          Align = alLeft
          Caption = #1042#1099#1073#1088#1072#1090#1100
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 188
          Top = 18
          Width = 182
          Height = 29
          Align = alRight
          Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
          TabOrder = 1
          OnClick = Button2Click
        end
      end
    end
    object tsConverter: TTabSheet
      Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100
      ImageIndex = 1
      object grpDictionary: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 375
        Height = 50
        Align = alTop
        Caption = #1057#1083#1086#1074#1072#1088#1100
        TabOrder = 0
        object DicLabel: TLabel
          AlignWithMargins = True
          Left = 86
          Top = 18
          Width = 284
          Height = 27
          Align = alClient
          Layout = tlCenter
          ExplicitWidth = 3
          ExplicitHeight = 13
        end
        object Button3: TButton
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 75
          Height = 27
          Align = alLeft
          Caption = #1042#1099#1073#1088#1072#1090#1100
          TabOrder = 0
          OnClick = Button3Click
        end
      end
      object grpParams: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 59
        Width = 375
        Height = 43
        Align = alTop
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        TabOrder = 1
        object Label6: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 18
          Height = 20
          Align = alLeft
          Caption = 'UIN'
          Layout = tlCenter
          ExplicitHeight = 13
        end
        object UINEdit: TEdit
          AlignWithMargins = True
          Left = 29
          Top = 18
          Width = 341
          Height = 20
          Align = alClient
          MaxLength = 9
          NumbersOnly = True
          TabOrder = 0
          ExplicitHeight = 21
        end
      end
      object grpProcess: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 108
        Width = 375
        Height = 340
        Align = alClient
        Caption = #1055#1088#1086#1094#1077#1089#1089
        TabOrder = 2
        object Button4: TButton
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 365
          Height = 317
          Align = alClient
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' UIN'
          TabOrder = 0
          OnClick = Button4Click
        end
      end
    end
  end
  object actlst: TActionList
    Left = 464
    Top = 152
    object StdSymSetAction: TAction
      Caption = #1057#1090#1072#1085#1076#1072#1088#1090#1085#1099#1077' '#1085#1072#1073#1086#1088#1099' '#1089#1080#1084#1074#1086#1083#1086#1074
      OnExecute = StdSymSetActionExecute
    end
    object UsrSymSetAction: TAction
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1081' '#1085#1072#1073#1086#1088' '#1089#1080#1084#1074#1086#1083#1086#1074
      OnExecute = UsrSymSetActionExecute
    end
  end
end
