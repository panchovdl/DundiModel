Class {
	#name : #Season,
	#superclass : #Object,
	#instVars : [
		'counter'
	],
	#category : #IterationDundi
}

{ #category : #accessing }
Season >> durationOfSeason [

	self subclassResponsibility.
]

{ #category : #accessing }
Season >> followingSeason [

	"this method simply return the season that should follow the current season : Dabbuunde after Nduungu"
	self subclassResponsibility 
]

{ #category : #accessing }
Season >> grassGrowthRate [ 

	self subclassResponsibility 
]

{ #category : #accessing }
Season >> index [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Season >> initialize [ 

	super initialize.
	
	counter := 0. 
]

{ #category : #control }
Season >> nextSeason [

	"this method should be called at every step. It will change the season when the duration is over, otherwize it will return the same season"
	
	counter := counter + 1.
	^ counter >= self durationOfSeason 
		ifTrue: [ self followingSeason ]
		ifFalse: [ self ]
												
				
]
