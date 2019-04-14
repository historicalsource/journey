
	.SEGMENT "MINES"


	.FUNCT	ANONF-259:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ZERO?	TRAPPED-IN-HOLE /?CCL6
	ICALL2	WPRINTD,ACTOR
	PRINTI	" stood at the edge of the broken rock, and peered down at "
	ICALL2	WPRINTD,TRAPPED-IN-HOLE
	PRINTI	". ""Don't worry,"" he said, ""I shall think of something."""
	RTRUE	
?CCL6:	ICALL2	WPRINTD,ACTOR
	PRINTI	" picked up a small stone, and dropped it through the crack. A long second later, it hit the surface below."
	CRLF	
	CRLF	
	PRINTI	"Doing some simple calculations in my head, I came up with an estimate of the drop. ""I'd say at least twenty feet, perhaps more,"" I said. ""Our rope might be long enough to lower someone down there."""
	RTRUE	


	.FUNCT	HURTH-SCRAMBLES-UP:ANY:0:0
	PRINTI	"Although the prospects for success appeared dim to us non-Dwarves, Hurth now began to scramble up the sheer rock walls with much the same agility as a mountain goat. Finding handholds and footholds where there appeared to be none, Hurth finally managed to extricate himself from the hole."
	CRLF	
	CRLF	
	PRINTI	"""We Dwarves are used to this sort of thing,"" he said modestly. ""I have not lived my entire life in these caverns without learning something about rocks."""
	RTRUE	


	.FUNCT	ANONF-260:ANY:0:0,TMP
?FCN:	EQUAL?	ACTION,LOOK-AROUND-COMMAND \?CCL3
	FSET	HERE,TRIED
	EQUAL?	ACTOR,PRAXIX \?CCL6
	FSET?	HERE,SCOUTED \?CCL9
	ICALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND
	JUMP	?CND7
?CCL9:	ICALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,CLIMB-UP-COMMAND
?CND7:	PRINTI	"Despite the pain, Praxix explored his environs, but the pain in his leg made exploring difficult. Before long, Praxix was forced to cut short his activity. ""I am sorry,"" he reported, ""but I have explored the best I can, and have found nothing here but some broken stones and dirt."""
	RTRUE	
