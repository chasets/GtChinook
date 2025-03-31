Class {
	#name : #ChinookAlbums,
	#superclass : #ChinookGroup,
	#category : #'GtChinook-Core'
}

{ #category : #accessing }
ChinookAlbums >> accessObject [
	^ ChinookAccessAlbums
]

{ #category : #'as yet unclassified' }
ChinookAlbums >> items [
	^ (rawData collect: [ :each | ChinookAlbum new rawData: each ]) sorted
]
