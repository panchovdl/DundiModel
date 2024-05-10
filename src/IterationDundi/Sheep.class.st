Class {
	#name : #Sheep,
	#superclass : #Herd,
	#category : #IterationDundi
}

{ #category : #accessing }
Sheep class >> dailyNeedsPerHead [

	^ 0.58 "kg DM/TLU/day calculé sur la moyenne des consommation sur l'année"
]

{ #category : #accessing }
Sheep class >> maxCorporalCondition [

	^ 5.
]

{ #category : #'as yet unclassified' }
Sheep >> acceptableDistanceFromCamp [

"number of cell away from camp the Herd can travel"

	^ 3
]

{ #category : #pov }
Sheep >> pov [

	^ Color orange 
]
