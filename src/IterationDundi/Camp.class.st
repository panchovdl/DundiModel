Class {
	#name : #Camp,
	#superclass : #Object,
	#instVars : [
		'woodQuantity',
		'woodNeeds',
		'inhabitants',
		'landUnit'
	],
	#category : #IterationDundi
}

{ #category : #accessing }
Camp >> inhabitants [

	^ inhabitants
]

{ #category : #accessing }
Camp >> inhabitants: anObject [

	inhabitants := anObject
]

{ #category : #initialization }
Camp >> initialize [ 

	super initialize.
	
	woodQuantity := 0.
	woodNeeds := 100.
	inhabitants := OrderedCollection new.
]

{ #category : #accessing }
Camp >> landUnit [

	^ landUnit
]

{ #category : #accessing }
Camp >> landUnit: anObject [

	landUnit := anObject
]

{ #category : #accessing }
Camp >> woodNeeds [

	^ woodNeeds
]

{ #category : #accessing }
Camp >> woodNeeds: anObject [

	woodNeeds := anObject
]

{ #category : #accessing }
Camp >> woodQuantity [

	^ woodQuantity
]

{ #category : #accessing }
Camp >> woodQuantity: anObject [

	woodQuantity := anObject
]
