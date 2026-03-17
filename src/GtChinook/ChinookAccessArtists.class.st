Class {
	#name : 'ChinookAccessArtists',
	#superclass : 'ChinookAccessObject',
	#category : 'GtChinook-Access',
	#package : 'GtChinook',
	#tag : 'Access'
}

{ #category : 'as yet unclassified' }
ChinookAccessArtists class >> groupClassname [
	^ 'ChinookArtists'
]

{ #category : 'as yet unclassified' }
ChinookAccessArtists >> retrieve [
	^ self retrieveFor: 'Artist'
]
