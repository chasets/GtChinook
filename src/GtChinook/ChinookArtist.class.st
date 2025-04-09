Class {
	#name : #ChinookArtist,
	#superclass : #ChinookEntity,
	#category : #'GtChinook-Core'
}

{ #category : #'as yet unclassified' }
ChinookArtist >> albums [
	^ ChinookAlbums new config: self config; populate; forArtist: self artistId
]

{ #category : #'as yet unclassified' }
ChinookArtist >> artistId [
	^ self rawData at: 'ArtistId'
]

{ #category : #'as yet unclassified' }
ChinookArtist >> gtAlbumsFor: aView [
	<gtView>
	^ aView forward
		title: 'Albums';
		priority: 15;
		object: [ self albums ];
		view: #gtItemsFor:
]

{ #category : #'as yet unclassified' }
ChinookArtist >> name [
	^ self rawData at: 'Name'
]
