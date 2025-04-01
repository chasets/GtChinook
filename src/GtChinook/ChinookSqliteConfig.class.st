Class {
	#name : #ChinookSqliteConfig,
	#superclass : #ChinookConfig,
	#instVars : [
		'databaseConfig'
	],
	#category : #'GtChinook-Config'
}

{ #category : #'as yet unclassified' }
ChinookSqliteConfig >> accessClassname [
	^ 'ChinookSqliteAccessObject'
]

{ #category : #accessing }
ChinookSqliteConfig >> databaseConfig [
	^ databaseConfig
]

{ #category : #accessing }
ChinookSqliteConfig >> databaseConfig: anObject [
	databaseConfig := anObject
]
