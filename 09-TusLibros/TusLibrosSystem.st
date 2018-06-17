!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #TusLibrosSystemsTest category: #TusLibros!
TestCase subclass: #TusLibrosSystemsTest
	instanceVariableNames: 'factory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 16:37:57'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/14/2018 20:31:42'!
setUp 

	factory := StoreTestObjectsFactory new.! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:21:45'!
test01CannotCreateANewCartForInvalidUser
	
	|tusLibros |
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	self should: [tusLibros createCartFor: factory invalidUser with: factory validPassword on: factory today]
	raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: TusLibrosSystems invalidUsernameErrorMessage].! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:22:09'!
test02CannotCreateANewCartForInvalidPassword
	
	|tusLibros|

	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	self should: [tusLibros createCartFor: factory validUser with: factory invalidPassword on: factory today ]
	raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: TusLibrosSystems invalidPasswordErrorMessage ].
! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:22:20'!
test03CannotListCartForInvalidCartId
	|tusLibros|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	self should: [tusLibros list: factory invalidCartID on: factory today]
	raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: TusLibrosSystems invalidCartIDErrorMessage ].
! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:25:02'!
test04CanListCartForValidCartId
	|tusLibros id|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today.
	self assert: (tusLibros list: id on: factory today) equals: OrderedCollection new! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:24:51'!
test05CanCreateANewCartForValidUserAndPassword
	
	|tusLibros id|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today.
	^self assert: (tusLibros list: id on: factory today) isEmpty 
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:22:51'!
test06CannotAddToInvalidCart
	
	|tusLibros|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	tusLibros createCartFor: factory validUser with: factory validPassword on: factory today. 
	
	^self should: [tusLibros to: factory invalidCartID add: 5 of: factory itemSellByTheStore on: factory today]
	raise: Error 
	withExceptionDo: [:anError | ^self assert: anError messageText equals: TusLibrosSystems invalidCartIDErrorMessage .]  
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:22:59'!
test07CannotAddInvalidItemToCart
	
	|tusLibros id|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today.
	
	^self should: [tusLibros to: id add: 5 of: factory itemNotSellByTheStore on: factory today ] 
	raise: Error 
	withExceptionDo: [:anError | ^self assert: anError messageText equals: Cart new invalidItemErrorMessage .]  
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:24:35'!
test08CanAddValidItemToCart
	
	|tusLibros id items|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	items := OrderedCollection new.
	items add: factory itemSellByTheStore .
	items add: factory itemSellByTheStore .
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today.
	tusLibros to: id add: 2 of: factory itemSellByTheStore on: factory today .
	^self assert: (tusLibros list: id on: factory today) equals: items.
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:23:18'!
test09CannotListPurchasesOfAnInvalidUsername	
	|tusLibros|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	^self should: [tusLibros listPurchasesOf: factory invalidUser with: factory invalidPassword on: factory today]
 	raise: Error 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TusLibrosSystems invalidUsernameErrorMessage]
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:23:22'!
test10CannotListPurchasesOfAnUserWithAnInvalidPassword
	|tusLibros|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	^self should: [tusLibros listPurchasesOf: factory validUser with: factory invalidPassword on: factory today ]
	raise: Error 
	withExceptionDo: [ :anError | self assert: anError messageText equals: TusLibrosSystems invalidPasswordErrorMessage ]! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:23:56'!
test11CanListEmptyPurchasesOfAValidUserAndValidPassword
	| tusLibros |
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	^ self
		assert:
			(tusLibros
				listPurchasesOf: factory validUser
				with: factory validPassword
				on: factory today)
		equals: OrderedCollection new.! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:24:19'!
