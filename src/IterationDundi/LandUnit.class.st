Class {
	#name : #LandUnit,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'soil',
		'parkRestriction',
		'treeCover',
		'grass'
	],
	#category : #IterationDundi
}

{ #category : #accessing }
LandUnit >> grass [

	^ grass
]

{ #category : #accessing }
LandUnit >> grass: anObject [

	grass := anObject
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

	parkRestriction := false.
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
LandUnit >> isDead [ 

 ^ false
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
LandUnit >> parkRestriction [

	^ parkRestriction
]

{ #category : #accessing }
LandUnit >> parkRestriction: anObject [

	parkRestriction := anObject
]

{ #category : #pov }
LandUnit >> povRestricted [

	^ self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ Color veryVeryLightGray ]
]

{ #category : #pov }
LandUnit >> povSoil [

		^ self
		povAttribute: #grass
		min: 0
		max: 10
		color: soil color
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

	self growPlants.
	self monthlyResetHerdingMemory.
]

{ #category : #accessing }
LandUnit >> treeCover [

	^ treeCover
]

{ #category : #accessing }
LandUnit >> treeCover: anObject [

	treeCover := anObject
]
