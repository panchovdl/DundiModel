Class {
	#name : #Caangol,
	#superclass : #AbstractSoil,
	#category : #IterationDundi
}

{ #category : #accessing }
Caangol class >> maxGrass [

	^ 20
]

{ #category : #accessing }
Caangol class >> maxTrees [

	^ 10000
]

{ #category : #accessing }
Caangol >> color [

	^ Color paleGreen
]

{ #category : #testing }
Caangol >> isCaangol [ 

	^ true
]
