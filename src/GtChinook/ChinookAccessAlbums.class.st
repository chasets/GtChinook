Class {
	#name : 'ChinookAccessAlbums',
	#superclass : 'ChinookAccessObject',
	#category : 'GtChinook-Access',
	#package : 'GtChinook',
	#tag : 'Access'
}

{ #category : 'as yet unclassified' }
ChinookAccessAlbums class >> groupClassname [
	^ 'ChinookAlbums'
]

{ #category : 'as yet unclassified' }
ChinookAccessAlbums >> retrieve [
	^ self retrieveFor: 'Album'
]
