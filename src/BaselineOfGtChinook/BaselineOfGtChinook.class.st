Class {
	#name : #BaselineOfGtChinook,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtChinook
}

{ #category : #loading }
BaselineOfGtChinook class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'GtChinook' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtChinook >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtChinook'
		]
]
