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

{ #category : #'as yet unclassified' }
GroupOfLivings >> dailyMove [

	knownSpace add: self patch. 
]

{ #category : #initialization }
GroupOfLivings >> initialize [ 

	super initialize.
	
	knownSpace := IndexedSet new.
]
