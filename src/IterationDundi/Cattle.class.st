Class {
	#name : #Cattle,
	#superclass : #Herd,
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
Cattle class >> dailyNeedsPerHead [

	^ 3.6 "kg DM/TLU/day calculé sur la moyenne des consommation sur l'année"
]

{ #category : #'as yet unclassified' }
Cattle class >> maxCorporalCondition [

	^ 10.
]

{ #category : #'as yet unclassified' }
Cattle >> acceptableDistanceFromCamp [

"number of cell away from camp the Herd can travel"

	^ 10
]

{ #category : #pov }
Cattle >> pov [

	^ Color brown
]
