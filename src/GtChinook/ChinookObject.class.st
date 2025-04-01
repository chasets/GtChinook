Class {
	#name : #ChinookObject,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'config'
	],
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookObject >> accessObject [
	"find the subclass of the accessClassname that matches the group class (e.g., AwsEc2Instances) of the current class"
	| accessClass |
	accessClass := self config accessClassname asClass allSubclasses detect: [:item | item groupClassname = self className].
	^ accessClass new 
]

{ #category : #accessing }
ChinookObject >> config [
	config ifNil: [config := ChinookConfig new].
	^ config
]

{ #category : #accessing }
ChinookObject >> config: anObject [
	config := anObject
]

{ #category : #'as yet unclassified' }
ChinookObject >> gtAccessObjectFor: aView [
	<gtView>
	^ aView forward
		title: 'Access Object';
		priority: 20;
		object: [ self accessObject ];
		view: #gtMetaFor:
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
