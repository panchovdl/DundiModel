Class {
	#name : 'Sheep',
	#superclass : 'Herd',
	#classInstVars : [
		'maxCorporalCondition',
		'dailyNeedsPerHead'
	],
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'as yet unclassified' }
Sheep class >> dailyNeedsPerHead [ 


	^ dailyNeedsPerHead
]

{ #category : 'accessing' }
Sheep class >> dailyNeedsPerHead: anObject [

	dailyNeedsPerHead := anObject
]

{ #category : 'initialization' }
Sheep class >> initializeParameters [

	super initializeParameters.
	dailyNeedsPerHead := 0.58 "kg DM/TLU/day calculé sur la moyenne des consommation sur l'année".
	maxCorporalCondition := 5.
]

{ #category : 'as yet unclassified' }
Sheep class >> maxCorporalCondition [

	^ maxCorporalCondition
]

{ #category : 'accessing' }
Sheep class >> maxCorporalCondition: anObject [

	maxCorporalCondition := anObject
]

{ #category : 'as yet unclassified' }
Sheep >> acceptableDistanceFromCamp [

"number of cell away from camp the Herd can travel"

	^ 5
]

{ #category : 'pov' }
Sheep >> pov [

	<pov>
	^ CMPointOfView color: Color white
]
