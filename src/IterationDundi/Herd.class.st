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
Herd class >> DaylyNeedsPerHead [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
Herd class >> maxCorporalCondition [

	self subclassResponsibility. 
]

{ #category : #'as yet unclassified' }
Herd >> consume [
	
	| quantity |
	patch ifNil: [ ^ nil ].
	
	quantity := self patch grassCover amountOfGrass * self class harvestRate.
	
	self patch grassCover removeAmountOfGrass: quantity. 
	
	self corporalCondition: self corporalCondition + quantity.
]

{ #category : #accessing }
Herd >> corporalCondition [

	^ corporalCondition
]

{ #category : #accessing }
Herd >> corporalCondition: anObject [

	corporalCondition := anObject
]

{ #category : #initialization }
Herd >> initialize [ 

	super initialize.
	
	corporalCondition := self class maxCorporalCondition / 2.
]
