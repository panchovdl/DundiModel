Class {
	#name : #BaselineOfDundiModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfDundiModel
}

{ #category : #baselines }
BaselineOfDundiModel >> baseline: spec [
	<baseline>
	
	"Packages"
	spec for: #common do: [
		spec
			package: 'Dundi-Model';
			package: 'IterationDundi' ].
]
