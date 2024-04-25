Class {
	#name : #WaterPoint,
	#superclass : #CMLocatedObject,
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

{ #category : #moving }
WaterPoint >> moveTo: aSpatialEntity [

	aSpatialEntity isSpatialEntity ifFalse: [ ^ nil ].
	self leaveWhileMoving: true.
	self patch: aSpatialEntity.
	self patch addOccupant: self
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
