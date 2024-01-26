Class {
	#name : #DundiLandscapeUnit,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'grassAmount',
		'category',
		'state',
		'woodAmount',
		'fruitAmount',
		'leafAmount'
	],
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiLandscapeUnit >> fruitAmount [

	^ fruitAmount
]

{ #category : #accessing }
DundiLandscapeUnit >> fruitAmount: anInteger [

	fruitAmount := anInteger
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
	self 	grassAmount: (Cormas randomIntegerFrom: 1 to: 10);
		 	leafAmount: (Cormas randomIntegerFrom: 1 to: 10);
			woodAmount: (Cormas randomIntegerFrom: 1 to: 10);
			fruitAmount: (Cormas randomIntegerFrom: 1 to: 10).
]

{ #category : #initialization }
DundiLandscapeUnit >> initializeRandomCategory [

	| blocks |
	
	blocks := { 
		[ self makeBaldiol ] .
		[ self makeSeeno ] .
		[ self makeSangre ].
		[ self makeCaangol ] }.
	
	(Cormas selectRandomlyFrom: blocks) value
]

{ #category : #accessing }
DundiLandscapeUnit >> isRestricted [

	^ state = #restricted
]

{ #category : #accessing }
DundiLandscapeUnit >> leafAmount [

	^ leafAmount
]

{ #category : #accessing }
DundiLandscapeUnit >> leafAmount: anInteger [

	leafAmount := anInteger
]

{ #category : #growth }
DundiLandscapeUnit >> logisticGrowth [

	self 	fruitAmount: (Cormas logisticGrowth: self fruitAmount r: category class reproductionRate K: category fruitCarryingCapacity);
			grassAmount: (Cormas logisticGrowth: self grassAmount r: category class reproductionRate K: category grassCarryingCapacity);
			leafAmount: (Cormas logisticGrowth: self leafAmount r: category class reproductionRate K: category leafCarryingCapacity);
			woodAmount: (Cormas logisticGrowth: self woodAmount r: category class reproductionRate K: category woodCarryingCapacity)
]

{ #category : #accessing }
DundiLandscapeUnit >> makeBaldiol [

	category := DundiBaldiolCategory new.
]

{ #category : #accessing }
DundiLandscapeUnit >> makeCaangol [

	category := DundiCaangolCategory new.
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

		^ self
		povAttribute: #grassAmount
		min: 0
		max: 10
		color: category color
]

{ #category : #pov }
DundiLandscapeUnit >> povCategoryAndRestricted [

	^ self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ self povCategory ]
]

{ #category : #pov }
DundiLandscapeUnit >> povRestricted [

	^ self isRestricted
		ifTrue: [ Color gray ]
		ifFalse: [ Color veryVeryLightGray ]
]

{ #category : #stepping }
DundiLandscapeUnit >> step [

	self logisticGrowth 
]

{ #category : #accessing }
DundiLandscapeUnit >> woodAmount [

	^ woodAmount
]

{ #category : #accessing }
DundiLandscapeUnit >> woodAmount: anInteger [

	woodAmount := anInteger
]
