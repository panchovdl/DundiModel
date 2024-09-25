Class {
	#name : #NduunguSeason,
	#superclass : #Season,
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
NduunguSeason >> durationOfSeason [

	^ 90.
]

{ #category : #'as yet unclassified' }
NduunguSeason >> followingSeason [

	^ DabbuundeSeason new.
]

{ #category : #'as yet unclassified' }
NduunguSeason >> grassGrowthRate [ 

	^ 0.04
]
