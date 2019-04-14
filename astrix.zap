
	.SEGMENT "RIVER"


	.FUNCT	ANONF-215:ANY:0:0
	FCLEAR	WEBBA-MAP,DONT-EXAMINE
	RTRUE	


	.FUNCT	ANONF-216:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	EQUAL?	ACTOR,ESHER \?CCL6
	ICALL2	WPRINTD,ACTOR
	PRINTI	" was sent to scout out the various paths, and returned a short while later. ""They all seem to lead up the mountain,"" he said. ""Perhaps it does not matter which one we take."""
	JUMP	?CND4
?CCL6:	ICALL2	WPRINTD,ACTOR
	PRINTI	" went ahead to scout the various paths, and returned a short while later. ""I have not been this far east in my travels,"" he said, ""I sense great danger here; I wish we did not have to guess which path to take up the mountain."""
?CND4:	CRLF	
	CRLF	
	PRINTI	"""I fear that such a powerful Wizard as Astrix would try to defend himself against unwanted visitors,"" Praxix "
	EQUAL?	ACTOR,ESHER \?CCL9
	PRINTI	"countered"
	JUMP	?CND7
?CCL9:	PRINTI	"said, echoing Minar's concerns"
?CND7:	PRINTC	46
	RTRUE	
?CCL3:	EQUAL?	ACTION,LEFT-COMMAND \?CCL11
	CALL2	AM-MOVE,0
	RSTACK	
?CCL11:	EQUAL?	ACTION,RIGHT-COMMAND \?CCL13
	CALL2	AM-MOVE,1
	RSTACK	
?CCL13:	EQUAL?	ACTION,BACK-COMMAND \?CCL15
	CALL2	AM-MOVE,-1
	RSTACK	
?CCL15:	EQUAL?	ACTION,CAST-COMMAND \?CCL17
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL17
	CALL	QSET?,FAR-VISION-SPELL,INCAPACITATED
	ZERO?	STACK \?CCL17
	CALL1	ASTRIX-RESPONDS-TO-FLARE
	RSTACK	
?CCL17:	EQUAL?	ACTION,GIVE-UP-COMMAND \FALSE
	ICALL2	HINT,HINT-WEBBA-MAP
	REMOVE	HINT-AVALANCHE
	REMOVE	HINT-MTN-LION
	CALL1	GIVE-UP-ENDING
	RSTACK	


	.FUNCT	GIVE-UP-ENDING:ANY:0:0
	PRINTI	"I am sad to report that we never did reach Astrix, though we had travelled so far and accomplished so much. It was a sad retreat back to Lavos, and word of our failure spread throughout the land like a winter's gale. The end had come for our journey, and there would be no others."
	CALL1	BAD-ENDING
	RSTACK	


	.FUNCT	AM-MOVE:ANY:1:1,LR
	ICALL	FORCE-TRAVEL-COMMAND,HERE,BACK-COMMAND
	LESS?	LR,0 \?CCL3
	PRINTI	"Unsure of whether our last decision was correct, we backtracked to "
	SHIFT	ASTRIX-MAZE-ROUTE,-1 >ASTRIX-MAZE-ROUTE
	DEC	'ASTRIX-FORK
	EQUAL?	ASTRIX-MAZE-ROUTE,1 \?CCL6
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,BACK-COMMAND,GIVE-UP-COMMAND
	PRINTI	"where all paths began, at the edge of the Great River."
	RTRUE	
?CCL6:	PRINTI	"the previous fork along the path."
	RTRUE	
?CCL3:	SHIFT	ASTRIX-MAZE-ROUTE,1
	ADD	STACK,LR >ASTRIX-MAZE-ROUTE
	INC	'ASTRIX-FORK
	EQUAL?	ASTRIX-MAZE-ROUTE,ASTRIX-MAZE-PATH \?CCL9
	FSET	WEBBA-MAP,DONT-EXAMINE
	CALL1	ARRIVE-AT-ASTRIX-TOWER
	RSTACK	
?CCL9:	GRTR?	ASTRIX-MAZE-ROUTE,63 \?CCL11
	SET	'ASTRIX-MAZE-ROUTE,1
	SET	'ASTRIX-FORK,1
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,BACK-COMMAND,GIVE-UP-COMMAND
	RANDOM	100
	LESS?	50,STACK /?CCL14
	CALL1	AM-LION
	RSTACK	
?CCL14:	CALL1	AM-AVALANCHE
	RSTACK	
?CCL11:	GET	ASTRIX-MAZE-STR-1,ASTRIX-FORK
	PRINT	STACK
	ZERO?	LR \?CCL17
	PRINTI	"left"
	JUMP	?CND15
?CCL17:	PRINTI	"right"
?CND15:	PRINTI	"hand path. "
	GET	ASTRIX-MAZE-STR-2,ASTRIX-FORK
	PRINT	STACK
	RTRUE	


	.FUNCT	AM-LION:ANY:0:0,FIP
	CALL1	SPARE-VICTIM >FIP
	PRINTI	"Our path rose steeply for a short while, but the path ended abruptly. "
	ZERO?	FIP /?CCL3
	ZERO?	ASTRIX-TRAP \?CCL3
	SET	'ASTRIX-TRAP,TRUE-VALUE
	ICALL2	PARTY-REMOVE,FIP
	ICALL2	HINT,HINT-MTN-LION
	PRINTI	"As "
	ICALL2	WPRINTD,FIP
	PRINTI	" began clambering up the rock face, he was struck by a mountain lion, killing him instantly. The lion stood there before us, protecting his kill."
	CALL2	CHECK-ESSENCES,FIRE-SPELL
	ZERO?	STACK /?CCL8
	PRINTI	" Praxix, quickly taking some fire essence from his pouch, cast it upon the lion, engulfing him in flame."
	ICALL2	USE-ESSENCES,FIRE-SPELL
	PRINTI	" We buried poor "
	ICALL2	WPRINTD,FIP
	PRINTI	" there, with Praxix performing the burial ritual. And then,"
	JUMP	?CND1
?CCL8:	PRINTI	"With no magic that might help us retrieve "
	ICALL2	WPRINTD,FIP
	PRINTI	"'s body,"
	JUMP	?CND1
?CCL3:	PRINTI	"""We shall be spending the next week climbing rock,"" Praxix said, ""I suggest trying another path."" I agreed, and"
?CND1:	PRINTI	" we slowly backtracked down the paths we had chosen, thereby reaching our starting point at the base of the mountain."
	RTRUE	


	.FUNCT	AM-AVALANCHE:ANY:0:0,FIP
	PRINTI	"Our chosen path wound its way steeply up the side of the mountain."
	CALL1	SPARE-VICTIM >FIP
	ZERO?	FIP /?CCL3
	ZERO?	ASTRIX-TRAP \?CCL3
	SET	'ASTRIX-TRAP,TRUE-VALUE
	ICALL2	PARTY-REMOVE,FIP
	ICALL2	HINT,HINT-AVALANCHE
	PRINTI	" With no warning, Praxix shouted, ""Down! Rocks!"" but "
	ICALL2	WPRINTD,FIP
	PRINTI	" did not move quickly enough. A large rock struck him on the head, splitting his skull and knocking him off the path, and down into a deep gully."
	CRLF	
	CRLF	
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	CALL2	HAPPENED-QUICKLY,FIP
	RSTACK	