test12CannotCheckoutInvalidCartID
	
	|tusLibros id|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today.
		
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today.
	tusLibros to: id add: 2 of: factory itemSellByTheStore on: factory today.
	debitBehavior := [].
	^self should: [tusLibros checkout: factory invalidCartID through: self payingWith: factory notExpiredCreditCard on: factory today ]
	raise: Error
	withExceptionDo: [:anError | ^self assert: anError messageText equals: TusLibrosSystems invalidCartIDErrorMessage ]
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:18:43'!
test13CannotCheckoutValidCartOnExpiredSession
	
	|tusLibros id|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today .
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today.
	tusLibros to: id add: 2 of: factory itemSellByTheStore on: factory today.
	debitBehavior := [].
	^self should: [tusLibros checkout: id through: self payingWith: factory notExpiredCreditCard on: factory today30MinutesIntoTheFuture ]
	raise: Error
	withExceptionDo: [:anError | ^self assert: anError messageText equals: TusLibrosSystems expiredSessionErrorMessage]
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:25:56'!
test14CannotAddItemOnExpiredSession
	
	
	|tusLibros id|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today .
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today.
	^self should: [tusLibros to: id add: 2 of: factory itemSellByTheStore on: factory today30MinutesIntoTheFuture . ]
	raise: Error
	withExceptionDo: [:anError | ^self assert: anError messageText equals: TusLibrosSystems expiredSessionErrorMessage]
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:26:21'!
test15CannotListCartOnExpiredSession
	
		
	|tusLibros id|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today .
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today.
	^self should: [tusLibros list: id on: factory today30MinutesIntoTheFuture ]
	raise: Error
	withExceptionDo: [:anError | ^self assert: anError messageText equals: TusLibrosSystems expiredSessionErrorMessage]
	
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:27:31'!
test16CannotCreateCartOnExpiredSession
	
		
	|tusLibros|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today .
	^self should: [tusLibros  createCartFor: factory validUser with: factory validPassword on: factory today30MinutesIntoTheFuture ]
	raise: Error
	withExceptionDo: [:anError | ^self assert: anError messageText equals: TusLibrosSystems expiredSessionErrorMessage]
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:28:43'!
test17CannotListPurchasesOnExpiredSession
	
	|tusLibros|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today .
	^self should: [tusLibros listPurchasesOf: factory validUser with: factory validPassword on: factory today30MinutesIntoTheFuture ]
	raise: Error
	withExceptionDo: [:anError | ^self assert: anError messageText equals: TusLibrosSystems expiredSessionErrorMessage]
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 18:35:42'!
test18CanOperateAfter30MinutesFromFirstOperationDoingStuffInBetween
	
	|tusLibros id|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today .
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today15MinutesIntoTheFuture .
	^ self assert:  (tusLibros list: id on: factory today30MinutesIntoTheFuture) equals: OrderedCollection new.
	
	
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 19:29:39'!
test19CanCheckoutValidCart
	
	|tusLibros id total|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today .
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today15MinutesIntoTheFuture .
	tusLibros to: id add: 1 of: factory itemSellByTheStore on: factory today15MinutesIntoTheFuture. 
	debitBehavior := [:anAmount :aCreditCard | ].
	total := tusLibros checkout: id through: self  payingWith: factory notExpiredCreditCard on: factory today15MinutesIntoTheFuture.

	^ self assert: ((tusLibros listPurchasesOf: factory validUser with: factory validPassword on: factory today15MinutesIntoTheFuture) at: 1) total equals: (Sale of: total) total 
	
	
	
	! !

!TusLibrosSystemsTest methodsFor: 'Testing' stamp: 'ps 6/17/2018 19:30:10'!
test20CanListPurchasesOfUser
	
	|tusLibros id total|
	tusLibros := TusLibrosSystems for: factory defaultClientsAndPasswords with: factory defaultCatalog since: factory today .
	id := tusLibros createCartFor: factory validUser with: factory validPassword on: factory today15MinutesIntoTheFuture .
	tusLibros to: id add: 1 of: factory itemSellByTheStore on: factory today15MinutesIntoTheFuture. 
	debitBehavior := [:anAmount :aCreditCard | ].
	total := tusLibros checkout: id through: self  payingWith: factory notExpiredCreditCard on: factory today15MinutesIntoTheFuture.

	^ self assert: ((tusLibros listPurchasesOf: factory validUser with: factory validPassword on: factory today15MinutesIntoTheFuture) at: 1) total equals: (Sale of: total) total ! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'accesing' stamp: 'ps 6/14/2018 23:16:51'!
items
	^items copy.
 ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'ps 6/14/2018 21:51:42'!
invalidCartID
^ 3! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !

!StoreTestObjectsFactory methodsFor: 'date' stamp: 'ps 6/17/2018 18:31:23'!
today15MinutesIntoTheFuture
	|año mes dia hora minutos segundos|
	año :=  (today year) yearNumber .
	mes :=  (today month) monthIndex .
	dia :=  today dayOfMonth .
	hora :=  today hour .
	minutos :=  today minute + 16 .
	segundos :=  today second .
	^ DateAndTime year: año month: mes day: dia  hour: hora minute: minutos second: segundos ! !

!StoreTestObjectsFactory methodsFor: 'date' stamp: 'ps 6/17/2018 18:14:40'!
today30MinutesIntoTheFuture
	|año mes dia hora minutos segundos|
	año :=  (today year) yearNumber .
	mes :=  (today month) monthIndex .
	dia :=  today dayOfMonth .
	hora :=  today hour .
	minutos :=  today minute + 31 .
	segundos :=  today second .
	^ DateAndTime year: año month: mes day: dia  hour: hora minute: minutos second: segundos ! !


!StoreTestObjectsFactory methodsFor: 'users' stamp: 'ps 6/14/2018 21:17:17'!
defaultClientsAndPasswords
	|dicc|
	
	dicc := Dictionary new.
	
	dicc at: self validUser put: self validPassword . 	

	^dicc copy.! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'ps 6/14/2018 21:16:31'!
invalidPassword
	^'novalida'! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'ps 6/14/2018 21:16:39'!
invalidUser
	^'novalida'! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'ps 6/14/2018 21:16:23'!
validPassword
	^'valida'! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'ps 6/14/2018 21:16:09'!
validUser
	^'valido'! !


!classDefinition: #TusLibrosSystems category: #TusLibros!
Object subclass: #TusLibrosSystems
	instanceVariableNames: 'carts users catalog IDs purchases userOfCart since'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!
