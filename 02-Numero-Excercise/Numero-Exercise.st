Object subclass: #Numero

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self error: self class invalidNumberTypeErrorDescription! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !
 anAdder

	self subclassResponsibility ! !

	^'No se puede dividir por cero'! !
	^ 'Tipo de numero invalido'! !
	
	^self class with: (value gcd: anEntero integerValue)! !
	^aMultiplier multiplicarEntero: self

	! !
	
	^self class with: value // aDivisor integerValue! !
	^aDivisor dividirEntero: self! !
 anAdder 
	"(anAdder isKindOf: self class) ifTrue: [^self class with: value + anAdder integerValue.]
	
^anAdder sumarEntero: self! !

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

	^value hash! !
	
	value := aValue! !
	
	^value = 1! !
	
	^value = 0! !

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initalizeWith: aValue! !
	
	^false! !
	
	^false! !

	^ numerator! !

	^ denominator! !
	
	^aDivisor dividirFraccion: self! !
	^aMultiplier multiplicarFraccion: self! !
	newDenominator := denominator * anFraccion  denominator.
	^(newNumerator / newDenominator).! !
 anAdder 
	
	^anAdder sumarFraccion: self! !

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

	^(numerator hash / denominator hash) hash! !

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !

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
	! !

	self assert: zero isZero! !

	self assert: one / twoFifth equals: fiveHalfs  ! !

	self deny: zero isOne! !

	self assert: oneHalf + oneHalf equals: one! !

	self assert: oneHalf / oneHalf equals: one! !

	self assert: oneFifth * two equals: twoFifth ! !

	self assert: two / four equals: oneHalf! !

	self assert: oneHalf equals: two / four! !

	self assert: two * oneFifth equals: twoFifth ! !

	self deny: one isZero! !

	self assert: one isOne! !

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

	self assert: twoFifth / five equals: twoTwentyfifth ! !

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

	self deny: oneHalf isZero! !

	self deny: oneHalf isOne! !

	self assert: two * two equals: four! !

	self assert: two equals: four / two! !
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

	self assert: (two/five) * (five/two) equals: one! !

	self assert: one + one equals: two! !
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

	self assert: two / two equals: one! !