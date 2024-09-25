Class {
	#name : 'Season',
	#superclass : 'Object',
	#instVars : [
		'counter'
	],
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'as yet unclassified' }
Season >> durationOfSeason [

	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
Season >> followingSeason [

	"this method simply return the season that should follow the current season : Dabbuunde after Nduungu"
	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Season >> grassGrowthRate [ 

	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Season >> initialize [ 

	super initialize.
	
	counter := 0. 
]

{ #category : 'as yet unclassified' }
Season >> nextSeason [

	"this method should be called at every step. It will change the season when the duration is over, otherwize it will return the same season"
	
	counter := counter + 1.
	^ counter >= self durationOfSeason 
		ifTrue: [ self followingSeason ]
		ifFalse: [ self ]
												
				
]
