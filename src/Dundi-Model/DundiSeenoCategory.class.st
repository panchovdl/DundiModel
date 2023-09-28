Class {
	#name : #DundiSeenoCategory,
	#superclass : #DundiAbstractLandscapeCategory,
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiSeenoCategory >> color [

	^ Color yellow
]

{ #category : #'as yet unclassified' }
DundiSeenoCategory >> grassGrowthRate [

	^ self class fastGrowthRate
]

{ #category : #'as yet unclassified' }
DundiSeenoCategory >> treeGrowthRate [

	^ self class slowGrowthRate
]

{ #category : #'as yet unclassified' }
DundiSeenoCategory >> waterGrowthRate [

	^ self class slowGrowthRate
]
