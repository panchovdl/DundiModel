Class {
	#name : #DundiCattle,
	#superclass : #DundiAgent,
	#category : #'Dundi-Model'
}

{ #category : #stepping }
DundiCattle >> conditionForDying [ 

	^ self grassAmount <= 0.
]

{ #category : #'as yet unclassified' }
DundiCattle >> fruitConsumptionRatio [ 

	^ 10
]

{ #category : #'as yet unclassified' }
DundiCattle >> grassConsumptionRatio [ 

	^ 25
]

{ #category : #'as yet unclassified' }
DundiCattle >> leafConsumptionRatio [ 

	^ 5
]

{ #category : #pov }
DundiCattle >> pov [ 


	^ Color blue 
]

{ #category : #'as yet unclassified' }
DundiCattle >> woodConsumptionRatio [ 

	^ 5
]
