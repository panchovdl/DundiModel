Class {
	#name : #Sheep,
	#superclass : #Herd,
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
Sheep class >> dailyNeedsPerHead [ 


	^ 17
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