?CCL3:	PRINTI	" I was about to continue when Praxix grabbed me, pulling me out of the path of some large falling rocks. ""Let us try another path,"" he said. And so we made the long descent back to the river to attempt again to find the path to Astrix."
	RTRUE	


	.FUNCT	SPARE-VICTIM:ANY:0:0
	FSET?	MINAR,IN-PARTY \?CCL3
	FSET?	DWARF-MEETING,SEEN \?CCL3
	RETURN	MINAR
?CCL3:	FSET?	ESHER,IN-PARTY \?CCL7
	RETURN	ESHER
?CCL7:	FSET?	BERGON,IN-PARTY \FALSE
	FSET?	DWARF-MEETING,SEEN \FALSE
	FSET?	HIGH-PLAIN,SEEN \FALSE
	RETURN	BERGON


	.FUNCT	HAPPENED-QUICKLY:ANY:1:1,FIP
	PRINTI	"It had happened so quickly, we stood in stunned silence, staring at the place where "
	ICALL2	WPRINTD,FIP
	PRINTI	" had met his end. ""We have come so far; this is a tragic blow!"" Praxix said, then performed a brief burial ritual. We descended all of the way back to our starting point at the river, but no words were spoken."
	RTRUE	


	.FUNCT	ARRIVE-AT-ASTRIX-TOWER:ANY:0:0,CNT,STN
	CALL1	STONE-COUNT >CNT
	SET	'2ND-PASS,TRUE-VALUE
	IN?	HERMIT-POWDER,INVENTORY \?CND1
	FSET	HERMIT-POWDER,INCAPACITATED
