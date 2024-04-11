Class {
	#name : #Cattle,
	#superclass : #Herd,
	#instVars : [
		'corporalCondition'
	],
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
Cattle class >> monthlyNeedsPerHeadBySeason [ 

	^ 120
]

{ #category : #accessing }
Cattle >> corporalCondition [

	^ corporalCondition
]

{ #category : #accessing }
Cattle >> corporalCondition: anObject [

	corporalCondition := anObject
]
