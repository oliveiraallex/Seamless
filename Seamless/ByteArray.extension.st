Extension { #name : 'ByteArray' }

{ #category : '*Seamless' }
ByteArray class >> definesWellKnownSeamlessClass [ 
	^true
]

{ #category : '*Seamless' }
ByteArray >> prepareMethodTransferBy: aSeamlessTransporter [
	super prepareMethodTransferBy: aSeamlessTransporter.
	
	aSeamlessTransporter transferByValue: self
]

{ #category : '*Seamless' }
ByteArray >> seamlessDefaultTransferStrategy [ 
	"Raw binary data should always be transferred as a real copy, never as
	 a remote reference/proxy. This was previously unspecified and fell
	 back to Object's default (by reference), which silently turned any
	 ByteArray-valued instance variable of a by-value object (e.g. UUID's
	 #uuidData on Pharo 14+) into a proxy — causing unexpected extra
	 round-trips and, in the peer identification handshake, a deadlock."
	^SeamlessTransferStrategy defaultByValue
]
