Class {
	#name : #DundiAgent,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'currentCharge',
		'basketSize',
		'fruitCharge',
		'grassCharge',
		'leafCharge',
		'woodCharge',
		'maxWoodCharge',
		'maxFruitCharge',
		'maxLeafCharge',
		'maxGrassCharge'
	],
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiAgent >> basketSize [

	^ basketSize
]

{ #category : #accessing }
DundiAgent >> basketSize: anObject [

	basketSize := anObject
]

{ #category : #accessing }
DundiAgent >> currentCharge [ 

	^ currentCharge
]

{ #category : #accessing }
DundiAgent >> currentCharge: anObject [

	currentCharge := anObject
]

{ #category : #'star moving' }
DundiAgent >> fruitCharge [

	^ fruitCharge
]

{ #category : #'star moving' }
DundiAgent >> fruitCharge: anObject [

	fruitCharge := anObject

]

{ #category : #'star moving' }
DundiAgent >> grassCharge [

	^ grassCharge
]

{ #category : #'star moving' }
DundiAgent >> grassCharge: anObject [

	grassCharge := anObject

]

{ #category : #'star moving' }
DundiAgent >> initialize [

	super initialize.
	basketSize := maxWoodCharge + maxFruitCharge + maxLeafCharge + maxGrassCharge.
	maxWoodCharge := 25.
	maxFruitCharge := 25.
	maxLeafCharge := 25.
	maxGrassCharge := 25.
	
	currentCharge := OrderedCollection new.
	currentCharge := fruitCharge + woodCharge + grassCharge + leafCharge.
	
	woodCharge := OrderedCollection new.
	grassCharge := OrderedCollection new.
	leafCharge := OrderedCollection new.
	fruitCharge := OrderedCollection.
]

{ #category : #'star moving' }
DundiAgent >> leafCharge [

	^ leafCharge
]

{ #category : #'star moving' }
DundiAgent >> leafCharge: anObject [

	leafCharge := anObject 
]

{ #category : #'as yet unclassified' }
DundiAgent >> moveToMaxOfGrass [

| candidatePatches maxGrassAmount targetPatch |
	patch ifNil: [ ^ self ].
	
	candidatePatches := self patch neighbourhoodAndSelf select: [ :each |
		each grassAmount > self grassConsumptionRatio and: [ each hasNoOccupants ] ].
	
	candidatePatches ifEmpty: [
		self randomWalkConstrainedBy: [ :c | c hasNoOccupants ].
		^ self ].
	
	maxGrassAmount := (candidatePatches collect: [ :each | each grassAmount ]) max.
	targetPatch := candidatePatches detect: [ :each | each grassAmount = maxGrassAmount ].
	
	self moveTo: targetPatch.
]

{ #category : #'star moving' }
DundiAgent >> pov [

	self subclassResponsibility 
]

{ #category : #stepping }
DundiAgent >> step [

	self randomWalk
]

{ #category : #'star moving' }
DundiAgent >> woodCharge [

	^ woodCharge 
]

{ #category : #'star moving' }
DundiAgent >> woodCharge: anObject [

	woodCharge := anObject

]
