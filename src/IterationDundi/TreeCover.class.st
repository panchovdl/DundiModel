Class {
	#name : #TreeCover,
	#superclass : #CMLocatedObject,
	#instVars : [
		'treesNumber',
		'ownedTreesNumber',
		'fruitTreesNumber',
		'woodAmount',
		'unaccessibleFruits',
		'unaccessibleLeaves',
		'accessibleFruits',
		'accessibleLeaves',
		'proprietaries'
	],
	#category : #IterationDundi
}

{ #category : #initialization }
TreeCover >> initialize [ 

	treesNumber := 0.
	ownedTreesNumber := 0.
	fruitTreesNumber := 0.
	woodAmount := 0.
	unaccessibleFruits := Fruits new.
		unaccessibleFruits treeCover: self.
	unaccessibleLeaves := Leaves new.
		unaccessibleLeaves treeCover: self.
	accessibleFruits := Fruits new.
		accessibleFruits treeCover: self.
	accessibleLeaves := Leaves new.
		accessibleLeaves treeCover: self.
	proprietaries := OrderedCollection new.
]

{ #category : #initialization }
TreeCover >> moveTo:  aSpatialEntity [
	aSpatialEntity 	isSpatialEntity ifFalse: [ ^ nil ].
	self leaveWhileMoving: true.
	self patch: aSpatialEntity.
	self patch addOccupant: self.
]

{ #category : #initialization }
TreeCover >> setTreesNumber [
	
	|max|
	
	max := self patch soil class maxTrees.
	
	treesNumber := Cormas randomIntegerFrom: 3 to: max.
]
