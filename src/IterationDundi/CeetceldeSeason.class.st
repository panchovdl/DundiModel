Class {
	#name : #CeetceldeSeason,
	#superclass : #Season,
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
CeetceldeSeason >> durationOfSeason [

 ^ 30
]

{ #category : #'as yet unclassified' }
CeetceldeSeason >> followingSeason [

 	^ NduunguSeason new
]

{ #category : #'as yet unclassified' }
CeetceldeSeason >> grassGrowthRate [ 

	^ 0.00001
]
