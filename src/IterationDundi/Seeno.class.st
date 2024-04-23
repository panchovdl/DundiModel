Class {
	#name : #Seeno,
	#superclass : #AbstractSoil,
	#category : #IterationDundi
}

{ #category : #accessing }
Seeno class >> maxGrass [

	^ 200000
]

{ #category : #accessing }
Seeno class >> maxTrees [

	^ 5000
]

{ #category : #accessing }
Seeno >> color [

	^ Color yellow
]

{ #category : #testing }
Seeno >> isSeeno [ 

	^ true
]
