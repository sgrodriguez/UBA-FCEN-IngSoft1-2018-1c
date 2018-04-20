Object subclass: #Numero	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Numero-Exercise'!!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!isOne

	self subclassResponsibility ! !!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!isZero

	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !!Numero methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:20'!dividirEntero	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:19'!sumarEntero	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!* aMultiplier

	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:20'!dividirFraccion	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!/ aDivisor

	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:20'!multiplicarEntero	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:20'!multiplicarFraccion	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:20'!sumarFraccion	self subclassResponsibility ! !!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!+ anAdder

	self subclassResponsibility ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Numero class	instanceVariableNames: ''!!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !Numero subclass: #Entero	instanceVariableNames: 'value'	classVariableNames: ''	poolDictionaries: ''	category: 'Numero-Exercise'!!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 11:58'!dividirFraccion: anFraccion	^Fraccion with: anFraccion numerator over: (anFraccion denominator * self)! !!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 11:35'!multiplicarEntero: anEntero	^self class with: (value * anEntero integerValue).! !!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:31'!* aMultiplier 
	^aMultiplier multiplicarEntero: self

	! !!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:45'!dividirEntero: anEntero	^Fraccion with: anEntero over: self ! !!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!// aDivisor 
	
	^self class with: value // aDivisor integerValue! !!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:31'!/ aDivisor 
	^aDivisor dividirEntero: self! !!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:30'!+ anAdder 
	"(anAdder isKindOf: self class) ifTrue: [^self class with: value + anAdder integerValue.]	ifFalse: [ ^Fraccion with: (self value * anAdder denominator) + anAdder numerator over: anAdder denominator .]"
	
^anAdder sumarEntero: self! !!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 11:53'!multiplicarFraccion: anFraccion	^Fraccion with: (self * anFraccion numerator) over: anFraccion denominator! !!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 11:55'!sumarFraccion: anFraccion	^Fraccion with: (anFraccion denominator * self ) + anFraccion numerator over: anFraccion denominator! !!Entero methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:13'!sumarEntero: anEntero	"comment stating purpose of message"	^self class with: (value  + anEntero integerValue).! !!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!hash

	^value hash! !!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!initalizeWith: aValue 
	
	value := aValue! !!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!isOne
	
	^value = 1! !!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!isZero
	
	^value = 0! !!Entero methodsFor: 'value' stamp: 'pato 4/19/2018 21:02'!integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Entero class	instanceVariableNames: ''!!Entero class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 22:53'!with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initalizeWith: aValue! !Numero subclass: #Fraccion	instanceVariableNames: 'numerator denominator'	classVariableNames: ''	poolDictionaries: ''	category: 'Numero-Exercise'!!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!isOne
	
	^false! !!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!isZero
	
	^false! !!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!numerator

	^ numerator! !!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!denominator

	^ denominator! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:31'!/ aDivisor 
	
	^aDivisor dividirFraccion: self! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 11:57'!dividirEntero: anEntero	^((Fraccion with: denominator over: numerator ) * anEntero)! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:38'!multiplicarFraccion: anFraccion	^(numerator * anFraccion numerator) / (denominator * anFraccion denominator)! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:40'!* aMultiplier 
	^aMultiplier multiplicarFraccion: self! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:57'!dividirFraccion: anFraccion	^anFraccion  * (self class with: denominator over: numerator )! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:36'!sumarFraccion: anFraccion	|newNumerator newDenominator|  	newNumerator := (numerator * anFraccion  denominator) + (denominator * anFraccion numerator).
	newDenominator := denominator * anFraccion  denominator.
	^(newNumerator / newDenominator).! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/20/2018 10:31'!+ anAdder 
	
	^anAdder sumarFraccion: self! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:34'!multiplicarEntero: anEntero	^self class with: (anEntero * numerator) over: denominator ! !!Fraccion methodsFor: 'arithmetic operations' stamp: 'pato 4/19/2018 21:36'!sumarEntero: anEntero	^self class with: (denominator * anEntero ) + numerator over: denominator .	! !!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!hash

	^(numerator hash / denominator hash) hash! !!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Fraccion class	instanceVariableNames: ''!!Fraccion class methodsFor: 'intance creation' stamp: 'HernanWilkinson 5/7/2016 20:41'!with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !TestCase subclass: #NumeroTest	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'	classVariableNames: ''	poolDictionaries: ''	category: 'Numero-Exercise'!!NumeroTest methodsFor: 'setup' stamp: 'HernanWilkinson 5/7/2016 20:56'!setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	four := Entero with: 4.
	five := Entero with: 5.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !