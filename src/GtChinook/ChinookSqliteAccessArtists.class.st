Class {
	#name : #ChinookSqliteAccessArtists,
	#superclass : #ChinookSqliteAccessObject,
	#category : #'GtChinook-Access'
}

{ #category : #'as yet unclassified' }
ChinookSqliteAccessArtists class >> groupClassname [
	^ 'ChinookArtists'
]

{ #category : #accessing }
ChinookSqliteAccessArtists >> retrieve [
	^ self query: 'select * from artist'
]
