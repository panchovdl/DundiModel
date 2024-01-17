Class {
	#name : #DundiCaangolCategory,
	#superclass : #DundiAbstractLandscapeCategory,
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiCaangolCategory >> color [

	^ Color paleGreen
]

{ #category : #'as yet unclassified' }
DundiCaangolCategory >> fruitCarryingCapacity [

	^ self class highCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiCaangolCategory >> grassCarryingCapacity [ 

	^ self class lowCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiCaangolCategory >> leafCarryingCapacity [ 

	^ self class highCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiCaangolCategory >> woodCarryingCapacity [ 

	^ self class highCarryingCapacity
]
