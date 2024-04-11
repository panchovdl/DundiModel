Class {
	#name : #DundiBaldiolCategory,
	#superclass : #DundiAbstractLandscapeCategory,
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiBaldiolCategory >> color [

	^ Color green quiteBlacker quiteBlacker quiteBlacker quiteBlacker
]

{ #category : #'as yet unclassified' }
DundiBaldiolCategory >> grassCarryingCapacity [

	^ self class mediumCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiBaldiolCategory >> leafCarryingCapacity [

	^ self class mediumCarryingCapacity
]

{ #category : #'as yet unclassified' }
DundiBaldiolCategory >> woodCarryingCapacity [

	^ self class mediumCarryingCapacity
]
