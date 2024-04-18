Class {
	#name : #Sangre,
	#superclass : #AbstractSoil,
	#category : #IterationDundi
}

{ #category : #accessing }
Sangre class >> maxGrass [

	^ 10
]

{ #category : #accessing }
Sangre class >> maxTrees [

	^ 15000
]

{ #category : #accessing }
Sangre >> color [

	^ (Color red mixed: 0.1 with: Color brown) quiteBlacker quiteBlacker
]

{ #category : #testing }
Sangre >> isSangre [ 

	^ true
]
