Object subclass: #AccountTransaction	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Portfolio-Ejercicio'!!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!value 

	self subclassResponsibility ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!AccountTransaction class	instanceVariableNames: ''!!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !AccountTransaction subclass: #Deposit	instanceVariableNames: 'value'	classVariableNames: ''	poolDictionaries: ''	category: 'Portfolio-Ejercicio'!!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!initializeFor: aValue

	value := aValue ! !!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!value

	^ value! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Deposit class	instanceVariableNames: ''!!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!for: aValue

	^ self new initializeFor: aValue ! !TestCase subclass: #PortfolioTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Portfolio-Ejercicio'!!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:46'!test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: -50 on: account.
		
	self assert: 50 = account balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!test17PortfolioKnowsItsPortfoliosTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 = (composedPortfolio transactionsOf:complexPortfolio) size .
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!test10ReceptiveAccountManageItSelf 

	| account1 |
	
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:27'!test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |
	
	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:27'!test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf: account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:26'!test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: -50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !!PortfolioTest methodsFor: 'tests' stamp: 'PatricioSabogal 5/8/2018 18:27'!test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |	account1 := ReceptiveAccount new.	account2 := ReceptiveAccount new.	account3 := ReceptiveAccount new.	complexPortfolio := Portfolio with: account1 with: account2.	composedPortfolio := Portfolio with: complexPortfolio with: account3.	deposit1 := Deposit register: 100 on: account1.	deposit2 := Deposit register: 200 on: account2.	deposit3 := Deposit register: 300 on: account3.	self assert: 3 = composedPortfolio transactions size.	self assert: (composedPortfolio transactions includes: deposit1).	self assert: (composedPortfolio transactions includes: deposit2).	self assert: (composedPortfolio transactions includes: deposit3)! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:26'!test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: -50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:26'!test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !!PortfolioTest methodsFor: 'tests' stamp: 'PatricioSabogal 5/8/2018 10:23'!test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |	account1 := ReceptiveAccount new.	account2 := ReceptiveAccount new.	account3 := ReceptiveAccount new.	complexPortfolio := Portfolio with: account1 with: account2.	composedPortfolio := Portfolio with: complexPortfolio with: account3.	deposit1 := Deposit register: 100 on: account1.	deposit2 := Deposit register: 200 on: account2.	deposit3 := Deposit register: 300 on: account3.	self assert: (composedPortfolio registers: deposit1).	self assert: (composedPortfolio registers: deposit2).	self assert: (composedPortfolio registers: deposit3)! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!test13PortfolioManagesComposedAccountsAndPortfolios 

	| account1 account2 account3 complexPortfolio composedPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio manages: account1).
	self assert: (composedPortfolio manages: account2).
	self assert: (composedPortfolio manages: account3).
	self assert: (composedPortfolio manages: complexPortfolio).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !Object subclass: #SummarizingAccount	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Portfolio-Ejercicio'!!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!transactions

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'balance' stamp: 'HernanWilkinson 7/13/2011 18:34'!balance

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!manages: anAccount

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!registers: aTransaction

	self subclassResponsibility ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!SummarizingAccount class	instanceVariableNames: ''!!SummarizingAccount class methodsFor: 'error messages' stamp: 'PatricioSabogal 5/9/2018 18:16'!accountNotManagedMessageDescription	^ 'account not managed.'! !!SummarizingAccount class methodsFor: 'error messages' stamp: 'PatricioSabogal 5/9/2018 18:23'!accountAlreadyManagedErrorMessage	^ 'accounts is already managed.'! !SummarizingAccount subclass: #Portfolio	instanceVariableNames: 'accounts'	classVariableNames: ''	poolDictionaries: ''	category: 'Portfolio-Ejercicio'!!Portfolio methodsFor: 'testing' stamp: 'PatricioSabogal 5/9/2018 17:50'!manages: anAccount	^(self = anAccount		or: (accounts inject: false into: [ :found :account | found or: (account manages: anAccount) ]))! !!Portfolio methodsFor: 'testing' stamp: 'PatricioSabogal 5/8/2018 10:40'!registers: aTransaction	^ accounts		inject: false		into: [ :found :account | found or: (account registers: aTransaction) ]! !!Portfolio methodsFor: 'balance' stamp: 'PatricioSabogal 5/9/2018 14:08'!balance	^ accounts inject: 0 into: [ :sum :account | sum + account balance ]! !!Portfolio methodsFor: 'transactions' stamp: 'PatricioSabogal 5/9/2018 18:22'!transactionsOf: anAccount	| result |	result := accounts		detect: [ :account | account manages: anAccount ]		ifNone: [ ^ self error: 'account not managed.' ].	^ result transactions! !!Portfolio methodsFor: 'transactions' stamp: 'PatricioSabogal 5/8/2018 18:27'!transactions	| total |	total := OrderedCollection new.	accounts do: [ :account | total addAll: account transactions ].	^ total! !!Portfolio methodsFor: 'initialization' stamp: 'PatricioSabogal 5/8/2018 10:11'!initializeWithAll: aCollectionOfAccounts	super initialize.	accounts := aCollectionOfAccounts.! !!Portfolio methodsFor: 'initialization' stamp: 'PatricioSabogal 5/9/2018 18:38'!initializeWith: account1 with: account2	super initialize.	accounts := OrderedCollection new.	accounts add: account1.	(self manages: account2)		ifTrue: [ self error: 'accounts is already managed.' ].	accounts add: account2! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Portfolio class	instanceVariableNames: ''!!Portfolio class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/8/2018 10:07'!with: anAccount1 with: anAccount2

	^self new initializeWith: anAccount1 with: anAccount2.  ! !!Portfolio class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/8/2018 10:12'!withAll: aCollectionOfAccounts	^ self new initializeWithAll: aCollectionOfAccounts! !SummarizingAccount subclass: #ReceptiveAccount	instanceVariableNames: 'transactions'	classVariableNames: ''	poolDictionaries: ''	category: 'Portfolio-Ejercicio'!!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!transactions 

	^ transactions copy! !!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!register: aTransaction

	transactions add: aTransaction 
! !!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!manages: anAccount

	^ self = anAccount 
! !!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!registers: aTtransaction

	^ transactions includes: aTtransaction 
! !!ReceptiveAccount methodsFor: 'balance' stamp: 'HernanWilkinson 7/13/2011 18:36'!balance

	^ transactions inject: 0 into: [ :balance :transaction | balance + transaction value ]
! !!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!initialize

	super initialize.
	transactions := OrderedCollection new.! !AccountTransaction subclass: #Withdraw	instanceVariableNames: 'value'	classVariableNames: ''	poolDictionaries: ''	category: 'Portfolio-Ejercicio'!!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!initializeFor: aValue

	value := aValue ! !!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!value

	^ value! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Withdraw class	instanceVariableNames: ''!!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!for: aValue

	^ self new initializeFor: aValue ! !