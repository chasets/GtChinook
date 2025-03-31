Class {
	#name : #ChinookArtist,
	#superclass : #ChinookEntity,
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookArtist >> name [
	^ self rawData at: 'Name'
]
