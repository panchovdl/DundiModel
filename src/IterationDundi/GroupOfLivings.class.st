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

{ #category : #accessing }
GroupOfLivings >> asString [

	" Private - See superimplementor's comment "

	^ String streamContents: [ :stream | 
		  stream
			  << super asString;
			  crtab;
			  << 'size: ';
			  << self size asString ]
]

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

{ #category : #accessing }
GroupOfLivings >> knownSpace [

	^ knownSpace
]

{ #category : #accessing }
GroupOfLivings >> knownSpace: anObject [

	knownSpace := anObject
]

{ #category : #moving }
GroupOfLivings >> rememberSpace [

	knownSpace add: self patch
]

{ #category : #accessing }
GroupOfLivings >> size [

	^ size
]

{ #category : #accessing }
GroupOfLivings >> size: anInteger [

	size := anInteger
]
