Class {
	#name : #DundiAgent,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'maxWoodAmount',
		'maxFruitAmount',
		'maxLeafAmount',
		'maxGrassAmount',
		'fruitAmount',
		'grassAmount',
		'leafAmount',
		'woodAmount'
	],
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiAgent >> fruitAmount [

	^ fruitAmount
]

{ #category : #accessing }
DundiAgent >> fruitAmount: anObject [

	fruitAmount := anObject

]

{ #category : #accessing }
DundiAgent >> grassAmount [

	^ grassAmount
]

{ #category : #accessing }
DundiAgent >> grassAmount: anObject [

	grassAmount := anObject

]

{ #category : #'star moving' }
DundiAgent >> initialize [

	super initialize.
	maxWoodAmount := 25.
	maxFruitAmount := 25.
	maxLeafAmount := 25.
	maxGrassAmount := 25.
	
	woodAmount := 0.
	grassAmount := 0.
	leafAmount := 0.
	fruitAmount := 0.
]

{ #category : #accessing }
DundiAgent >> leafAmount [

	^ leafAmount
]

{ #category : #accessing }
DundiAgent >> leafAmount: anObject [

	leafAmount := anObject 
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

{ #category : #accessing }
DundiAgent >> woodAmount [

	^ woodAmount 
]

{ #category : #accessing }
DundiAgent >> woodAmount: anObject [

	woodAmount := anObject

]
