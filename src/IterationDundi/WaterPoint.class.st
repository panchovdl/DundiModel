Class {
	#name : #WaterPoint,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'waterAmount'
	],
	#category : #IterationDundi
}

{ #category : #accessing }
WaterPoint >> initialize [

	super initialize.
	waterAmount := 1000
]

{ #category : #pov }
WaterPoint >> pov [

	^ Color blue
]

{ #category : #accessing }
WaterPoint >> waterAmount [

	^ waterAmount
]

{ #category : #accessing }
WaterPoint >> waterAmount: anObject [

	waterAmount := anObject
]
