Class {
	#name : #ChinookSqliteDatabaseConfig,
	#superclass : #Object,
	#category : #'GtChinook-Config'
}

{ #category : #accessing }
ChinookSqliteDatabaseConfig >> sqlitePath [
	^ ChinookDataRepo new sqliteFile
]
