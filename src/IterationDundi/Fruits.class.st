Class {
	#name : 'Fruits',
	#superclass : 'Object',
	#instVars : [
		'treeCover',
		'fruitsAmount',
		'maxFruits'
	],
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'accessing' }
Fruits >> fruitsAmount [

	^ fruitsAmount
]

{ #category : 'accessing' }
Fruits >> fruitsAmount: anObject [

	fruitsAmount := anObject
]

{ #category : 'initialization' }
Fruits >> initialize [ 

	maxFruits := 100. "kilograms".
	fruitsAmount := 0.
]

{ #category : 'accessing' }
Fruits >> maxFruits [

	^ maxFruits
]

{ #category : 'accessing' }
Fruits >> maxFruits: anObject [

	maxFruits := anObject
]

{ #category : 'accessing' }
Fruits >> treeCover [

	^ treeCover
]

{ #category : 'accessing' }
Fruits >> treeCover: anObject [

	treeCover := anObject
]