?CCL6:	SET	'TMP,ACTOR
	ICALL	UPDATE-MOVE,IRON-KEY,INVENTORY
	ICALL1	PRINT-CHARACTER-COMMANDS
	ICALL	TRAVEL-COMMANDS,TMP,CLIMB-UP-COMMAND
	ICALL	GRAPHIC,FALSE-VALUE,G-MINE-FIND,TOP-LEFT
	PRINTI	"""Time to do some exploring,"" "
	ICALL2	WPRINTD,TMP
	PRINTI	" said. Then, leaving "
	CALL2	MY/OUR,2
	PRINT	STACK
	PRINTI	" view, "
	ICALL2	WPRINTD,TMP
	PRINTI	" spent a seeming eternity scouting out his surroundings. When he again became visible, "
	CALL2	I/EACH,2
	PRINT	STACK
	PRINTI	" breathed a sigh of relief."
	CRLF	
	CRLF	
	PRINTI	"""I've found a friend,"" he said, smiling, ""an old friend!"" He held up to "
	CALL2	MY/OUR,2
	PRINT	STACK
	PRINTI	" view a decayed human skull. ""Quite the worse for wear. I would say he's been here quite a few years. Found this alongside,"" he said, tossing up an iron key. ""Nothing else here, I'm afraid."""
	CRLF	
	CRLF	
	FSET?	BERGON,IN-PARTY \?CND10
	PRINTI	"""What do you think?"" Bergon asked, holding up the key."
	CRLF	
	CRLF	
?CND10:	PRINTI	"""Perhaps he dropped the key, then went in after it and got trapped,"" I suggested."
	EQUAL?	TMP,PRAXIX,HURTH /FALSE
	SET	'TRAPPED-IN-HOLE,TMP
	PUTP	MINE-HOLE-CRACK,P?EXBITS,PRAXIXBIT
	CRLF	
	CRLF	
	PRINTI	"""I don't mean to be rude, but has anyone figured out how I'm to get out of here?"" "
	ICALL2	WPRINTD,TMP
	PRINTI	" asked anxiously. In fact, we had not."
	RTRUE	
?CCL3:	EQUAL?	ACTION,CLIMB-UP-COMMAND \?CCL16
	FSET	HERE,SCOUTED
	EQUAL?	ACTOR,HURTH \?CCL19
	ICALL1	HURTH-SCRAMBLES-UP
	PUTP	HERE,P?TEMP,0
	ICALL2	RESTORE-TRAVEL-COMMANDS,HURTH
	SET	'UPDATE-FLAG,TRUE-VALUE
	RETURN	UPDATE-FLAG
?CCL19:	EQUAL?	ACTOR,PRAXIX \?CCL21
	ICALL2	WPRINTD,ACTOR
	PRINTI	" surveyed the situation, and quickly came to the realization that he was far too frail to attempt to climb the near-vertical sheets of rock that separated him from the chamber above."
	FSET?	HERE,TRIED \?CCL24
	CALL	TRAVEL-COMMANDS,ACTOR,CAST-COMMAND
	RSTACK	
?CCL24:	CALL	TRAVEL-COMMANDS,ACTOR,CAST-COMMAND,LOOK-AROUND-COMMAND
	RSTACK	
?CCL21:	ICALL2	WPRINTD,ACTOR
	PRINTI	" now began a pitiable attempt to scale the near-vertical sheets of rock that separated him from the chamber above. But the attempt was futile; there would be no simple way of extricating "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" from the hole he had gotten himself into."
	CALL2	TRAVEL-COMMANDS,ACTOR
	RSTACK	
?CCL16:	EQUAL?	ACTION,CAST-COMMAND \?CCL26
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL26
	GETP	HERE,P?TEMP >TMP
	ZERO?	TMP /?CCL26
	EQUAL?	TMP,PRAXIX \?CCL32
	PUTP	HERE,P?TEMP,0
	ICALL2	RESTORE-TRAVEL-COMMANDS,PRAXIX
	PRINTI	"Having assured himself that there was nothing further of interest there, Praxix had us throw down his pouch, after which he cast a spell of elevation on himself, lifting him out of the hole."
	RTRUE	
?CCL32:	PRINTI	"Praxix removed the proper essences from his pouch, and cast them through the hole toward the floor below. But the spell would not work over such distances; "
	ICALL2	WPRINTD,TMP
	PRINTI	" rose but a foot, then returned to where he had stood."
	CRLF	
	CRLF	
	PRINTI	"""I feared it would be so,"" he said. ""I do not know how we shall retrieve him now."""
	RTRUE	
?CCL26:	EQUAL?	ACTION,CAST-COMMAND \?CCL34
	GETP	HERE,P?TEMP
	EQUAL?	STACK,PRAXIX \?CCL34
	ICALL1	UNUSE-ESSENCES
	PRINTI	"This was no time for games, but Praxix later confided in me that he had thought to try out his """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell; he didn't, of course, for it would have been more an embarrassment than anything else."
	RTRUE	
?CCL34:	EQUAL?	ACTION,BACK-COMMAND \?CCL38
	IN?	IRON-KEY,INVENTORY /?CCL40
	ZERO?	HOLE-VICTIM /?CND39
?CCL40:	ICALL	REMOVE-TRAVEL-COMMAND,GATE-JUNCTION,CRUDE-PATH-COMMAND
?CND39:	ZERO?	HOLE-VICTIM /?CCL45
	PRINTI	"Certain that "
	ICALL2	WPRINTD,HOLE-VICTIM
	PRINTI	" was dead, and not wishing to endanger the rest of our party, we reluctantly decided to leave him behind. No words were spoken as we quietly shuffled out of the chamber and into the vestibule that lay outside."
	ICALL2	MOVE-TO,GATE-JUNCTION
	RTRUE	
