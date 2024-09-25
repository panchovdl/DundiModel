Class {
	#name : 'Herd',
	#superclass : 'GroupOfLivings',
	#instVars : [
		'corporalCondition',
		'camp'
	],
	#classVars : [
		'dailyNeedsPerHead'
	],
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'as yet unclassified' }
Herd class >> dailyNeedsPerHead [

	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Herd class >> maxCorporalCondition [

	self subclassResponsibility. 
]

{ #category : 'as yet unclassified' }
Herd >> acceptableDistanceFromCamp [

"number of cell away from camp the Herd can travel"

	self subclassResponsibility 
]

{ #category : 'accessing' }
Herd >> camp [

	^ camp
]

{ #category : 'accessing' }
Herd >> camp: anObject [

	camp := anObject
]

{ #category : 'accessing' }
Herd >> corporalCondition [

	^ corporalCondition
]

{ #category : 'accessing' }
Herd >> corporalCondition: anObject [

	corporalCondition := anObject
]

{ #category : 'as yet unclassified' }
Herd >> corporalConditionPercent [

	^ (self corporalCondition / self class maxCorporalCondition) * 100
]

{ #category : 'as yet unclassified' }
Herd >> dailyBurnCorporalCondition [

	self corporalCondition: (0 max: self corporalCondition - self class dailyNeedsPerHead)
]

{ #category : 'as yet unclassified' }
Herd >> dailyConsume [

	| quantity needs |
	(patch isNil or: [ size = 0 ]) ifTrue: [ ^ nil ].

	self dailyBurnCorporalCondition.
	needs := self class dailyNeedsPerHead * size.
	needs := needs * 100 / (self corporalConditionPercent max: 0.1). "plus la vache est maigre, plus elle a faim"
	quantity := self patch grassCover amountOfGrass min: needs.

	self patch grassCover removeAmountOfGrass: quantity.
	self corporalCondition: (self class maxCorporalCondition min:
			 self corporalCondition + (quantity / size))
]

{ #category : 'as yet unclassified' }
Herd >> dailyMove [

	self randomWalkConstrainedBy: [ :cell | cell isRestricted not and: [ 
			self isNotTooFarFromCamp: cell ] ].
	self rememberSpace.
]

{ #category : 'as yet unclassified' }
Herd >> dailyStep [

	self 	dailyMove; 
			dailyConsume.	
]

{ #category : 'initialization' }
Herd >> initialize [ 

	super initialize.
	
	corporalCondition := self class maxCorporalCondition / 2.
	
	size :=0. 
]

{ #category : 'testing' }
Herd >> isNotTooFarFromCamp: aCell [

	^ (aCell distanceTo: camp landUnit) <= self acceptableDistanceFromCamp. 
]
