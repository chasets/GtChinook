Class {
	#name : #ChinookDataJson,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'rootDirectory'
	],
	#category : #'GtChinook-Accesss'
}

{ #category : #accessing }
ChinookDataJson >> exists [
	| rootDirectory |
	rootDirectory := 'chinook-data' asFileReference.
	^ rootDirectory exists
]

{ #category : #accessing }
ChinookDataJson >> rawData [
	| jsonFile |
	rawData
		ifNil: [ self exists ifFalse: [ self resetData ].
			jsonFile := self rootDirectory / 'ChinookDatabase' / 'DataSources'
					/ 'ChinookData.json'.
			rawData := STONJSON fromString: jsonFile contents ].
	^ rawData
]

{ #category : #accessing }
ChinookDataJson >> rawData: anObject [
	rawData := anObject
]

{ #category : #'as yet unclassified' }
ChinookDataJson >> resetData [
	| repository |
	self rootDirectory ensureDeleteAll.
	repository := IceRepositoryCreator
			fromUrl: 'git@github.com:lerocha/chinook-database.git'
			to: self rootDirectory.
	^ self rootDirectory
]

{ #category : #accessing }
ChinookDataJson >> rootDirectory [
	rootDirectory ifNil: [rootDirectory := 'chinook-data' asFileReference].
	^ rootDirectory
]

{ #category : #accessing }
ChinookDataJson >> rootDirectory: anObject [
	rootDirectory := anObject
]
