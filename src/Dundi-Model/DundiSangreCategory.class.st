Class {
	#name : #DundiSangreCategory,
	#superclass : #DundiAbstractLandscapeCategory,
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiSangreCategory >> color [

	^ (Color red mixed: 0.1 with: Color brown) quiteBlacker quiteBlacker
]

{ #category : #'as yet unclassified' }
DundiSangreCategory >> fruitCarryingCapacity [

	^ self class lowCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiSangreCategory >> grassCarryingCapacity [

	^ self class lowCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiSangreCategory >> leafCarryingCapacity [

	^ self class highCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiSangreCategory >> woodCarryingCapacity [

	^ self class highCarryingCapacity
]
