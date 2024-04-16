Class {
	#name : #LandUnit,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'soil',
		'parkRestriction',
		'treeCover',
		'grassCover'
	],
	#category : #IterationDundi
}

{ #category : #accessing }
LandUnit >> grassAmount [

	^ grassCover amountOfGrass 
]

{ #category : #accessing }
LandUnit >> grassCover [

	^ grassCover 
]

{ #category : #'as yet unclassified' }
LandUnit >> grassGrowthRate [ 

	^ cormasModel season grassGrowthRate 
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

{ #category : #'as yet unclassified' }
LandUnit >> maxGrassAmount [ 

	^ soil class maxGrass 
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
LandUnit >> povGrassCover [

	^ self
		povAttribute: #grassAmount
		min: 0
		max: self maxGrassAmount 
		color: Color green
]

{ #category : #pov }
LandUnit >> povGrassCoverSoilType [

	^ self
		povAttribute: #grassAmount
		min: 0
		max: self maxGrassAmount 
		color: soil color 
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
