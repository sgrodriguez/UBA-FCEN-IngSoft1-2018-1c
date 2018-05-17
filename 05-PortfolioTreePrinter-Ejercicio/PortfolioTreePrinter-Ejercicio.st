Object subclass: #AccountInvestmentEarnings	instanceVariableNames: 'investment revenue'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!AccountInvestmentEarnings methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:52'!reportWithdraw: aTransaction	! !!AccountInvestmentEarnings methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:57'!reportCertificateOfDeposit: aTransaction	revenue := revenue + (aTransaction value * (aTransaction tna / 360) * aTransaction numberOfDays)! !!AccountInvestmentEarnings methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:52'!reportTransferDeposit: aTransaction	! !!AccountInvestmentEarnings methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:52'!reportTransferWithdraw: aTransaction	! !!AccountInvestmentEarnings methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:50'!initializeOf: aReceptiveAccount	revenue := 0.	aReceptiveAccount transactions do: [ :aTransaction | aTransaction report: self].	^revenue .	! !!AccountInvestmentEarnings methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:52'!reportDeposit: aTransaction	! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!AccountInvestmentEarnings class	instanceVariableNames: ''!!AccountInvestmentEarnings class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 23:53'!of: aReceptiveAccount	^ self new initializeOf: aReceptiveAccount! !Object subclass: #AccountInvestmentNet	instanceVariableNames: 'investment'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!AccountInvestmentNet methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:52'!reportDeposit: aTransaction	! !!AccountInvestmentNet methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:42'!reportCertificateOfDeposit: aTransaction	investment := investment + aTransaction value! !!AccountInvestmentNet methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:52'!reportTransferDeposit: aTransaction	! !!AccountInvestmentNet methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:52'!reportTransferWithdraw: aTransaction	! !!AccountInvestmentNet methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 22:20'!initializeOf: aReceptiveAccount	investment := 0.	aReceptiveAccount transactions do: [ :aTransaction | aTransaction report: self ].	^investment.! !!AccountInvestmentNet methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:52'!reportWithdraw: aTransaction	! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!AccountInvestmentNet class	instanceVariableNames: ''!!AccountInvestmentNet class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 21:51'!of: aReceptiveAccount	^ self new initializeOf: aReceptiveAccount.	! !Object subclass: #AccountSummary	instanceVariableNames: 'lines'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!AccountSummary methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:35'!reportWithdraw: aTransaction	^ 'Extraccion por ' , aTransaction value asString asString! !!AccountSummary methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:35'!reportTransferDeposit: aTransaction	^ 'Transferencia por ' , aTransaction value asString! !!AccountSummary methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:40'!reportCertificateOfDeposit: aTransaction	^ 'Plazo fijo por ',aTransaction value asString,' durante ',aTransaction numberOfDays asString,' dias a una tna de ', (aTransaction tna * 100) asString, '%'! !!AccountSummary methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:35'!reportTransferWithdraw: aTransaction	^ 'Transferencia por -' , aTransaction value asString! !!AccountSummary methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 21:46'!initializeOf: aReceptiveAccount	| transactions |	lines := OrderedCollection new.	transactions := aReceptiveAccount transactions.	transactions do: [ :aTransaction | lines add: (aTransaction report: self) ].	^ lines! !!AccountSummary methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:34'!reportDeposit: aTransaction	^ 'Deposito por ' , aTransaction value asString! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!AccountSummary class	instanceVariableNames: ''!!AccountSummary class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 21:47'!of: aReceptiveAccount	^ self new initializeOf: aReceptiveAccount! !Object subclass: #AccountTransaction	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!AccountTransaction methodsFor: 'evaluating' stamp: 'patosabogal 5/17/2018 16:51'!modifiedBalance^ self subclassResponsibility! !!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!value

	self subclassResponsibility ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!AccountTransaction class	instanceVariableNames: ''!!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !Object subclass: #AccountTransferNet	instanceVariableNames: 'value'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!AccountTransferNet methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:43'!reportWithdraw: aTransaction	! !!AccountTransferNet methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:43'!reportTransferDeposit: aTransaction	value := value + aTransaction value! !!AccountTransferNet methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:47'!reportCertificateOfDeposit: aTransaction! !!AccountTransferNet methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:43'!reportTransferWithdraw: aTransaction	value := value - aTransaction value! !!AccountTransferNet methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 22:01'!initializeOf: anAccount	value := 0.	anAccount transactions do: [ :aTransaction | aTransaction report: self ].	^ value! !!AccountTransferNet methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:42'!reportDeposit: aTransaction! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!AccountTransferNet class	instanceVariableNames: ''!!AccountTransferNet class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 21:47'!of: anAccount	^ self new initializeOf: anAccount! !AccountTransaction subclass: #CertificateOfDeposit	instanceVariableNames: 'numberOfDays account value tna'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!CertificateOfDeposit methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 23:37'!initializeFor: aValue during: aNumberOfDays at: aTna	value := aValue.	numberOfDays := aNumberOfDays.	tna := aTna! !!CertificateOfDeposit methodsFor: 'reporting' stamp: 'patosabogal 5/17/2018 16:50'!report: aVisitor	^ aVisitor reportCertificateOfDeposit: self! !!CertificateOfDeposit methodsFor: 'value' stamp: 'PatricioSabogal 5/14/2018 22:05'!modifiedBalance: aBalance	^ aBalance - value! !!CertificateOfDeposit methodsFor: 'value' stamp: 'PatricioSabogal 5/14/2018 22:06'!value ^ value.! !!CertificateOfDeposit methodsFor: 'accessing' stamp: 'PatricioSabogal 5/14/2018 23:37'!tna	^tna! !!CertificateOfDeposit methodsFor: 'accessing' stamp: 'PatricioSabogal 5/14/2018 23:37'!numberOfDays	^ numberOfDays ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CertificateOfDeposit class	instanceVariableNames: ''!!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'PatricioSabogal 5/14/2018 21:58'!register: aValue during: aNumberOfDays at: aRate on: anAccount	| certificateOfDeposit |	certificateOfDeposit := self new initializeFor: aValue during: aNumberOfDays at: aRate.	anAccount register: certificateOfDeposit.	^ certificateOfDeposit! !AccountTransaction subclass: #Deposit	instanceVariableNames: 'value'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!Deposit methodsFor: 'initialization' stamp: 'SA 5/10/2018 19:40:49'!modifiedBalance: aBalance

	^(aBalance + value)! !!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!initializeFor: aValue

	value := aValue ! !!Deposit methodsFor: 'value' stamp: 'patosabogal 5/17/2018 16:50'!report: aVisitor	^ aVisitor reportDeposit: self! !!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!value

	^ value! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Deposit class	instanceVariableNames: ''!!Deposit class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 19:11'!register: aValue on: account	| deposit |	deposit := self for: aValue.	account register: deposit.	^ deposit! !!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!for: aValue

	^ self new initializeFor: aValue ! !TestCase subclass: #PortfolioTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!PortfolioTest methodsFor: 'test support' stamp: 'PatricioSabogal 5/14/2018 23:53'!investmentEarningsOf: aReceptiveAccount	^ AccountInvestmentEarnings of: aReceptiveAccount .! !!PortfolioTest methodsFor: 'test support' stamp: 'PatricioSabogal 5/14/2018 21:47'!accountTransferNetOf: aReceptiveAccount	^ AccountTransferNet of: aReceptiveAccount! !!PortfolioTest methodsFor: 'test support' stamp: 'patosabogal 5/17/2018 16:39'!portofolioTreeOf: aPortfolio namingAccountWith: aDictionary	^ PortfolioTree of: aPortfolio namingAccountWith: aDictionary! !!PortfolioTest methodsFor: 'test support' stamp: 'patosabogal 5/17/2018 16:48'!reversePortofolioTreeOf: aPortfolio namingAccountWith: aDictionary	^ ReversePortfolioTree of: aPortfolio namingAccountWith: aDictionary! !!PortfolioTest methodsFor: 'test support' stamp: 'PatricioSabogal 5/14/2018 21:51'!investmentNetOf: aReceptiveAccount	^ AccountInvestmentNet of: aReceptiveAccount .! !!PortfolioTest methodsFor: 'test support' stamp: 'PatricioSabogal 5/14/2018 21:46'!accountSummaryLinesOf: aReceptiveAccount	^ AccountSummary of: aReceptiveAccount! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:15'!test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:45'!test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 18:37:21'!test26AccountSummaryShouldWorkWithCertificateOfDeposit

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	lines := self accountSummaryLinesOf: fromAccount.
		
	self assert: 4 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:27:01'!test22AccountSummaryShouldProvideHumanReadableTransactionsDetail

	| fromAccount toAccount fromAccountLines toAccountLines|

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.
	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	
	fromAccountLines := self accountSummaryLinesOf: fromAccount.
	toAccountLines := self accountSummaryLinesOf: toAccount.
	
	self assert: 3 = fromAccountLines size.
	self assert: 'Deposito por 100' = (fromAccountLines at: 1).
	self assert: 'Extraccion por 50' = (fromAccountLines at: 2).
	self assert: 'Transferencia por -100' = (fromAccountLines at: 3).
	
	self assert: 1 = toAccountLines size.
	self assert: 'Transferencia por 100' = (toAccountLines at: 1).
	! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:34'!test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
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
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |
	account := ReceptiveAccount new. 
		
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings = (self investmentEarningsOf: account).! !!PortfolioTest methodsFor: 'tests' stamp: 'PatricioSabogal 5/14/2018 19:50'!test21_01TransferIsReachedFromTransacctions	| fromAccount toAccount transfer |	fromAccount := ReceptiveAccount new.	toAccount := ReceptiveAccount new.	transfer := Transfer register: 100 from: fromAccount to: toAccount.	self assert: 100 = transfer value.	self assert: fromAccount transactions first transfer equals: transfer.	self assert: toAccount transactions first transfer equals: transfer! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:01'!test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:44'!test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:53'!test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!test24CertificateOfDepositShouldWithdrawInvestmentValue

	| account toAccount |
	account := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	Transfer register: 100 from: account to: toAccount.
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
		
	self assert: 100 =(self investmentNetOf:account).
	self assert: 750 = account balance.! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:48'!test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:30'!test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:00'!test10ReceptiveAccountManageItSelf 

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:02'!test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:24:31'!test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |

	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:27'!test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert: -100 = fromAccount balance.
	self assert:  100 = toAccount balance.! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!test23ShouldBeAbleToBeQueryTransferNet

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:29'!test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: 'composedPortfolio' = (lines at: 1).
	self assert: ' complexPortfolio' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: '  account2' = (lines at: 4).
	self assert: ' account3' = (lines at: 5).! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:36'!test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:28'!test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:22:46'!test03_01WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	self assert: (Withdraw register: withdrawValue on: account) value equals: withdrawValue 
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:51'!test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:03'!test13PortfolioManagesComposedAccountsAndPortfolios 

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
! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:11:42'!test20_01CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolioTwo

    | account1 account2 account3 complexPortfolio1 complexPortfolio2 |
    
    account1 := ReceptiveAccount new.
    account2 := ReceptiveAccount new.
    account3 := ReceptiveAccount new.    
    complexPortfolio1 := Portfolio with: account1 with: account2.
    complexPortfolio2 := Portfolio with: account3 with: account1.

    self 
        should: [ Portfolio with: complexPortfolio1 with: complexPortfolio2 ]
        raise: Error
        withExceptionDo: [ :invalidPortfolio |
            self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ] ! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:30'!test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: ' account3' = (lines at: 1).
	self assert: '  account2' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: ' complexPortfolio' = (lines at: 4).
	self assert: 'composedPortfolio' = (lines at: 5).
	! !Object subclass: #PortfolioTree	instanceVariableNames: 'lines spaces dictionary'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!PortfolioTree methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:42'!reportPortfolio: aPortfolio	lines add: spaces , (dictionary at: aPortfolio).	spaces := ' ' , spaces.	aPortfolio accounts collect: [ :anAccount | anAccount report: self ].	spaces := spaces allButFirst.! !!PortfolioTree methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:43'!reportReceptiveAccount: aReceptiveAccount lines add: spaces, (dictionary at: aReceptiveAccount).! !!PortfolioTree methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:42'!initializeOf: anAccount namingAccountWith: aDictionary lines := OrderedCollection new. spaces := ''. dictionary := aDictionary. anAccount report: self. ^lines.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!PortfolioTree class	instanceVariableNames: ''!!PortfolioTree class methodsFor: 'as yet unclassified' stamp: 'patosabogal 5/17/2018 14:35'!of: aPortafolio namingAccountWith: aDictionary ^self new initializeOf: aPortafolio namingAccountWith: aDictionary 	! !Object subclass: #ReversePortfolioTree	instanceVariableNames: 'lines spaces dictionary'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!ReversePortfolioTree methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:49'!reportPortfolio: aPortfolio	lines addFirst: spaces , (dictionary at: aPortfolio).	spaces := ' ' , spaces.	aPortfolio accounts collect: [ :anAccount | anAccount report: self ].	spaces := spaces allButFirst! !!ReversePortfolioTree methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:49'!reportReceptiveAccount: aReceptiveAccount	lines addFirst: spaces , (dictionary at: aReceptiveAccount)! !!ReversePortfolioTree methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:44'!initializeOf: anAccount namingAccountWith: aDictionary	lines := OrderedCollection new.	spaces := ''.	dictionary := aDictionary.	anAccount report: self.	^ lines! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ReversePortfolioTree class	instanceVariableNames: ''!!ReversePortfolioTree class methodsFor: 'as yet unclassified' stamp: 'patosabogal 5/17/2018 16:47'!of: aPortafolio namingAccountWith: aDictionary	^ self new initializeOf: aPortafolio namingAccountWith: aDictionary! !Object subclass: #SummarizingAccount	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!balance

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!transactions

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'as yet unclassified' stamp: 'PatricioSabogal 5/14/2018 20:10'!accountSummary	^ self subclassResponsibility 	! !!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!manages: anAccount

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!registers: aTransaction

	self subclassResponsibility ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!SummarizingAccount class	instanceVariableNames: ''!!SummarizingAccount class methodsFor: 'error messages' stamp: 'PatricioSabogal 5/9/2018 18:16'!accountNotManagedMessageDescription	^ 'account not managed.'! !!SummarizingAccount class methodsFor: 'error messages' stamp: 'PatricioSabogal 5/9/2018 18:23'!accountAlreadyManagedErrorMessage	^ 'accounts is already managed.'! !SummarizingAccount subclass: #Portfolio	instanceVariableNames: 'accounts'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:26'!anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount manages: anAccount) or: [ anAccount manages: managedAccount ] ] ! !!Portfolio methodsFor: 'testing' stamp: 'patosabogal 5/17/2018 16:39'!accounts ^accounts! !!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:01'!manages: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !!Portfolio methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 19:20'!registers: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ]  ! !!Portfolio methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 19:27'!transactionsOf: anAccount 

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !!Portfolio methodsFor: 'transactions' stamp: 'patosabogal 5/17/2018 16:43'!report: aVisitor	^ aVisitor reportPortfolio: self! !!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!balance

	^ accounts sum: [ :account | account balance ]
