Class {
	#name : #ChinookAlbum,
	#superclass : #ChinookEntity,
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookAlbum >> artistId [
	^ self rawData at: 'ArtistId'
]

{ #category : #'as yet unclassified' }
ChinookAlbum >> name [
	^ self rawData at: 'Title'
]