?CCL45:	GETP	HERE,P?TEMP >TMP
	ZERO?	TMP /?CCL47
	EQUAL?	TMP,PRAXIX \?CCL47
	CALL2	CHECK-ESSENCES,LEVITATE-SPELL
	ZERO?	STACK /?CCL47
	PUTP	HERE,P?TEMP,FALSE-VALUE
	ICALL2	USE-ESSENCES,LEVITATE-SPELL
	ICALL2	RESTORE-TRAVEL-COMMANDS,PRAXIX
	ICALL	REMOVE-TRAVEL-COMMAND,GATE-JUNCTION,CRUDE-PATH-COMMAND
	CALL	I/WE,2,TRUE-VALUE
	PRINT	STACK
	PRINTI	" started to leave, almost forgetting about "
	CALL1	MY/OUR
	PRINT	STACK
	PRINTI	" friend in the hole below "
	CALL1	MY/OUR
	PRINT	STACK
	PRINTI	" feet. ""Hey! What about me?"" he said, quickly rustling up an elevation spell and rising back out of the hole."
	CRLF	
	CRLF	
	JUMP	?CND43
?CCL47:	EQUAL?	TMP,HURTH \?CCL52
	PUTP	HERE,P?TEMP,FALSE-VALUE
	ICALL1	HURTH-SCRAMBLES-UP
	ICALL2	RESTORE-TRAVEL-COMMANDS,HURTH
	ICALL	REMOVE-TRAVEL-COMMAND,GATE-JUNCTION,CRUDE-PATH-COMMAND
	CRLF	
	CRLF	
	JUMP	?CND43
?CCL52:	ZERO?	TMP /?CND43
	SET	'HOLE-VICTIM,TMP
	ICALL2	KILLED-OFF,TMP
	PRINTI	"Seeing no reasonable alternative, "
	CALL1	I/WE
	PRINT	STACK
	PRINTI	" decided to leave the chamber with "
	ICALL2	WPRINTD,TMP
	PRINTI	" still trapped inside the darkened hole."
	CRLF	
	CRLF	
	PRINTI	"""Hurry!"" "
	ICALL2	WPRINTD,TMP
	PRINTI	" pleaded. ""I do not wish to become too friendly with my roommate here, if you know what I mean!"""
	CRLF	
	CRLF	
	PRINTI	"As "
	CALL1	I/WE
	PRINT	STACK
	PRINTI	" prepared to leave, "
	ICALL2	WPRINTD,HOLE-VICTIM
	PRINTI	" screamed loudly, and "
	CALL1	I/WE
	PRINT	STACK
	PRINTI	" heard nothing further from within the hole. In all likelyhood, "
	ICALL2	WPRINTD,HOLE-VICTIM
	PRINTI	" was dead. "
	EQUAL?	TMP,PRAXIX \?CND43
	CRLF	
	CRLF	
	PRINTI	"Having lost our Wizard, "
	GRTR?	PARTY-MAX,1 \?CND56
	PRINTI	"it was agreed that "
?CND56:	PRINTI	"there was no purpose in continuing our quest. And so, heavy of heart, "
	CALL1	I/WE
	PRINT	STACK
	PRINTI	" made "
	CALL1	MY/OUR
	PRINT	STACK
	PRINTI	" way back to Astrix."
	ICALL1	PART-TWO-ENDING
	RTRUE	
?CND43:	FSET?	PRAXIX,IN-PARTY \?CND58
	FSET?	PRAXIX,INCAPACITATED \?CND58
	FCLEAR	PRAXIX,INCAPACITATED
	PRINTI	"Before continuing, we rested here for a while, giving Praxix a chance to rest his ankle. Fortunately, "
	FSET?	ESHER,IN-PARTY \?CND62
	PRINTI	"with Esher's assistance, "
?CND62:	PRINTI	"this didn't take long, and we were soon ready to proceed. "
?CND58:	CALL	MOVE-TO,GATE-JUNCTION,STR?620
	RSTACK	
?CCL38:	EQUAL?	ACTION,ESHER-COMMAND /?CTR64
	EQUAL?	ACTION,HURTH-COMMAND /?CTR64
	EQUAL?	ACTION,PRAXIX-COMMAND \?CCL65
