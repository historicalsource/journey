
	.SEGMENT "0"


	.FUNCT	SKIP-BITE-FOREST:ANY:0:0
	CRLF	
	CRLF	
	PRINTI	"The warm afternoon air lifted our hearts, and we were soon marching eastward again through the towering forest. Before long, we came upon the shore of a great river."
	CRLF	
	CRLF	
	PRINTI	"""We are nearly there,"" Praxix said, gazing ahead at the Sunset Mountain and the mysterious tower that stood precariously atop it."
	CALL2	MOVE-TO,RIVER-2
	RSTACK	


	.FUNCT	MASSAGE-ELVISH:ANY:1:1,MAX,TOFF,IOFF,CHR
	SET	'IOFF,2
?PRG1:	DLESS?	'MAX,0 \?CCL5
	SUB	IOFF,2
	PUTB	E-INBUF,1,STACK
	RTRUE	
?CCL5:	GETB	E-TEMP,TOFF >CHR
	EQUAL?	CHR,39 /?CND6
	LESS?	CHR,65 /?CCL11
	GRTR?	CHR,90 /?CCL11
	ADD	CHR,32 >CHR
	JUMP	?CND9
?CCL11:	EQUAL?	CHR,45,44 \?CND9
	SET	'CHR,32
?CND9:	PUTB	E-INBUF,IOFF,CHR
	ZERO?	TOFF \?CND15
	LESS?	CHR,97 /?CND15
	GRTR?	CHR,122 /?CND15
	SUB	CHR,32 >CHR
?CND15:	PUTB	E-TEMP,TOFF,CHR
	INC	'IOFF
?CND6:	INC	'TOFF
	JUMP	?PRG1


	.FUNCT	READ-ELVISH:ANY:0:1,ACT,OFF,CHR,LN,COL,TBL,CNT,MAX,FG,BG,POS,OLD-X,MAX-X,CUR-X,?TMP1
	ASSIGNED?	'ACT /?CND1
	SET	'ACT,TAG
?CND1:	SET	'COL,COMMAND-OBJECT-COLUMN
	SET	'MAX-X,1000
	ICALL1	TURN-ON-CURSOR
	ICALL1	CLEAR-FIELDS
	PUTB	E-LEXV,0,20
	PUTB	E-INBUF,0,50
	ZERO?	FWC-FLAG \?CND3
	GET	0,17 >?TMP1
	CALL2	TEXT-WIDTH,STR?210
	SUB	?TMP1,STACK >MAX-X
?CND3:	SUB	SCREEN-WIDTH,COMMAND-OBJECT-COLUMN
	SUB	STACK,2 >MAX
	ICALL2	SELECT-SCREEN,COMMAND-WINDOW
	CALL2	PARTY-PCM,ACT
	ADD	COMMAND-START-LINE,STACK
	SUB	STACK,1 >LN
	ICALL	GCURSET,LN,CHR-COMMAND-COLUMN
	PRINTI	"says..."
	ZERO?	FWC-FLAG \?CND5
	WINGET	-3,11 >FG
	SHIFT	FG,-8 >BG
	BAND	FG,255 >FG
?CND5:	ICALL	GCURSET,LN,COL
	ZERO?	FWC-FLAG \?PRG10
	CURGET	CURGET-TABLE
	GET	CURGET-TABLE,1 >POS
	SET	'CUR-X,POS
	COLOR	BG,FG
	ERASE	COMMAND-WIDTH-PIX
	JUMP	?CND7
?PRG10:	IGRTR?	'CNT,MAX /?REP11
	PRINTC	95
	JUMP	?PRG10
?REP11:	ICALL	GCURSET,LN,COL
?CND7:	SET	'TBL,E-TEMP
?PRG15:	INPUT	1 >CHR
	EQUAL?	CHR,13 \?CCL19
	ZERO?	FWC-FLAG \?CND20
	COLOR	FG,BG
	CALL	GPOS,LN,CHRV
	CURSET	STACK,RIGHT-COLUMN-LEFT-EDGE
	ERASE	RIGHT-COLUMN-WIDTH
?CND20:	SUB	COMMAND-START-LINE,1
	ICALL2	REFRESH-CHARACTER-COMMAND-AREA,STACK
	ICALL1	TURN-OFF-CURSOR
	SET	'UPDATE-FLAG,TRUE-VALUE
	ICALL2	SELECT-SCREEN,TEXT-WINDOW
	ZERO?	OFF /FALSE
	ICALL2	MASSAGE-ELVISH,OFF
	SET	'E-TEMP-LEN,OFF
	LEX	E-INBUF,E-LEXV
	GETB	E-LEXV,1
	ZERO?	STACK /FALSE
	EQUAL?	ACT,PRAXIX,BERGON /TRUE
	ICALL1	PARSE-ELVISH
	RTRUE	
?CCL19:	EQUAL?	CHR,DELETE-KEY,BACK-SPACE,LEFT-ARROW \?CCL31
	ZERO?	OFF \?CCL34
	SOUND	1
	JUMP	?PRG15
?CCL34:	ZERO?	FWC-FLAG \?CCL36
	DEC	'OFF
	ZERO?	OFF \?CCL39
	CALL	GPOS,LN,CHRV
	CURSET	STACK,POS
	SET	'CUR-X,POS
	ERASE	COMMAND-WIDTH-PIX
	JUMP	?PRG15
?CCL39:	DIROUT	3,CENTER-TABLE
	PRINTT	TBL,OFF
	DIROUT	-3
	GET	0,24
	ADD	POS,STACK >OLD-X
	CALL	GPOS,LN,CHRV
	CURSET	STACK,OLD-X
	SUB	CUR-X,OLD-X
	GRTR?	STACK,1 /?CCL42
	ERASE	2
	JUMP	?CND40
?CCL42:	SUB	CUR-X,OLD-X
	ERASE	STACK
?CND40:	SET	'CUR-X,OLD-X
	JUMP	?PRG15
?CCL36:	ICALL	GCURSET,LN,COL
	PRINTC	95
	DEC	'COL
	ICALL	GCURSET,LN,COL
	PRINTC	95
	DEC	'OFF
	ICALL	GCURSET,LN,COL
	JUMP	?PRG15
?CCL31:	EQUAL?	OFF,MAX /?CCL44
	CALL2	BAD-ELVISH-CHARACTER?,CHR
	ZERO?	STACK \?CCL44
	ZERO?	FWC-FLAG \?CND43
	LESS?	CUR-X,MAX-X /?CND43
?CCL44:	SOUND	1
	JUMP	?PRG15
?CND43:	PRINTC	CHR
	PUTB	TBL,OFF,CHR
	INC	'OFF
	ZERO?	FWC-FLAG /?CCL52
	INC	'COL
	ICALL	GCURSET,LN,COL
	JUMP	?PRG15
?CCL52:	CURGET	CURGET-TABLE
	GET	CURGET-TABLE,1 >CUR-X
	JUMP	?PRG15


	.FUNCT	BAD-ELVISH-CHARACTER?:ANY:1:1,CHR
	LESS?	CHR,65 /?CCL3
	GRTR?	CHR,90 \FALSE
?CCL3:	LESS?	CHR,97 /?CCL7
	GRTR?	CHR,122 \FALSE
?CCL7:	EQUAL?	CHR,32,39,45 /FALSE
	EQUAL?	CHR,46,44,63 /FALSE
	RTRUE	


	.FUNCT	MAKE-TAG-SUBGROUP:ANY:0:1,STO
	ICALL2	MAKE-SUBGROUP,TAG
	ZERO?	STO /?CND1
	ICALL1	SAVE-TAG-OBJECTS
?CND1:	CALL	TRAVEL-COMMANDS,TAG,EXAMINE-COMMAND
	RSTACK	


	.FUNCT	RESTORE-TAG-OBJECTS:ANY:0:0
	ICALL	REMOVE-ALL,SAVED-TAG-OBJECTS,INVENTORY
	LOC	TORCH
	ZERO?	STACK /TRUE
	ICALL2	UPDATE-REMOVE,TORCH
	RTRUE	


	.FUNCT	SAVE-TAG-OBJECTS:ANY:0:0
	CALL	REMOVE-ALL,INVENTORY,SAVED-TAG-OBJECTS
	RSTACK	


	.FUNCT	RESTORE-TAG-COMMANDS:ANY:0:0
	CALL	TRAVEL-COMMANDS,TAG,PICK-UP-COMMAND,DROP-COMMAND,INVENTORY-COMMAND
	RSTACK	


	.FUNCT	N-DAY-TREK:ANY:1:1,NUM
	ICALL2	NEXT-DAY,NUM
	PRINTI	"The next morning, we started the long trek back to Astrix' Tower, and I'm happy to report that we arrived there "
	EQUAL?	NUM,1 \?CCL3
	PRINTI	"the next day"
	JUMP	?CND1
?CCL3:	GET	INT-STR,NUM
	PRINT	STACK
	PRINTI	" days later"
?CND1:	PRINTI	" without serious incident."
	CRLF	
	CRLF	
	CALL1	RETURN-TO-ASTRIX-TOWER
	RSTACK	


	.FUNCT	RETURN-TO-ASTRIX-TOWER:ANY:0:1,FAIL,CNT
	CALL1	STONE-COUNT
	ADD	PASS-1-STONES,STACK >CNT
	ICALL2	GRAPHIC,G-ASTRIX
	ZERO?	FAIL /?CCL3
	PRINTI	"Astrix now looked grave."
	JUMP	?CND1
?CCL3:	FSET?	STAIR-BOTTOM,SEEN \?CND1
	PRINTI	"Astrix greeted us heartily when we returned. ""How has your journey gone? What news have you found?"" he asked."
	GRTR?	CNT,PASS-1-STONES \?CCL7
	CRLF	
	CRLF	
	PRINTI	"We told him of our doings, and showed him the stone"
	SUB	CNT,PASS-1-STONES
	GRTR?	STACK,1 \?CND8
	PRINTC	115
?CND8:	PRINTI	" we had obtained."
	CRLF	
	CRLF	
	EQUAL?	CNT,3 \?CCL12
	ICALL1	ASTRIX-SHOWS-STONE
	RTRUE	
?CCL12:	PRINTI	" ""This is good,"" he said, but he looked disappointed."
	JUMP	?CND1
?CCL7:	CRLF	
	CRLF	
	PRINTI	"We told Astrix of our adventures, but he was evidently disappointed."
?CND1:	PRINTI	" ""I am afraid we will need the three Stones,"" he said, ""if we are to defeat the Enemy."""
	CRLF	
	CRLF	
	PRINTI	"""Three stones?"" I said, quizzically, ""You said there were four Sisters?"""
	CRLF	
	CRLF	
	PRINTI	"""And so there are,"" Astrix said, holding out a fiery red stone. ""This is the Wizard Stone! I had hoped it would be of use in our war against the "
	PRINT	BAD-GUY
	PRINTI	"."""
	CRLF	
	CRLF	
	CALL1	PART-ONE-BAD-ENDING
	RSTACK	


	.FUNCT	PART-ONE-BAD-ENDING:ANY:0:1,ONE?
	PRINTI	"""I fear we are now without hope."
	ZERO?	ONE? /?CND1
	PRINTI	" The Anvil is beyond our grasp!"
?CND1:	PRINTI	" Get back to your lands that you may join your families before the Storm arrives!"""
	CRLF	
	CRLF	
	PRINTI	"And then, from the north, came a mocking laugh carried on an icy wind. We covered our ears, but Astrix ran to his high balcony and cursed the "
	PRINT	BAD-GUY
	PRINTI	" in the languages of old. But the laugh was not stilled; and Astrix, overcome by a great madness, leapt from his great tower and plunged to his death...."
	ICALL2	GRAPHIC,G-ASTRIX-LEAPS
	CALL1	BAD-ENDING
	RSTACK	


	.FUNCT	ENDING:ANY:0:0
	PRINTI	"[The End]"
	CRLF	
	ICALL1	CLEAR-SUBGROUP
	ICALL	UPDATE-FCLEAR,TAG,SHADOW
	SET	'SUBGROUP-MODE,TRUE-VALUE
	CALL2	MOVE-TO,ENDING-ROOM
	RSTACK	


	.FUNCT	ANONF-4:ANY:0:0
	ZERO?	GAME-WON? \?CND1
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,GAME-COMMAND
?CND1:	ZERO?	GAME-WON? \FALSE
	FIRST?	HINTS /FALSE
	CALL	REMOVE-TRAVEL-COMMAND,HERE,MUSINGS-COMMAND
	RSTACK	


	.FUNCT	ANONF-5:ANY:0:0
	EQUAL?	ACTION,RESTORE-COMMAND \FALSE
	CALL2	V-RESTORE,FALSE-VALUE
	RSTACK	


	.FUNCT	KILLED-OFF:ANY:1:1,CHR,TMP
	ICALL2	PARTY-REMOVE,CHR
	CALL	ADD-TO-LTABLE,KILLED-TBL,CHR
	RSTACK	


	.FUNCT	ASTRIX-SHOWS-STONE:ANY:0:0
	ICALL	GRAPHIC,FALSE-VALUE,G-FOUR-STONES,BOTTOM-LEFT
	ICALL	UPDATE-FCLEAR,WEBBA-MAP,DONT-DROP
	PRINTI	"As Astrix took the three stones, it seemed they were bathed in a warm red light, as if from a glowing ember. ""I have some surprises of my own,"" he said, and revealed to us the glowing Wizard Stone, which he had long possessed. ""It is beautiful, is it not, "
	ICALL1	WPRINTTAG
	PRINTI	"? Not since the day it was cut from the living earth has such a sight been witnessed!"""
	CRLF	
	CRLF	
	GRTR?	PARTY-MAX,3 \?CCL3
	FSET?	BERGON,IN-PARTY \?CCL3
	PRINTI	"Astrix turned silent and stared into the glowing Stones. When, at last, the trance was broken, he spoke again. ""The Two are revealed to me; one lies deep within the earth, the other in an Elvish place - very old, and long forgotten. More than that, I cannot say."""
	CRLF	
	CRLF	
	EQUAL?	PARTY-MAX,5 \?CND6
	ICALL2	PARTY-REMOVE,MINAR
	PRINTI	"Minar now spoke. ""I am grateful that you have allowed me to journey with you to this place,"" he began, ""but I must return now to the plains, for there is much to be done. At the least, I shall report to the people on your safe arrival at the Sunrise Tower! Good luck to you all; perhaps our paths shall cross again."" And, though we tried to persuade him otherwise, Minar turned and left Astrix' high tower and started on the lonely road toward home."
	CRLF	
	CRLF	