!TusLibrosSystems commentStamp: '<historical>' prior: 0!
THIS CLASS HAS COMMENT!!!


!TusLibrosSystems methodsFor: 'accessing' stamp: 'ps 6/17/2018 18:13:02'!
checkout: aCartID through: aMerchantProcessor payingWith: aCreditCard on: aDateAndTime

	|cashier cart salesbook user|
	(aDateAndTime - since) minutes >= 30 ifTrue: [^ self error: self class expiredSessionErrorMessage ].
	cart := carts at: aCartID ifAbsent: [^ self error: self class invalidCartIDErrorMessage.].
	user := userOfCart at: aCartID .
	salesbook := purchases at: user.
	cashier := Cashier toCheckout: cart charging:  aCreditCard throught: aMerchantProcessor on: aDateAndTime registeringOn: salesbook . 
	^cashier checkOut .! !

!TusLibrosSystems methodsFor: 'accessing' stamp: 'ps 6/17/2018 18:20:05'!
createCartFor: anUser with: aPassword on: aDateAndTime
	|idPrevio|
	(aDateAndTime - since) minutes >= 30 ifTrue: [^ self error: self class expiredSessionErrorMessage ].
	users at: anUser ifAbsent: [^self error: self class invalidUsernameErrorMessage].
	(users at: anUser) = aPassword ifFalse: [^self error: self class invalidPasswordErrorMessage].
	
	carts at: IDs put: (Cart acceptingItemsOf: catalog).
	userOfCart at: IDs put: anUser.
	idPrevio := IDs.
	IDs := idPrevio +1.
	since := aDateAndTime .
	^idPrevio 
	! !

!TusLibrosSystems methodsFor: 'accessing' stamp: 'ps 6/17/2018 18:20:30'!
list: aCartID on: aDateAndTime
	|cart|
	(aDateAndTime - since) minutes >= 30 ifTrue: [^ self error: self class expiredSessionErrorMessage ].
	 cart := carts at: aCartID ifAbsent: [^ self error: self class invalidCartIDErrorMessage.].
	since := aDateAndTime .
	^ cart items copy.
	! !

!TusLibrosSystems methodsFor: 'accessing' stamp: 'ps 6/17/2018 18:20:57'!
listPurchasesOf: anUser with: aPassword on: aDateAndTime
	(aDateAndTime - since) minutes >= 30 ifTrue: [^ self error: self class expiredSessionErrorMessage ].
	users at: anUser ifAbsent: [^self error: self class invalidUsernameErrorMessage].
	(users at: anUser) = aPassword ifFalse: [^self error: self class invalidPasswordErrorMessage].
	since := aDateAndTime .
	^ purchases at: anUser copy.



	! !

!TusLibrosSystems methodsFor: 'accessing' stamp: 'ps 6/17/2018 18:21:22'!
to: aCartID add: aQuantity of: anItem on: aDateAndTime
	| cart |
	(aDateAndTime - since) minutes >= 30 ifTrue: [^ self error: self class expiredSessionErrorMessage ].
	cart := carts at: aCartID ifAbsent: [^ self error: self class invalidCartIDErrorMessage.].
	cart add: aQuantity of: anItem .
	since := aDateAndTime .! !


!TusLibrosSystems methodsFor: 'initializing' stamp: 'ps 6/17/2018 17:48:31'!
initializeFor: aSetUsersAndPasswords with: aCatalog since: aDateAndTime
	|keys|
	
	since := aDateAndTime.
	IDs := 0.
	catalog := aCatalog .
	users := aSetUsersAndPasswords .
	carts := Dictionary new.
	purchases := Dictionary new.
	userOfCart := Dictionary new.

	keys := aSetUsersAndPasswords keys.
	keys do: [ :aKey | purchases at: aKey put: OrderedCollection new.]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystems class' category: #TusLibros!
TusLibrosSystems class
	instanceVariableNames: ''!


!TusLibrosSystems class methodsFor: 'initializing' stamp: 'ps 6/17/2018 17:42:14'!
for: aSetOfUsersAndPasswords with: aCatalog since: aDateAndTime

	^self new initializeFor: aSetOfUsersAndPasswords with: aCatalog since: aDateAndTime .! !


!TusLibrosSystems class methodsFor: 'error messages' stamp: 'ps 6/17/2018 17:46:34'!
expiredSessionErrorMessage
	^ 'La sesion expiro'! !

!TusLibrosSystems class methodsFor: 'error messages' stamp: 'ps 6/14/2018 21:35:45'!
invalidCartIDErrorMessage
	^ 'El ID del carrito es invalido'! !

!TusLibrosSystems class methodsFor: 'error messages' stamp: 'ps 6/14/2018 21:30:51'!
invalidPasswordErrorMessage
	^'El usuario o contraseña es invalido(constraseña)'! !

!TusLibrosSystems class methodsFor: 'error messages' stamp: 'ps 6/14/2018 21:30:43'!
invalidUsernameErrorMessage
	^'El usuario o contraseña es invalido(usuario)'! !
