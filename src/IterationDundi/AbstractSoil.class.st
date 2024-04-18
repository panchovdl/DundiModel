Class {
	#name : #AbstractSoil,
	#superclass : #Object,
	#instVars : [
		'soilDegradation',
		'landUnit'
	],
	#classVars : [
		'maxGrass',
		'maxTrees'
	],
	#category : #IterationDundi
}

{ #category : #accessing }
AbstractSoil class >> maxGrass [

	self subclassResponsibility 
]

{ #category : #accessing }
AbstractSoil class >> maxTrees [

	self subclassResponsibility 
]

{ #category : #initialization }
AbstractSoil >> initialize [ 

	soilDegradation := 0.
]

{ #category : #testing }
AbstractSoil >> isBaldiol [

	^ false
]

{ #category : #testing }
AbstractSoil >> isCaangol [

	^ false
]

{ #category : #testing }
AbstractSoil >> isSangre [

	^ false
]

{ #category : #testing }
AbstractSoil >> isSeeno [

	^ false
]

{ #category : #accessing }
AbstractSoil >> landUnit [

	^ landUnit
]

{ #category : #accessing }
AbstractSoil >> landUnit: anObject [

	landUnit := anObject
]
