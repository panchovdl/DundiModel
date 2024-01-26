Class {
	#name : #DundiAbstractLandscapeCategory,
	#superclass : #Object,
	#instVars : [
		'logisticGrowth'
	],
	#category : #'Dundi-Model'
}

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

{ #category : #growth }
DundiAbstractLandscapeCategory >> logisticGrowth [

	super 	fruitAmount: (Cormas logisticGrowth: super fruitAmount r: self class reproductionRate K: self subclassResponsibility fruitCarryingCapacity);
			grassAmount: (Cormas logisticGrowth: self grassAmount r: self class reproductionRate K: self subclassResponsibility grassCarryingCapacity);
			leafAmount: (Cormas logisticGrowth: self leafAmount r: self class reproductionRate K: self subclassResponsibility leafCarryingCapacity);
			woodAmount: (Cormas logisticGrowth: self woodAmount r: self class reproductionRate K: self subclassResponsibility woodCarryingCapacity)
]

{ #category : #'as yet unclassified' }
DundiAbstractLandscapeCategory >> woodCarryingCapacity [

	self subclassResponsibility 
]
