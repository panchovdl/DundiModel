Class {
	#name : #DundiLandscapeUnit,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'treeAmount',
		'waterAmount',
		'grassAmount',
		'typeOfCategory',
		'isRestricted',
		'state'
	],
	#category : #'Dundi-Model'
}

{ #category : #accessing }
DundiLandscapeUnit >> isRestricted [

	^ state = #restricted
]

{ #category : #accessing }
DundiLandscapeUnit >> makeRestricted [

	state := #restricted
]

{ #category : #pov }
DundiLandscapeUnit >> pov [

	^ Color green
]
