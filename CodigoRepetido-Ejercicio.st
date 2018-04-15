Object subclass: #CustomerBook
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

	self error: self class customerCanNotBeEmptyErrorMessage ! !

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !
	
	^customers size! !

	self error: self class customerAlreadyExistsErrorMessage! !

	super initialize.
	customers := OrderedCollection new! !

	^customers includes: aName ! !
	
	^customers isEmpty  ! !

	^'Customer already exists'! !

	^'Customer name cannot be empty'! !

	| customerBook |
			
	customerBook := CustomerBook new.

					 self assert: customerBook isEmpty ])! !
	aBlockClosure value.
	millisecondsAfterRunning := Time millisecondClockValue.

	| customerBook limit |
	
	customerBook := CustomerBook new.
	self assert: ((self on: [customerBook addCustomerNamed: 'John Lennon'.] shouldTakeLessThanMilliseconds: limit ) )
	
! !

	| customerBook paulMcCartney limit|
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	limit:= 100.
	customerBook addCustomerNamed: paulMcCartney.
	 	
	self assert: (self on: [customerBook removeCustomerNamed: paulMcCartney ] shouldTakeLessThanMilliseconds: limit).
	
! !
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	(self on:[ customerBook removeCustomerNamed: 'Paul McCartney'.] 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ])
! !