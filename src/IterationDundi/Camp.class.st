Class {
	#name : #Camp,
	#superclass : #Object,
	#instVars : [
		'woodQuantity',
		'woodNeeds',
		'inhabitants',
		'landUnit',
		'name'
	],
	#category : #IterationDundi
}

{ #category : #'instance creation' }
Camp class >> named: aString [

	^ self new name: aString; yourself. 
]

{ #category : #accessing }
Camp >> inhabitants [

	^ inhabitants
]

{ #category : #accessing }
Camp >> inhabitants: anObject [

	inhabitants := anObject
]

{ #category : #initialization }
Camp >> initialize [ 

	super initialize.
	
	woodQuantity := 0.
	woodNeeds := 100.
	inhabitants := OrderedCollection new.
]

{ #category : #accessing }
Camp >> landUnit [

	^ landUnit
]

{ #category : #accessing }
Camp >> landUnit: anObject [

	landUnit := anObject
]

{ #category : #accessing }
Camp >> name [

	^ name
]

{ #category : #accessing }
Camp >> name: anObject [

	name := anObject.
]

{ #category : #printing }
Camp >> printOn: aStream [

	aStream
		nextPutAll: self className;
		nextPutAll: ' (';
		nextPutAll: name;
		nextPutAll: ')'
]

{ #category : #accessing }
Camp >> woodNeeds [

	^ woodNeeds
]

{ #category : #accessing }
Camp >> woodNeeds: anObject [

	woodNeeds := anObject
]

{ #category : #accessing }
Camp >> woodQuantity [

	^ woodQuantity
]

{ #category : #accessing }
Camp >> woodQuantity: anObject [

	woodQuantity := anObject
]
