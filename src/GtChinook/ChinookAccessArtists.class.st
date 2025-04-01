Class {
	#name : #ChinookAccessArtists,
	#superclass : #ChinookAccessObject,
	#category : #'GtChinook-Access'
}

{ #category : #'as yet unclassified' }
ChinookAccessArtists >> retrieve [
	^ self retrieveFor: 'Artist'
]
