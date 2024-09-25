Class {
	#name : 'Cattle',
	#superclass : 'Herd',
	#classInstVars : [
		'dailyNeedsPerHead',
		'maxCorporalCondition'
	],
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'as yet unclassified' }
Cattle class >> dailyNeedsPerHead [ 

	^ dailyNeedsPerHead
]

{ #category : 'accessing' }
Cattle class >> dailyNeedsPerHead: anObject [

	dailyNeedsPerHead := anObject
]

{ #category : 'initialization' }
Cattle class >> initializeParameters [

	super initializeParameters.
	dailyNeedsPerHead := 3.6 "kg DM/TLU calculé sur la moyenne des consommation sur l'année".
	maxCorporalCondition := 10.
]

{ #category : 'as yet unclassified' }
Cattle class >> maxCorporalCondition [

	^ maxCorporalCondition
]

{ #category : 'accessing' }
Cattle class >> maxCorporalCondition: anObject [

	maxCorporalCondition := anObject
]

{ #category : 'as yet unclassified' }
Cattle >> acceptableDistanceFromCamp [

"number of cell away from camp the Herd can travel"

	^ 10
]

{ #category : 'pov' }
Cattle >> pov [

	<pov>
	^ CMPointOfView color: Color brown
]
