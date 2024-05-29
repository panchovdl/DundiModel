Class {
	#name : #Sheep,
	#superclass : #Herd,
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
Sheep class >> dailyNeedsPerHead [ 


	^ 0.57
]

{ #category : #'as yet unclassified' }
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
