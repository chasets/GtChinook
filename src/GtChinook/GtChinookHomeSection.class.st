Class {
	#name : #GtChinookHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'GtChinook-Card'
}

{ #category : #'as yet unclassified' }
GtChinookHomeSection >> defaultPriority [
	^ 15
]

{ #category : #'as yet unclassified' }
GtChinookHomeSection >> gtUsedKnowledgeBaseCard [
	<gtSectionCard>
	<gtExample>
	<noTest>
	| dbName |
	dbName := (LeDatabasesRegistry defaultLogicalDatabase databases detect: [:i | i databaseName includesSubstring: 'GtChinook']) databaseName.
	^ GtHomeCard lepiterBaseWithTableOfContents
		title: 'Chinook Home Card';
		description: 'Explore Chinook knowledge base';
		priority: 1;
		databaseName: dbName;
		recentlyEditedPage;
		editableToolbar;
		details: [ :db | 
			| snippets somePages |
			somePages := db pages select: #shouldAppearInIndexOrDailyNotes.
			snippets := somePages flatCollect: #allChildrenDepthFirst.
			'Your local knowledge base includes '
				, somePages size asString , ' pages containing '
				, snippets size asString , ' snippets of '
				, (snippets groupedBy: #class) size asString , ' different kinds.' ]
				yourself
]

{ #category : #'as yet unclassified' }
GtChinookHomeSection >> sectionTitle [
	^ 'Chinook Data'
]