?CND1:	ICALL2	GRAPHIC,G-ASTRIX
	PRINTI	"For six long hours, we continued to climb steeply up the side of the Sunrise Mountain, and thus we came to the high tower of Astrix, the Wizard. No sooner had we arrived, than the tower's massive oak door opened."
	CRLF	
	CRLF	
	PRINTI	"""I have been following your progress with great interest,"" the Wizard said, stroking his stringy gray beard. ""You are a very resourceful group, that is certain!"""
	CRLF	
	CRLF	
	PRINTI	"His voice then became dark. ""The question is: Have you mettle enough to make siege on the "
	PRINT	BAD-GUY
	PRINTI	" himself?"" And then, smiling, the darkness fell from his voice, and he answered his own question, ""We shall see, I suppose; we shall see."""
	CRLF	
	CRLF	
	PRINTI	"Leading us to his hearth, he sat us in a semi-circle around the blazing fire and spoke. ""There is a story I must tell, a story of Seven Stones. Created in a time lost to living memory, these Stones contained the very strength and essence of our world. Of the Seven, Four were entrusted to the races of men who could use them best: Elves, Dwarves, Nymphs, and Wizards."""
	CRLF	
	CRLF	
	PRINTI	"""These are the Four: the Elf Stone, green as the forests of old, and the Dwarf Stone, brown as the caverns of Forn a-klamen; the Nymph Stone, blue as the deep waters of M'nera, and the Wizard Stone, red as the dark fire of Serdi."""
	CRLF	
	CRLF	
	PRINTI	"""The four races are now sundered, and the Four have long been kept apart, but now, with the "
	PRINT	BAD-GUY
	PRINTI	" rearing his misshapen head in our lands, we must bring them together again. For with them, we can hope to find the Two, and then, finally, the One with whose help we can destroy all Evil."""
	CRLF	
	CRLF	
	PRINTI	"""For it is told that having the Four, it is possible to find the Two; so, also, do the Two give witness to their master, the One that in elder days was called the Anvil!"""
	CRLF	
	CRLF	
	GRTR?	CNT,0 \?CND3
	PRINTI	"""Do they look anything like this?"" I asked, sheepishly, holding up the "
	CALL1	FIRST-STONE >STN
	ICALL2	WPRINTD,STN
	PRINTI	" to Astrix' view."
	CRLF	
	CRLF	
	PRINTI	"""You are too modest,"" he said, grinning widely, ""Yes, this is the "
	CALL2	STONE-NAME,STN
	PRINT	STACK
	PRINTI	"."""
	CRLF	
	CRLF	
?CND3:	GRTR?	CNT,1 \?CND5
	PRINTI	"""Oh,"" I said. ""And th"
	EQUAL?	CNT,2 \?CCL9
	PRINTI	"is"
	JUMP	?CND7
?CCL9:	PRINTI	"ese"
?CND7:	PRINTI	"...?"""
	CRLF	
	CRLF	
	PRINTI	"""Indeed, you have been busy,"" Astrix said, taking the stones, and slapping me heartily on the back."
	CRLF	
	CRLF	
?CND5:	SET	'PASS-1-STONES,CNT
	EQUAL?	CNT,3 \?CND10
	ICALL1	ASTRIX-SHOWS-STONE
	RTRUE	
?CND10:	IN?	NYMPH-STONE,INVENTORY \?CND12
	REMOVE	NYMPH-STONE
?CND12:	IN?	DWARF-STONE,INVENTORY \?CND14
	REMOVE	DWARF-STONE
?CND14:	IN?	ELF-STONE,INVENTORY \?CND16
	REMOVE	ELF-STONE
?CND16:	FSET?	DWARF-MEETING,SEEN /?CCL20
	PRINTI	"Astrix sat in deep thought, then spoke again. ""I am certain the Dwarves who still walk the dark caverns can be of help to us. I know of a gate...,"" Astrix said, and he proceeded to tell us where we might find entrance to the Dwarves' kingdom."
	CRLF	
	CRLF	
	PRINTI	"We trekked for five days until we reached the spot Astrix had sent us to; ironically, we were not far from the fork at Lavos where we had started our journey."
	ICALL2	NEXT-DAY,5
	FSET?	CANYON-GATE,SCOUTED \?CCL23
	ICALL	TRAVEL-COMMANDS,CANYON-GATE,ENTER-COMMAND
	JUMP	?CND21
?CCL23:	ICALL2	TRAVEL-COMMANDS,CANYON-GATE
?CND21:	CALL2	MOVE-TO,CANYON-GATE
	RSTACK	
?CCL20:	FSET?	HIGH-PLAIN,SEEN /?CCL25
	PRINTI	"""There is a place,"" Astrix began, ""a place high in the mountains where we may find help in our cause."" He gave us directions, and sent us on our way."
	CRLF	
	CRLF	
	PRINTI	"We trekked for three days until we reached the high plain to which Astrix had sent us. Below, a large, clear lake sat in a bowl in the mountains."
	ICALL2	NEXT-DAY,3
	CALL2	MOVE-TO,HIGH-PLAIN
	RSTACK	
?CCL25:	CALL2	RETURN-TO-ASTRIX-TOWER,TRUE-VALUE
	RSTACK	


	.FUNCT	STONE-COUNT:ANY:0:0,OBJ,CNT
	FIRST?	INVENTORY >OBJ /?PRG2
?PRG2:	ZERO?	OBJ \?CCL6
	RETURN	CNT
?CCL6:	EQUAL?	OBJ,DWARF-STONE,ELF-STONE,NYMPH-STONE \?CND4
	INC	'CNT
?CND4:	NEXT?	OBJ >OBJ /?PRG2
	JUMP	?PRG2


	.FUNCT	STONE-NAME:ANY:1:1,STN
	GETP	STN,P?STONE-NAME
	RSTACK	


	.FUNCT	FIRST-STONE:ANY:0:0,OBJ
	FIRST?	INVENTORY >OBJ /?PRG2
?PRG2:	ZERO?	OBJ /FALSE
	EQUAL?	OBJ,DWARF-STONE,ELF-STONE,NYMPH-STONE \?CND4
	RETURN	OBJ
?CND4:	NEXT?	OBJ >OBJ /?PRG2
	JUMP	?PRG2

	.ENDSEG

	.ENDI
