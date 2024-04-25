Class {
	#name : #LandUnit,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'soil',
		'parkRestriction',
		'treeCover',
		'grassCover',
		'camp'
	],
	#category : #IterationDundi
}

{ #category : #accessing }
LandUnit >> camp [

	^ camp
]

{ #category : #accessing }
LandUnit >> camp: anObject [

	camp := anObject
]

{ #category : #initialization }
LandUnit >> createCampNamed: aString [
	
	camp := Camp named: aString.
	camp landUnit: self. 
]

{ #category : #accessing }
LandUnit >> grassAmount [

	^ grassCover amountOfGrass 
]

{ #category : #accessing }
LandUnit >> grassCover [

	^ grassCover 
]

{ #category : #accessing }
LandUnit >> grassGrowthRate [ 

	^ cormasModel season grassGrowthRate 
]

{ #category : #testing }
LandUnit >> hasWaterPoint [
	^self hasOccupantsOfClass: WaterPoint 
]

{ #category : #initialization }
LandUnit >> initGrass [ 

	grassCover initGrass
]

{ #category : #initialization }
LandUnit >> initTreeCover [

	|tc|
	tc := TreeCover new. 
	tc moveTo: self.
	tc setTreesNumber.
]

{ #category : #initialization }
LandUnit >> initialize [

	super initialize.
	parkRestriction := false.
	grassCover := GrassCover for: self.
]

{ #category : #initialization }
LandUnit >> initializeRandomSoil [

	| blocks |
	
	blocks := { 
		[ self makeBaldiol ] .
		[ self makeSeeno ] .
		[ self makeSangre ].
		[ self makeCaangol ] }.
	
	(Cormas selectRandomlyFrom: blocks) value
]

{ #category : #testing }
LandUnit >> isPotentialCampSite [

	^ soil isCaangol not and: [ 
		  self neighbourhood anySatisfy: [ :each | each soil isCaangol ] ]
]

{ #category : #testing }
LandUnit >> isRestricted [

	^ self parkRestriction
]

{ #category : #initialization }
LandUnit >> makeBaldiol [ 

	soil := Baldiol new.
	soil landUnit: self.
]

{ #category : #initialization }
LandUnit >> makeCaangol [ 

	soil := Caangol new.
	soil landUnit: self.
]

{ #category : #'setting category' }
LandUnit >> makeRestricted [

	parkRestriction := true 
]

{ #category : #initialization }
LandUnit >> makeSangre [ 

	soil := Sangre new.
	soil landUnit: self.
]

{ #category : #initialization }
LandUnit >> makeSeeno [ 

	soil := Seeno new.
	soil landUnit: self.
]

{ #category : #accessing }
LandUnit >> maxGrassAmount [ 

	^ soil class maxGrass. 
]

{ #category : #accessing }
LandUnit >> maxGrassPotential [ 

	^ (AbstractSoil allSubclasses collect: #maxGrass) max. 
]

{ #category : #accessing }
LandUnit >> minGrass [

	^ grassCover minGrass  
]

{ #category : #accessing }
LandUnit >> parkRestriction [

	^ parkRestriction
]

{ #category : #accessing }
LandUnit >> parkRestriction: anObject [

	parkRestriction := anObject
]

{ #category : #pov }
LandUnit >> povCamp [
self hasWaterPoint
		  ifTrue: [ ^Color blue ].
	^ camp ifNil: [ self povSoilAndRestricted ] ifNotNil: [ Color black ]
]

{ #category : #pov }
LandUnit >> povGrassCover [

	self hasWaterPoint ifTrue: [ ^ Color blue ].
	camp ifNotNil: [ ^ Color black ].
	self grassAmount <= self minGrass ifTrue: [ ^ Color white ].
	"^self povAttribute: #grassAmount min: self minGrass color: (Color yellow) max: (self  maxGrassPotential) color: Color green ."

	^ self
		  povAttribute: #grassAmount
		  min: self minGrass - 1
		  max: 2 * self maxGrassPotential
		  color: Color green
]

{ #category : #pov }
LandUnit >> povGrassCoverSoilType [

	^ self
		povAttribute: #grassAmount
		min: 0
		max: self maxGrassPotential 
		color: soil color 
]

{ #category : #pov }
LandUnit >> povPotentialCampSites [

	^ self isPotentialCampSite ifTrue: [ Color white ] ifFalse: [ Color black ]. 
]

{ #category : #pov }
LandUnit >> povRestricted [

	^ self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ Color veryVeryLightGray ]
]

{ #category : #pov }
LandUnit >> povSoil [

	^ soil color
]

{ #category : #pov }
LandUnit >> povSoilAndRestricted [

	^ self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ self povSoil ]
]

{ #category : #accessing }
LandUnit >> soil [

	^ soil
]

{ #category : #accessing }
LandUnit >> soil: anObject [

	soil := anObject
]

{ #category : #stepping }
LandUnit >> step [

	grassCover growGrass.
]

{ #category : #accessing }
LandUnit >> treeCover [

	^ treeCover
]

{ #category : #accessing }
LandUnit >> treeCover: anObject [

	treeCover := anObject
]