! !!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !!Portfolio methodsFor: 'initialization' stamp: 'PatricioSabogal 5/9/2018 18:38'!initializeWith: account1 with: account2	super initialize.	accounts := OrderedCollection new.	accounts add: account1.	(self manages: account2)		ifTrue: [ self error: 'accounts is already managed.' ].	accounts add: account2! !!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Portfolio class	instanceVariableNames: ''!!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!accountNotManagedMessageDescription
	
	^ 'Account not managed'! !!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !SummarizingAccount subclass: #ReceptiveAccount	instanceVariableNames: 'transactions'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!ReceptiveAccount methodsFor: 'transactions' stamp: 'patosabogal 5/17/2018 16:43'!report: aVisitor	^ aVisitor reportReceptiveAccount: self! !!ReceptiveAccount methodsFor: 'transactions' stamp: 'SA 5/10/2018 19:38:13'!balance

	^ transactions inject: 0 into: [ :balance :transaction |  transaction modifiedBalance: balance ]! !!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!transactions 

	^ transactions copy! !!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!register: aTransaction

	transactions add: aTransaction 
! !!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!manages: anAccount

	^ self = anAccount 
! !!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!registers: aTtransaction

	^ transactions includes: aTtransaction 
! !!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!initialize

	super initialize.
	transactions := OrderedCollection new.! !Object subclass: #Transfer	instanceVariableNames: 'transferWithdraw transferDeposit value'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!Transfer methodsFor: 'accessing' stamp: 'PatricioSabogal 5/14/2018 19:23'!transferDeposit	^ transferDeposit! !!Transfer methodsFor: 'accessing' stamp: 'PatricioSabogal 5/14/2018 19:23'!transferWithdraw	^transferWithdraw ! !!Transfer methodsFor: 'value' stamp: 'SA 5/10/2018 20:01:10'!value

	^ value ! !!Transfer methodsFor: 'registry' stamp: 'PatricioSabogal 5/14/2018 19:59'!initializeRegister: aValue from: anAccount to: anotherAccount	value := aValue.	transferWithdraw := TransferDeposit registerTransfer: self on: anotherAccount.	transferDeposit := TransferWithdraw registerTransfer: self on: anAccount! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Transfer class	instanceVariableNames: ''!!Transfer class methodsFor: 'class initialization' stamp: 'PatricioSabogal 5/14/2018 19:28'!register: aValue from: aReceptiveAccount to: otherReceptiveAccount	^ self new initializeRegister: aValue from: aReceptiveAccount to: otherReceptiveAccount! !AccountTransaction subclass: #TransferDeposit	instanceVariableNames: 'value transfer'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!TransferDeposit methodsFor: 'value' stamp: 'PatricioSabogal 5/14/2018 18:45'!modifiedBalance: aBalance	^ aBalance + value! !!TransferDeposit methodsFor: 'value' stamp: 'PatricioSabogal 5/14/2018 18:46'!value	^value! !!TransferDeposit methodsFor: 'value' stamp: 'PatricioSabogal 5/14/2018 19:35'!initializeFor: aTransfer	value := aTransfer value.	transfer := aTransfer! !!TransferDeposit methodsFor: 'reporting' stamp: 'patosabogal 5/17/2018 16:50'!report: aVisitor	^ aVisitor reportTransferDeposit: self! !!TransferDeposit methodsFor: 'accessing' stamp: 'PatricioSabogal 5/14/2018 18:48'!transfer	^transfer! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!TransferDeposit class	instanceVariableNames: ''!!TransferDeposit class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 19:34'!registerTransfer: aTransfer on: account	| transferDeposit |	transferDeposit := self for: aTransfer.	account register: transferDeposit.	^ transferDeposit! !!TransferDeposit class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 19:35'!for: aTransfer	^ self new initializeFor: aTransfer! !AccountTransaction subclass: #TransferWithdraw	instanceVariableNames: 'value transfer'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!TransferWithdraw methodsFor: 'accessing' stamp: 'PatricioSabogal 5/14/2018 18:49'!value	^ value! !!TransferWithdraw methodsFor: 'value' stamp: 'PatricioSabogal 5/14/2018 18:48'!modifiedBalance: aBalance	^ aBalance - value! !!TransferWithdraw methodsFor: 'value' stamp: 'PatricioSabogal 5/14/2018 18:49'!transfer	^ transfer! !!TransferWithdraw methodsFor: 'initialization' stamp: 'PatricioSabogal 5/14/2018 19:36'!initializeFor: aTransfer	value := aTransfer value.	transfer := aTransfer! !!TransferWithdraw methodsFor: 'reporting' stamp: 'patosabogal 5/17/2018 16:50'!report: aVisitor	^ aVisitor reportTransferWithdraw: self! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!TransferWithdraw class	instanceVariableNames: ''!!TransferWithdraw class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 19:37'!registerTransfer: aTransfer on: account	| transferWithdraw |	transferWithdraw := self for: aTransfer.	account register: transferWithdraw.	^ transferWithdraw! !!TransferWithdraw class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 19:36'!for: aTransfer	^ self new initializeFor:  aTransfer! !AccountTransaction subclass: #Withdraw	instanceVariableNames: 'value'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!Withdraw methodsFor: 'initialization' stamp: 'patosabogal 5/17/2018 16:49'!report: aVisitor	^ aVisitor reportWithdraw: self! !!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!initializeFor: aValue

	value := aValue ! !!Withdraw methodsFor: 'value' stamp: 'SA 5/10/2018 19:39:36'!modifiedBalance: aBalance

	^(aBalance - value)! !!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!value

	^ value ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Withdraw class	instanceVariableNames: ''!!Withdraw class methodsFor: 'instance creation' stamp: 'PatricioSabogal 5/14/2018 19:14'!register: aValue on: account	| withdraw |	withdraw := self for: aValue.	account register: withdraw.	^ withdraw! !!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!for: aValue

	^ self new initializeFor: aValue ! !