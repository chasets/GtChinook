Class {
	#name : #ChinookAccessObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'GtChinook-Access'
}

{ #category : #'as yet unclassified' }
ChinookAccessObject class >> new [
	^ self uniqueInstance
]

{ #category : #'as yet unclassified' }
ChinookAccessObject class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new resetData]
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
ChinookAccessObject >> resetData [
	| rootDirectory repository jsonFile |
	rootDirectory := 'chinook-data' asFileReference.
		rootDirectory ensureDeleteAll.
		repository := IceRepositoryCreator
				fromUrl: 'git@github.com:lerocha/chinook-database.git'
				to: rootDirectory.
		jsonFile := rootDirectory / 'ChinookDatabase' / 'DataSources' / 'ChinookData.json'.
		rawData := STONJSON fromString: jsonFile contents.
]

{ #category : #'as yet unclassified' }
ChinookAccessObject >> retrieve [
	self subclassResponsibility
]

{ #category : #accessing }
ChinookAccessObject >> retrieveFor: aKey [
	^ self rawData at: aKey 
]
