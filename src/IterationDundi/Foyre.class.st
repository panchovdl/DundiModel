Class {
	#name : #Foyre,
	#superclass : #GroupOfLivings,
	#instVars : [
		'woodAmount',
		'woodBasketSize',
		'camp',
		'sheepHerd',
		'cattleHerd',
		'landscape'
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

{ #category : #access }
Foyre >> getBaldiols [

	"Return a list of cells on Baldiol"

	^ self getSoilType: Baldiol 
]

{ #category : #access }
Foyre >> getCaangols [

	"Return a list of cells on Caangol"

	^ self getSoilType: Caangol
]

{ #category : #access }
Foyre >> getCellWithMaxGrassAmong: listOfCells [

	"return a cell with maximum of grass among listOfCells. listOfCells excludes the protected cells. If several cells with max, return one randomly"

	| max authorizedCells |
	authorizedCells := listOfCells select: [ :c | c isRestricted not].
	max := Cormas maxOf: #grassAmount amongObjects: authorizedCells.
	^ Cormas selectRandomlyFrom:
		  (authorizedCells select: [ :c | c grassAmount = max ])
]

{ #category : #access }
Foyre >> getSangres [
"Return a list of cells on Sangre"

	^ self getSoilType: Sangre
]

{ #category : #access }
Foyre >> getSeenos [

	"Return a list of cells on Seeno"

	^ self getSoilType: Seeno
]

{ #category : #access }
Foyre >> getSoilType: aClassOfSoil [

	^ landscape select: [ :c | c soil class = aClassOfSoil ]
]

{ #category : #initialization }
Foyre >> initialize [ 

	super initialize. 
	
	cattleHerd := Cattle new.
	sheepHerd := Sheep new.
]

{ #category : #accessing }
Foyre >> landscape [

	^ landscape
]

{ #category : #accessing }
Foyre >> landscape: anObject [

	landscape := anObject
]

{ #category : #control }
Foyre >> manageCattle [

	cattleHerd ifNil: [ ^ nil ].
	cattleHerd corporalConditionPercent < 30 ifTrue: [ 
		cattleHerd die.
		^ cattleHerd := nil ].

	LandscapeDundi season = CeetceldeSeason ifTrue: [ 
		cattleHerd moveTowards:
			(self getCellWithMaxGrassAmong: cattleHerd patch neighbourhoodAndSelf) ].
	LandscapeDundi season = DabbuundeSeason ifTrue: [ 
		cattleHerd moveTowards:
			(self getCellWithMaxGrassAmong: self getBaldiols) ].
	LandscapeDundi season = NduunguSeason ifTrue: [ 
		cattleHerd moveTowards:
			(self getCellWithMaxGrassAmong: self getSangres) ].
		
	cattleHerd dailyConsume
]

{ #category : #control }
Foyre >> manageSheep [

	sheepHerd ifNil: [ ^ nil ].
	sheepHerd corporalConditionPercent < 30 ifTrue: [ 
		sheepHerd die.
		^ sheepHerd := nil ].
	LandscapeDundi season = CeetceldeSeason ifTrue: [ sheepHerd moveTowards:
			(self getCellWithMaxGrassAmong: sheepHerd patch neighbourhoodAndSelf )].
	LandscapeDundi season = DabbuundeSeason ifTrue: [ 
		sheepHerd moveTowards:
			(self getCellWithMaxGrassAmong: self getBaldiols) ].
	LandscapeDundi season = NduunguSeason ifTrue: [ 
		sheepHerd moveTowards:
			(self getCellWithMaxGrassAmong: self getSangres) ].

	sheepHerd dailyConsume
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

{ #category : #control }
Foyre >> step [

	self manageCattle.
	self manageSheep
]
