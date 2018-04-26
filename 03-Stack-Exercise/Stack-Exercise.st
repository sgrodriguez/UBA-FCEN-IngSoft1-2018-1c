Object subclass: #OOStack	instanceVariableNames: 'top size'	classVariableNames: ''	poolDictionaries: ''	category: 'Stack-Exercise'!!OOStack methodsFor: 'initialization' stamp: 'PatricioSabogal 4/23/2018 21:58'!initialize	| base |	size := 0.	base := OOStackBase new.	top := base.! !!OOStack methodsFor: 'accessing' stamp: 'PatricioSabogal 4/26/2018 12:05'!top	^top object.! !!OOStack methodsFor: 'accessing' stamp: 'PatricioSabogal 4/23/2018 21:50'!size	^size.! !!OOStack methodsFor: 'removing' stamp: 'PatricioSabogal 4/26/2018 14:37'!pop	| previousTopObject |	previousTopObject := top object.	top :=  top previous.	size := size -1.	^previousTopObject.! !!OOStack methodsFor: 'adding' stamp: 'PatricioSabogal 4/26/2018 14:33'!push: anObject	| newElement |	newElement := OOStackElement stack: anObject onTopOf: top.	top := newElement.	size := size + 1.		! !!OOStack methodsFor: 'testing' stamp: 'PatricioSabogal 4/23/2018 21:51'!isEmpty	^ size = 0.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!OOStack class	instanceVariableNames: ''!!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!stackEmptyErrorDescription
	
	^ 'Stack is empty'! !Object subclass: #OOStackBase	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Stack-Exercise'!!OOStackBase methodsFor: 'accessing' stamp: 'PatricioSabogal 4/26/2018 14:19'!previous	^self error: 'Stack is empty'! !!OOStackBase methodsFor: 'accessing' stamp: 'PatricioSabogal 4/26/2018 14:19'!object	^self error: 'Stack is empty'! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!OOStackBase class	instanceVariableNames: ''!!OOStackBase class methodsFor: 'error descriptions' stamp: 'PatricioSabogal 4/26/2018 14:11'!stackEmptyErrorDescription	^'La base del stack no tiene elemento previo.'! !Object subclass: #OOStackElement	instanceVariableNames: 'previous object'	classVariableNames: ''	poolDictionaries: ''	category: 'Stack-Exercise'!!OOStackElement methodsFor: 'accessing' stamp: 'PatricioSabogal 4/23/2018 21:57'!previous	^previous ! !!OOStackElement methodsFor: 'accessing' stamp: 'PatricioSabogal 4/26/2018 11:53'!object	^object! !!OOStackElement methodsFor: 'initialization' stamp: 'PatricioSabogal 4/26/2018 11:53'!initializeWith: anObject onTopOf: aStackElement		object  := anObject.	previous := aStackElement.	! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!OOStackElement class	instanceVariableNames: ''!!OOStackElement class methodsFor: 'instance creation' stamp: 'PatricioSabogal 4/26/2018 14:44'!stack: anObject onTopOf: previousTop	^self new initializeWith: anObject  onTopOf: previousTop ! !TestCase subclass: #OOStackTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Stack-Exercise'!!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !