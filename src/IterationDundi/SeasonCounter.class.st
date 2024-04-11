Class {
	#name : #SeasonCounter,
	#superclass : #Object,
	#instVars : [
		'counter',
		'seasonIndex',
		'stepsPerSeasons',
		'seasons',
		'totalStepsPerYear',
		'stepsPerYear',
		'climate'
	],
	#category : #IterationDundi
}

{ #category : #initialization }
SeasonCounter >> calculateStepsPerSeasons [

    | adjustedStepsPerSeasons totalSteps currentTotalSteps |

    adjustedStepsPerSeasons := Array new: 4.
    totalSteps := 0.
    currentTotalSteps := 0.
    
	seasons withIndexDo: [ :season :index | 
    	| steps |
    	steps := stepsPerYear at: index + 1.
    	totalSteps := totalSteps + steps.
	].
    
    seasons withIndexDo: [ :season :index | 
        | steps adjustedSteps |
        steps := stepsPerYear at: index.
        adjustedSteps := (steps * totalStepsPerYear / totalSteps) rounded.
        adjustedStepsPerSeasons at: index put: adjustedSteps.
        currentTotalSteps := currentTotalSteps + adjustedSteps.
    ].
    
    "Compenser pour les erreurs d'arrondi"
   
 (totalStepsPerYear - currentTotalSteps) timesRepeat: [ 
    | idx |
    idx := adjustedStepsPerSeasons indexOf: adjustedStepsPerSeasons max.
    adjustedStepsPerSeasons at: idx put: (adjustedStepsPerSeasons at: idx) + 1.
].
    
    ^adjustedStepsPerSeasons
]

{ #category : #initialization }
SeasonCounter >> changeSeason [

        counter := 0. "Reinitialize counter"
        seasonIndex := seasonIndex \\ seasons size + 1. "Passe à la saison suivante"
        self inform: 'New season: ', (seasons at: seasonIndex) "Affiche la nouvelle saison"
]

{ #category : #initialization }
SeasonCounter >> checkSeasonChange [

		| stepsPerSeason | 
	stepsPerSeason := stepsPerSeasons at: seasonIndex.
        (counter >= stepsPerSeason) ifTrue: [
            self changeSeason ]
]

{ #category : #'primitives - incremental' }
SeasonCounter >> increment [
       
	counter := counter + 1.
	self checkSeasonChange.
]

{ #category : #initialization }
SeasonCounter >> initialize [ 

	super initialize.
	
		counter := 0.
  		seasonIndex := 1. "Démarre avec la première saison"
		seasons := #('Nduungu' 'Kawle-Dabbuunde' 'Ceedu' 'Ceetcelde'). "Liste des saisons"
 		totalStepsPerYear := 365.	
		stepsPerYear := #(90 90 60 30). "Nombre de pas pour chaque saison"
		climate := Climate new. "Initialise le climat"
		stepsPerSeasons := self calculateStepsPerSeasons.
		
   ^ self
]
