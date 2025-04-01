Class {
	#name : #ChinookArtists,
	#superclass : #ChinookGroup,
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookArtists >> items [
	^ (rawData collect: [ :each | ChinookArtist new rawData: each ]) sorted
]
