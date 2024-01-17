Class {
	#name : #DundiAbstractLandscapeCategory,
	#superclass : #Object,
	#category : #'Dundi-Model'
}

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> highCarryingCapacity [

	^ 0.6
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> lowCarryingCapacity [

	^ 0.1
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> mediumCarryingCapacity [

	^ 0.3
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory class >> reproductionRate [

	^ 0.2 
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