?CTR64:	EQUAL?	ACTION,ESHER-COMMAND \?CCL71
	ICALL2	HINT,HINT-HOLE
	SET	'TMP,ESHER
	JUMP	?CND69
?CCL71:	EQUAL?	ACTION,HURTH-COMMAND \?CCL73
	ICALL2	UPDATE-REMOVE,HINT-HOLE
	SET	'TMP,HURTH
	JUMP	?CND69
?CCL73:	ICALL2	HINT,HINT-HOLE
	SET	'TMP,PRAXIX
?CND69:	PRINTI	"After a moment's thought, "
	ICALL2	WPRINTD,LEADER
	PRINTI	" selected "
	EQUAL?	TMP,LEADER \?CCL76
	PRINTI	"himself"
	JUMP	?CND74
?CCL76:	ICALL2	WPRINTD,TMP
?CND74:	PRINTI	" to make the descent. Praxix removed the tiniest amount of earth and fire essences from his pouch and applied them to "
	EQUAL?	TMP,PRAXIX \?CCL79
	PRINTI	"his cloak, causing it to glow faintly; then, he handed his staff and powders to me. ""If I come into trouble below, I expect this will be of more use to you"
	JUMP	?CND77
?CCL79:	ICALL2	WPRINTD,TMP
	PRINTI	"'s cloak, causing it to glow faintly. ""At least you will have some light for your descent"
?CND77:	PRINTI	","" he said."
	CRLF	
	CRLF	
	PRINTI	"Taking out our rope, "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" securely tied one end around "
	ICALL2	WPRINTD,TMP
	PRINTC	39
	EQUAL?	TMP,PRAXIX /?CND80
	PRINTC	115
?CND80:	PRINTI	" waist, and slowly lowered him down into the darkened hole. When we had reached the rope's end, "
	ICALL2	WPRINTD,TMP
	PRINTI	" was still not at the bottom."
	CRLF	
	CRLF	
	PRINTI	"""It would seem to be about ten feet down from here,"" he said. ""I can't tell much else for now."""
	ICALL1	END-OPTION
	ICALL	OPTION,TMP,JUMP-COMMAND,RETURN-COMMAND
	PUTP	HERE,P?TEMP,TMP
	RTRUE	
?CCL65:	EQUAL?	ACTION,JUMP-COMMAND \?CCL83
	ICALL2	GRAPHIC,G-MINE-HOLE
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,DOWN-COMMAND
	GETP	HERE,P?TEMP >TMP
	ICALL2	WPRINTD,TMP
	PRINTI	" decided to fall from the rope to the floor below. He landed with a crash, and "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" feared he had been injured. "
	EQUAL?	ACTOR,PRAXIX \?CCL86
	FSET	PRAXIX,INCAPACITATED
	PRINTI	"Indeed, those fears were well-founded, for Praxix had twisted his ankle. ""I shall be fine,"" he said, wincing with pain."
	JUMP	?CND84
?CCL86:	PRINTI	"""Only some loose rock,"" he said, a little shakily, ""I am fine."""
?CND84:	FSET	MINE-HOLE-CRACK,DONT-EXAMINE
	ICALL1	END-OPTION
	ICALL2	SAVE-TRAVEL-COMMANDS,TMP
	EQUAL?	TMP,PRAXIX \?CCL89
	CALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,CLIMB-UP-COMMAND,LOOK-AROUND-COMMAND
	RSTACK	
?CCL89:	CALL	TRAVEL-COMMANDS,TMP,CLIMB-UP-COMMAND,LOOK-AROUND-COMMAND
	RSTACK	
?CCL83:	EQUAL?	ACTION,RETURN-COMMAND \?CCL91
	GETP	HERE,P?TEMP >PREVIOUS-HOLE
	PRINTI	"""Pull me back up!"" "
	GETP	HERE,P?TEMP
	ICALL2	WPRINTD,STACK
	PRINTI	" shouted from the darkness, and we did. ""Too dangerous,"" he continued when he had been pulled through the hole, ""If I had jumped, it might well have been impossible to reach the rope again."""
	ICALL	UPDATE-FSET,MINE-HOLE-CRACK,DONT-EXAMINE
	PUTP	HERE,P?TEMP,0
	CALL1	END-OPTION
	RSTACK	
