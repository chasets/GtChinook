Class {
	#name : #ChinookAlbum,
	#superclass : #ChinookEntity,
	#instVars : [
		'albumCover'
	],
	#category : #'GtChinook-Core'
}

{ #category : #util }
ChinookAlbum >> albumCover [
	| releaseId imageUrl image |
	albumCover ifNil: [
	releaseId := [self albumReleaseId] onErrorDo: [^ self placeholderImage].
	imageUrl := [self albumCoverImageUrlFor: releaseId] onErrorDo: [^ self placeholderImage].
	image := [ZnEasy getJpeg: imageUrl] onErrorDo: [^ self placeholderImage].
	albumCover := image].
	^ albumCover
	
]

{ #category : #util }
ChinookAlbum >> albumCoverImageUrlFor: aReleaseId [ 
| coverUrl coverResult imageUrl |
	coverUrl := 'http://coverartarchive.org/release' asZnUrl addPathSegment: aReleaseId.
	 coverResult := ZnClient new forJsonREST get: coverUrl.
	 imageUrl := (coverResult at: 'images') first at: 'thumbnails' at: 'small'.
	 ^ imageUrl
]

{ #category : #util }
ChinookAlbum >> albumReleaseId [
	 | queryParams searchUrl searchResult releaseId |
	queryParams := {'query' -> self name . 'fmt' -> 'json' . 'limit' -> '1'} asDictionary.
	searchUrl := 'http://musicbrainz.org/ws/2/release' asZnUrl query: queryParams.
	searchResult := ZnClient new forJsonREST get: searchUrl.
	releaseId := (searchResult at: 'releases') first at: 'id'.
	^ releaseId
]

{ #category : #'as yet unclassified' }
ChinookAlbum >> artist [
	"super inefficient way to do this; just an example for navigation"
	| allArtists |
	allArtists := ChinookArtists new config: self config; populate.
	^ allArtists detect: [:i | i artistId = self artistId]
]

{ #category : #info }
ChinookAlbum >> artistId [
	^ self rawData at: 'ArtistId'
]

{ #category : #'as yet unclassified' }
ChinookAlbum >> artistName [
	^ self artist name
]

{ #category : #'as yet unclassified' }
ChinookAlbum >> gtArtistFor: aView [
	<gtView>
	^ aView forward
		title: 'Artist';
		priority: 15;
		object: [ {self artist}  ];
		view: #gtItemsFor:
]

{ #category : #'as yet unclassified' }
ChinookAlbum >> gtViewDetailsFor: aView [
	<gtView>
	^ aView explicit 
		title: 'Album Details' translated;
		priority: 5;
		stencil: [
			|container verticalContainer detailsTextContainer avatarContainer nameTextContainer details|
			details := self artistName.
			
			container := BlElement new
				layout: BlLinearLayout horizontal;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent].
			avatarContainer := BlElement new
				size: 124@124;
				background: (self albumCover scaledToSize: 124@124);
				margin: (BlInsets all: 10).
			nameTextContainer := BlTextElement new
				constraintsDo: [ :c | 
					c horizontal matchParent ];
				margin: (BlInsets top: 5 right: 0 bottom: 20 left: 5);
				text: (self name asRopedText glamorousRegularFont
					fontSize: 30;
					foreground: Color black).
			detailsTextContainer := BrEditor new
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: details;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			verticalContainer := BlElement new
				layout: BlLinearLayout vertical;
				margin: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent].
			verticalContainer addChild: nameTextContainer.
			verticalContainer addChild: detailsTextContainer.
			container addChild: avatarContainer.
			container addChild: verticalContainer.
			container ].
]

{ #category : #info }
ChinookAlbum >> name [
	^ self rawData at: 'Title'
]

{ #category : #'as yet unclassified' }
ChinookAlbum >> placeholderImage [
| borderedForm |
	borderedForm := Form extent: 100@100.
	^ borderedForm 
	    fillColor: Color lightGray;
	    borderWidth: 1 
	    color: Color black
]
