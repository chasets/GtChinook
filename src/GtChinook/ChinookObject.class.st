Class {
	#name : #ChinookObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookObject >> populate [
	| data |
	data := self accessObject retrieve.
	self rawData: data
]

{ #category : #accessing }
ChinookObject >> rawData [
	^ rawData ifNil: [ Dictionary new ]
]

{ #category : #accessing }
ChinookObject >> rawData: dictionary [
	rawData := dictionary
]
