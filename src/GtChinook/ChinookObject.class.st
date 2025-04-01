Class {
	#name : #ChinookObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookObject >> accessObject [
	"find the subclass of the accessClassname that matches the group class (e.g., AwsEc2Instances) of the current class"
	| accessClass |
	accessClass := 'ChinookAccessObject' asClass allSubclasses detect: [:item | item groupClassname = self className].
	^ accessClass new 
]

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
