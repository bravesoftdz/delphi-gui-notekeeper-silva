object Form1: TForm1
  Left = 235
  Top = 251
  Width = 701
  Height = 506
  ActiveControl = tree
  Caption = 'Silva'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ScreenSnap = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 185
    Top = 0
    Height = 441
    AutoSnap = False
    Color = clBtnFace
    MinSize = 100
    ParentColor = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 441
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 1
    object Splitter3: TSplitter
      Left = 1
      Top = 274
      Width = 183
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object list: TListView
      Left = 1
      Top = 277
      Width = 183
      Height = 163
      Align = alBottom
      Columns = <
        item
          AutoSize = True
          Caption = 'Recent'
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnEnter = listEnter
      OnKeyDown = listKeyDown
      OnSelectItem = listSelectItem
    end
    object tree: TTreeView
      Left = 1
      Top = 1
      Width = 183
      Height = 273
      Align = alClient
      Constraints.MinWidth = 100
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Pitch = fpVariable
      Font.Style = []
      HideSelection = False
      Images = ImageList1
      Indent = 19
      ParentFont = False
      ReadOnly = True
      SortType = stText
      TabOrder = 1
      OnChange = treeChange
      OnChanging = treeChanging
      OnCustomDrawItem = treeCustomDrawItem
      OnExpanding = treeExpanding
      OnKeyDown = treeKeyDown
    end
  end
  object Panel1: TPanel
    Left = 188
    Top = 0
    Width = 505
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    Constraints.MinWidth = 100
    TabOrder = 0
    object edit: TRichEdit
      Left = 0
      Top = 0
      Width = 505
      Height = 441
      TabStop = False
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Sheldon'
      Font.Style = []
      Lines.Strings = (
        'edit')
      ParentFont = False
      TabOrder = 0
      WantTabs = True
      OnChange = editChange
      OnKeyDown = editKeyDown
      OnKeyPress = editKeyPress
    end
  end
  object status: TStatusBar
    Left = 0
    Top = 441
    Width = 693
    Height = 19
    Panels = <>
  end
  object ImageList1: TImageList
    AllocBy = 8
    Left = 640
    Top = 368
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800080808000808
      0800080808000808080008080800080808000808080008080800080808000808
      0800080808000808080008080800000000000000000000000000000000000000
      0000080808000808080008080800080808000808080008080800080808000808
      0800080808000808080008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800BDC6C600BDC6
      C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6
      C600BDC6C600BDC6C60008080800000000000000000000000000000000000000
      000008080800BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6
      C600BDC6C600BDC6C60008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800C6CECE00C6CE
      CE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CE
      CE00C6CECE00C6CECE0008080800000000000000000000000000000000000000
      000008080800C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CE
      CE00C6CECE00C6CECE0008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800CED6D600CED6
      D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600CED6D600CED6D60008080800000000000000000000000000000000000000
      000008080800C6CECE0018181800181818001818180018181800C6CECE00C6CE
      CE00C6CECE00C6CECE0008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0008080800000000000000000000000000000000000000
      000008080800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600CED6D600CED6D60008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E70008080800000000000000000000000000000000000000
      000008080800D6DED60039393900393939003939390039393900393939003939
      390039393900D6DED60008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0008080800000000000000000000000000000000000000
      000008080800DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800947308009473
      080094730800946B080094730800946B0800947308009473080094730800946B
      0800946B08009473080008080800000000000000000000000000000000000000
      000008080800DEE7E7005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00DEE7E70008080800000000000000000000000000000000000000
      0000DECE73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800A5840800A584
      0800A5840800A5840800A5840800A5840800A5840800A5840800A5840800A584
      0800A5840800A584080008080800000000000000000000000000000000000000
      000008080800E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E7000808080000000000000000000000000000000000DECE
      7300DECE7300B59C100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800B59C1000B59C
      1000B59C1000DECE7300DECE7300DECE7300DECE7300DECE7300DECE7300DECE
      7300DECE7300DECE730008080800000000000000000000000000000000000000
      000008080800EFEFEF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00EFEFEF0008080800000000000000000000000000000000000000
      0000B59C10000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800DECE7300DECE
      7300DECE73000808080008080800080808000808080008080800080808000808
      0800000000000808080008080800000000000000000000000000000000000000
      000008080800EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800080808000808
      080008080800080808000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008080800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000080808000808080008080800080808000808080008080800080808000808
      0800080808000808080008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      0800080808000808080008080800080808000808080008080800080808000808
      0800080808000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000008080800080808000808
      0800080808000808080008080800080808000808080008080800080808000808
      0800080808000808080008080800000000000000000000000000000000000808
      0800BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6
      C600BDC6C6000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000008080800BDC6C600BDC6
      C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6
      C600BDC6C600BDC6C60008080800000000000000000000000000000000000808
      0800C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CE
      CE00C6CECE000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800C6CECE00C6CE
      CE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CE
      CE00C6CECE00C6CECE0008080800000000000000000008080800080808000808
      080008080800080808000808080008080800C6CECE00C6CECE00C6CECE00C6CE
      CE00C6CECE000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000008080800CED6D600CED6
      D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600CED6D600CED6D60008080800000000000000000008080800DECE7300946B
      0800946B0800946B0800946B080008080800CED6D600CED6D600CED6D600CED6
      D600CED6D6000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0008080800000000000000000008080800DECE73009C7B
      08009C7B08009C7B08009C7B080008080800D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D60008080800000000000000000000000000946B08009C730800C6CE
      CE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CE
      CE00C6CECE00DECE7300946B08000000000000000000946B0800946B0800C6CE
      CE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CECE00C6CE
      CE00C6CECE00DECE7300946B0800000000000000000008080800E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E70008080800000000000000000008080800DECE7300AD94
      0800AD940800AD940800AD94080008080800D6DEDE00D6DEDE00D6DEDE00D6DE
      DE00D6DEDE00080808000000000000000000000000009C7308009C7308000808
      0800736B6B00736B6B00736B6B00736B6B00736B6B00736B6B00736B6B006B6B
      6B00CED6D600DECE73009C73080000000000000000009C730800946B08000808
      0800736B6B00736B6B00736B6B00736B6B00736B6B00736B6B00736B6B006B6B
      6B00CED6D600DECE7300946B0800000000000000000008080800EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0008080800000000000000000008080800DECE7300BDA5
      1000BDA51000BDA51000BDA5100008080800DEE7E700DEE7E700DEE7E700DEE7
      E700DEDEE70008080800000000000000000000000000A58408009C7308003939
      39003939390039393900423931004A4231004242310042393900393939003939
      3900D6DEDE00DECE7300A58408000000000000000000A5840800946B08003939
      39003939390039393900423931004A4231004242310042393900393939003939
      3900D6DEDE00DECE7300946B0800000000000000000008080800947308009473
      080094730800946B080094730800946B0800947308009473080094730800946B
      0800946B08009473080008080800000000000000000008080800DECE7300DECE
      7300DECE7300DECE7300DECE730008080800E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E7000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700DECE7300AD9408000000000000000000AD940800946B0800E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700DECE7300946B0800000000000000000008080800A5840800A584
      0800A5840800A5840800A5840800A5840800A5840800A5840800A5840800A584
      0800A5840800A584080008080800000000000000000008080800080808000808
      080008080800080808000808080008080800E7EFEF00E7EFEF00E7EFEF00E7EF
      EF00E7EFEF0008080800000000000000000000000000524AEF004A4AEF000000
      9C006B6BFF002118CE0000000000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DECE7300B5A510000000000000000000BDA51000946B0800EFEF
      EF0010FF5A0000000000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DECE7300946B0800000000000000000008080800B59C1000B59C
      1000B59C1000DECE7300DECE7300DECE7300DECE7300DECE7300DECE7300DECE
      7300DECE7300DECE730008080800000000000000000000000000000000000808
      0800EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF000808080000000000000000000000000000000000524AEF004242
      E7003939DE0000000000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DECE7300BDAD10000000000000000000BDAD1000946B0800EFEF
      EF000000000000000000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DECE7300946B0800000000000000000008080800DECE7300DECE
      7300DECE73000808080008080800080808000808080008080800080808000808
      0800080808000808080008080800000000000000000000000000000000000808
      0800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0008080800000000000000000000000000000000005A5AFF00524A
      EF004A4AEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800080808000808
      0800080808000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      0800080808000808080008080800080808000808080008080800080808000808
      080008080800080808000000000000000000000000006B6BFF006B6BFF005A5A
      FF005252EF004A4AEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      8001F001FFFF00008001F001FFFF00008001F001FFFF00008001F001FFFF0000
      8001F001FFFF00008001F001FFFF00008001F001E3FF00008001F001C1FF0000
      8001F001C1FF00008001F001C1FF00008001F001E3FF00008207F001FFFF0000
      FF0FF001FFFF0000FF9FFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFC3FFC3FFFFF
      E003C813C8138001E003C813C8138001E003FC3FFC3F80018003FC3FFC3F8001
      8003000000008001800300000000800180030000000080018003000000008001
      80030000000080018003000000008001E003000000008001E0030000000083FF
      E00301FFFFFFFFFFFFFF01FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object savedialog: TSaveDialog
    Left = 640
    Top = 332
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 640
    Top = 408
    object File1: TMenuItem
      Caption = '&File'
      OnClick = SaveLeafExecute
      object Open1: TMenuItem
        Caption = '&Link Root'
        ImageIndex = 2
        ShortCut = 16463
        OnClick = PlantRootExecute
      end
      object KillRoot1: TMenuItem
        Caption = '&Unlink Root'
        ImageIndex = 1
        ShortCut = 16459
        OnClick = KillRootExecute
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Save1: TMenuItem
        Caption = '&Save Leaf'
        ImageIndex = 5
        ShortCut = 16467
      end
      object RevertLeaf1: TMenuItem
        Caption = '&Revert Leaf'
        ShortCut = 16466
        OnClick = RevertLeafExecute
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        ShortCut = 32883
        OnClick = Exit1Click
      end
    end
    object Node1: TMenuItem
      Caption = '&Edit'
      object RenameNode1: TMenuItem
        Caption = '&Rename'
        ShortCut = 113
        OnClick = RenameNodeExecute
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object NewBranch1: TMenuItem
        Caption = 'New &Branch'
        ImageIndex = 3
        ShortCut = 114
        OnClick = NewBranchExecute
      end
      object NewLeaf1: TMenuItem
        Caption = 'New &Leaf'
        ImageIndex = 5
        ShortCut = 115
        OnClick = NewLeafExecute
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object RefreshTree1: TMenuItem
        Caption = 'Re&fresh'
        ShortCut = 116
        OnClick = RefreshTreeExecute
      end
      object imestamp1: TMenuItem
        Caption = '&Timestamp'
        ShortCut = 117
        OnClick = TimestampExecute
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object ExpandAll1: TMenuItem
        Caption = 'E&xpand All'
        OnClick = ExpandAll1Click
      end
      object CollapseAll1: TMenuItem
        Caption = '&Collapse All'
        OnClick = CollapseAll1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object DeleteNode1: TMenuItem
        Caption = '&Delete'
        ShortCut = 120
        OnClick = DeleteNodeExecute
      end
    end
  end
  object TrayIcon: TCoolTrayIcon
    CycleInterval = 0
    Icon.Data = {
      0000010001001010000001000800680500001600000028000000100000002000
      000001000800000000000001000000000000000000000001000000010000FFFF
      FF00EBEDED00E4E6E600DFE2E200DCE0DF00DCDFE000D9DDDD00D5DADA00CCD2
      D200CDCECE00C3CBCB008ED4FF00B6B6B600C2AE12009E7D0C006BC6FF000062
      96000E0E0E0000000000DCCF7100C2AE1200B39A1000B39A0F009E7D0C008F69
      0A006BC6FF0048B8FF00006296004A4A4A001A1A1A000E0E0E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF001212
      1212121212121212111111111212121212121212121212110C09090911121212
      121212121212110909101009091112121212121212121109100F0F1009111212
      0A0A0A0A0A0A1109100B0F100911121209120A0A090911090910100909111212
      0808080808080811090909091112121207121212121207071111111112121212
      0304040404060506060504041212121202121212121212020202020212121212
      0101010101010101010101011212121201120101121212120101010112121212
      000000000000000000000000121212120E0E0E0E0E0E0E0E0E0E0E0E12121212
      0D0D0D0D0D0D0D0D0D0D0D0D121212121212121212121212121212121212FFC3
      0000FF810000FF00000080000000800000008000000080010000800100008001
      000080010000800100008001000080010000800100008001000080010000}
    IconVisible = True
    IconIndex = 0
    PopupMenu = PopupMenu1
    MinimizeToTray = True
    OnClick = TrayIconClick
    Left = 644
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 644
    Top = 264
    object miTrayIconShowWindow: TMenuItem
      Caption = '&Show Window'
      OnClick = zTrayShowWindowExecute
    end
    object miTrayIconMinimize: TMenuItem
      Caption = '&Minimize'
      ShortCut = 16499
      OnClick = zFileMinimizeExecute
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miTrayIconExit: TMenuItem
      Caption = 'E&xit'
      ShortCut = 32883
      OnClick = zExit
    end
  end
  object adpInstanceControl1: TadpInstanceControl
    Enabled = True
    MaxInstances = 1
    Left = 644
    Top = 8
  end
end