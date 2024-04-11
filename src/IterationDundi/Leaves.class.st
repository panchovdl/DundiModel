Class {
	#name : #Leaves,
	#superclass : #Object,
	#instVars : [
		'treeCover',
		'leavesAmount',
		'maxLeaves'
	],
	#category : #IterationDundi
}

{ #category : #initialization }
Leaves >> initialize [ 

	maxLeaves := 1000. "kilograms".
	leavesAmount := 0.
]

{ #category : #accessing }
Leaves >> leavesAmount [

	^ leavesAmount
]

{ #category : #accessing }
Leaves >> leavesAmount: anObject [

	leavesAmount := anObject
]

{ #category : #accessing }
Leaves >> maxLeaves [

	^ maxLeaves
]

{ #category : #accessing }
Leaves >> maxLeaves: anObject [

	maxLeaves := anObject
]

{ #category : #accessing }
Leaves >> treeCover [

	^ treeCover
]

{ #category : #accessing }
Leaves >> treeCover: anObject [

	treeCover := anObject
]
