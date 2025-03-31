Class {
	#name : #ChinookEntity,
	#superclass : #ChinookObject,
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookEntity >> <= other [
	^ self name <= other name
]

{ #category : #'as yet unclassified' }
ChinookEntity >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		priority: 10;
		items: [self rawData associations];
		column: 'Key' text: #key;
		column: 'Value' text: #value.
]

{ #category : #'as yet unclassified' }
ChinookEntity >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Raw data';
		priority: 60;
		items: [ self rawData isDictionary 
			ifTrue: [ self rawData associations sorted: [:a :b | a key < b key ] ]
			ifFalse: [ self rawData ] ];
		column: 'Property' text: #key; 
		column: 'Value' text: #value
]

{ #category : #'as yet unclassified' }
ChinookEntity >> name [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
ChinookEntity >> printOn: aStream [
	aStream nextPutAll: self name.
]
