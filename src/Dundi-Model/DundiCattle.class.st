Class {
	#name : #DundiCattle,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'energy'
	],
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiCattle class >> catabolicRate [

	^ 2
]

{ #category : #accessing }
DundiCattle class >> defaultProbes [

	^ self probes
]

{ #category : #accessing }
DundiCattle class >> harvestRate [

	^ 0.5
]

{ #category : #biology }
DundiCattle >> consumeEnergy [

	self energy: self energy - self class catabolicRate
]

{ #category : #biology }
DundiCattle >> eat [ 


	| quantity |
	patch ifNil: [ ^ nil ].
	
	quantity := self patch grassAmount * self class harvestRate.
	
	self energy: self energy + quantity.
	self patch grassAmount: self patch grassAmount - quantity 
]

{ #category : #accessing }
DundiCattle >> energy [

	^ energy
]

{ #category : #accessing }
DundiCattle >> energy: anObject [

	energy := anObject
]

{ #category : #biology }
DundiCattle >> initialize [

	super initialize.
	energy := 50.
]

{ #category : #accessing }
DundiCattle >> move [
	"The Forager examines its current location and around. From thw patches that are not occupied, it chooses the one containing the most biomass. If the chosen patch has enough biomass to meet the catabolic rate, the Forager moves there. If not, it moves instead to a randomly chosen adjacent free place (not occupied by another Forager)"	

	| candidatePatches maxGrassAmount targetPatch |
	patch ifNil: [ ^ self ].
	
	candidatePatches := self patch neighbourhoodAndSelf select: [ :each |
		each grassAmount > self class catabolicRate and: [ each hasNoOccupants ] ].
	
	candidatePatches ifEmpty: [
		self randomWalkConstrainedBy: [ :c | c hasNoOccupants ].
		^ self ].
	
	maxGrassAmount := (candidatePatches collect: [ :each | each grassAmount ]) max.
	targetPatch := candidatePatches detect: [ :each | each grassAmount = maxGrassAmount ].
	
	self moveTo: targetPatch.
]

{ #category : #accessing }
DundiCattle >> pov [

	^ #rectangle
]
