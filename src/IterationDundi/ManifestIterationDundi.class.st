"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIterationDundi,
	#superclass : #PackageManifest,
	#category : #'IterationDundi-Manifest'
}

{ #category : #'code-critics' }
ManifestIterationDundi class >> ruleNotEliminationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GroupOfLivings #isNotEmpty #false)) #'2024-04-18T15:09:35.840979+00:00') )
]
