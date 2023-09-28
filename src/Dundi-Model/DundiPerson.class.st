Class {
	#name : #DundiPerson,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'treeAmount',
		'waterAmount',
		'grassAmount',
		'carryingCapacity'
	],
	#classVars : [
		'grassConsumptionRatio',
		'treeConsumptionRatio',
		'waterConsumptionRatio'
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
	waterAmount := OrderedCollection new.
	treeAmount := OrderedCollection new.
	grassAmount := OrderedCollection new.
]

{ #category : #'star moving' }
DundiPerson >> pov [

	^ Color red
]

{ #category : #'star moving' }
DundiPerson >> treeAmount [

	^ treeAmount
]

{ #category : #'star moving' }
DundiPerson >> treeAmount: anObject [

	treeAmount := anObject

]

{ #category : #'star moving' }
DundiPerson >> waterAmount [

	^ waterAmount
]

{ #category : #'star moving' }
DundiPerson >> waterAmount: anObject [

	waterAmount := anObject

]
