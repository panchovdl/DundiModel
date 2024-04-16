Class {
	#name : #Herd,
	#superclass : #GroupOfLivings,
	#instVars : [
		'heads',
		'corporalCondition'
	],
	#classVars : [
		'monthlyNeedsPerHeadBySeason'
	],
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
Herd class >> monthlyNeedsPerHeadBySeason [

	self subclassResponsibility 
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
