Class {
	#name : #DundiBaldiolCategory,
	#superclass : #DundiAbstractLandscapeCategory,
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiBaldiolCategory >> color [

	^ Color green quiteBlacker quiteBlacker quiteBlacker quiteBlacker
]

{ #category : #'as yet unclassified' }
DundiBaldiolCategory >> grassGrowthRate [

	^ self class mediumGrowthRate
]

{ #category : #'as yet unclassified' }
DundiBaldiolCategory >> treeGrowthRate [

	^ self class mediumGrowthRate
]

{ #category : #'as yet unclassified' }
DundiBaldiolCategory >> waterGrowthRate [

	^ self class fastGrowthRate
]
