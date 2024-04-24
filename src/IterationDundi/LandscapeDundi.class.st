Class {
	#name : #LandscapeDundi,
	#superclass : #CMAbstractModel,
	#instVars : [
		'numberOfRows',
		'numberOfColumns',
		'theLandUnits',
		'season',
		'theTreeCovers',
		'camps',
		'theCattleHerds',
		'theSheepHerds',
		'theFoyres'
	],
	#category : #IterationDundi
}

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_averageGrass [
  ^ (Color r: 1.0 g: 0.6480938416422287 b: 0.0 alpha: 1.0)
]

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_totalGrass [
  ^ (Color r: 0.0 g: 1.0 b: 0.18866080156402737 alpha: 1.0)
]

{ #category : #probes }
LandscapeDundi >> averageGrass [

	<probe> 

	^ Cormas average: (self theLandUnits collect: [ :each | each grassCover amountOfGrass])


]

{ #category : #initialization }
LandscapeDundi >> createCamps [
	
	| potentialCampSites campSites campNames numberOfCamps campSite |
	
	
	campNames := #('wendou Namari' 'Thiafaly' 'Sorro' 'Velingara' 'wendou ilo' 'Nieloumol' 'Koki').
	numberOfCamps := campNames size.
	
	potentialCampSites := theLandUnits select: [ :each | each isPotentialCampSite ].
	campSites := potentialCampSites shuffled first: numberOfCamps.
	
	camps := ( 1 to: numberOfCamps) collect: [ :i |
		campSite := campSites at: i.
		campSite createCampNamed: (campNames at: i).
	 	campSite camp ].
	
	
	
	
]

{ #category : #initialization }
LandscapeDundi >> createFoyres [

	theFoyres := { 
		          (Foyre
			           camp: camps first
			           numberOfPeople: 4
			           numberOfSheep: 400
			           numberOfCattle: 500).

		          (Foyre
			           camp: camps first
			           numberOfPeople: 3
			           numberOfSheep: 1500
			           numberOfCattle: 150).

		          (Foyre
			           camp: camps first
			           numberOfPeople: 6
			           numberOfSheep: 1300
			           numberOfCattle: 280).

		          (Foyre
			           camp: camps second
			           numberOfPeople: 5
			           numberOfSheep: 160
			           numberOfCattle: 275).

		          (Foyre
			           camp: camps second
			           numberOfPeople: 3
			           numberOfSheep: 900
			           numberOfCattle: 600).

		          (Foyre
			           camp: camps third
			           numberOfPeople: 6
			           numberOfSheep: 5000
			           numberOfCattle: 500).

		          (Foyre
			           camp: camps third
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300). 
			
			  (Foyre
			           camp: camps fourth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			 
			  (Foyre
			           camp: camps fourth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
			  (Foyre
			           camp: camps fourth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			 
			  (Foyre
			           camp: camps fifth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps fifth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps fifth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps sixth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					  (Foyre
			           camp: camps sixth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					  (Foyre
			           camp: camps sixth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300) } 
]

{ #category : #'accessing - spatial grid' }
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

{ #category : #'accessing - spatial grid' }
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

{ #category : #init }
LandscapeDundi >> init [

	self
		createGridLines: numberOfRows
		columns: numberOfColumns
		neighbourhood: 4
		closed: true.
		
	self initializeSoil.
	self initializeParkStatus.
	self initTreeCover.
	self initGrass.
	self createCamps.
	self createFoyres.
	
	theCattleHerds := theFoyres collect: [ :foyre | foyre cattleHerd ].
	theSheepHerds := theFoyres collect: [ :foyre | foyre sheepHerd ].

	self
		displayPov: #povSoil of: LandUnit;
		displayPov: #pov of: GroupOfLivings .
		

]

{ #category : #initialization }
LandscapeDundi >> initGrass [

	self theLandUnits do: [ 
			:c | c initGrass ]

]

{ #category : #initialization }
LandscapeDundi >> initTreeCover [

	self theLandUnits do: [ 
			:c | c initTreeCover ]

]

{ #category : #initialization }
LandscapeDundi >> initialize [

	super initialize.

	numberOfRows := 30.
	numberOfColumns := 30.

	theLandUnits := OrderedCollection new.
	theCattleHerds := OrderedCollection new.
	theSheepHerds := OrderedCollection new.
	theFoyres := OrderedCollection new.
	theTreeCovers := OrderedCollection new.
	camps := OrderedCollection new.
	
	season := NduunguSeason new.
]

{ #category : #initialization }
LandscapeDundi >> initializeParkStatus [

	1 to: numberOfRows do: [ :i | 
		1 to: numberOfColumns do: [ :j |
			((self gridParkMatrix at: i) at: j) = 1 ifTrue: [ 
				(self pickCellAt: j@i) makeRestricted ] ] ]

]

{ #category : #initialization }
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

{ #category : #accessing }
LandscapeDundi >> season [

	^ season
]

{ #category : #control }
LandscapeDundi >> step: t [
		
	season := season nextSeason.
	
	theCattleHerds do: #dailyStep.
	theSheepHerds do: #dailyStep.
	theLandUnits do: #step.
	
]

{ #category : #accessing }
LandscapeDundi >> theCattleHerds [

	<getterFor: #Cattle>
	^ theCattleHerds
]

{ #category : #accessing }
LandscapeDundi >> theFoyres [

	<getterFor: #Foyre>
	^ theFoyres
]

{ #category : #accessing }
LandscapeDundi >> theLandUnits [

	<getterFor: #LandUnit>
	^ theLandUnits
]

{ #category : #accessing }
LandscapeDundi >> theLandUnits: anObject [

	theLandUnits := anObject
]

{ #category : #accessing }
LandscapeDundi >> theSheepHerds [

	<getterFor: #Sheep>
	^ theSheepHerds
]

{ #category : #accessing }
LandscapeDundi >> theTreeCovers [

	<getterFor: #TreeCover>
	^ theTreeCovers
]

{ #category : #accessing }
LandscapeDundi >> theTreeCovers: anObject [

	theTreeCovers := anObject
]

{ #category : #probes }
LandscapeDundi >> totalGrass [

	<probe> 

	^ Cormas sum: (self theLandUnits collect: [ :each | each grassCover amountOfGrass])


]
