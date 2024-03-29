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
	self 	grassAmount: (Cormas randomIntegerFrom: 1 to: 20);
		 	leafAmount: (Cormas randomIntegerFrom: 1 to: 20);
			woodAmount: (Cormas randomIntegerFrom: 1 to: 20);
			fruitAmount: (Cormas randomIntegerFrom: 1 to: 20).
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

{ #category : #testing }
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

	self 	fruitAmount: (Cormas logisticGrowth: self fruitAmount r: category class growthRatio K: category fruitCarryingCapacity);
			grassAmount: (Cormas logisticGrowth: self grassAmount r: category class growthRatio K: category grassCarryingCapacity);
			leafAmount: (Cormas logisticGrowth: self leafAmount r: category class growthRatio K: category leafCarryingCapacity);
			woodAmount: (Cormas logisticGrowth: self woodAmount r: category class growthRatio K: category woodCarryingCapacity)
]

{ #category : #'setting category' }
DundiLandscapeUnit >> makeBaldiol [

	category := DundiBaldiolCategory new.
]

{ #category : #'setting category' }
DundiLandscapeUnit >> makeCaangol [

	category := DundiCaangolCategory new.
]

{ #category : #'setting category' }
DundiLandscapeUnit >> makeRestricted [

	state := #restricted
]

{ #category : #'setting category' }
DundiLandscapeUnit >> makeSangre [

	category := DundiSangreCategory new.
]

{ #category : #'setting category' }
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
