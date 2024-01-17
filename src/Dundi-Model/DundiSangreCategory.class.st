Class {
	#name : #DundiSangreCategory,
	#superclass : #DundiAbstractLandscapeCategory,
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiSangreCategory >> color [

	^ (Color red mixed: 0.1 with: Color brown) quiteBlacker quiteBlacker
]

{ #category : #'as yet unclassified' }
DundiSangreCategory >> grassGrowthRate [

	^ self class slowGrowthRate
]

{ #category : #'as yet unclassified' }
DundiSangreCategory >> treeGrowthRate [

	^ self class fastGrowthRate
]

{ #category : #'as yet unclassified' }
DundiSangreCategory >> waterGrowthRate [

	^ self class mediumGrowthRate
]
