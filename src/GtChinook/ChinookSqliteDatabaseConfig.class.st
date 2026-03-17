Class {
	#name : 'ChinookSqliteDatabaseConfig',
	#superclass : 'Object',
	#category : 'GtChinook-Config',
	#package : 'GtChinook',
	#tag : 'Config'
}

{ #category : 'accessing' }
ChinookSqliteDatabaseConfig >> sqlitePath [
	^ ChinookDataRepo new sqliteFile
]
