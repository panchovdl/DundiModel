Class {
	#name : #GrassCover,
	#superclass : #Object,
	#instVars : [
		'patch',
		'amountOfGrass',
		'minGrass'
	],
	#category : #IterationDundi
}

{ #category : #'instance creation' }
GrassCover class >> for: aPatch [

	 ^self new patch: aPatch ; yourself
]

{ #category : #accessing }
GrassCover >> amountOfGrass [

	^ amountOfGrass
]

{ #category : #accessing }
GrassCover >> growGrass [

	amountOfGrass = 0 ifTrue: [ amountOfGrass := 1000 ].
	
	amountOfGrass := Cormas logisticGrowth: amountOfGrass r: patch grassGrowthRate K: patch maxGrassAmount 

	
]

{ #category : #initialization }
GrassCover >> initGrass [ 
	amountOfGrass := patch maxGrassAmount / 2
]

{ #category : #accessing }
GrassCover >> initialize [ 

	super initialize. 
	minGrass := 1000.
	amountOfGrass := minGrass.

	
]

{ #category : #accessing }
GrassCover >> minGrass [

	^ minGrass
]

{ #category : #accessing }
GrassCover >> minGrass: anObject [

	minGrass := anObject
]

{ #category : #accessing }
GrassCover >> patch: anObject [

	patch := anObject
]

{ #category : #accessing }
GrassCover >> removeAmountOfGrass: aNumber [

	amountOfGrass := amountOfGrass - aNumber 

	
]
