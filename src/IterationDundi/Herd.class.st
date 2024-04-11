Class {
	#name : #Herd,
	#superclass : #GroupOfLivings,
	#instVars : [
		'heads'
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
	"The forager eats a quatity of biomass of its current location. The quantity depends on the harvestRate: a proportion of biomass (50% or 99% according to forager type)"
	
	| quantity |
	patch ifNil: [ ^ nil ].
	
	quantity := self patch grass * self class harvestRate.
	
	self corporalCondition: self corporalCondition + quantity.
	self patch grass: self patch grass - quantity
]

{ #category : #'as yet unclassified' }
Herd >> updateCorporalCondition [

	self corporalCondition: self subclassResponsibility corporalCondition - self class monthlyNeedsPerHeadBySeason 
]