?CCL91:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL93
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"""I suggest we find out what's down there,"" Praxix offered."
	RTRUE	
?CCL93:	EQUAL?	ACTION,DOWN-COMMAND \FALSE
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	ZERO?	PREVIOUS-HOLE /?CND96
	ICALL1	REMOVE-TRAVEL-COMMAND
?CND96:	PRINTI	"It was decided that we should try sending someone down the hole, though it might be quite dangerous. "
	ICALL2	WPRINTD,LEADER
	PRINTI	" thought a moment before deciding who would make the attempt."
	FSET?	ESHER,IN-PARTY \?CCL100
	FSET?	HURTH,IN-PARTY \?CCL100
	EQUAL?	PREVIOUS-HOLE,ESHER,HURTH /?CCL100
	EQUAL?	PREVIOUS-HOLE,PRAXIX \?CCL106
	CALL	OPTION,LEADER,ESHER-COMMAND,HURTH-COMMAND
	RSTACK	
?CCL106:	CALL	OPTION,LEADER,ESHER-COMMAND,HURTH-COMMAND,PRAXIX-COMMAND
	RSTACK	
?CCL100:	FSET?	ESHER,IN-PARTY \?CCL108
	EQUAL?	PREVIOUS-HOLE,ESHER /?CCL108
	EQUAL?	PREVIOUS-HOLE,PRAXIX \?CCL113
	CALL	OPTION,LEADER,ESHER-COMMAND
	RSTACK	
?CCL113:	CALL	OPTION,LEADER,ESHER-COMMAND,PRAXIX-COMMAND
	RSTACK	
?CCL108:	FSET?	HURTH,IN-PARTY \?CCL115
	EQUAL?	PREVIOUS-HOLE,HURTH /?CCL115
	EQUAL?	PREVIOUS-HOLE,PRAXIX \?CCL120
	CALL	OPTION,LEADER,HURTH-COMMAND
	RSTACK	
?CCL120:	CALL	OPTION,LEADER,HURTH-COMMAND,PRAXIX-COMMAND
	RSTACK	
?CCL115:	CRLF	
	CRLF	
	SET	'ACTION,PRAXIX-COMMAND
	JUMP	?FCN


	.FUNCT	ANONF-261:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	IN?	SPIRIT-STONE,INVENTORY \?CCL6
	PRINTI	"With the Spirit Stone in hand, we returned to the bottom of the stairs."
	JUMP	?CND4
?CCL6:	IN?	SPIRIT-STONE,HERE \?CCL8
	ICALL	UPDATE-MOVE,SPIRIT-STONE,INVENTORY
	PRINTI	"With the approval of the group, I took the Spirit Stone from around Cedrith's neck, and placed it in my pack. Then, we returned to the bottom of the stairs."
	JUMP	?CND4
?CCL8:	PRINTI	"We could not fathom the meaning of the vault and runes, and it appeared that we never would. And so, we returned to the stairs."
	CRLF	
	CRLF	
	PRINTI	"""I cannot help but feel,"" Praxix said, ""that the tomb is not what it appears. Something that perfect cannot have been placed here without purpose."""
?CND4:	ICALL	REMOVE-TRAVEL-COMMAND,MINE-LOWER-STAIR,RIGHT-COMMAND
	CALL2	MOVE-TO,MINE-LOWER-STAIR
	RSTACK	
?CCL3:	EQUAL?	ACTION,USE-MIX-COMMAND \FALSE
	EQUAL?	MIXTURE,SPECIAL-VISION-SPELL \FALSE
	EQUAL?	ACTION-OBJECT,TOMB-VAULT \FALSE
	FSET	SPECIAL-VISION-SPELL,SEEN
	ICALL	GRAPHIC,FALSE-VALUE,G-COFFIN,BOTTOM-LEFT
	CALL	I/WE,2,TRUE-VALUE
	PRINT	STACK
	PRINTI	" stood in silence as Praxix cast the strange mixture at the vault. The powder appeared to wrap itself about the iron casing, which began to glow with a pale-blue light. And then the entire vault became translucent, and its borders soft and ill-defined. In a matter of moments, the once formidable structure lost all substance, dissolving into the thin air!"
	CRLF	
	CRLF	
	PRINTI	"""A powerful illusion,"" said Praxix, himself awe-struck, ""and it appears the spell has broken it."""
	CRLF	
	CRLF	
	PRINTI	"But no sooner had Praxix spoken than another ghostly image appeared where the vault had stood - far smaller it was, and oblong in shape. The image shimmered before us as it struggled to acquire an earthly substance."
	CRLF	
	CRLF	
	PRINTI	"""A coffin!"" "
	FSET?	HURTH,IN-PARTY \?CCL16
	PRINTI	"Hurth"
	JUMP	?CND14
