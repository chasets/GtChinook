Class {
	#name : #ChinookAccessAlbums,
	#superclass : #ChinookAccessObject,
	#category : #'GtChinook-Access'
}

{ #category : #'as yet unclassified' }
ChinookAccessAlbums class >> groupClassname [
	^ 'ChinookAlbums'
]

{ #category : #'as yet unclassified' }
ChinookAccessAlbums >> retrieve [
	^ self retrieveFor: 'Album'
]
