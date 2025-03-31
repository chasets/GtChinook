Class {
	#name : #ChinookAlbums,
	#superclass : #ChinookGroup,
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookAlbums >> items [
	^ (rawData collect: [ :each | ChinookAlbum new rawData: each ]) sorted
]
