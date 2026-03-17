Class {
	#name : 'ChinookArtists',
	#superclass : 'ChinookGroup',
	#category : 'GtChinook-Core',
	#package : 'GtChinook',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
ChinookArtists >> items [
	^ (rawData collect: [ :each | ChinookArtist new config: self config; rawData: each ]) sorted
]
