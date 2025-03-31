Class {
	#name : #ChinookAccessObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GtChinook-Access'
}

{ #category : #'as yet unclassified' }
ChinookAccessObject >> initialize [
	| rootDirectory repository jsonFile |
	super initialize.
	rootDirectory := 'chinook-data' asFileReference.
	rootDirectory ensureDeleteAll.
	repository := IceRepositoryCreator
			fromUrl: 'git@github.com:lerocha/chinook-database.git'
			to: rootDirectory.
	jsonFile := rootDirectory / 'ChinookDatabase' / 'DataSources' / 'ChinookData.json'.
	rawData := STONJSON fromString: jsonFile contents.
]

{ #category : #accessing }
ChinookAccessObject >> rawData [
	^ rawData
]

{ #category : #accessing }
ChinookAccessObject >> rawData: anObject [
	rawData := anObject
]

{ #category : #'as yet unclassified' }
ChinookAccessObject >> retrieve [
	self subclassResponsibility
]

{ #category : #accessing }
ChinookAccessObject >> retrieveFor: aKey [
	self rawData at: aKey 
]
