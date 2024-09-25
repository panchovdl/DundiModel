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

{ #category : #accessing }
Foyre >> cattleHerd: anObject [

	cattleHerd := anObject
]

{ #category : #testing }
Foyre >> hasCattle [

	^ cattleHerd isNotEmpty.
]

{ #category : #testing }
Foyre >> hasSheep [

	^ sheepHerd isNotEmpty.
]

{ #category : #'as yet unclassified' }
Foyre >> manageCattle [

	cattleHerd ifNil: [ ^ self ].
	cattleHerd corporalConditionPercent < 30 ifTrue: [ 
		cattleHerd die.
		cattleHerd := nil. 
		^ self].

	cattleHerd dailyMove.

	cattleHerd dailyConsume.
]

{ #category : #'as yet unclassified' }
Foyre >> manageSheep [

	sheepHerd ifNil: [ ^ self ].
	sheepHerd corporalConditionPercent < 30 ifTrue: [ 
		sheepHerd die.
		sheepHerd := nil.
		^ self ].
	
	sheepHerd dailyMove .

	sheepHerd dailyConsume
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

{ #category : #accessing }
Foyre >> sheepHerd: anObject [

	sheepHerd := anObject
]

{ #category : #'as yet unclassified' }
Foyre >> step [

	self manageCattle.
	self manageSheep
]
