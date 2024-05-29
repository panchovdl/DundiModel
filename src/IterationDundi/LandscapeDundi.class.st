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
		'theCattles',
		'theSheeps',
		'theFoyres',
		'theWaterPoints'
	],
	#classVars : [
		'season'
	],
	#category : #IterationDundi
}

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_averageGrass [
  ^ (Color r: 0.28934506353861195 g: 0.8719452590420332 b: 0.2561094819159335 alpha: 1.0)
]

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_cc_Cattle [
  ^ (Color r: 0.5405669599217986 g: 0.364613880742913 b: 0.13294232649071358 alpha: 1.0)
]

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_cc_Sheep [
  ^ (Color r: 0.3626588465298143 g: 0.7223851417399805 b: 0.8377321603128055 alpha: 1.0)
]

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_corporalCondition [
  ^ (Color r: 0.08993157380254155 g: 0.08993157380254155 b: 0.520039100684262 alpha: 1.0)
]

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_grassGrowthRate [
  ^ (Color r: 0.05278592375366569 g: 0.0 b: 1.0 alpha: 1.0)
]

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_rain [
  ^ (Color r: 0.1681329423264907 g: 0.06647116324535679 b: 0.83088954056696 alpha: 1.0)
]

{ #category : #'- probes' }
LandscapeDundi class >> colorOfProbe_totalGrass [
  ^ (Color r: 0.0 g: 1.0 b: 0.18866080156402737 alpha: 1.0)
]

{ #category : #accessing }
LandscapeDundi class >> season [

	^ season
]

{ #category : #accessing }
LandscapeDundi class >> season: anObject [

	season := anObject
]

{ #category : #probes }
LandscapeDundi >> averageGrass [

	<probe> 

	^ Cormas average: (self theLandUnits collect: [ :each | each grassCover amountOfGrass])


]

{ #category : #probes }
LandscapeDundi >> cc_Cattle [

	<probe>
	^ Cormas average:
		  (self theCattles collect: [ :each | each corporalConditionPercent ])
]

{ #category : #probes }
LandscapeDundi >> cc_Sheep [

	<probe>
	^ Cormas average:
		  (self theSheeps collect: [ :each | each corporalConditionPercent ])
]

{ #category : #probes }
LandscapeDundi >> corporalCondition [ 

	<probe> 

	^ Cormas average: (self theHerds collect: [ :each | each corporalCondition])


]

{ #category : #initialization }
LandscapeDundi >> create1Foyre [

	theFoyres := { (Foyre
		              camp: camps first
		              numberOfPeople: 4
		              numberOfSheep: 2000
		              numberOfCattle: 1000) }
]

{ #category : #initialization }
LandscapeDundi >> create1WaterPoint [

	| theCampCell wp |
	theWaterPoints := OrderedCollection new.
	theCampCell := (self theLandUnits select: [ :c | c camp isNotNil ])
		               first.

	wp := WaterPoint new.
	theWaterPoints add: wp.
	wp moveTo: theCampCell neighbourhood first.
	theCampCell camp waterPoints add: wp
]

{ #category : #initialization }
LandscapeDundi >> create7Camps [
	
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
LandscapeDundi >> create7Foyres [

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

{ #category : #initialization }
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

{ #category : #initialization }
LandscapeDundi >> createCamps: numberOfCamps [

	| potentialCampSites campSites campSite |
	numberOfCamps = 7 ifTrue: [ ^self create7Camps ].
	potentialCampSites := theLandUnits select: [ :each | 
		                      each isPotentialCampSite ].
	campSites := Cormas
		             selectRandomlyFrom: potentialCampSites
		             subCollectionSize: numberOfCamps.

	camps := (1 to: numberOfCamps) collect: [ :i | 
		         campSite := campSites at: i.
		         campSite createCampNamed: campSite id asString.
		         campSite camp ]
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
			           numberOfCattle: 300).
			
						(Foyre
			           camp: camps seventh 
			           numberOfPeople: 4
			           numberOfSheep: 400
			           numberOfCattle: 500).

		          (Foyre
			           camp: camps seventh
			           numberOfPeople: 3
			           numberOfSheep: 1500
			           numberOfCattle: 150).

		          (Foyre
			           camp: camps eighth 
			           numberOfPeople: 6
			           numberOfSheep: 1300
			           numberOfCattle: 280).

		          (Foyre
			           camp: camps eighth 
			           numberOfPeople: 5
			           numberOfSheep: 160
			           numberOfCattle: 275).

		          (Foyre
			           camp: camps eighth
			           numberOfPeople: 3
			           numberOfSheep: 900
			           numberOfCattle: 600).

		          (Foyre
			           camp: camps ninth 
			           numberOfPeople: 6
			           numberOfSheep: 5000
			           numberOfCattle: 500).

		          (Foyre
			           camp: camps ninth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300). 
			
			  (Foyre
			           camp: camps ninth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			 
			  (Foyre
			           camp: camps tenth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
			  (Foyre
			           camp: camps eleventh 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			 
			  (Foyre
			           camp: camps fifth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps eleventh 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps twelveth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps twelveth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					  (Foyre
			           camp: camps thirteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					  (Foyre
			           camp: camps thirteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					    (Foyre
							
			           camp: camps fourteenth 
			           numberOfPeople: 4
			           numberOfSheep: 400
			           numberOfCattle: 500).

		          (Foyre
			           camp: camps fourteenth 
			           numberOfPeople: 3
			           numberOfSheep: 1500
			           numberOfCattle: 150).

		          (Foyre
			           camp: camps fifteenth 
			           numberOfPeople: 6
			           numberOfSheep: 1300
			           numberOfCattle: 280).

		          (Foyre
			           camp: camps fifteenth 
			           numberOfPeople: 5
			           numberOfSheep: 160
			           numberOfCattle: 275).

		          (Foyre
			           camp: camps sixteenth 
			           numberOfPeople: 3
			           numberOfSheep: 900
			           numberOfCattle: 600).

		          (Foyre
			           camp: camps third
			           numberOfPeople: 6
			           numberOfSheep: 5000
			           numberOfCattle: 500).

		          (Foyre
			           camp: camps sixteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300). 
			
			  (Foyre
			           camp: camps seventeenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			 
			  (Foyre
			           camp: camps seventeenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
			  (Foyre
			           camp: camps seventeenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			 
			  (Foyre
			           camp: camps eighteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps eighteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps nineteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps nineteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					  (Foyre
			           camp: camps twentith 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					  (Foyre
			           camp: camps twentith 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
						(Foyre
			           camp: camps twentith 
			           numberOfPeople: 4
			           numberOfSheep: 400
			           numberOfCattle: 500).

		          (Foyre
			           camp: camps twentyFirst 
			           numberOfPeople: 3
			           numberOfSheep: 1500
			           numberOfCattle: 150).

		          (Foyre
			           camp: camps twentyFirst  
			           numberOfPeople: 6
			           numberOfSheep: 1300
			           numberOfCattle: 280).

		          (Foyre
			           camp: camps twentyFirst  
			           numberOfPeople: 5
			           numberOfSheep: 160
			           numberOfCattle: 275).

		          (Foyre
			           camp: camps eighth
			           numberOfPeople: 3
			           numberOfSheep: 900
			           numberOfCattle: 600).

		          (Foyre
			           camp: camps ninth 
			           numberOfPeople: 6
			           numberOfSheep: 5000
			           numberOfCattle: 500).

		          (Foyre
			           camp: camps ninth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300). 
			
			  (Foyre
			           camp: camps ninth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			 
			  (Foyre
			           camp: camps tenth
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
			  (Foyre
			           camp: camps eleventh 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			 
			  (Foyre
			           camp: camps fifth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps eleventh 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps twelveth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
		  (Foyre
			           camp: camps twelveth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					  (Foyre
			           camp: camps thirteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300).
			
					  (Foyre
			           camp: camps thirteenth 
			           numberOfPeople: 3
			           numberOfSheep: 500
			           numberOfCattle: 300) } 
]

{ #category : #initialization }
LandscapeDundi >> createFoyres: numberOfFoyres [

	numberOfFoyres = 1 ifTrue: [ self create1Foyre ] ifFalse:[
	numberOfFoyres = 7 ifTrue: [  self create7Foyres ] ifFalse: [  

	self createRandomFoyres: numberOfFoyres]].
self theFoyres do: [ :f | f landscape: self theLandUnits ]
]

{ #category : #initialization }
LandscapeDundi >> createRandomFoyres: number [

	theFoyres := OrderedCollection new.
	number timesRepeat: [ 
		theFoyres add: (Foyre
				 camp: (Cormas selectRandomlyFrom: camps)
				 numberOfPeople: (Cormas randomIntegerFrom: 3 to: 6)
				 numberOfSheep: (Cormas randomIntegerFrom: 16 to: 500) * 10
				 numberOfCattle: (Cormas randomIntegerFrom: 15 to: 60) * 10) ]
]

{ #category : #initialization }
LandscapeDundi >> createWaterPoints [

	| listOfCells cellsWithWater wp theCamps distanceMin dist nearestCell |
	listOfCells := #( 338 52 495 669 ).
	theWaterPoints := OrderedCollection new.
	cellsWithWater := self theLandUnits select: [ :c | 
		                  listOfCells includes: c id ].
	theCamps := self theLandUnits select: [ :c | c camp isNotNil ].
	cellsWithWater do: [ :c | 
		wp := WaterPoint new.
		theWaterPoints add: wp.
		wp moveTo: c.
		"look for nearest camp around each waterpoint"
		distanceMin := 1000.
		theCamps do: [ :cc | 
			(dist := c distanceTo: cc) < distanceMin ifTrue: [ 
				distanceMin := dist.
				nearestCell := cc ] ].
		nearestCell camp waterPoints add: wp ]
]

{ #category : #control }
LandscapeDundi >> dailyStep: t [

	self setSeason.

	theFoyres do: #step.
	theLandUnits do: #step
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
		neighbourhood: 8
		closed: true.

	self initializeSoil.
	self initializeParkStatus.
	self initTreeCover.
	self initGrass.
	self createCamps: 14.
	self createFoyres: 20.

	theCattles := theFoyres collect: [ :foyre | foyre cattleHerd ].
	theSheeps := theFoyres collect: [ :foyre | foyre sheepHerd ].

	self createWaterPoints.

	self
		displayPov: #povGrassCover of: LandUnit;
		displayPov: #pov of: GroupOfLivings;
		displayPov: #pov of: WaterPoint
]

{ #category : #init }
LandscapeDundi >> init7 [

	self
		createGridLines: numberOfRows
		columns: numberOfColumns
		neighbourhood: 8
		closed: true.

	self initializeSoil.
	self initializeParkStatus.
	self initTreeCover.
	self initGrass.
	self createCamps: 7.
	self createFoyres: 7.

	theCattles := theFoyres collect: [ :foyre | foyre cattleHerd ].
	theSheeps := theFoyres collect: [ :foyre | foyre sheepHerd ].

	self createWaterPoints.

	self
		displayPov: #povGrassCover of: LandUnit;
		displayPov: #pov of: GroupOfLivings
]

{ #category : #initialization }
LandscapeDundi >> initGrass [

	self theLandUnits do: [ 
			:c | c initGrass ]

]

{ #category : #init }
LandscapeDundi >> initSmall [

	numberOfRows := 10.
	numberOfColumns := 10.
	self
		createGridLines: numberOfRows
		columns: numberOfColumns
		neighbourhood: 8
		closed: true.

	self initializeSoil.
	"self initializeParkStatus."
	self initTreeCover.
	self initGrass.
	self createCamps: 1.
	self createFoyres: 2.

	theCattles := theFoyres collect: [ :foyre | foyre cattleHerd ].
	theSheeps := theFoyres collect: [ :foyre | foyre sheepHerd ].

	self create1WaterPoint.

	self
		displayPov: #povGrassCover of: LandUnit;
		displayPov: #pov of: GroupOfLivings;
		displayPov: #pov of: WaterPoint
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
	theCattles := OrderedCollection new.
	theSheeps := OrderedCollection new.
	theFoyres := OrderedCollection new.
	theTreeCovers := OrderedCollection new.
	theWaterPoints := OrderedCollection new.
	camps := OrderedCollection new.

	season := NduunguSeason new
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

{ #category : #control }
LandscapeDundi >> monthlyStep: t [

	30 timesRepeat: [ self dailyStep: t ]
]

{ #category : #probes }
LandscapeDundi >> rain [  

	<probe>  

	^ season grassGrowthRate 


]

{ #category : #accessing }
LandscapeDundi >> season [

	^ season
]

{ #category : #controling }
LandscapeDundi >> setSeason [

	season := season nextSeason.
	self class season: season class
]

{ #category : #accessing }
LandscapeDundi >> theCattles [

	<getterFor: #Cattle>
	^ theCattles
]

{ #category : #accessing }
LandscapeDundi >> theFoyres [

	<getterFor: #Foyre>
	^ theFoyres
]

{ #category : #accessing }
LandscapeDundi >> theHerds [

	| herds |
	herds := self theCattles copy asOrderedCollection.
	herds addAll: self theSheeps.
	^ herds
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
LandscapeDundi >> theSheeps [

	<getterFor: #Sheep>
	^ theSheeps
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

{ #category : #accessing }
LandscapeDundi >> theWaterPoints [
	<getterFor: #WaterPoint>
	^ theWaterPoints
]

{ #category : #accessing }
LandscapeDundi >> theWaterPoints: anObject [

	theWaterPoints := anObject
]

{ #category : #'probes-Old' }
LandscapeDundi >> totalGrass [

	"<probe>" 

	^ Cormas sum: (self theLandUnits collect: [ :each | each grassCover amountOfGrass])


]
