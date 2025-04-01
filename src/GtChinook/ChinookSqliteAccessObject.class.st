Class {
	#name : #ChinookSqliteAccessObject,
	#superclass : #Object,
	#instVars : [
		'databaseConfig',
		'results'
	],
	#category : #'GtChinook-Access'
}

{ #category : #accessing }
ChinookSqliteAccessObject >> databaseConfig [
	databaseConfig ifNil: [self error: 'databaseConfig is required to be set'].
	^ databaseConfig
]

{ #category : #accessing }
ChinookSqliteAccessObject >> databaseConfig: anObject [
	databaseConfig := anObject
]

{ #category : #'as yet unclassified' }
ChinookSqliteAccessObject >> exec: aCommand [
	| connection cursor |
	connection := SQLite3Connection on: self databaseConfig sqlitePath.
	connection open.
	cursor := connection execute: aCommand.
	results := cursor rows
]

{ #category : #'as yet unclassified' }
ChinookSqliteAccessObject >> query: sqlString [
	| structuredResults|.
	structuredResults := self queryWithStructuredResults: sqlString.
	^ structuredResults
]

{ #category : #'as yet unclassified' }
ChinookSqliteAccessObject >> queryWithStructuredResults: sqlString [
	| structuredResults |
	self exec: sqlString.
	structuredResults := results collect: #asDictionary.
	^ structuredResults
]
