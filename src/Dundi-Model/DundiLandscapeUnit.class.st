Class {
	#name : #DundiLandscapeUnit,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'treeAmount',
		'waterAmount',
		'grassAmount',
		'category',
		'isRestricted',
		'state'
	],
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiLandscapeUnit class >> maxGrassAmount [

	^ self
]

{ #category : #accessing }
DundiLandscapeUnit class >> maxTreeAmount [

	^ self
]

{ #category : #accessing }
DundiLandscapeUnit class >> maxWaterAmount [

	^ self
]

{ #category : #accessing }
DundiLandscapeUnit >> grassAmount [

	^ grassAmount
]

{ #category : #accessing }
DundiLandscapeUnit >> grassAmount: anInteger [

	grassAmount := anInteger
]

{ #category : #initialization }
DundiLandscapeUnit >> initialize [

	super initialize.
	category := DundiBaldiolCategory new.
]

{ #category : #initialization }
DundiLandscapeUnit >> initializeRandomCategory [

	| blocks |
	
	blocks := { 
		[ self makeBaldiol ] .
		[ self makeSeeno ] .
		[ self makeSangre ] }.
	
	(Cormas selectRandomlyFrom: blocks) value
]

{ #category : #accessing }
DundiLandscapeUnit >> isRestricted [

	^ state = #restricted
]

{ #category : #accessing }
DundiLandscapeUnit >> makeBaldiol [

	category := DundiBaldiolCategory new.
]

{ #category : #accessing }
DundiLandscapeUnit >> makeRestricted [

	state := #restricted
]

{ #category : #accessing }
DundiLandscapeUnit >> makeSangre [

	category := DundiSangreCategory new.
]

{ #category : #accessing }
DundiLandscapeUnit >> makeSeeno [

	category := DundiSeenoCategory new.
]

{ #category : #pov }
DundiLandscapeUnit >> povCategory [

	^ category color
]

{ #category : #pov }
DundiLandscapeUnit >> povCategoryAndRestricted [

	^ self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ category color ]
]

{ #category : #pov }
DundiLandscapeUnit >> povRestricted [

	^ self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ Color veryVeryLightGray ]
]

{ #category : #accessing }
DundiLandscapeUnit >> treeAmount [

	^ treeAmount
]

{ #category : #accessing }
DundiLandscapeUnit >> treeAmount: anInteger [

	treeAmount := anInteger
]

{ #category : #accessing }
DundiLandscapeUnit >> waterAmount [

	^ waterAmount
]

{ #category : #accessing }
DundiLandscapeUnit >> waterAmount: anInteger [

	waterAmount := anInteger
]
