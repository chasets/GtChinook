Class {
	#name : #ChinookAccessObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GtChinook-Access'
}

{ #category : #accessing }
ChinookAccessObject >> rawData [
	rawData ifNil: [rawData := ChinookDataJson new rawData].
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
	^ self rawData at: aKey 
]
