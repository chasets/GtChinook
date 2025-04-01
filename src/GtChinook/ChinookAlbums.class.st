Class {
	#name : #ChinookAlbums,
	#superclass : #ChinookGroup,
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookAlbums >> forArtist: anArtistId [
	^ self items select: [:i | i artistId = anArtistId]
]

{ #category : #'as yet unclassified' }
ChinookAlbums >> items [
	^ (rawData collect: [ :each | ChinookAlbum new rawData: each ]) sorted
]
