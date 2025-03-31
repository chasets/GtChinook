Class {
	#name : #ChinookObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GtChinook-Core'
}

{ #category : #accessing }
ChinookObject >> rawData [
	^ rawData ifNil: [ Dictionary new ]
]

{ #category : #accessing }
ChinookObject >> rawData: dictionary [
	rawData := dictionary
]
