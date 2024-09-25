Class {
	#name : 'LandscapeDundi',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'numberOfRows',
		'numberOfColumns',
		'theLandUnits',
		'season',
		'theTreeCovers',
		'camps',
		'theCattles',
		'theSheeps',
		'theFoyres',
		'initialNumberOfSheep',
		'initialNumberOfCattle'
	],
	#classInstVars : [
		'numberOfFoyres'
	],
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'initialization' }
LandscapeDundi class >> initializeParameters [

	super initializeParameters.
	numberOfFoyres := 150
]

{ #category : 'accessing' }
LandscapeDundi class >> numberOfFoyres [

	^ numberOfFoyres
]

{ #category : 'accessing' }
LandscapeDundi class >> numberOfFoyres: anObject [

	numberOfFoyres := anObject
]

{ #category : 'probes' }
LandscapeDundi >> averageCorporalCondition [ 

	<probeNamed: 'Average corporal condition' color: '171785'> 
	^ (self theHerds collect: #corporalConditionPercent)
		ifEmpty: [ 0 ]
		ifNotEmpty: #average


]

{ #category : 'probes' }
LandscapeDundi >> averageCorporalConditionCattle [

	<probeNamed: 'Average corporal condition of cattle' color: '8A5D22'>
	^ (self theCattles collect: #corporalConditionPercent) 
		ifEmpty: [ 0 ]
		ifNotEmpty: #average
]

{ #category : 'probes' }
LandscapeDundi >> averageCorporalConditionSheep [

	<probeNamed: 'Average corporal condition of sheep' color: '5CB8D6'>
	^ (self theSheeps collect: #corporalConditionPercent) 
		ifEmpty: [ 0 ]
		ifNotEmpty: #average
]

{ #category : 'probes' }
LandscapeDundi >> averageGrass [

	<probeNamed: 'Average grass amount' color: '4ADF41'> 
	^ (self theLandUnits collect: [ :each | each grassCover amountOfGrass ]) average


]

{ #category : 'initialization' }
LandscapeDundi >> createCamps [
	
	| potentialCampSites campSites campNames numberOfCamps campSite |
	
	
	campNames := #('wendou Namari' 'Thiafaly' 'Sorro' 'Velingara' 'wendou ilo' 'Nieloumol' 'Koki' 'yoyo' 'kali' 'majdi' 'oui' 'non' 'echelle' 'magie' 'noire' 'blanche' 'henry' ' nene' 'wendou ilo' 'saldaw' 'touba velingara').
	numberOfCamps := campNames size.
	
	potentialCampSites := theLandUnits select: [ :each | each isPotentialCampSite ].
	campSites := potentialCampSites shuffled first: numberOfCamps.
	
	camps := ( 1 to: numberOfCamps) collect: [ :i |
		campSite := campSites at: i.
		campSite createCampNamed: (campNames at: i).
	 	campSite camp ].
	
	
	
	


]

{ #category : 'as yet unclassified' }
LandscapeDundi >> createFoyreCamp: aCamp numberOfPeople: aNumberOfPeople numberOfSheep: aNumberOfSheep numberOfCattle: aNumberOfCattle [

	| foyre |
	foyre := self newEntity: Foyre.
	foyre cattleHerd: (self newEntity: Cattle).
	foyre sheepHerd: (self newEntity: Sheep).
	foyre camp: aCamp.
	foyre size: aNumberOfPeople.
	foyre sheepHerd size: aNumberOfSheep.
	foyre cattleHerd size: aNumberOfCattle.
	^ foyre.
]

{ #category : 'as yet unclassified' }
LandscapeDundi >> createRandomFoyres: number [

	number timesRepeat: [ 
		self
			createFoyreCamp: (self selectRandomlyFrom: camps)
			numberOfPeople: (self randomIntegerBetween: 3 and: 6)
			numberOfSheep: (self randomIntegerBetween: 30 and: 500) * 10
			numberOfCattle: (self randomIntegerBetween: 20 and: 80) * 10 ]
]

{ #category : 'accessing - spatial grid' }
LandscapeDundi >> gridParkMatrix [

	| matrix |
	
	matrix := #(
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)).
		
	(matrix size = numberOfRows and: [ matrix allSatisfy: [ :row | row size = numberOfColumns ] ])
		ifFalse: [ self error: 'Matrix has the wrong dimensions' ].
		
	^ matrix
]

{ #category : 'accessing - spatial grid' }
LandscapeDundi >> gridSoilMatrix [

	| matrix |
	
	matrix := #(
		(2 2 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 3 0 0 0 0 0 0 0 0)
		(2 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 3 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 3 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 3 3 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 2 2 0 0 0 3 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 2 2 0 0 3 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 2 2 0 3 3 3 0 0 0 0 0 0 0)
		(3 3 3 3 3 0 0 0 0 0 0 0 0 0 0 2 2 2 0 3 3 0 0 0 0 0 0 0 0 0)
		(3 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 2 3 3 3 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 3 3 3 3 3 3 3 3 3 3 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 3 3 3 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 0 3 3 0 0 0 3 3 3 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 3 3 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 3 3 3 3 0 0 0 0 0 0 0 0 0 3 3 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 3 3 0 0 0 0 0 0 0)
		(0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 3 0 0 0 0 0 0)
		(0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 3 0 0 0 0 0)
		(0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0)
		(0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 3 3 0 0 0)
		(0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0)
		(0 0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
		(0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)).
		
	"(matrix size = numberOfRows and: [ matrix allSatisfy: [ :row | row size = numberOfColumns ] ])
		ifFalse: [ self error: 'Matrix has the wrong dimensions' ]."
		
	^ matrix
]

{ #category : 'init' }
LandscapeDundi >> init [

	<init>
	self
		createGridNumberOfRows: numberOfRows
		numberOfColumns: numberOfColumns
		neighbourhood: 8
		closed: true.
		
	self initializeSoil.
	self initializeParkStatus.
	self initTreeCover.
	self initGrass.
	self createCamps.
	self createRandomFoyres: self class numberOfFoyres.
	
	initialNumberOfSheep := self theSheeps sum: #size.
	initialNumberOfCattle := self theCattles sum: #size.
	
	LandUnit activePovSelector: #povGrassCover.
]

{ #category : 'initialization' }
LandscapeDundi >> initGrass [

	self theLandUnits do: [ 
			:c | c initGrass ]

]

{ #category : 'initialization' }
LandscapeDundi >> initTreeCover [

	self theLandUnits do: [ 
			:c | c initTreeCover ]

]

{ #category : 'initialization' }
LandscapeDundi >> initialize [

	super initialize.

	numberOfRows := 30.
	numberOfColumns := 30.

	theLandUnits := OrderedCollection new.
	theCattles := OrderedCollection new.
	theSheeps := OrderedCollection new.
	theFoyres := OrderedCollection new.
	theTreeCovers := OrderedCollection new.
	camps := OrderedCollection new.
	
	season := NduunguSeason new.
]

{ #category : 'initialization' }
LandscapeDundi >> initializeParkStatus [

	1 to: numberOfRows do: [ :i | 
		1 to: numberOfColumns do: [ :j |
			((self gridParkMatrix at: i) at: j) = 1 ifTrue: [ 
				(self pickCellAt: j@i) makeRestricted ] ] ]

]

{ #category : 'initialization' }
LandscapeDundi >> initializeSoil [

	| matrixCellValue modelCell |

	1 to: numberOfRows do: [ :i | 
		1 to: numberOfColumns do: [ :j |
			matrixCellValue := (self gridSoilMatrix at: i) at: j.
			modelCell := self pickCellAt: j@i.
			
			matrixCellValue = 0 ifTrue: [ modelCell makeBaldiol ].
			matrixCellValue = 1 ifTrue: [ modelCell makeSeeno ].
			matrixCellValue = 2 ifTrue: [ modelCell makeSangre ].
			matrixCellValue = 3 ifTrue: [ modelCell makeCaangol ] ] ]

]

{ #category : 'probes' }
LandscapeDundi >> percentageOfRemainingCattle [

	<probeNamed: 'Percentage of remaining cattle' color: 'AC5D12'>
	^ (self theCattles sum: #size) / initialNumberOfCattle * 100


]

{ #category : 'probes' }
LandscapeDundi >> percentageOfRemainingSheep [

	<probeNamed: 'Percentage of remaining sheep' color: 'FFB000'> 
	^ (self theSheeps sum: #size) / initialNumberOfSheep * 100


]

{ #category : 'accessing' }
LandscapeDundi >> season [

	^ season
]

{ #category : 'control' }
LandscapeDundi >> step: t [
		
	<control>
	season := season nextSeason.

	theFoyres do: #step.
	theLandUnits do: #step.
	
]

{ #category : 'accessing' }
LandscapeDundi >> theCattles [

	<getterFor: #Cattle>
	^ theCattles
]

{ #category : 'accessing' }
LandscapeDundi >> theFoyres [

	<getterFor: #Foyre>
	^ theFoyres
]

{ #category : 'accessing' }
LandscapeDundi >> theHerds [
| herds |
herds := self theCattles copy.
herds addAll: self theSheeps.
^herds
]

{ #category : 'accessing' }
LandscapeDundi >> theLandUnits [

	<getterFor: #LandUnit>
	^ theLandUnits
]

{ #category : 'accessing' }
LandscapeDundi >> theLandUnits: anObject [

	theLandUnits := anObject
]

{ #category : 'accessing' }
LandscapeDundi >> theSheeps [

	<getterFor: #Sheep>
	^ theSheeps
]

{ #category : 'accessing' }
LandscapeDundi >> theTreeCovers [

	<getterFor: #TreeCover>
	^ theTreeCovers
]

{ #category : 'accessing' }
LandscapeDundi >> theTreeCovers: anObject [

	theTreeCovers := anObject
]

{ #category : 'probes' }
LandscapeDundi >> totalGrass [

	<probeNamed: 'Total grass amount' color: '00FF30'> 
	^ self theLandUnits sum: [ :each | each grassCover amountOfGrass]


]
