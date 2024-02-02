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
		'woodAmount',
		'distancePerception'
	],
	#category : #'Dundi-Model'
}

{ #category : #'as yet unclassified' }
DundiAgent >> collectFruit [

	| whatIWantToCollect whatICanCollect collectedQuantity |
	patch ifNil: [ ^ nil ].
	
	"cannot collect more than the space which left in agent max grass amount (maxGrassAmount)"
	whatIWantToCollect := self fruitConsumptionRatio min: (maxFruitAmount - fruitAmount).
								
	
	"Cannot collect more grass than there is in a patch and patch needs at least 1 amount to regrow"
	whatICanCollect := self patch fruitAmount - 1.

	
	collectedQuantity := whatICanCollect min: whatIWantToCollect.

	
	self fruitAmount: self fruitAmount + collectedQuantity.
	self patch fruitAmount: self patch fruitAmount - collectedQuantity
]

{ #category : #'as yet unclassified' }
DundiAgent >> collectGrass [

	| whatIWantToCollect whatICanCollect collectedQuantity |
	patch ifNil: [ ^ nil ].
	
	"cannot collect more than the space which left in agent max grass amount (maxGrassAmount)"
	whatIWantToCollect := self grassConsumptionRatio min: (maxGrassAmount - grassAmount).
	
	
	"Cannot collect more grass than there is in a patch and patch needs at least 1 amount to regrow"
	whatICanCollect := self patch grassAmount - 1.
	
	collectedQuantity := whatICanCollect min: whatIWantToCollect.

	
	self grassAmount: self grassAmount + collectedQuantity.
	self patch grassAmount: self patch grassAmount - collectedQuantity
]

{ #category : #'as yet unclassified' }
DundiAgent >> collectLeaves [

	| whatIWantToCollect whatICanCollect collectedQuantity |
	patch ifNil: [ ^ nil ].
	
	"cannot collect more than the space which left in agent max grass amount (maxGrassAmount)"
	whatIWantToCollect := self leafConsumptionRatio min: (maxLeafAmount - leafAmount).
								
	
	"Cannot collect more grass than there is in a patch and patch needs at least 1 amount to regrow"
	whatICanCollect := self patch leafAmount - 1.

	
	collectedQuantity := whatICanCollect min: whatIWantToCollect.

	
	self leafAmount: self leafAmount + collectedQuantity.
	self patch leafAmount: self patch leafAmount - collectedQuantity
]

{ #category : #'as yet unclassified' }
DundiAgent >> collectWood [

	| whatIWantToCollect whatICanCollect collectedQuantity |
	patch ifNil: [ ^ nil ].
	
	"cannot collect more than the space which left in agent max grass amount (maxGrassAmount)"
	whatIWantToCollect := self woodConsumptionRatio min: (maxWoodAmount - woodAmount).
								
	
	"Cannot collect more grass than there is in a patch and patch needs at least 1 amount to regrow"
	whatICanCollect := self patch woodAmount - 1.

	
	collectedQuantity := whatICanCollect min: whatIWantToCollect.

	
	self woodAmount: self woodAmount + collectedQuantity.
	self patch woodAmount: self patch woodAmount - collectedQuantity
]

{ #category : #'as yet unclassified' }
DundiAgent >> consumeResources [

	self 
		leafAmount: self leafAmount - self leafConsumptionRatio;
		woodAmount: self woodAmount - self woodConsumptionRatio;
		fruitAmount: self fruitAmount - self fruitConsumptionRatio;
		grassAmount: self grassAmount - self grassConsumptionRatio 

]

{ #category : #accessing }
DundiAgent >> distancePerception [

	^ distancePerception ifNil: [ distancePerception := 5 ]
]

{ #category : #accessing }
DundiAgent >> distancePerception: anObject [

	distancePerception := anObject
]

{ #category : #accessing }
DundiAgent >> fruitAmount [

	^ fruitAmount
]

{ #category : #accessing }
DundiAgent >> fruitAmount: anObject [

	fruitAmount := anObject

]

{ #category : #'as yet unclassified' }
DundiAgent >> fruitConsumptionRatio [

	self subclassResponsibility 
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
	distancePerception := 25.
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
DundiAgent >> leafConsumptionRatio [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DundiAgent >> moveToMaxOfGrass [

| candidatePatches maxGrassLocation targetPatch |
	patch ifNil: [ ^ self ].
	
	candidatePatches := self patch neighbourhoodAndSelf select: [ :each |	each grassAmount > self grassConsumptionRatio and: [ each hasNoOccupants ] ].
	
	candidatePatches ifEmpty: [
		self randomWalkConstrainedBy: [ :c | c hasNoOccupants ].
		^ self ].
	
	maxGrassLocation := (candidatePatches collect: [ :each | each grassAmount ]) max.
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
		moveToMaxOfGrass;
		collectGrass;
		collectLeaves;
		collectWood;
		collectFruit;
		consumeResources.
]

{ #category : #accessing }
DundiAgent >> woodAmount [

	^ woodAmount 
]

{ #category : #accessing }
DundiAgent >> woodAmount: anObject [

	woodAmount := anObject

]

{ #category : #'as yet unclassified' }
DundiAgent >> woodConsumptionRatio [

	self subclassResponsibility 
]
