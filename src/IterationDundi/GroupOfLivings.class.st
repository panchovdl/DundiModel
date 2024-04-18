Class {
	#name : #GroupOfLivings,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'number',
		'knownSpace'
	],
	#category : #IterationDundi
}

{ #category : #initialization }
GroupOfLivings >> initialize [ 

	super initialize.
	
	knownSpace := IndexedSet new.
]

{ #category : #moving }
GroupOfLivings >> rememberSpace [

	knownSpace add: self patch. 
]
