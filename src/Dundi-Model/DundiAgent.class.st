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
		'distancePerception',
		'resourceAmount'
	],
	#category : #'Dundi-Model'
}

{ #category : #'star moving' }
DundiAgent >> collect [

	| whatIWantToCollect whatICanCollect collectedQuantity |
	
	patch ifNil: [ ^ nil ].
	
	"Parcourir toutes les ressources que l'agent peut collecter"
	resourceAmount keysDo: [ :resourceName |
		
		"Déterminer ce que l'agent veut collecter pour la ressource spécifiée"
		whatIWantToCollect := self determineWhatToCollectForResource: resourceName.
		
		"Déterminer ce que l'agent peut réellement collecter pour la ressource spécifiée"
		whatICanCollect := self determineWhatICanCollectForResource: resourceName.
		
		"Calculer la quantité collectée pour la ressource spécifiée"
		collectedQuantity := whatIWantToCollect min: whatICanCollect.
		
		"Mettre à jour les quantités après la collecte pour la ressource spécifiée"
		self updateResource: resourceName with: collectedQuantity ].
	
]

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
		leafAmount: self leafAmount  - self leafConsumptionRatio;
		woodAmount: self woodAmount - self woodConsumptionRatio;
		fruitAmount: self fruitAmount - self fruitConsumptionRatio;
		grassAmount: self grassAmount - self grassConsumptionRatio 
		
		

]

{ #category : #'as yet unclassified' }
DundiAgent >> determineNeededResourceFrom: aPatch [

	| neededResource |
    "Implémentez la logique appropriée pour déterminer la ressource nécessaire"
    neededResource := self subclassResponsibility.  "Exemple: l'agent a besoin d'herbe"

    ^ neededResource
]

{ #category : #'as yet unclassified' }
DundiAgent >> determineWhatICanCollectForResource: resourceName [

 | maxAmountCollectable |
	maxAmountCollectable := 0.

	"Sélectionner la méthode spécifique à la ressource"
	resourceName = 'grass' ifTrue: [ maxAmountCollectable := self patch grassAmount - 1 ].
	resourceName = 'fruit' ifTrue: [ maxAmountCollectable := self patch fruitAmount - 1 ].
	resourceName = 'wood' ifTrue: [ maxAmountCollectable := self patch woodAmount - 1. ].
	resourceName = 'leaf' ifTrue: [ maxAmountCollectable := self patch leafAmount - 1. ].
	

	"Ajoutez des conditions pour d'autres ressources si nécessaire"

	^ maxAmountCollectable 
]

{ #category : #'as yet unclassified' }
DundiAgent >> determineWhatToCollectForResource: resourceName [

	
	| maxAmountToCollect |
	maxAmountToCollect := 0.

	"Sélectionner la méthode spécifique à la ressource"
	resourceName = 'grass' ifTrue: [ maxAmountToCollect:= self grassConsumptionRatio min: (maxGrassAmount  - grassAmount). ].
	resourceName = 'fruit' ifTrue: [ maxAmountToCollect := self fruitConsumptionRatio min: (maxFruitAmount - fruitAmount). ].
	resourceName = 'wood' ifTrue: [ maxAmountToCollect := self woodConsumptionRatio min: (maxWoodAmount - woodAmount). ].
	resourceName = 'leaf' ifTrue: [ maxAmountToCollect := self leafConsumptionRatio min: (maxLeafAmount - leafAmount). ].
	

	"Ajoutez des conditions pour d'autres ressources si nécessaire"

	^ maxAmountToCollect 
]

{ #category : #accessing }
DundiAgent >> distancePerception [

	^ distancePerception ifNil: [ distancePerception := 5 ]
]

{ #category : #accessing }
DundiAgent >> distancePerception: anObject [

	distancePerception := anObject
]

{ #category : #'as yet unclassified' }
DundiAgent >> findPatchWithMostNeededResource [

   | maxResourcePatch maxResourceAmount candidatePatches |
    maxResourcePatch := nil.
    maxResourceAmount := 0.
	
	candidatePatches := self patch neighbourhoodAndSelf.
	
	candidatePatches do: [ :neighbor |
        | resourceName neededAmount availableAmount |
        resourceName := self determineNeededResourceFrom: neighbor.
        neededAmount := self determineWhatToCollectForResource: resourceName.
        availableAmount := neighbor getResource: resourceName.

        "Vérifier si ce voisin a plus de ressources nécessaires"
        (availableAmount - neededAmount) > maxResourceAmount ifTrue: [
            maxResourceAmount := availableAmount - neededAmount.
            maxResourcePatch := neighbor ] ].

    ^ maxResourcePatch

	 "select: [ :each |	
			| resourceName neededAmount availableAmount |
			resourceName := self determineNeededResourceFrom: self patch neighbourhoodAndSelf.
			neededAmount := self determineWhatToCollectForResource: resourceName.
			availableAmount := each neighbourhoodAndSelf getResource: resourceName.
			
			
			maxResourceLocation > (self determineWhatToCollectForResource: resourceName)
			
			
			
			
			 and: [ each hasNoOccupants ] ].
		
	maxResourceLocation := (candidatePatches collect: [ :each | each resourceAmount ]) max.


	
	candidatePatches ifEmpty: [
		self randomWalkConstrainedBy: [ :c | c hasNoOccupants ].
		^ self ].
	
	targetPatch := candidatePatches detect: [ :each | each resourceAmount = maxResourceLocation ].
	
	self moveTo: targetPatch.
	
		^ maxResourceLocation."
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

{ #category : #'star moving' }
DundiAgent >> getResource: resourceName [ 

	^ resourceAmount at: resourceName ifAbsent: [ 1 ].
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
	
	resourceAmount := OrderedCollection new.
	woodAmount := 0.
	grassAmount := 1.
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
	targetPatch := candidatePatches detect: [ :each | each grassAmount = maxGrassLocation ].
	
	self moveTo: targetPatch.
]

{ #category : #'as yet unclassified' }
DundiAgent >> moveToMostNeededResourceNeighborhoodPatch [

	|targetPatch|
    "Trouver le patch voisin avec le plus de ressources nécessaires"
	targetPatch := self findPatchWithMostNeededResource.
	targetPatch ifEmpty: [
		self randomWalkConstrainedBy: [ :c | c hasNoOccupants ].
		^ self ].
    "Déplacer l'agent vers le patch ciblé"
    self moveTo: targetPatch.
	
]

{ #category : #'star moving' }
DundiAgent >> pov [

	self subclassResponsibility 
]

{ #category : #accessing }
DundiAgent >> resourceAmount [

	^ resourceAmount
]

{ #category : #accessing }
DundiAgent >> resourceAmount: anObject [

	resourceAmount := anObject
]

{ #category : #'star moving' }
DundiAgent >> setResource: resourceName amount:amount [

resourceAmount at: resourceName put: amount.
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
		
	 self grassAmount <= 0
		ifTrue: [ self moveS ]
]

{ #category : #'as yet unclassified' }
DundiAgent >> updateResource: resourceName with: collectedQuantity [
    "Met à jour la quantité de la ressource spécifiée après la collecte"
    | currentResourceAmount |
    currentResourceAmount := self getResource: resourceName.
    self setResource: resourceName amount: (currentResourceAmount + collectedQuantity).
    patch setResource: resourceName amount: ((patch getResource: resourceName) - collectedQuantity).

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
