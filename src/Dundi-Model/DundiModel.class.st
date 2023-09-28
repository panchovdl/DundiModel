Class {
	#name : #DundiModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'thePersons',
		'theLandscapeUnits',
		'numberOfPersons'
	],
	#category : #'Dundi-Model'
}

{ #category : #initialization }
DundiModel >> init [

	self
		createGridLines: 30
		columns: 30
		neighbourhood: 4
		closed: true.
	self pickCellConstrainedBy: [ :cell |  cell isRestricted ].
	

	self
		createN: numberOfPersons 
		randomlyLocatedEntities: DundiPerson 
		constrainedBy: [ :cell | 
		cell hasNoOccupants and: [ cell isRestricted ] ].

	self
		displayPov: #pov of: DundiPerson ;
		displayPov: #pov of: DundiLandscapeUnit .

]

{ #category : #initialization }
DundiModel >> initialize [

	super initialize.

	numberOfPersons := 10.


	thePersons := OrderedCollection new.
	theLandscapeUnits := OrderedCollection new.

]

{ #category : #initialization }
DundiModel >> step: t [
	
	self thePersons do: #step
]

{ #category : #initialization }
DundiModel >> theLandscapeUnits [

	<getterFor: #DundiLandscapeUnit>
	^ theLandscapeUnits
]

{ #category : #initialization }
DundiModel >> thePersons [

	<getterFor: #DundiPerson>
	^ thePersons
]
