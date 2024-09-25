Class {
	#name : 'LandUnit',
	#superclass : 'CMSpatialEntityElement',
	#instVars : [
		'soil',
		'parkRestriction',
		'treeCover',
		'grassCover',
		'camp'
	],
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'accessing' }
LandUnit >> camp [

	^ camp
]

{ #category : 'accessing' }
LandUnit >> camp: anObject [

	camp := anObject
]

{ #category : 'as yet unclassified' }
LandUnit >> createCampNamed: aString [
	
	camp := Camp named: aString.
	camp landUnit: self. 
]

{ #category : 'accessing' }
LandUnit >> grassAmount [

	^ grassCover amountOfGrass 
]

{ #category : 'accessing' }
LandUnit >> grassCover [

	^ grassCover 
]

{ #category : 'as yet unclassified' }
LandUnit >> grassGrowthRate [ 

	^ cormasModel season grassGrowthRate 
]

{ #category : 'initialization' }
LandUnit >> initGrass [ 

	grassCover initGrass
]

{ #category : 'initialization' }
LandUnit >> initTreeCover [

	treeCover := cormasModel newEntity: TreeCover. 
	treeCover moveTo: self.
	treeCover setTreesNumber.
]

{ #category : 'initialization' }
LandUnit >> initialize [

	super initialize.
	parkRestriction := false.
	grassCover := GrassCover for: self.
]

{ #category : 'initialization' }
LandUnit >> initializeRandomSoil [

	| blocks |
	
	blocks := { 
		[ self makeBaldiol ] .
		[ self makeSeeno ] .
		[ self makeSangre ].
		[ self makeCaangol ] }.
	
	(self selectRandomlyFrom: blocks) value
]

{ #category : 'testing' }
LandUnit >> isPotentialCampSite [

	^ soil isCaangol not and: [ 
		  self neighbourhood anySatisfy: [ :each | each soil isCaangol ] ]
]

{ #category : 'testing' }
LandUnit >> isRestricted [

	^ self parkRestriction
]

{ #category : 'initialization' }
LandUnit >> makeBaldiol [ 

	soil := Baldiol new.
	soil landUnit: self.
]

{ #category : 'initialization' }
LandUnit >> makeCaangol [ 

	soil := Caangol new.
	soil landUnit: self.
]

{ #category : 'setting category' }
LandUnit >> makeRestricted [

	parkRestriction := true 
]

{ #category : 'initialization' }
LandUnit >> makeSangre [ 

	soil := Sangre new.
	soil landUnit: self.
]

{ #category : 'initialization' }
LandUnit >> makeSeeno [ 

	soil := Seeno new.
	soil landUnit: self.
]

{ #category : 'accessing' }
LandUnit >> maxGrassAmount [ 

	^ soil class maxGrass. 
]

{ #category : 'as yet unclassified' }
LandUnit >> maxGrassPotential [ 

	^ (AbstractSoil allSubclasses collect: #maxGrass) max. 
]

{ #category : 'accessing' }
LandUnit >> parkRestriction [

	^ parkRestriction
]

{ #category : 'accessing' }
LandUnit >> parkRestriction: anObject [

	parkRestriction := anObject
]

{ #category : 'pov' }
LandUnit >> povCamp [
	
	<pov>
	^ camp
		ifNil: [ self povSoilAndRestricted ]
		ifNotNil: [ CMPointOfView color: Color black ]
]

{ #category : 'pov' }
LandUnit >> povGrassCover [

	<pov>
	^ CMPointOfView color: (self
		colorAttribute: #grassAmount
		min: 0
		max: self  maxGrassPotential 
		color: Color green)
]

{ #category : 'pov' }
LandUnit >> povGrassCoverSoilType [

	<pov>
	^ CMPointOfView color: (self
		colorAttribute: #grassAmount
		min: 0
		max: self maxGrassPotential 
		color: soil color)
]

{ #category : 'pov' }
LandUnit >> povPotentialCampSites [

	<pov>
	^ CMPointOfView color: (self isPotentialCampSite
		ifTrue: [ Color white ]
		ifFalse: [ Color black ]). 
]

{ #category : 'pov' }
LandUnit >> povRestricted [

	<pov>
	^ CMPointOfView color: (self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ Color veryVeryLightGray ])
]

{ #category : 'pov' }
LandUnit >> povSoil [

	<pov>
	^ CMPointOfView color: soil color
]

{ #category : 'pov' }
LandUnit >> povSoilAndRestricted [

	<pov>
	^ CMPointOfView color: (self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ soil color ])
]

{ #category : 'accessing' }
LandUnit >> soil [

	^ soil
]

{ #category : 'accessing' }
LandUnit >> soil: anObject [

	soil := anObject
]

{ #category : 'stepping' }
LandUnit >> step [

	grassCover growGrass.
]

{ #category : 'accessing' }
LandUnit >> treeCover [

	^ treeCover
]

{ #category : 'accessing' }
LandUnit >> treeCover: anObject [

	treeCover := anObject
]
