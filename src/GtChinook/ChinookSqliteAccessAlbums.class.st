Class {
	#name : #ChinookSqliteAccessAlbums,
	#superclass : #ChinookSqliteAccessObject,
	#category : #'GtChinook-Access'
}

{ #category : #'as yet unclassified' }
ChinookSqliteAccessAlbums class >> groupClassname [
	^ 'ChinookAlbums'
]

{ #category : #accessing }
ChinookSqliteAccessAlbums >> retrieve [
	^ self query: 'select * from album'
]