?CND6:	CALL1	START-PART-TWO
	RSTACK	
?CCL3:	PRINTI	"""Yes, you have all done well, but perhaps not well enough, for you have lost enough of your party that the search for the remaining Stones is pointless. For it is told in Legend that Five shall unite the Six Stones which shall lead them to the Anvil."""
	CRLF	
	CRLF	
	CALL1	PART-ONE-BAD-ENDING
	RSTACK	


	.FUNCT	BAD-ENDING:ANY:0:0
	ICALL1	DIVIDER
	PRINT	I-SIT-ALONE
	CRLF	
	CRLF	
	CALL1	ENDING
	RSTACK	


	.FUNCT	PART-TWO-TOO-FEW:ANY:0:0
	PRINTI	"Only Praxix and I were left, and our only consolation was that the terrain was familiar; we were only a few miles below the falls we had seen earlier on our journey, not far from the Sunrise Mountain. And so we returned to Astrix; his face was grim."
	IN?	SPIRIT-STONE,INVENTORY \?CND1
	CRLF	
	CRLF	
	PRINTI	"""It is good that you have found the fifth Stone, but your party has been devastated,"" he said. "
?CND1:	CALL1	PART-ONE-BAD-ENDING
	RSTACK	


	.FUNCT	PART-TWO-ENDING:ANY:0:0
	ICALL2	GRAPHIC,G-ASTRIX
	CRLF	
	CRLF	
	PRINTI	"Astrix, pleased at our return, sat impassively as we gave a detailed account of our adventures. When we finished, he expressed his "
	IN?	SPIRIT-STONE,INVENTORY \?CCL3
	IN?	SIXTH-STONE,INVENTORY \?CCL3
	PRINTI	"delight that we had found the Two stones."
	CRLF	
	CRLF	
	LESS?	PARTY-MAX,5 \?CCL8
	PRINTI	"""But this is not enough,"" Astrix said. ""The last stone, the Anvil, will be the most difficult to obtain, and the Legend says that the Five shall, having united the Six Stones, be led to the Anvil. Alas that you have come so far only to be defeated at the end!"""
	CRLF	
	CRLF	
	CALL2	PART-ONE-BAD-ENDING,TRUE-VALUE
	RSTACK	
?CCL8:	PRINTI	"""I believe, for the first time, that we may be able to end the Darkness that comes from the north,"" Astrix said. ""The Sisters we have, and the Two; one last task awaits you!"""
	CRLF	
	CRLF	
	CALL2	MOVE-TO,THREE-CONNECTOR
	RSTACK	
?CCL3:	PRINTI	"disappointment that we had not fared better."
	CRLF	
	CRLF	
	IN?	SPIRIT-STONE,INVENTORY /?CTR10
	IN?	SIXTH-STONE,INVENTORY \?CCL11
?CTR10:	PRINTI	"""You have done well to find even one of the Two, but I fear it is not"
	JUMP	?CND9
?CCL11:	PRINTI	"""You have failed in bringing back the Two; even had you brought one of them, I fear it would not be"
?CND9:	PRINTI	" enough,"" Astrix said. "
	CALL1	PART-ONE-BAD-ENDING
	RSTACK	


	.FUNCT	TELL-WITH-COMMAS:ANY:1:1,TBL,CNT,OFF,OBJ
	GET	TBL,0 >CNT
	SET	'OFF,1
?PRG1:	PRINTC	32
	GET	TBL,OFF >OBJ
	ICALL2	WPRINTD,OBJ
	EQUAL?	CNT,1 /TRUE
	EQUAL?	CNT,2 \?CCL7
	PRINTI	" and"
	JUMP	?CND3
?CCL7:	PRINTC	44
?CND3:	DEC	'CNT
	INC	'OFF
	JUMP	?PRG1

	.ENDSEG

	.ENDI
