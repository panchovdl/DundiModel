Class {
	#name : #DundiPerson,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'carryingCapacity',
		'currentCharge',
		'fruitAmount',
		'leafAmount',
		'woodAmount',
		'grassAmount'
	],
	#category : #'Dundi-Model'
}

{ #category : #'star moving' }
DundiPerson >> carryingCapacity [

	^ carryingCapacity
]

{ #category : #'star moving' }
DundiPerson >> carryingCapacity: anObject [

	carryingCapacity := anObject
]

{ #category : #accessing }
DundiPerson >> currentCharge [ 

	^ currentCharge
]

{ #category : #accessing }
DundiPerson >> currentCharge: anObject [

	currentCharge := anObject
]

{ #category : #'star moving' }
DundiPerson >> fruitAmount [

	^ fruitAmount
]

{ #category : #'star moving' }
DundiPerson >> fruitAmount: anObject [

	fruitAmount := anObject

]

{ #category : #'star moving' }
DundiPerson >> grassAmount [

	^ grassAmount
]

{ #category : #'star moving' }
DundiPerson >> grassAmount: anObject [

	grassAmount := anObject

]

{ #category : #'star moving' }
DundiPerson >> initialize [

	super initialize.
	carryingCapacity := 100.
	fruitAmount := OrderedCollection new.
	woodAmount := OrderedCollection new.
	grassAmount := OrderedCollection new.
	leafAmount := OrderedCollection new.
]

{ #category : #'star moving' }
DundiPerson >> leafAmount [

	^ leafAmount
]

{ #category : #'star moving' }
DundiPerson >> leafAmount: anObject [

	leafAmount := anObject 
]

{ #category : #'star moving' }
DundiPerson >> pov [

	^ Color red
]

{ #category : #stepping }
DundiPerson >> step [

	self randomWalk
]

{ #category : #'star moving' }
DundiPerson >> woodAmount [

	^ woodAmount 
]

{ #category : #'star moving' }
DundiPerson >> woodAmount: anObject [

	woodAmount := anObject

]
