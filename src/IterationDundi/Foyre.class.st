Class {
	#name : #Foyre,
	#superclass : #GroupOfLivings,
	#instVars : [
		'woodAmount',
		'woodBasketSize',
		'camp',
		'herds'
	],
	#classVars : [
		'distancePerception'
	],
	#category : #IterationDundi
}

{ #category : #accessing }
Foyre class >> distancePerception [

	^ distancePerception ifNil: [ distancePerception := 3 ]
]

{ #category : #'as yet unclassified' }
Foyre >> collectWood [
]

{ #category : #'as yet unclassified' }
Foyre >> comeBack [
]

{ #category : #'as yet unclassified' }
Foyre >> manageHerds [
]
