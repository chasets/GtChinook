Class {
	#name : #ChinookObject,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'config',
		'accessObject'
	],
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookObject >> accessObject [
	"find the subclass of the accessClassname that matches the group class (e.g., AwsEc2Instances) of the current class"

	| accessClass databaseConfig |
	accessObject
		ifNil: [ accessClass := self config accessClassname asClass allSubclasses
					detect: [ :item | item groupClassname = self className ].
			databaseConfig := [ self config databaseConfig ]
					onErrorDo: [ ^ accessClass new ].
			accessObject := accessClass new databaseConfig: databaseConfig ].
	^ accessObject
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
		view: #gtRawFor:
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
