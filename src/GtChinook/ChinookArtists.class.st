Class {
	#name : #ChinookArtists,
	#superclass : #ChinookGroup,
	#category : #'GtChinook-Core'
}

{ #category : #accessing }
ChinookArtists >> accessObject [
	^ ChinookAccessArtists new
]

{ #category : #'as yet unclassified' }
ChinookArtists >> items [
	^ (rawData collect: [ :each | ChinookArtist new rawData: each ]) sorted
]
