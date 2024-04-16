Class {
	#name : #Cattle,
	#superclass : #Herd,
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
Cattle class >> dailyNeedsPerHead [ 

	^ 120
]

{ #category : #'as yet unclassified' }
Cattle class >> maxCorporalCondition [

	^ 10.
]

{ #category : #'as yet unclassified' }
Cattle >> dailyMove [

	self randomWalk  
]
