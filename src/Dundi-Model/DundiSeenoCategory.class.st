Class {
	#name : #DundiSeenoCategory,
	#superclass : #DundiAbstractLandscapeCategory,
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiSeenoCategory >> color [

	^ Color yellow
]

{ #category : #'as yet unclassified' }
DundiSeenoCategory >> fruitCarryingCapacity [

	^ self class lowCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiSeenoCategory >> grassCarryingCapacity [

	^ self class highCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiSeenoCategory >> leafCarryingCapacity [

	^ self class lowCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiSeenoCategory >> woodCarryingCapacity [

	^ self class lowCarryingCapacity
]
