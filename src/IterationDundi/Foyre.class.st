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
Foyre >> cellWithMaxGrassAmong: listOfCells [

	"return a cell with maximum of grass among listOfCells. listOfCells excludes the protected cells. If several cells with max, return one randomly"

	| max authorizedCells |
	authorizedCells := listOfCells select: [ :c | c isRestricted not].
	max := Cormas maxOf: #grassAmount amongObjects: authorizedCells.
	^ Cormas selectRandomlyFrom:
		  (authorizedCells select: [ :c | c grassAmount = max ])
]

{ #category : #control }
Foyre >> checkKnownSpace [
| set |
knownSpace size >= 100 ifTrue: [ self halt]. 
set := Set withAll: knownSpace  values.
set size = knownSpace size ifFalse: [ self halt]. 
]

{ #category : #control }
Foyre >> forgetCell: aCell [
knownSpace removeKey:	(knownSpace keyAtValue: aCell ifAbsent: [^nil])
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
	knownSpace := Dictionary new
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

	LandscapeDundi season = CeeduSeason ifTrue: [ 
		cattleHerd moveTo:
			(self cellWithMaxGrassAmong:
				 cattleHerd patch neighbourhoodAndSelf) ].
	LandscapeDundi season = CeetceldeSeason ifTrue: [ 
		cattleHerd moveTowards:
			(self cellWithMaxGrassAmong:
				 cattleHerd patch neighbourhoodAndSelf) ].
	LandscapeDundi season = DabbuundeSeason ifTrue: [ 
		cattleHerd moveTowards:
			(self cellWithMaxGrassAmong: self getBaldiols) ].
	LandscapeDundi season = NduunguSeason ifTrue: [ 
		cattleHerd moveTowards:
			(self cellWithMaxGrassAmong: self getSangres) ].

	cattleHerd dailyConsume
]

{ #category : #control }
Foyre >> manageHerdMemory: aHerd [

	| bestGrass bestGrassMem targetCell |
	targetCell := self cellWithMaxGrassAmong:
		              aHerd patch neighbourhoodAndSelf.
	bestGrass := targetCell grassAmount. 
	knownSpace isEmpty ifFalse: [ 
		bestGrassMem := knownSpace keys max.
		bestGrass >= bestGrassMem ifFalse: [ 
			targetCell := knownSpace at: bestGrassMem ] ].
	"on oublie la cell sur laquelle le troupeau va aller aujourd'hui"
	self forgetCell: targetCell.
	aHerd
		moveTowards: targetCell
		constraintOnPath: [ :c | c isRestricted not ].
	"aHerd moveTo: targetCell."
	self rememberSpace: aHerd patch.

	aHerd dailyConsume
]

{ #category : #control }
Foyre >> manageSheep [

	sheepHerd ifNil: [ ^ nil ].
	sheepHerd corporalConditionPercent < 30 ifTrue: [ 
		sheepHerd die.
		^ sheepHerd := nil ].
	
	LandscapeDundi season = CeeduSeason ifTrue: [ 
		sheepHerd moveTowards:
			(self cellWithMaxGrassAmong:
				 sheepHerd patch neighbourhoodAndSelf) ].
	LandscapeDundi season = CeetceldeSeason ifTrue: [ 
		sheepHerd moveTowards:
			(self cellWithMaxGrassAmong:
				 sheepHerd patch neighbourhoodAndSelf) ].
	LandscapeDundi season = DabbuundeSeason ifTrue: [ 
		sheepHerd moveTowards:
			(self cellWithMaxGrassAmong: self getBaldiols) ].
	LandscapeDundi season = NduunguSeason ifTrue: [ 
		sheepHerd moveTowards:
			(self cellWithMaxGrassAmong: self getSangres) ].

	sheepHerd dailyConsume
]

{ #category : #initialization }
Foyre >> moveHerdsToCamp [

	sheepHerd moveTo: camp landUnit.
	cattleHerd moveTo: camp landUnit.
	self rememberSpace: camp landUnit
]

{ #category : #pov }
Foyre >> povId [

	^ super povId
]

{ #category : #control }
Foyre >> rememberSpace: aCell [

	"la clé est la valeur du grass au moment de l'enregistrement"

	knownSpace at: aCell grassAmount put: aCell "copy"
	"self checkKnownSpace"
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

{ #category : #control }
Foyre >> stepMemory [

	cattleHerd isNil ifFalse: [ 
		cattleHerd corporalConditionPercent < 30
			ifTrue: [ cattleHerd die ]
			ifFalse: [ self manageHerdMemory: cattleHerd] ].


	sheepHerd isNil ifFalse: [ 
		sheepHerd corporalConditionPercent < 30
			ifTrue: [ sheepHerd die ]
			ifFalse: [ self manageHerdMemory: sheepHerd ] ]
]
