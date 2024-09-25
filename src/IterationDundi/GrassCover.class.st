Class {
	#name : 'GrassCover',
	#superclass : 'Object',
	#traits : 'TCMMath',
	#classTraits : 'TCMMath classTrait',
	#instVars : [
		'patch',
		'amountOfGrass'
	],
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'instance creation' }
GrassCover class >> for: aPatch [

	 ^self new patch: aPatch ; yourself
]

{ #category : 'accessing' }
GrassCover >> amountOfGrass [

	^ amountOfGrass
]

{ #category : 'accessing' }
GrassCover >> growGrass [

	amountOfGrass = 0 ifTrue: [ amountOfGrass := 1000 ].
	
	amountOfGrass := self logisticGrowth: amountOfGrass r: patch grassGrowthRate k: patch maxGrassAmount 

	
]

{ #category : 'initialization' }
GrassCover >> initGrass [ 
	amountOfGrass := patch maxGrassAmount / 2
]

{ #category : 'accessing' }
GrassCover >> initialize [ 

	super initialize.
	
	amountOfGrass := 0.

	
]

{ #category : 'accessing' }
GrassCover >> patch: anObject [

	patch := anObject
]

{ #category : 'accessing' }
GrassCover >> removeAmountOfGrass: aNumber [

	amountOfGrass := amountOfGrass - aNumber 

	
]
