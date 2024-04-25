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

{ #category : #'instance creation' }
Foyre class >> camp: aCamp numberOfPeople: aNumberOfPeople numberOfSheep: aNumberOfSheep numberOfCattle: aNumberOfCattle [
"Return a new instance of Foyre"
	| foyre |
	foyre := self new.
	foyre camp: aCamp.
	foyre size: aNumberOfPeople.
	foyre sheepHerd size: aNumberOfSheep.
	foyre cattleHerd size: aNumberOfCattle.
	^ foyre
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
	self moveTo: camp landUnit.
	self moveHerdsToCamp
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

{ #category : #pov }
Foyre >> povId [

	^ super povId
]

{ #category : #accessing }
Foyre >> sheepHerd [

	^ sheepHerd
]
