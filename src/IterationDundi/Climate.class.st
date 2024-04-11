Class {
	#name : #Climate,
	#superclass : #Object,
	#instVars : [
		'type',
		'coefficients',
		'landscapeDundi',
		'seasonCounter'
	],
	#category : #IterationDundi
}

{ #category : #initialization }
Climate >> coefficients [ 

	^ coefficients 
]

{ #category : #initialization }
Climate >> initialize [ 

	super initialize.
	
	type := #medium. "Par défaut, le climat est normal"
	coefficients := { #good -> 1.2. "Coefficient pour un bon climat"
                          #medium -> 1.0. "Coefficient pour un climat moyen"
                          #bad -> 0.8 }. "Coefficient pour un mauvais climat"
	^ self
]

{ #category : #initialization }
Climate >> type [


        ^type
]

{ #category : #initialization }
Climate >> type: aType [

        type := aType
]