?CCL16:	PRINTI	"Praxix"
?CND14:	PRINTI	" whispered; and there we stood, dumbfounded, before the gray marble casket that now sat on the ground before us."
	ICALL2	UPDATE-REMOVE,TOMB-VAULT
	ICALL2	UPDATE-REMOVE,TOMB-RUNES
	ICALL	UPDATE-MOVE,TOMB-COFFIN,HERE
	CALL1	MIXTURE-CAST
	RSTACK	


	.FUNCT	ANONF-262:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" took a tentative step forward and touched the polished stone with his hand. Breathlessly, he lifted the lid and stood there, frozen with fear. """
	ICALL2	GRAPHIC,G-CEDRITH
	EQUAL?	ACTOR,PRAXIX \?CCL6
	PRINTI	"Why, this is quite remarkable,"" he said excitedly."
	JUMP	?CND4
?CCL6:	PRINTI	"I cannot believe it,"" he said in a perfect monotone."
?CND4:	CRLF	
	CRLF	
	PRINTI	"It was impossible, and to this day we have not found an explanation for what we discovered within: a Dwarvish body, perfectly preserved through the long years. He wore a long, white robe which appeared to glisten in the light of Praxix' staff. Around his neck, a round white stone hung at the end of a golden chain."
	FSET?	HURTH,IN-PARTY \?CND7
	CRLF	
	CRLF	
	PRINTI	"""Cedrith!"" gasped Hurth, stumbling backward."
?CND7:	CALL	UPDATE-MOVE,SPIRIT-STONE,HERE
	RSTACK	


	.FUNCT	ANONF-263:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	FSET?	HURTH,IN-PARTY /?CND4
	ICALL2	WPRINTD,ACTOR
	PRINTI	" walked over to the runes but discovered little. ""They seem to be Dwarvish,"" he said, ""but I could not even attempt to translate them."""
	RTRUE	
?CND4:	EQUAL?	ACTOR,HURTH /?CCL8
	ICALL2	WPRINTD,ACTOR
	PRINTI	" walked over to the runes and, thinking them Dwarvish, called Hurth over to help in the translation."
	JUMP	?CND6
?CCL8:	PRINTI	"Hurth moved closer to the runes and began to inspect them."
?CND6:	PRINTI	" ""These runes are similar to Dwarvish, but in some peculiar dialect,"" he said."
	CRLF	
	CRLF	
	PRINTI	"""Or perhaps an early forerunner of present-day Dwarvish,"" Praxix suggested."
	CRLF	
	CRLF	
	PRINTI	"""Yes, that would explain much. The runes say something like 'Herein the Legacy of Dwarves.' I wonder what it can mean."""
	RTRUE	


	.FUNCT	ANONF-264:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"The vault appeared impenetrable, of a magnificently polished stone the likes of which we had never seen before."
	CRLF	
	CRLF	
	EQUAL?	ACTOR,HURTH \?CCL6
	PRINTI	"""I know of no Dwarvish craft such as this,"" Hurth said, ""This is some lost art or work of magic."""
	RTRUE	
?CCL6:	PRINTI	"""There is no craftsman that can make such a thing,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, ""It is too...perfect!"""
	RTRUE	

	.ENDSEG

	.ENDI
