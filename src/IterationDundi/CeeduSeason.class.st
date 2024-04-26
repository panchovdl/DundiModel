Class {
	#name : #CeeduSeason,
	#superclass : #Season,
	#category : #IterationDundi
}

{ #category : #'as yet unclassified' }
CeeduSeason >> durationOfSeason [

 ^ 120
]

{ #category : #'as yet unclassified' }
CeeduSeason >> followingSeason [

	^ CeetceldeSeason new
]

{ #category : #'as yet unclassified' }
CeeduSeason >> grassGrowthRate [

	^ 0.001
]

{ #category : #'as yet unclassified' }
CeeduSeason >> index [

	^ 3
]
