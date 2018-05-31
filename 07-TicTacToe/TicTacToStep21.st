!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 19:31:28'!
testIsEmptyWhenGameIsNew
	| game |
	game _ TicTacToe new.
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testNobodyHasWon
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	self deny: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testNobodyWonWhenGameTied
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 2.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 20:12:57'!
testOCannotMoveOnAPositionTakenByX
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 11:10:54'!
testOCannotMoveOnXTurn
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notOTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 20:12:12'!
testOCannotOnPositionTaken
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 3 @ 3.
	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: (game Xs includes: 3 @ 3).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 20:09:41'!
testOCannotPlayWhenGameIsOver
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 1 @ 3.
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Os size.
			self assert: (game Os includes: 2 @ 1).
			self assert: (game Os includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testOHasCompletedDownwardDiagonal
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 1 @ 3.
	self assert: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 19:35:18'!
testTicTacToeContaingXMove
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 19:37:27'!
testTicTacToeContainsXAndOMoves
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self
		assert: 1
		equals: game Os size.
	self assert: (game Os includes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 20:13:42'!
testXCannotMoveOnAPositionTakenByO
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 20:14:05'!
testXCannotPlayOnAPositionTaken
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 19:38:35'!
testXCannotPlayOnOsTurn
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notXTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/28/2018 20:10:10'!
testXCannotPlayWhenGameIsOver
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 3.
	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 3
				equals: game Xs size.
			self assert: (game Xs includes: 2 @ 2).
			self assert: (game Xs includes: 2 @ 1).
			self assert: (game Xs includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testXHasCompletedDownwardDiagonal
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testXHasCompletedFirstColumn
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 1.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testXHasCompletedFirstRow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testXHasCompletedSecondRow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testXHasCompletedThirdRow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testXHasCompletedUpwardDiagonal
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'ps 5/31/2018 10:52:12'!
testXHasWonEvenWhenCompleted
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.! !


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'accesing' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'accesing' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'accesing' stamp: 'ps 5/31/2018 11:24:12'!
markWithOAt: aPosition
	state markWithOAt: aPosition. 
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	os add: aPosition .
	state := XTurn with: self.
	(self hasWin:os) ifTrue: [state := OWon with: self].
	(self isTied) ifTrue: [state := GameTied with: self].	
	! !

!TicTacToe methodsFor: 'accesing' stamp: 'ps 5/31/2018 15:00:33'!
markWithXAt: aPosition
	state markWithXAt: aPosition. 
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	xs add: aPosition .
	state := OTurn with: self.
	(self hasWin: xs) ifTrue: [state := XWon with: self].
	(self isTied) ifTrue: [state := GameTied with: self].	
	! !


!TicTacToe methodsFor: 'testing' stamp: 'jg 5/22/2018 12:51:23'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'testing' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'testing' stamp: 'jg 5/22/2018 12:56:21'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToe methodsFor: 'testing' stamp: 'ps 5/31/2018 10:51:36'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing' stamp: 'ps 5/31/2018 10:52:12'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'testing' stamp: 'jg 5/22/2018 13:01:53'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]


! !

!TicTacToe methodsFor: 'testing' stamp: 'ps 5/30/2018 18:55:43'!
isGameOver
	
	^ state isGameOver! !

!TicTacToe methodsFor: 'testing' stamp: 'ps 5/30/2018 18:55:19'!
isOver
	
	^state isOver.
! !

!TicTacToe methodsFor: 'testing' stamp: 'ps 5/31/2018 10:55:12'!
isTied
	
	^xs size = 5 and: [ os size = 4 and: [ self hasPlayerXWon not ]]  "and: [ self YHasWon not ]]]"
! !


!TicTacToe methodsFor: 'initialization' stamp: 'ps 5/31/2018 11:19:08'!
initialize
	
	xs:= Set new.
	os:= Set new.
	
	state := XTurn with: self.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToStep21!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:46:27'!
notOTurnErrorMessage

	^'Not O turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeState category: #TicTacToStep21!
Object subclass: #TicTacToeState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:38:47'!
hasPlayerOWon
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:39:46'!
hasPlayerXWon
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 15:03:10'!
initializeWith: aTicTacToe
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:39:39'!
isOver
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:39:24'!
isPlayingO
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:39:30'!
isPlayingX
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:40:03'!
isTied
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 16:17:09'!
markWithOAt: aTicTacToe
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 16:17:05'!
markWithXAt: aTicTacToe
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToStep21!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 19:04:44'!
with: aTicTacToe
	self subclassResponsibility! !


!classDefinition: #GameTied category: #TicTacToStep21!
TicTacToeState subclass: #GameTied
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!GameTied methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:55:06'!
hasPlayerOWon
	^false! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:54:43'!
hasPlayerXWon
	^false! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:54:43'!
initializeWith: aTicTacToe
	game := aTicTacToe ! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:54:43'!
isOver
	^true! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:54:43'!
isPlayingO
	^false! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:54:43'!
isPlayingX
	^false! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:54:43'!
markWithOAt: aPosition
	^ self error: self class canNotPlayWhenGameIsOverErrorMessage ! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:54:43'!
markWithXAt: aPosition
	^ self error: self class canNotPlayWhenGameIsOverErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameTied class' category: #TicTacToStep21!
GameTied class
	instanceVariableNames: ''!

!GameTied class methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:09:10'!
with: aTicTacToe
	^self new initializeWith: aTicTacToe ! !


!classDefinition: #OTurn category: #TicTacToStep21!
TicTacToeState subclass: #OTurn
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!OTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:15:15'!
hasPlayerOWon
	^false! !

!OTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:15:15'!
hasPlayerXWon
	^false! !

!OTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:15:15'!
initializeWith: aTicTacToe
 game := aTicTacToe! !

!OTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:15:15'!
isOver
	^false! !

!OTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:15:37'!
isPlayingO
	^true! !

!OTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:15:32'!
isPlayingX
	^false! !

!OTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:25:32'!
markWithOAt: aPosition
! !

!OTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:16:20'!
markWithXAt: aPosition
	self error: game class notXTurnErrorMessage 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OTurn class' category: #TicTacToStep21!
OTurn class
	instanceVariableNames: ''!

!OTurn class methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:15:15'!
with: aTicTacToe

	^ self new initializeWith: aTicTacToe.! !


!classDefinition: #OWon category: #TicTacToStep21!
TicTacToeState subclass: #OWon
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:47:45'!
hasPlayerOWon
	^true! !

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:47:53'!
hasPlayerXWon
	^false! !

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:47:45'!
initializeWith: aTicTacToe
	game := aTicTacToe ! !

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:58:39'!
isGameOver
	^true! !

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:47:45'!
isOver
	^true! !

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:47:45'!
isPlayingO
	^false! !

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:47:45'!
isPlayingX
	^false! !

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:26:08'!
markWithOAt: aPosition
	^ self error: game class canNotPlayWhenGameIsOverErrorMessage ! !

!OWon methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:26:18'!
markWithXAt: aPosition
	^ self error: game class canNotPlayWhenGameIsOverErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OWon class' category: #TicTacToStep21!
OWon class
	instanceVariableNames: ''!

!OWon class methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:17:32'!
with: aTicTacToe
 ^self new initializeWith: aTicTacToe ! !


!classDefinition: #XTurn category: #TicTacToStep21!
TicTacToeState subclass: #XTurn
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!XTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:40:59'!
hasPlayerOWon
	^false! !

!XTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:40:56'!
hasPlayerXWon
	^false! !

!XTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 16:09:31'!
initializeWith: aTicTacToe
 game := aTicTacToe! !

!XTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:40:47'!
isOver
	^false! !

!XTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:40:39'!
isPlayingO
	^false! !

!XTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:40:33'!
isPlayingX
	^true! !

!XTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:16:29'!
markWithOAt: aPosition
	^  self error: game class notOTurnErrorMessage! !

!XTurn methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:24:46'!
markWithXAt: aPosition


	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XTurn class' category: #TicTacToStep21!
XTurn class
	instanceVariableNames: ''!

!XTurn class methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 19:00:43'!
with: aTicTacToe

	^ self new initializeWith: aTicTacToe.! !


!classDefinition: #XWon category: #TicTacToStep21!
TicTacToeState subclass: #XWon
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 10:51:36'!
hasPlayerOWon
	^ false.! !

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 10:52:12'!
hasPlayerXWon
	^ true.! !

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 16:14:52'!
initializeWith: aTicTacToe
	game := aTicTacToe ! !

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/30/2018 18:58:45'!
isGameOver
	^true! !

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:43:41'!
isOver
	^true! !

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:43:01'!
isPlayingO
	^false! !

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/29/2018 18:42:51'!
isPlayingX
	^false! !

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:26:28'!
markWithOAt: aPosition
	^ self error: game class canNotPlayWhenGameIsOverErrorMessage ! !

!XWon methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:26:35'!
markWithXAt: aPosition
	^ self error: game class canNotPlayWhenGameIsOverErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XWon class' category: #TicTacToStep21!
XWon class
	instanceVariableNames: ''!

!XWon class methodsFor: 'as yet unclassified' stamp: 'ps 5/31/2018 11:17:17'!
with: aTicTacToe
	^ self new initializeWith: aTicTacToe ! !
