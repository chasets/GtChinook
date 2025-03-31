Class {
	#name : #ChinookGroup,
	#superclass : #ChinookObject,
	#traits : 'TGtGroup',
	#classTraits : 'TGtGroup classTrait',
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookGroup >> gtItemsFor: aView [
	<gtView>
	^ aView list 
		title: 'Items';
		priority: 1;
		items: [self items]
]

{ #category : #'as yet unclassified' }
ChinookGroup >> gtRawDataFor: aView [
	<gtView>
	^ aView list
		title: 'Raw data';
		items: [ self rawData ]
]

{ #category : #testing }
ChinookGroup >> isEmptyOrNil [
	^ self isEmpty
]

{ #category : #printing }
ChinookGroup >> printOn: aStream [
	| itemCount |
	itemCount := self rawData isEmptyOrNil 
					ifTrue: [0] 
					ifFalse: [self items size] .
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: itemCount asString.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
ChinookGroup >> sorted [
	^ self asOrderedCollection sorted
]
