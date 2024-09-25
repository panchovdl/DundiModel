Class {
	#name : 'Baldiol',
	#superclass : 'AbstractSoil',
	#category : 'IterationDundi',
	#package : 'IterationDundi'
}

{ #category : 'accessing' }
Baldiol class >> maxGrass [

	^ 186700
]

{ #category : 'accessing' }
Baldiol class >> maxTrees [

	^ 7000
]

{ #category : 'accessing' }
Baldiol >> color [

	^ Color green quiteBlacker quiteBlacker quiteBlacker quiteBlacker
]

{ #category : 'testing' }
Baldiol >> isBaldiol [ 

	^ true
]
