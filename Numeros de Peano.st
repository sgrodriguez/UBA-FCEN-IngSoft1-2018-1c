!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: 'descripcionDeErrorDeDividendoMenorADivisor next previous descripcionDeErrorNumerosRacionalesNoSoportados descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor'!

!I class methodsFor: 'operations' stamp: 'sa 4/1/2018 22:42:26'!
* unPeano
	^unPeano! !

!I class methodsFor: 'operations' stamp: 'ps 3/31/2018 15:02:47'!
+ unPeano
	^unPeano next! !

!I class methodsFor: 'operations' stamp: 'ps 3/31/2018 14:36:06'!
- unPeano
		self error: self descripcionDeErrorDeNumerosNegativosNoSoportados
	
	! !

!I class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:31:47'!
/ unPeano
	self = unPeano ifTrue:[^self] ifFalse:[self error: descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]! !

!I class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:36:41'!
> unPeano
	^false! !

!I class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:31:27'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se soportan divisiones por numeros mayores al dividendo'! !

!I class methodsFor: 'operations' stamp: 'ps 3/26/2018 20:53:34'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se soportan numero negativos'! !

!I class methodsFor: 'operations' stamp: 'ps 3/26/2018 21:07:05'!
next
	^next! !

!I class methodsFor: 'operations' stamp: 'ps 3/31/2018 15:12:08'!
previous
		self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'operations' stamp: 'sa 4/1/2018 22:27:33'!
restaPosta: unPeano
	^unPeano previous! !

I instVarNamed: 'descripcionDeErrorDeDividendoMenorADivisor' put: nil!
I instVarNamed: 'next' put: II!
I instVarNamed: 'previous' put: nil!
I instVarNamed: 'descripcionDeErrorNumerosRacionalesNoSoportados' put: nil!
I instVarNamed: 'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor' put: nil!

!classDefinition: #II category: #'Numeros de Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: 'previous next'!

!II class methodsFor: 'operations' stamp: 'sa 4/1/2018 22:46:53'!
* unPeano
	^self previous * unPeano + unPeano! !

!II class methodsFor: 'operations' stamp: 'ps 3/31/2018 15:03:52'!
+ unPeano
	^self previous + unPeano next! !

!II class methodsFor: 'operations' stamp: 'sa 4/1/2018 22:32:28'!
- unPeano
	^unPeano restaPosta: self! !

!II class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:29:01'!
/ unPeano
	(unPeano > self)
		ifTrue:
			[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]
		ifFalse:
			[(self = unPeano)
				ifTrue:
					[^I]
				ifFalse:
					[^self - unPeano / unPeano + I]].! !

!II class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:36:16'!
> unPeano
	^(unPeano = I or: [self previous > unPeano previous]) ! !

!II class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:37:34'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se soportan divisiones por numeros mayores al dividendo'! !

!II class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:32:59'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se soportan numero negativos'! !

!II class methodsFor: 'operations' stamp: 'ps 3/26/2018 21:18:33'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous: self.
	].
	^next! !

!II class methodsFor: 'operations' stamp: 'ps 3/26/2018 21:11:14'!
previous 
	^previous! !

!II class methodsFor: 'operations' stamp: 'ps 3/26/2018 21:20:30'!
previous: aPeano
	previous:= aPeano! !

!II class methodsFor: 'operations' stamp: 'sa 4/1/2018 22:33:39'!
restaPosta: unPeano
	^(self previous restaPosta: unPeano) previous! !

II instVarNamed: 'previous' put: I!
II instVarNamed: 'next' put: III!

!classDefinition: #III category: #'Numeros de Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros de Peano'!
III class
	instanceVariableNames: 'previous next'!

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
* unPeano
	^self previous * unPeano + unPeano! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
+ unPeano
	^self previous + unPeano next! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
- unPeano
	^unPeano restaPosta: self! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
/ unPeano
	(unPeano > self)
		ifTrue:
			[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]
		ifFalse:
			[(self = unPeano)
				ifTrue:
					[^I]
				ifFalse:
					[^self - unPeano / unPeano + I]].! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
> unPeano
	^(unPeano = I or: [self previous > unPeano previous]) ! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se soportan divisiones por numeros mayores al dividendo'! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se soportan numero negativos'! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous: self.
	].
	^next! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
previous 
	^previous! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
previous: aPeano
	previous:= aPeano! !

!III class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
restaPosta: unPeano
	^(self previous restaPosta: unPeano) previous! !

III instVarNamed: 'previous' put: II!
III instVarNamed: 'next' put: IIII!

!classDefinition: #IIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numeros de Peano'!
IIII class
	instanceVariableNames: 'previous next'!

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
* unPeano
	^self previous * unPeano + unPeano! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
+ unPeano
	^self previous + unPeano next! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
- unPeano
	^unPeano restaPosta: self! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
/ unPeano
	(unPeano > self)
		ifTrue:
			[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]
		ifFalse:
			[(self = unPeano)
				ifTrue:
					[^I]
				ifFalse:
					[^self - unPeano / unPeano + I]].! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
> unPeano
	^(unPeano = I or: [self previous > unPeano previous]) ! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se soportan divisiones por numeros mayores al dividendo'! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se soportan numero negativos'! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous: self.
	].
	^next! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
previous 
	^previous! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
previous: aPeano
	previous:= aPeano! !

!IIII class methodsFor: 'operations' stamp: 'ps 4/1/2018 23:38:27'!
restaPosta: unPeano
	^(self previous restaPosta: unPeano) previous! !

IIII instVarNamed: 'previous' put: III!
IIII instVarNamed: 'next' put: nil!

!classDefinition: #PeanoTest category: #'Numeros de Peano'!
DenotativeObject subclass: #PeanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PeanoTest class' category: #'Numeros de Peano'!
PeanoTest class
	instanceVariableNames: ''!

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:51:26'!
test01UnoMasUnSumandoEsElProximoDelSumando

	Assert that: I + II isEqualTo: II next.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ps 4/1/2018 23:40:21'!
test02NumerosMayoresaUnoSumanBien

	Assert that: II + II isEqualTo: IIII.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:12:19'!
test03UnNumeroMenosUnoEsElPrevioDelNumero

	Assert that: II - I isEqualTo: II previous.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'sa 4/1/2018 22:40:48'!
test04NumerosMayoresaUnoRestanBien

	Assert that: IIII - II isEqualTo: II.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:51:02'!
test05RestaNoSoportaNumerosNegativos

	Assert should: [ I - II ] signal: Error withDescription: I descripcionDeErrorDeNumerosNegativosNoSoportados.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:15:53'!
test06UnNumeroMultiplicadoPorUnoEsIgualAlNumero

	Assert that: II * I isEqualTo: II.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'sa 4/1/2018 22:48:38'!
test07NumerosMayoresaUnoMultiplicanBien

	Assert that: II * II isEqualTo: IIII.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:16:46'!
test08UnoMultiplicadoUnoEsIgualAUno

	Assert that: I * I isEqualTo: I.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:01:58'!
test09NumerosMayoresaUnoDividenBien

	Assert that: IIII / II isEqualTo: II.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:28'!
test10UnNumeroDivididoUnoEsIgualAlNumero

	Assert that: II / I isEqualTo: II.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:38'!
test11UnoDivididoUnoEsIgualAUno

	Assert that: I / I isEqualTo: I.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:59'!
test12DivisionNoSoportaDividirPorUnNumeroMayor

	Assert should: [ III /  IIII ] signal: Error withDescription: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
	
	Assert should: [ I /  II] signal: Error withDescription: I descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
! !
