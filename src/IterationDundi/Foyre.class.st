Class {
	#name : #Foyre,
	#superclass : #GroupOfLivings,
	#instVars : [
		'woodAmount',
		'woodBasketSize',
		'camp',
		'sheepHerd',
		'cattleHerd'
	],
	#classVars : [
		'distancePerception'
	],
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
Foyre class >> camp: aCamp numberOfPeople: aNumberOfPeople numberOfSheep: aNumberOfSheep numberOfCattle: aNumberOfCattle [

	| foyre |
	foyre := self new.
	foyre camp: aCamp.
	foyre size: aNumberOfPeople.
	foyre sheepHerd size: aNumberOfSheep.
	foyre cattleHerd size: aNumberOfCattle.
	^ foyre.
]

{ #category : #accessing }
Foyre class >> distancePerception [

	^ distancePerception ifNil: [ distancePerception := 3 ]
]

{ #category : #accessing }
Foyre >> camp [

	^ camp
]

{ #category : #accessing }
Foyre >> camp: anObject [

	camp := anObject.
	cattleHerd camp: camp.
	sheepHerd camp: camp.
	self moveHerdsToCamp.
]

{ #category : #accessing }
Foyre >> cattleHerd [

	^ cattleHerd
]

{ #category : #testing }
Foyre >> hasCattle [

	^ cattleHerd isNotEmpty.
]

{ #category : #testing }
Foyre >> hasSheep [

	^ sheepHerd isNotEmpty.
]

{ #category : #initialization }
Foyre >> initialize [ 

	super initialize. 
	
	cattleHerd := Cattle new.
	sheepHerd := Sheep new.
]

{ #category : #initialization }
Foyre >> moveHerdsToCamp [

	sheepHerd moveTo: camp landUnit.
	cattleHerd moveTo: camp landUnit.
]

{ #category : #accessing }
Foyre >> sheepHerd [

	^ sheepHerd
]
