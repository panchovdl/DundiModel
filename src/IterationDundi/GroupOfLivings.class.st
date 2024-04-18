Class {
	#name : #GroupOfLivings,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'knownSpace',
		'size'
	],
	#category : #IterationDundi
}

{ #category : #initialization }
GroupOfLivings >> initialize [ 

	super initialize.
	
	knownSpace := IndexedSet new.
]

{ #category : #testing }
GroupOfLivings >> isEmpty [

	^ size = 0.
]

{ #category : #testing }
GroupOfLivings >> isNotEmpty [

	^ self isEmpty not.
]

{ #category : #moving }
GroupOfLivings >> rememberSpace [

	knownSpace add: self patch. 
]

{ #category : #accessing }
GroupOfLivings >> size [

	^ size
]

{ #category : #accessing }
GroupOfLivings >> size: anObject [

	size := anObject
]
