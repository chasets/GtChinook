Class {
	#name : #ChinookAlbum,
	#superclass : #ChinookEntity,
	#category : #'GtChinook-Coree'
}

{ #category : #'as yet unclassified' }
ChinookAlbum >> name [
	^ self rawData at: 'Title'
]
