Class {
	#name : #Foyre,
	#superclass : #GroupOfLivings,
	#instVars : [
		'woodAmount',
		'woodBasketSize'
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
Foyre >> comeBack [
]

{ #category : #'as yet unclassified' }
Foyre >> manageHerds [
]

{ #category : #'as yet unclassified' }
Foyre >> recoltWood [
]
