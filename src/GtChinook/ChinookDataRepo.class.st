Class {
	#name : #ChinookDataRepo,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'rootDirectory'
	],
	#category : #'GtChinook-Access'
}

{ #category : #accessing }
ChinookDataRepo >> exists [
	| rootDirectory |
	rootDirectory := 'chinook-data' asFileReference.
	^ rootDirectory exists
]

{ #category : #accessing }
ChinookDataRepo >> rawData [
	| jsonFile |
	rawData
		ifNil: [ self exists ifFalse: [ self resetData ].
			jsonFile := self rootDirectory / 'ChinookDatabase' / 'DataSources'
					/ 'ChinookData.json'.
			rawData := STONJSON fromString: jsonFile contents ].
	^ rawData
]

{ #category : #accessing }
ChinookDataRepo >> rawData: anObject [
	rawData := anObject
]

{ #category : #'as yet unclassified' }
ChinookDataRepo >> resetData [
	| repository |
	self rootDirectory ensureDeleteAll.
	repository := IceRepositoryCreator
			fromUrl: 'git@github.com:lerocha/chinook-database.git'
			to: self rootDirectory.
	^ self rootDirectory
]

{ #category : #accessing }
ChinookDataRepo >> rootDirectory [
	rootDirectory ifNil: [rootDirectory := 'chinook-data' asFileReference].
	^ rootDirectory
]

{ #category : #accessing }
ChinookDataRepo >> rootDirectory: anObject [
	rootDirectory := anObject
]

{ #category : #'as yet unclassified' }
ChinookDataRepo >> sqliteFile [
	^ (self rootDirectory / 'ChinookDatabase' / 'DataSources' / 'Chinook_sqlite.sqlite') pathString
]
