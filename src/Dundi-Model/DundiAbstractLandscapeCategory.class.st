Class {
	#name : #DundiAbstractLandscapeCategory,
	#superclass : #Object,
	#category : #'Dundi-Model'
}

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> fastGrowthRate [

	^ 0.6
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> mediumGrowthRate [

	^ 0.3
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> slowGrowthRate [

	^ 0.1
]

{ #category : #accessing }
DundiAbstractLandscapeCategory >> color [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory >> grassGrowthRate [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory >> treeGrowthRate [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory >> waterGrowthRate [

	self subclassResponsibility 
]
