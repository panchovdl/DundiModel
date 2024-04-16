Class {
	#name : #Herd,
	#superclass : #GroupOfLivings,
	#instVars : [
		'corporalCondition'
	],
	#classVars : [
		'DaylyNeedsPerHead'
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

	self class dailyNeedsPerHead * number
]

{ #category : #'as yet unclassified' }
Herd >> dailyConsume [
	
	| quantity |
	patch ifNil: [ ^ nil ].
	
	self dailyBurnCorporalCondition. 
	
	quantity := self patch grassCover amountOfGrass min: (self class dailyNeedsPerHead * number).
	
	self patch grassCover removeAmountOfGrass: quantity.
	
	self corporalCondition: (self class maxCorporalCondition min: (self corporalCondition + quantity)).
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
