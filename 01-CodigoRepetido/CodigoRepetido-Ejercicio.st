Object subclass: #CustomerBook	instanceVariableNames: 'customers'	classVariableNames: ''	poolDictionaries: ''	category: 'CodigoRepetido-Ejercicio'!!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!numberOfCustomers
	
	^customers size! !!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!initialize

	super initialize.
	customers := OrderedCollection new! !!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!includesCustomerNamed: aName

	^customers includes: aName ! !!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!isEmpty
	
	^customers isEmpty  ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CustomerBook class	instanceVariableNames: ''!!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!customerAlreadyExistsErrorMessage

	^'Customer already exists'! !!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !TestCase subclass: #IdiomTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CodigoRepetido-Ejercicio'!!IdiomTest methodsFor: 'testing' stamp: 'PatricioSabogal 4/15/2018 18:07'!test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	(self on: [ customerBook addCustomerNamed: ''.] 	raises: Error 		andSatisfies: [ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
					 self assert: customerBook isEmpty ])! !!IdiomTest methodsFor: 'testing' stamp: 'PatricioSabogal 4/12/2018 21:27'!on: aBlockClosure shouldTakeLessThanMilliseconds: aTime		| millisecondsBeforeRunning millisecondsAfterRunning |	millisecondsBeforeRunning := Time millisecondClockValue.
	aBlockClosure value.
	millisecondsAfterRunning := Time millisecondClockValue.	^(millisecondsAfterRunning - millisecondsBeforeRunning ) < aTime! !!IdiomTest methodsFor: 'testing' stamp: 'PatricioSabogal 4/12/2018 21:27'!test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook limit |
	
	customerBook := CustomerBook new.	limit := 50.
	self assert: ((self on: [customerBook addCustomerNamed: 'John Lennon'.] shouldTakeLessThanMilliseconds: limit ) )
	
! !!IdiomTest methodsFor: 'testing' stamp: 'PatricioSabogal 4/12/2018 21:27'!test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney limit|
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	limit:= 100.
	customerBook addCustomerNamed: paulMcCartney.
	 	
	self assert: (self on: [customerBook removeCustomerNamed: paulMcCartney ] shouldTakeLessThanMilliseconds: limit).
	
! !!IdiomTest methodsFor: 'testing' stamp: 'PatricioSabogal 4/15/2018 18:12'!on: aBlock raises: anException andSatisfies: someConditions	[aBlock  value.	self fail]	on: anException  	do:[ :anError | someConditions ]! !!IdiomTest methodsFor: 'testing' stamp: 'PatricioSabogal 4/15/2018 18:14'!test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	(self on:[ customerBook removeCustomerNamed: 'Paul McCartney'.] 	raises: NotFound	 andSatisfies: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ])
! !Error subclass: #NotFound	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CodigoRepetido-Ejercicio'!!NotFound commentStamp: 'SvenVanCaekenberghe 4/18/2011 14:32' prior: 0!I am NotFound, an exception to indicate that something is not found in a collection.I am an Error and thus Exception.Typically, the thing not found is in my object instance variable.The collection where this thing was not found is in my inherited signaler instance variable.[ NotFound signalFor: 10 in: #(1 2 3) ] on: NotFound do: [ :exception | exception ]!!NotFound methodsFor: 'private' stamp: 'nice 12/2/2011 23:35'!standardMessageText	"Generate a standard textual description"		^ String streamContents: [ :stream |		stream print: self object.		stream << ' not found in '.		stream print: self collection class ]! !!NotFound methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 4/18/2011 14:27'!collection: aCollection	"Set the collection where something is not found in"		self signaler: aCollection! !!NotFound methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 4/18/2011 14:27'!collection	"Return the collection where something is not found in"		^ self signaler! !!NotFound methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 4/18/2011 14:35'!messageText	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"		^ messageText ifNil: [ messageText := self standardMessageText ]! !!NotFound methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 4/18/2011 14:29'!object	"Return the object that was not found"		^ object! !!NotFound methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 4/18/2011 14:30'!object: anObject	"Set the object that was not found"		object := anObject! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!NotFound class	instanceVariableNames: ''!!NotFound class methodsFor: 'instance creation' stamp: 'MartinDias 10/23/2013 14:47'!signalFor: anObject	"Create and signal a NotFound exception for anObject in the default receiver."		^ self new		object: anObject;		signal! !!NotFound class methodsFor: 'instance creation' stamp: 'MartinDias 10/23/2013 14:47'!signalFor: anObject in: aCollection	"Create and signal a NotFound exception for anObject in aCollection."	^ self new		object: anObject;		collection: aCollection;		signal! !