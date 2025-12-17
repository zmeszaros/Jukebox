object DM: TDM
  OldCreateOrder = False
  Left = 173
  Top = 131
  Height = 375
  Width = 544
  object SzamokDataSource: TDataSource
    DataSet = SQLSzamok
    Left = 40
    Top = 24
  end
  object AlbumokDataSource: TDataSource
    DataSet = AlbumokTable
    Left = 40
    Top = 80
  end
  object SzamokTable: TTable
    AfterPost = SzamokTableAfterPost
    AfterDelete = SzamokTableAfterDelete
    DatabaseName = 'Music'
    IndexName = 'ALBUMSZAM'
    TableName = 'Szamok.dbf'
    TableType = ttDBase
    Left = 144
    Top = 24
  end
  object AlbumokTable: TTable
    AfterPost = AlbumokTableAfterPost
    AfterDelete = AlbumokTableAfterDelete
    DatabaseName = 'Music'
    IndexName = 'SORSZAM'
    TableName = 'Albumok.dbf'
    TableType = ttDBase
    Left = 144
    Top = 80
  end
  object SQLSzamok: TQuery
    DatabaseName = 'Music'
    Left = 40
    Top = 136
  end
end
