!classDefinition: #TestCart category: #TusLibros!
TestCase subclass: #TestCart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestCart methodsFor: 'testing' stamp: 'ps 6/7/2018 18:06:37'!
test01NewCartIsEmpty
	
	|carrito catalogo|
	catalogo := 'catalogo'.
	carrito := Cart acceptingItemsOf: catalogo.
	
	self assert: carrito isEmpty.! !

!TestCart methodsFor: 'testing' stamp: 'ps 6/7/2018 18:27:53'!
test02SuccefulyAddingItemToCart
	
	|carrito catalogo|
	catalogo := #('Item').
	carrito := Cart acceptingItemsOf: catalogo.
	carrito add: 'Item'.
	
	self deny: carrito isEmpty.! !

!TestCart methodsFor: 'testing' stamp: 'ps 6/7/2018 18:41:19'!
test03CannotAddItemOutsideOfCatalog
	
	|carrito catalogo|
	catalogo := #('Item').
	carrito := Cart acceptingItemsOf: catalogo.

	
	self should: [	carrito add: 'Item1'. self fail] raise: Error withExceptionDo: [:anError | ^ self assert: anError messageText equals: Cart canOnlyAddItemsFromCatalogErrorMessage ]! !

!TestCart methodsFor: 'testing' stamp: 'ps 6/7/2018 18:35:33'!
test03SuccefulyAddingItemToCart
	
	|carrito catalogo|
	catalogo := #('Item').
	carrito := Cart acceptingItemsOf: catalogo.
	carrito add: 'Item'.
	
	self deny: carrito isEmpty.! !

!TestCart methodsFor: 'testing' stamp: 'ps 6/7/2018 18:33:23'!
test04SuccefulyAddingMultipleItemsToCart
	
	|carrito catalogo item1 item2|
	catalogo := #('Item1' , 'Item2').
	carrito := Cart acceptingItemsOf: catalogo.
	item1 := 'Item1'.
	item2 := 'Item2'.
	carrito add: item1.
	carrito add: item2.
	self assert: carrito numberOfItems equals: 2.! !

!TestCart methodsFor: 'testing' stamp: 'ps 6/7/2018 18:33:30'!
test05CanAddMoreThan1OfTheSameItem
	
	|carrito item1 catalogo|
	catalogo := #('Item1').
	carrito := Cart acceptingItemsOf: catalogo.
	item1 := 'Item1'.
	carrito add: item1 of: 3.

	self assert: (carrito countQuantityOfItem: item1) equals: 3.! !

!TestCart methodsFor: 'testing' stamp: 'ps 6/7/2018 18:33:37'!
test06CannotAddAnInvalidNumberOfTheSameItem
	
	|carrito item1 catalogo|
	catalogo := #('Item1').
	carrito := Cart acceptingItemsOf: catalogo .
	item1 := 'Item1'.

	self
		should: [ carrito add: item1 of: -1. self fail ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Cart canOnlyAddAPositiveIntegerQuantityOfAnItemErrorMessage ].! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'items catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'testing' stamp: 'ps 6/4/2018 21:44:46'!
countQuantityOfItem: anItem
	|quantity|
	quantity := items select: [:item | item = anItem].
	^quantity size! !

!Cart methodsFor: 'testing' stamp: 'ps 6/4/2018 21:22:30'!
isEmpty
	^items isEmpty! !

!Cart methodsFor: 'testing' stamp: 'ps 6/7/2018 18:41:38'!
isValid: anItem
	(catalog includes: anItem) ifFalse: [^self error: self class canOnlyAddItemsFromCatalogErrorMessage].
! !

!Cart methodsFor: 'testing' stamp: 'ps 6/4/2018 21:31:37'!
numberOfItems
	^items size! !


!Cart methodsFor: 'accesing' stamp: 'ps 6/4/2018 21:27:32'!
Items
	^items copy.! !

!Cart methodsFor: 'accesing' stamp: 'ps 6/7/2018 18:22:29'!
add: anItem
	self isValid: anItem .
	items add: anItem! !

!Cart methodsFor: 'accesing' stamp: 'ps 6/7/2018 18:22:45'!
add: anItem of: aQuantity
	|times|
	self isValid: anItem .
	(aQuantity > 0 and: (aQuantity isKindOf: Integer)) ifFalse: [^ self error: self class canOnlyAddAPositiveIntegerQuantityOfAnItemErrorMessage ].
	times := aQuantity .
	[times > 0] whileTrue: [self add: (anItem copy). times := times - 1]! !


!Cart methodsFor: 'initialization' stamp: 'ps 6/7/2018 18:03:40'!
initializeAcceptingItemsOf: aCatalog
	catalog := aCatalog .
	items := Bag new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error messages' stamp: 'ps 6/7/2018 18:05:07'!
acceptingItemsOf: aCatalog
	^ self new initializeAcceptingItemsOf: aCatalog ! !

!Cart class methodsFor: 'error messages' stamp: 'ps 6/7/2018 17:52:58'!
canOnlyAddAPositiveIntegerQuantityOfAnItemErrorMessage
 ^ 'Solo se puede agregar una cantidad positiva de un item '! !

!Cart class methodsFor: 'error messages' stamp: 'ps 6/7/2018 18:05:55'!
canOnlyAddItemsFromCatalogErrorMessage
 ^ 'Solo se puede agregar items contenidos en el catalogo.'! !
