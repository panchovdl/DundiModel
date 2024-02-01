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

{ #category : #'as yet unclassified' }
DundiAgent >> collectGrass [

	| whatIWantToCollect whatICanCollect collectedQuantity |
	patch ifNil: [ ^ nil ].
	
	"cannot collect mor than the space than left in agent max grass amount (maxGrassAmount)"
	whatIWantToCollect := self grassConsumptionRatio min: (maxGrassAmount - grassAmount ).
	
	"Cannot collect more grass than there is in a patch and patch needs at least 1 amount to regrow"
	whatICanCollect := self patch grassAmount - 1.
	
	collectedQuantity := whatICanCollect min:  whatIWantToCollect.

	
	self grassAmount: self grassAmount + collectedQuantity.
	self patch grassAmount: self patch grassAmount - collectedQuantity
]

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

{ #category : #'as yet unclassified' }
DundiAgent >> grassConsumptionRatio [

	self subclassResponsibility 
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

	self 
		randomWalk;
		collectGrass.
]

{ #category : #accessing }
DundiAgent >> woodAmount [

	^ woodAmount 
]

{ #category : #accessing }
DundiAgent >> woodAmount: anObject [

	woodAmount := anObject

]
