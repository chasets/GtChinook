Class {
	#name : 'ChinookSqliteAccessArtists',
	#superclass : 'ChinookSqliteAccessObject',
	#category : 'GtChinook-Access',
	#package : 'GtChinook',
	#tag : 'Access'
}

{ #category : 'as yet unclassified' }
ChinookSqliteAccessArtists class >> groupClassname [
	^ 'ChinookArtists'
]

{ #category : 'accessing' }
ChinookSqliteAccessArtists >> retrieve [
	^ self query: 'select * from artist'
]
