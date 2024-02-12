Class {
	#name : #DundiAbstractLandscapeCategory,
	#superclass : #Object,
	#instVars : [
		'logisticGrowth'
	],
	#category : #'Dundi-Model'
}

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> growthRatio [

	^ 0.01
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> highCarryingCapacity [

	^ 10
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> lowCarryingCapacity [

	^ 2
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> mediumCarryingCapacity [

	^ 5
]

{ #category : #accessing }
DundiAbstractLandscapeCategory >> color [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory >> fruitCarryingCapacity [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory >> grassCarryingCapacity [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory >> leafCarryingCapacity [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory >> woodCarryingCapacity [

	self subclassResponsibility 
]
