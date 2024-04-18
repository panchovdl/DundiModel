Class {
	#name : #Herd,
	#superclass : #GroupOfLivings,
	#instVars : [
		'corporalCondition',
		'camp'
	],
	#classVars : [
		'dailyNeedsPerHead'
	],
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
Herd class >> dailyNeedsPerHead [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
Herd class >> maxCorporalCondition [

	self subclassResponsibility. 
]

{ #category : #'as yet unclassified' }
Herd >> acceptableDistanceFromCamp [

"number of cell away from camp the Herd can travel"

	self subclassResponsibility 
]

{ #category : #accessing }
Herd >> camp [

	^ camp
]

{ #category : #accessing }
Herd >> camp: anObject [

	camp := anObject
]

{ #category : #accessing }
Herd >> corporalCondition [

	^ corporalCondition
]

{ #category : #accessing }
Herd >> corporalCondition: anObject [

	corporalCondition := anObject
]

{ #category : #'as yet unclassified' }
Herd >> dailyBurnCorporalCondition [

	self corporalCondition: (0 max: self corporalCondition - self class dailyNeedsPerHead)
]

{ #category : #'as yet unclassified' }
Herd >> dailyConsume [
	
	| quantity |
	patch ifNil: [ ^ nil ].
	
	self dailyBurnCorporalCondition. 
	
	quantity := self patch grassCover amountOfGrass min: (self class dailyNeedsPerHead * number).
	
	self patch grassCover removeAmountOfGrass: quantity.
	
	self corporalCondition: (self class maxCorporalCondition min: ((self corporalCondition + quantity))/number).
]

{ #category : #'as yet unclassified' }
Herd >> dailyMove [

	self subclassResponsibility. 
]

{ #category : #'as yet unclassified' }
Herd >> dailyStep [

	self 	dailyMove; 
			dailyConsume.	
]

{ #category : #initialization }
Herd >> initialize [ 

	super initialize.
	
	corporalCondition := self class maxCorporalCondition / 2.
	
	number := Cormas randomIntegerFrom: 5 to: 20. 
]

{ #category : #testing }
Herd >> isNotTooFarFromCamp: aCell [

	^ (aCell distanceTo: camp landUnit) <= self acceptableDistanceFromCamp. 
]
