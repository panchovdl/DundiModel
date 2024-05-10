Class {
	#name : #DabbuundeSeason,
	#superclass : #Season,
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
DabbuundeSeason >> durationOfSeason [

	^ 90.
]

{ #category : #'as yet unclassified' }
DabbuundeSeason >> followingSeason [

	^ CeeduSeason new.
]

{ #category : #'as yet unclassified' }
DabbuundeSeason >> grassGrowthRate [

	^ 0.04
]

{ #category : #'as yet unclassified' }
DabbuundeSeason >> index [

	^ 2
]
