Class {
	#name : #GrassCover,
	#superclass : #Object,
	#instVars : [
		'patch',
		'amountOfGrass'
	],
	#category : #IterationDundi
}

{ #category : #'instance creation' }
GrassCover class >> for: aPatch [

	^ self new patch: aPatch; yourself 
]

{ #category : #accessing }
GrassCover >> amountOfGrass [

	^ amountOfGrass
]

{ #category : #accessing }
GrassCover >> growGrass [

	amountOfGrass = 0 ifTrue: [ amountOfGrass := 0.1 ].
	
	amountOfGrass := Cormas logisticGrowth: amountOfGrass r: patch grassGrowthRate K: patch maxGrassAmount 

	
]

{ #category : #accessing }
GrassCover >> initialize [ 

	super initialize.
	
	amountOfGrass := 0.

	
]

{ #category : #accessing }
GrassCover >> patch: anObject [

	patch := anObject
]

{ #category : #accessing }
GrassCover >> removeAmountOfGrass: aNumber [

	amountOfGrass := amountOfGrass - aNumber 

	
]
