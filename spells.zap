
	.SEGMENT "0"


	.FUNCT	PRAXIX-TOO-DANGEROUS-TO-CAST:ANY:0:0
	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix thought to cast the """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell, but we agreed that the situation was far too serious to use such a seemingly irrelevant spell."
	CALL1	CHECK-CAST-LIMIT
	RSTACK	


	.FUNCT	CHECK-CAST-LIMIT:ANY:0:0,CL
	GETP	HERE,P?CAST-LIMIT >CL
	FSET	ACTION-OBJECT,TRIED
	FSET?	HERE,SINGLE-CAST /?CTR2
	EQUAL?	CL,1 \?CCL3
?CTR2:	ICALL	UPDATE-FSET,HERE,DONT-CAST
	SET	'DONT-CAST-FLAG,TRUE-VALUE
	RTRUE	
?CCL3:	GRTR?	CL,1 \TRUE
	SUB	CL,1
	PUTP	HERE,P?CAST-LIMIT,STACK
	RTRUE	


	.FUNCT	DISSIPATION-CHECK:ANY:0:0
	ZERO?	DISSIPATION-WARNING \FALSE
	ZERO?	SUBGROUP-MODE \FALSE
	SET	'DISSIPATION-WARNING,TRUE-VALUE
	CRLF	
	CRLF	
	PRINTI	"""Actually,"" Praxix revealed, ""I do not have magical essences in any vast supply. These experiments may, one day, prove costly, but for now they seem harmless enough."""
	RTRUE	


	.FUNCT	PRAXIX-NO-CAST:ANY:0:0
	ICALL1	UNUSE-ESSENCES
	ZERO?	SUBGROUP-MODE \?CCL3
	PRINTI	"Praxix suggested using the """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell, but "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" convinced him"
	JUMP	?CND1
?CCL3:	PRINTI	"Praxix' mind, working rapidly, thought of using the """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell, but he soon convinced himself"
?CND1:	PRINTI	" that it would be a waste of time under the circumstances."
	CALL1	CHECK-CAST-LIMIT
	RSTACK	


	.FUNCT	ADD-ESSENCE:ANY:2:2,OFF,AMT
	GET	ESSENCE-TBL,OFF
	ADD	STACK,AMT
	PUT	ESSENCE-TBL,OFF,STACK
	RTRUE	


	.FUNCT	FIND-ESSENCE:ANY:2:2,ESS,AMT,OFF
	GETP	ESS,P?EOFF >OFF
	ICALL	UPDATE-MOVE,ESS,ESSENCES
	ICALL	ADD-ESSENCE,OFF,AMT
	SET	'FOUND-ESSENCE,TRUE-VALUE
	CALL	QUEUE,I-FOUND-ESSENCE,1
	RSTACK	


	.FUNCT	ANONF-24:ANY:0:0
	SET	'FOUND-ESSENCE,FALSE-VALUE
	RETURN	FOUND-ESSENCE


	.FUNCT	CHECK-USED-UP-ESSENCES:ANY:0:0,OFF,FST?,ESS
	SET	'OFF,1
?PRG1:	GRTR?	OFF,EMAX \?CCL5
	ZERO?	FST? /TRUE
	PRINTI	". ""Let us hope we shall "
	EQUAL?	PARTY-MODE,FIGHT-MODE \?CCL10
	PRINTI	"get some good use out of "
	JUMP	?CND8
?CCL10:	PRINTI	"not be needing "
?CND8:	GRTR?	FST?,1 \?CCL13
	PRINTI	"them"
	JUMP	?CND11
?CCL13:	PRINTI	"it"
?CND11:	PRINTI	","" he said, resignedly."
	RTRUE	
?CCL5:	GET	ESSENCE-OBJECT-TBL,OFF >ESS
	ZERO?	ESS /?CND3
	FSET?	ESS,USED-UP \?CND3
	ZERO?	SUBGROUP-MODE /?PRD18
	FSET?	PRAXIX,SUBGROUP \?CND3
?PRD18:	FSET?	PRAXIX,BUSY /?CND3
	FCLEAR	ESS,USED-UP
	ZERO?	FST? \?CCL23
	SET	'FST?,1
	CRLF	
	CRLF	
	PRINTI	"Praxix now turned his thoughts to his magical powders, since his last spell had used up all of his "
	ICALL2	WPRINTD,ESS
?CND3:	INC	'OFF
	JUMP	?PRG1
?CCL23:	INC	'FST?
	PRINTI	" and "
	ICALL2	WPRINTD,ESS
	PRINTC	46
	RTRUE	


	.FUNCT	ANONF-25:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	CALL	QSET?,POUCH,EXAMINED
	ZERO?	STACK \?CCL6
	PRINTI	"The key to Praxix' wizardly powers lay within the badly worn, brown leather pouch that he carried inside his cloak. This pouch contained his entire stock of magical essences, with whose help it was possible to conjure up a variety of magical spells. But these essences were in very limited supply, and one cannot be too harsh on Praxix for the frequency with which he would assess the quantities of those in his possession."
	CRLF	
	CRLF	
	PRINTI	"He did so now, taking out his pouch and finding"
	JUMP	?CND4
?CCL6:	ICALL2	WPRINTD,PRAXIX
	PRINTI	", "
	ZERO?	FOUND-ESSENCE /?CCL9
	PRINTI	"having just added to his stock of magical essences, took inventory"
	JUMP	?CND7
?CCL9:	PRINTI	"ever concerned about his magical resources, took out his pouch"
?CND7:	PRINTI	" and found"
?CND4:	FIRST?	ESSENCES /?CCL12
	PRINTI	" not a single speck of magical essence."
	JUMP	?CND10
?CCL12:	ICALL2	TELL-AMOUNTS,ESSENCES
?CND10:	FIRST?	REAGENTS \TRUE
	PRINTI	" In addition, he found"
	ICALL2	TELL-AMOUNTS,REAGENTS
	RTRUE	


	.FUNCT	TELL-AMOUNTS:ANY:1:1,OBJ,F,AMT
	FIRST?	OBJ >F /?PRG2
?PRG2:	ZERO?	F \?CCL6
	PRINTC	46
	RTRUE	
?CCL6:	PRINTI	" a "
	GETP	F,P?EOFF
	GET	ESSENCE-TBL,STACK >AMT
	GET	ESSENCE-AMT-TBL,AMT
	PRINT	STACK
	PRINTI	" amount of "
	ICALL2	WPRINTD,F
	LESS?	SCREEN-WIDTH,12-WIDTH \?CND7
	EQUAL?	OBJ,REAGENTS /?CND7
	PRINTI	" essence"
?CND7:	PRINTI	" (enough for "
	GET	ESSENCE-AMT-TBL-X,AMT
	PRINT	STACK
	PRINTI	" spell"
	EQUAL?	AMT,1 /?CND11
	PRINTC	115
?CND11:	PRINTC	41
	NEXT?	F >F \?PRG2
	NEXT?	F \?CCL17
	PRINTC	44
	JUMP	?PRG2
?CCL17:	PRINTI	", and"
	JUMP	?PRG2


	.FUNCT	CHECK-ESSENCES:ANY:1:2,SPL,AMT,OFF,EBITS
	ASSIGNED?	'AMT /?CND1
	SET	'AMT,1
?CND1:	SET	'OFF,1
	GETP	SPL,P?EBITS >EBITS
?PRG3:	EQUAL?	OFF,EMAX /TRUE
	BTST	EBITS,1 \?CCL9
	GET	ESSENCE-TBL,OFF
	LESS?	STACK,AMT /FALSE
?CCL9:	INC	'OFF
	SHIFT	EBITS,-1 >EBITS
	JUMP	?PRG3


	.FUNCT	UNUSE-ESSENCES:ANY:0:1,SPL
	ASSIGNED?	'SPL /?CND1
	SET	'SPL,ACTION-OBJECT
?CND1:	CALL	USE-ESSENCES,SPL,FALSE-VALUE
	RSTACK	


	.FUNCT	USE-ESSENCE:ANY:1:2,ESS,DEC?,OFF,TMP
	ASSIGNED?	'DEC? /?CND1
	SET	'DEC?,TRUE-VALUE
?CND1:	GETP	ESS,P?EOFF >OFF
	GET	ESSENCE-TBL,OFF >TMP
	ZERO?	DEC? /?CCL5
	EQUAL?	TMP,1 \?CND6
	FSET	ESS,USED-UP
	ICALL2	UPDATE-REMOVE,ESS
?CND6:	SUB	TMP,1
	PUT	ESSENCE-TBL,OFF,STACK
	RTRUE	
?CCL5:	ZERO?	TMP \?CND8
	FCLEAR	ESS,USED-UP
	GET	ESSENCE-CONT-TBL,OFF
	ICALL	UPDATE-MOVE,ESS,STACK
?CND8:	ADD	TMP,1
	PUT	ESSENCE-TBL,OFF,STACK
	RTRUE	


	.FUNCT	USE-ESSENCES:ANY:1:2,SPL,DEC?,OFF,EBITS
	ASSIGNED?	'DEC? /?CND1
	SET	'DEC?,TRUE-VALUE
?CND1:	SET	'OFF,1
	GETP	SPL,P?EBITS >EBITS
?PRG3:	EQUAL?	OFF,EMAX /TRUE
	BTST	EBITS,1 \?CND5
	GET	ESSENCE-OBJECT-TBL,OFF
	ICALL	USE-ESSENCE,STACK,DEC?
?CND5:	INC	'OFF
	SHIFT	EBITS,-1 >EBITS
	JUMP	?PRG3


	.FUNCT	ANONF-26:ANY:0:0
	CALL1	PRE-SPELL
	ZERO?	STACK \TRUE
	PRINTI	"Praxix reached into his cloak and took out the red invisibility powder; there was enough left for at most "
	GET	INT-STR,RED-ROCK-COUNT
	PRINT	STACK
	PRINTI	" use"
	EQUAL?	RED-ROCK-COUNT,1 /?CND4
	PRINTC	115
?CND4:	PRINTI	", and this did not seem like the best situation to waste the precious material."
	CALL1	CHECK-CAST-LIMIT
	RSTACK	


	.FUNCT	CAST-INVISIBLE:ANY:0:1,ZT
	DEC	'RED-ROCK-COUNT
	ZERO?	RED-ROCK-COUNT \TRUE
	ICALL2	UPDATE-REMOVE,INVISIBLE-SPELL
	ZERO?	ZT /TRUE
	CRLF	
	CRLF	
	PRINTI	"That was the last of the invisibility powder, and we were all sorry to see it go."
	RTRUE	


	.FUNCT	ANONF-27:ANY:0:0
	CALL1	PRE-SPELL
	ZERO?	STACK \TRUE
	PRINTI	"Praxix reached into his cloak and brought forth some air essence. As he tossed it into the air, a great wind came up, almost knocking us off our feet. When the wind subsided, "
	ICALL2	WPRINTD,LEADER
	PRINTI	" quite reasonably asked, ""What was that for?"""
	CRLF	
	CRLF	
	PRINTI	"""What, the wind?"" Praxix replied. ""Oh! Just testing, just testing."""
	ICALL1	DISSIPATION-CHECK
	CALL1	CHECK-CAST-LIMIT
	RSTACK	


	.FUNCT	UNDERGROUND-CHECK:ANY:0:0
	FSET?	HERE,UNDERGROUND /?CCL3
	FSET?	HERE,INDOORS \FALSE
?CCL3:	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix mused about using his '"
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	"' spell, but, upon "
	ZERO?	SUBGROUP-MODE /?CCL8
	PRINTI	"further consideration, he realized"
	JUMP	?CND6
?CCL8:	PRINTI	"careful questioning, he admitted"
?CND6:	PRINTI	" that it could not possibly work "
	FSET?	HERE,UNDERGROUND \?CCL11
	PRINTI	"underground."
	RTRUE	
?CCL11:	PRINTI	"indoors."
	RTRUE	


	.FUNCT	ANONF-28:ANY:0:0
	CALL1	UNDERGROUND-CHECK
	ZERO?	STACK \TRUE
	CALL1	PRE-SPELL
	ZERO?	STACK \TRUE
	PRINTI	"Praxix reached into his cloak and brought forth a little bit of water essence. He cast it into the air, and soon clouds gathered and a light rain fell on us. It lasted only a minute, but it was refreshing nonetheless."
	ICALL1	DISSIPATION-CHECK
	CALL1	CHECK-CAST-LIMIT
	RSTACK	


	.FUNCT	PRE-SPELL:ANY:0:0
	FSET?	HERE,DANGEROUS /?CTR2
	FSET?	SCENE-OBJECT,DANGEROUS \?CCL3
?CTR2:	ICALL1	PRAXIX-TOO-DANGEROUS-TO-CAST
	RTRUE	
?CCL3:	ZERO?	SUBGROUP-MODE \?CCL7
	EQUAL?	PRAXIX,LEADER /?CCL7
	FSET?	ACTION-OBJECT,TRIED \FALSE
?CCL7:	ICALL1	PRAXIX-NO-CAST
	RTRUE	


	.FUNCT	ANONF-29:ANY:0:0
	CALL1	PRE-SPELL
	ZERO?	STACK \TRUE
	PRINTI	"Praxix reached into his cloak and brought forth some earth essence. "
	FSET?	HERE,UNDERGROUND /?CTR5
	FSET?	HERE,ENCLOSED \?CCL6
?CTR5:	PRINTI	"But then, fearing for the safety of the party, he replaced it."
	ICALL1	UNUSE-ESSENCES
	JUMP	?CND4
?CCL6:	PRINTI	"As he tossed it onto the ground, there was a violent shaking from within the earth. Fortunately, nobody was hurt by this display of magical heroics."
	ICALL1	DISSIPATION-CHECK
?CND4:	CALL1	CHECK-CAST-LIMIT
	RSTACK	


	.FUNCT	ANONF-30:ANY:0:0,TMP
	EQUAL?	HERE,STAIR-CHASM \?CCL3
	FSET?	HERE,BLUE-MIX \?CCL3
	ICALL2	FIND-OBJECT,FLOATER
	JUMP	?CND1
?CCL3:	ZERO?	SUBGROUP-MODE /?CCL7
	FSET?	PRAXIX,SUBGROUP \?CCL7
	ICALL2	FIND-OBJECT,HIMSELF-OBJECT
	JUMP	?CND1
?CCL7:	EQUAL?	HERE,MINE-HOLE \?CCL11
	GETP	HERE,P?TEMP >TMP
	ZERO?	TMP /?CCL11
	GETP	TMP,P?ROBJ
	ICALL2	FIND-OBJECT,STACK
	JUMP	?CND1
?CCL11:	EQUAL?	HERE,STORMY-SEAS \?CCL15
	ICALL2	FIND-OBJECT,TAG-OBJECT
	JUMP	?CND1
?CCL15:	EQUAL?	HERE,IN-RIVER \?CCL17
	ICALL2	FIND-OBJECT,RAFT
	JUMP	?CND1
?CCL17:	EQUAL?	HERE,BOAT \?CCL19
	ICALL2	FIND-OBJECT,HIMSELF-OBJECT
	JUMP	?CND1
?CCL19:	ICALL1	FIND-PARTY-OBJECTS
?CND1:	EQUAL?	HERE,GOLD-STREAM \?CND20
	GETP	HERE,P?TEMP
	GRTR?	STACK,0 \?CND20
	ICALL2	FIND-OBJECT,TAG-OBJECT
?CND20:	CALL2	PRSI-TBL,STR?281
	RSTACK	


	.FUNCT	ANONF-31:ANY:0:0
	CALL1	PRE-SPELL
	ZERO?	STACK \TRUE
	PRINTI	"Perhaps as a joke, Praxix took some air essence and earth essence out of his cloak, mixed them in his hand, and flung them at "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTC	46
	CRLF	
	CRLF	
	PRINTI	"He scowled as he rose into the air, then (a long minute later) he slowly fell back to earth, amid a chorus of laughter from the rest of the party. ""Works like it should!"" Praxix said, proudly. ""Do not be cross! We may have need for such things!"""
	ICALL1	DISSIPATION-CHECK
	CALL1	CHECK-CAST-LIMIT
	RSTACK	


	.FUNCT	ANONF-32:ANY:0:0
	CALL1	PRE-SPELL
	ZERO?	STACK \TRUE
	FSET?	HERE,ENCLOSED /?CCL5
	CALL	QSET?,MUD-SPELL,EXAMINED
	ZERO?	STACK \?CCL5
	PRINTI	"Praxix then decided to cast his mud spell, though none of us could quite fathom why. In any event, he took two powders from his pouch and cast them at the ground, which soon became a morass of thick, brown sludge."
	CRLF	
	CRLF	
	PRINTI	"""A little used and much misunderstood spell,"" Praxix said, wiping the "
	ICALL	TELL-COLOR,ESSENCE-WATER,ESSENCE-EARTH
	PRINTI	" residue from his hands. ""Only occasionally useful, yet always a mess."""
	CRLF	
	CRLF	
	PRINTI	"We had no idea what he was talking about, of course, and it seemed best not to pursue the matter further."
	RTRUE	
?CCL5:	PRINTI	"Praxix then had the peculiar notion of casting his mud spell"
	PRINTI	", but decided it was a terrible waste of time."
	CALL1	UNUSE-ESSENCES
	RSTACK	


	.FUNCT	ANONF-33:ANY:0:0
	ICALL	FIND-OBJECTS,HERE,DONT-CAST
	FSET?	HERE,ENCLOSED /?CND1
	FSET?	HERE,INDOORS /?CND1
	ICALL2	FIND-OBJECT,GROUND
?CND1:	CALL2	PRSI-TBL,STR?281
	RSTACK	


	.FUNCT	ANONF-34:ANY:0:0
	CALL1	UNDERGROUND-CHECK
	ZERO?	STACK \TRUE
	CALL1	PRE-SPELL
	ZERO?	STACK \TRUE
	EQUAL?	ACTION-PRSI,GROUND \?CCL7
	PRINTI	"Praxix raised a finger to the wind, then took a quick glance at the sky. The rest of us looked on in bewilderment as Praxix removed some fire and water essences from his pouch and mixed them carefully in his hand. Finally, he added just the smallest amount of earth essence and cast the combination into the sky while aiming his staff at a nearby piece of earth."
	CRLF	
	CRLF	
	PRINTI	"A moment later, the sky was filled with clouds. A dull rumble of thunder preceded a single bolt of white lightning which smote the ground at which Praxix' staff was still pointing."
	CALL	QSET?,LIGHTNING-SPELL,INCAPACITATED
	ZERO?	STACK \?CND8
	CRLF	
	CRLF	
	PRINTI	"Praxix, proud of his accomplishment, turned to me and said, ""It's that tiny bit of earth essence that gives the lightning spell its extra punch!"" Then, he turned to the others and spoke."
?CND8:	CRLF	
	CRLF	
	PRINTI	"""It's quite exciting to watch,"" he said, ""and sometimes it is even helpful!"""
	FSET?	ESHER,IN-PARTY \?CND10
	CRLF	
	CRLF	
	PRINTI	"""I assume you'll let us know when that is,"" Esher said, derisively."
	CRLF	
	CRLF	
	PRINTI	"Praxix frowned and replied, ""I shall make it a point that you are the first to know."""
?CND10:	ICALL1	DISSIPATION-CHECK
	FSET	LIGHTNING-SPELL,SEEN
	CALL1	CHECK-CAST-LIMIT
	RSTACK	
?CCL7:	CALL2	PECULIAR-NOTION,STR?285
	RSTACK	


	.FUNCT	PECULIAR-NOTION:ANY:1:1,STR
	PRINTI	"Praxix then had the peculiar notion of casting his "
	PRINT	STR
	PRINTI	" spell"
	ZERO?	ACTION-PRSI /?CND1
	PRINTI	" on the "
	ICALL2	WPRINTD,ACTION-PRSI
?CND1:	PRINTI	", but decided it "
	EQUAL?	ACTION-PRSI,MOAT-BRIDGE \?CCL5
	PRINTI	"would ruin any chance he might have of reaching the castle grounds"
	JUMP	?CND3
?CCL5:	PRINTI	"was a terrible waste of time"
?CND3:	PRINTC	46
	CALL1	UNUSE-ESSENCES
	RSTACK	


	.FUNCT	PRAXIX-DEFAULT-CAST:ANY:0:0
	FSET?	HERE,DANGEROUS /?CTR2
	FSET?	SCENE-OBJECT,DANGEROUS \?CCL3
?CTR2:	CALL1	PRAXIX-TOO-DANGEROUS-TO-CAST
	RSTACK	
?CCL3:	CALL1	PRAXIX-NO-CAST
	RSTACK	


	.FUNCT	ANONF-35:ANY:0:0
	ICALL	FIND-OBJECTS,HERE,DONT-CAST
	ICALL2	FIND-OBJECT,GROUND
	CALL2	PRSI-TBL,STR?281
	RSTACK	


	.FUNCT	ANONF-36:ANY:0:0
	CALL1	PRE-SPELL
	ZERO?	STACK \TRUE
	EQUAL?	ACTION-OBJECT,GROUND \?CCL5
	PRINTI	"Praxix took out his fire essence and cast it on the ground before our feet. The spot burst into a white-hot flame that died out only a few moments later."
	CRLF	
	CRLF	
	PRINTI	"""Quite useful,"" Praxix said, mainly to himself. ""Keeping away dangerous beasts, cooking meals, warming up a cold campsite. One never knows when a good fire will be needed!"""
	ICALL1	DISSIPATION-CHECK
	CALL1	CHECK-CAST-LIMIT
	RSTACK	
?CCL5:	CALL2	PECULIAR-NOTION,STR?288
	RSTACK	


	.FUNCT	ANONF-37:ANY:0:0
	ICALL2	FIND-OBJECTS,PRAXIX-CAST-OBJECTS
	ICALL	FIND-OBJECTS,INVENTORY,DONT-CAST
	ICALL	FIND-OBJECTS,HERE,DONT-CAST
	CALL2	PRSI-TBL,STR?17
	RSTACK	


	.FUNCT	ANONF-38:ANY:0:0
	EQUAL?	HERE,WEBBA-MAP-GLOW-LOC /FALSE
	REMOVE	I-CLEAR-WEBBA-MAP-EXAMINE
	CALL	UPDATE-FSET,WEBBA-MAP,DONT-EXAMINE
	RSTACK	


	.FUNCT	CAST-LIGHT:ANY:0:0
	EQUAL?	ACTION-PRSI,STAFF \?CCL3
	FSET?	HERE,UNDERGROUND /?CCL6
	FSET?	HERE,NEAR-DARK /?CCL6
	FSET?	PRAXIX,LIT \?CCL11
	CALL1	DONT-WASTE-LIGHT
	RSTACK	
?CCL11:	FSET?	HERE,NEAR-DARK \?CCL13
	SET	'DARKNESS-CAST?,FALSE-VALUE
	FSET	PRAXIX,LIT
	PRINTI	"Thinking light might be soon needed, Praxix removed his pouch of essences and, combining that of earth and fire, applied the mix to his staff, which started to glow a faint red color."
	RTRUE	
?CCL13:	PRINTI	"Presumably for practice, or perhaps out of boredom, Praxix removed his pouch of magical essences and, combining two of them, applied the resulting mixture to his staff which started to glow a faint red color."
	SET	'DARKNESS-CAST?,FALSE-VALUE
	ZERO?	SUBGROUP-MODE \?CND14
	CRLF	
	CRLF	
	PRINTI	"""Gotten me out of many a tight spot,"" he said without explanation."
?CND14:	FSET	PRAXIX,LIT
	ICALL1	DISSIPATION-CHECK
	CALL1	CHECK-CAST-LIMIT
	RSTACK	
?CCL6:	FSET?	PRAXIX,LIT /?CCL17
	ZERO?	SUBGROUP-MODE \?CCL17
	FSET	PRAXIX,LIT
	FSET?	HERE,NEAR-DARK \?CCL22
	PRINTI	"Praxix now withdrew some earth and fire essences and cast them at his staff, causing it"
	JUMP	?CND20
?CCL22:	PRINTI	"You can imagine our surprise when, in this deepest gloom, Praxix' staff began"
?CND20:	PRINTI	" to glow with a brilliant red light. ""A good thing we found fire essence,"" Praxix said, blankly. ""I only hope I didn't use too much."""
	FSET?	ESHER,IN-PARTY \?CND23
	CRLF	
	CRLF	
	PRINTI	"""Some Wizard!"" replied Esher. ""Heaven help us!"""
?CND23:	ICALL1	CHECK-CAST-LIMIT
	EQUAL?	HERE,BERN-I-LAV,DWARF-MEETING-LOC \TRUE
	ICALL1	CAVERN-GRAPHIC
	RTRUE	
?CCL17:	CALL	QSET?,PRAXIX,LIT
	ZERO?	STACK \?CCL28
	PRINTI	"Praxix now withdrew some earth and fire essences and cast them at his staff, causing it to glow with a brilliant red light."
	CRLF	
	CRLF	
	PRINTI	"""Should do nicely,"" he said to himself. ""Very nicely indeed."""
	RTRUE	
?CCL28:	ZERO?	SUBGROUP-MODE /?CCL30
	CALL1	DONT-WASTE-LIGHT
	RSTACK	
?CCL30:	PRINTI	"The light emanating from Praxix' staff appeared fine to us, but Praxix took more fire and earth essence from his pouch and applied it to the staff anyway. ""Can't be too sure,"" he said."
	REMOVE	HYE-GLOW
	CALL1	CHECK-CAST-LIMIT
	RSTACK	
?CCL3:	EQUAL?	ACTION-PRSI,WEBBA-MAP \?CCL32
	FCLEAR	WEBBA-MAP,DEAD
	FSET	WEBBA-MAP,SOLVED
	ICALL	UPDATE-FCLEAR,WEBBA-MAP,DONT-EXAMINE
	SET	'WEBBA-MAP-GLOW-LOC,HERE
	ICALL	QUEUE,I-CLEAR-WEBBA-MAP-EXAMINE,-1
	FSET	WEBBA-MAP,ENCHANTED
	ICALL	QUEUE,I-WEBBA-MAP-GLOW,1
	FSET	ACTION-PRSI,DONT-CAST
	PRINTI	"I suppose it was only a hunch, but Praxix decided to cast his glow spell on the map that Webba had given us. Much to our surprise, a chain of runes began to glow, pointing the way to some unknown place."
	CRLF	
	CRLF	
	PRINTI	"""This solves the mystery of which runes were originally there,"" he said, proudly, ""though it says nothing of who put it there, and why"
	EQUAL?	HERE,ASTRIX-MAZE \?CND33
	PRINTI	", though I would lay odds it was Astrix himself"
?CND33:	PRINTI	"."""
	RTRUE	
?CCL32:	EQUAL?	ACTION-PRSI,GATE-RUNES \?CCL36
	FSET	ACTION-PRSI,DONT-CAST
	PRINTI	"This sort of thing had worked before, so Praxix took out his magical powders and cast his glow enchantment on the strange ruins above the gate. The runes did, in fact, glow more brightly than they had before, yet no other change occurred - certainly none that we found useful in getting through the gate."
	RTRUE	
?CCL36:	PRINTI	"Praxix then had the most peculiar notion of casting his glow spell on the "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	", but decided it was a terrible waste of time."
	CALL1	UNUSE-ESSENCES
	RSTACK	


	.FUNCT	ANONF-39:ANY:0:0
	FCLEAR	WEBBA-MAP,ENCHANTED
	RTRUE	


	.FUNCT	DONT-WASTE-LIGHT:ANY:0:0
	PRINTI	"Praxix checked his staff, but a usable light was already emanating from it. Figuring it best not to waste magical essences, he decided against recharging it with light."
	ICALL1	UNUSE-ESSENCES
	CALL1	CHECK-CAST-LIMIT
	RSTACK	


	.FUNCT	CAST-FAR-VISION:ANY:0:1,DFLT?
	ASSIGNED?	'DFLT? /?CND1
	SET	'DFLT?,TRUE-VALUE
?CND1:	FSET?	HERE,ENCLOSED /?CTR4
	FSET?	HERE,INDOORS \?CCL5
?CTR4:	PRINTI	"Praxix now considered using his flare spell, but felt it was too dangerous considering how enclosed our surroundings were."
	ICALL1	UNUSE-ESSENCES
	RTRUE	
?CCL5:	CALL	QSET?,FAR-VISION-SPELL,SEEN
	ZERO?	STACK \?CCL9
	PRINTI	"Praxix raised his arm before him, and from his crooked forefinger shot a small ball of fire"
	FSET?	HERE,UNDERGROUND \?CCL12
	PRINTI	", illuminating the cavern walls as it sped into the gloom."
	JUMP	?CND3
?CCL12:	PRINTI	", disappearing into the air before him."
	ICALL1	CHECK-CAST-LIMIT
	JUMP	?CND3
?CCL9:	FSET?	HERE,UNDERGROUND \?CCL14
	PRINTI	"Praxix, using his flare spell, illuminated the darkness before "
	ZERO?	SUBGROUP-MODE /?CCL17
	PRINTI	"him."
	JUMP	?CND3
?CCL17:	PRINTI	"us."
	JUMP	?CND3
?CCL14:	PRINTI	"Praxix, casting his flare spell, shot a ball of fire into the distance."
?CND3:	ZERO?	DFLT? /TRUE
	PRINTI	" Unfortunately, "
	FSET?	HERE,UNDERGROUND \?CCL22
	PRINTI	"nothing was revealed in the gloom."
	RTRUE	
?CCL22:	PRINTI	"there was no response, and nothing new was revealed."
	RTRUE	


	.FUNCT	V-MIX:ANY:0:0
	PRINTI	"Carefully, Praxix mixed the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" with an equal amount of "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	", "
	SET	'MIX-ESSENCE,ACTION-PRSI
	SET	'MIX-REAGENT,ACTION-OBJECT
	EQUAL?	MIX-REAGENT,REAGENT,BLUE-REAGENT \?CCL3
	EQUAL?	MIX-ESSENCE,ESSENCE-FIRE \?CCL3
	SET	'MIXTURE,SPECIAL-VISION-SPELL
	JUMP	?CND1
?CCL3:	EQUAL?	MIX-REAGENT,REAGENT,BLUE-REAGENT \?CCL7
	EQUAL?	MIX-ESSENCE,ESSENCE-WATER \?CCL7
	SET	'MIXTURE,ANIMATE-SPELL
	JUMP	?CND1
?CCL7:	EQUAL?	MIX-REAGENT,GRAY-REAGENT \?CCL11
	EQUAL?	MIX-ESSENCE,ESSENCE-AIR \?CCL11
	SET	'MIXTURE,FOREBODING-SPELL
	JUMP	?CND1
?CCL11:	EQUAL?	MIX-REAGENT,GRAY-REAGENT \?CCL15
	EQUAL?	MIX-ESSENCE,ESSENCE-FIRE \?CCL15
	SET	'MIXTURE,BEND-WILL-SPELL
	JUMP	?CND1
?CCL15:	EQUAL?	MIX-REAGENT,BLACK-REAGENT \?CCL19
	EQUAL?	HERE,ZAN-CAVE \?CCL19
	EQUAL?	MIX-ESSENCE,ESSENCE-FIRE \?CCL24
	SET	'MIXTURE,DARKNESS-SPELL
	JUMP	?CND1
?CCL24:	EQUAL?	MIX-ESSENCE,ESSENCE-WATER \?CCL26
	SET	'MIXTURE,ILLNESS-SPELL
	JUMP	?CND1
?CCL26:	EQUAL?	MIX-ESSENCE,ESSENCE-EARTH \?CCL28
	SET	'MIXTURE,COLD-SPELL
	JUMP	?CND1
?CCL28:	SET	'MIXTURE,DESPAIR-SPELL
	JUMP	?CND1
?CCL19:	SET	'MIXTURE,UNSTABLE-MIX
?CND1:	EQUAL?	MIX-REAGENT,BLACK-REAGENT \?CCL31
	ZERO?	MIXTURE \?CCL31
	ICALL2	UPDATE-REMOVE,BLACK-REAGENT
	PRINTI	"but the strangest thing happened. The mixture itself, along with the remaining black reagent, simply vanished into the air."
	CRLF	
	CRLF	
	GRTR?	BLACK-COUNT,0 \TRUE
	PRINTI	"""It would appear that without Umber, the mixtures are powerless,"" Praxix said. ""He possesses a great power, and his magic has harnessed the very essence of evil! But for what purpose?"""
	RTRUE	
?CCL31:	ZERO?	MIXTURE /?CCL37
	FSET?	MIXTURE,SEEN \?CCL37
	PRINTI	"and was soon ready to cast the mixture."
	JUMP	?CND29
?CCL37:	ZERO?	MIXTURE /?CND40
	FSET	MIXTURE,SEEN
?CND40:	PRINTI	"and was now ready to cast the unknown mix to see what enchantment it would perform."
?CND29:	SET	'MIX-DONE,TRUE-VALUE
	ZERO?	MIXTURE /?CCL44
	ICALL2	USE-ESSENCES,MIXTURE
	JUMP	?CND42
?CCL44:	ICALL2	USE-ESSENCE,MIX-REAGENT
	ICALL2	USE-ESSENCE,MIX-ESSENCE
?CND42:	CALL1	FIXUP-PRAXIX-COMMANDS
	RSTACK	


	.FUNCT	FIXUP-PRAXIX-COMMANDS:ANY:0:0
	ZERO?	MIX-DONE \?CCL3
	CALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,MIX-COMMAND,EXAMINE-COMMAND
	RSTACK	
?CCL3:	CALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,USE-MIX-COMMAND,EXAMINE-COMMAND
	RSTACK	


	.FUNCT	V-USE-MIX:ANY:0:0
	SET	'MIX-DONE,FALSE-VALUE
	ICALL1	FIXUP-PRAXIX-COMMANDS
	EQUAL?	PARTY-MODE,FIGHT-MODE \?CND1
	ICALL	CHANGE-CIT,PRAXIX,2,NUL-COMMAND
?CND1:	ZERO?	MIXTURE \?CCL5
	EQUAL?	MIX-REAGENT,GRAY-REAGENT \?CCL8
	FSET	MIX-ESSENCE,GRAY-MIX
	JUMP	?CND6
?CCL8:	EQUAL?	MIX-REAGENT,BLUE-REAGENT,REAGENT \?CCL10
	FSET	MIX-ESSENCE,BLUE-MIX
	JUMP	?CND6
?CCL10:	FSET	MIX-ESSENCE,BLACK-MIX
?CND6:	PRINTI	"Even as Praxix cast this unknown mixture, it disintegrated into the air."
	CRLF	
	CRLF	
	ZERO?	SUBGROUP-MODE /?CCL13
	PRINTI	"""Blasted powders,"" he said aloud."
	RTRUE	
?CCL13:	CALL	QSET?,MIX-REAGENT,TRAPPED
	ZERO?	STACK \?CCL15
	PRINTI	"""Astrix warned us that some mixtures would be unstable,"" he said, ""It would appear that he was right."""
	RTRUE	
?CCL15:	PRINTI	"""Another unstable mixture,"" Praxix said with a sigh."
	RTRUE	
?CCL5:	PRINTI	"Praxix cast his mixture at "
	EQUAL?	ACTION-OBJECT,BERGON-OBJECT,ESHER-OBJECT,MINAR-OBJECT /?CND16
	PRINTI	"the "
?CND16:	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	", but nothing appeared to happen. ""It was worth a try,"" Praxix said, but he was clearly disappointed with the result."
	RTRUE	


	.FUNCT	O-CAST-MIX:ANY:0:0
	ICALL	FIND-OBJECTS,HERE,DONT-CAST
	CALL2	FIND-OBJECTS,PRAXIX-CAST-OBJECTS
	RSTACK	


	.FUNCT	ANONF-40:ANY:0:0
	EQUAL?	ACTION,USE-MIX-COMMAND \FALSE
	ZERO?	MIXTURE /FALSE
	EQUAL?	MIXTURE,FOREBODING-SPELL \?CCL8
	FSET	FOREBODING-SPELL,ENCHANTED
	PRINTI	"Praxix cast this strange new mixture at his staff, and the oddest thing happened. Rather than the pale red glow of his ""glow"" spell, his staff now gave off a "
	FSET?	HERE,FORBIDDING \?CCL11
	PRINTI	"deep red glow"
	JUMP	?CND9
?CCL11:	PRINTI	"dim green glow which was barely perceptible to the eye"
?CND9:	PRINTC	46
	ICALL	QUEUE,RESET-FOREBODING-OBJ,5
	CALL	QSET?,STAFF,ENCHANTED
	ZERO?	STACK \?CND12
	PRINTI	" We waited a while longer, but nothing further happened."
	REMOVE	HYE-FOREBODING
	CRLF	
	CRLF	
	PRINTI	"""Odd,"" Praxix said, ""Either the spell is useless, or it works in a manner that we have not yet discovered - I wonder which."""
?CND12:	ICALL1	MIXTURE-CAST
	RTRUE	
?CCL8:	PRINTI	"Unsure of what to cast the mixture at, Praxix thought to try his staff. Sadly, though, nothing happened."
	ICALL1	MIXTURE-CAST
	RTRUE	


	.FUNCT	FIND-PARTY-OBJECTS:ANY:0:0,CNT,CHR
?PRG1:	IGRTR?	'CNT,PARTY-MAX /TRUE
	GET	PARTY,CNT >CHR
	ZERO?	CHR /?PRG1
	FSET?	CHR,IN-PARTY \?PRG1
	EQUAL?	CHR,PRAXIX /?PRG1
	GETP	CHR,P?ROBJ >CHR
	ZERO?	CHR /?PRG1
	LOC	CHR
	ZERO?	STACK /?PRG1
	ICALL2	FIND-OBJECT,CHR
	JUMP	?PRG1


	.FUNCT	PRSI-TBL:ANY:1:1,STR,OBJ1,OBJ2,OBJ3,OBJ4,CNT,?TMP1,?TMP2,?TMP3
	GET	O-TABLE,0 >CNT
	ZERO?	CNT \?CCL3
	SET	'ACTION-PRSI,FALSE-VALUE
	RTRUE	
?CCL3:	EQUAL?	CNT,4 \?CCL5
	GET	O-TABLE,1 >?TMP3
	GET	O-TABLE,2 >?TMP2
	GET	O-TABLE,3 >?TMP1
	GET	O-TABLE,4
	ICALL	PRSI-SETUP,?TMP3,?TMP2,?TMP1,STACK
	JUMP	?CND1
?CCL5:	EQUAL?	CNT,3 \?CCL7
	GET	O-TABLE,1 >?TMP2
	GET	O-TABLE,2 >?TMP1
	GET	O-TABLE,3
	ICALL	PRSI-SETUP,?TMP2,?TMP1,STACK
	JUMP	?CND1
?CCL7:	EQUAL?	CNT,2 \?CCL9
	GET	O-TABLE,1 >?TMP1
	GET	O-TABLE,2
	ICALL	PRSI-SETUP,?TMP1,STACK
	JUMP	?CND1
?CCL9:	EQUAL?	CNT,1 \?CND1
	GET	O-TABLE,1
	ICALL2	PRSI-SETUP,STACK
?CND1:	GRTR?	CNT,4 \?CCL13
	CALL	PRSI-INPUT,STR,FALSE-VALUE
	RSTACK	
?CCL13:	CALL	PRSI-INPUT,STR,TRUE-VALUE
	RSTACK	


	.FUNCT	PRSI-SETUP:ANY:0:4,OBJ1,OBJ2,OBJ3,OBJ4,CNT
	ASSIGNED?	'OBJ1 \?CND1
	LOC	OBJ1
	ZERO?	STACK /?CND1
	INC	'CNT
	ADD	CNT,5
	PUT	O-TABLE,STACK,OBJ1
?CND1:	ASSIGNED?	'OBJ2 \?CND5
	LOC	OBJ2
	ZERO?	STACK /?CND5
	INC	'CNT
	ADD	CNT,5
	PUT	O-TABLE,STACK,OBJ2
?CND5:	ASSIGNED?	'OBJ3 \?CND9
	LOC	OBJ3
	ZERO?	STACK /?CND9
	INC	'CNT
	ADD	CNT,5
	PUT	O-TABLE,STACK,OBJ3
?CND9:	ASSIGNED?	'OBJ4 \?CND13
	LOC	OBJ4
	ZERO?	STACK /?CND13
	INC	'CNT
	ADD	CNT,5
	PUT	O-TABLE,STACK,OBJ4
?CND13:	PUT	O-TABLE,5,CNT
	ADD	6,CNT
	PUT	O-TABLE,0,STACK
	RTRUE	


	.FUNCT	PRSI-ESSENCE:ANY:0:0
	PUT	O-TABLE,0,0
	ICALL2	FIND-OBJECTS,ESSENCES
	CALL2	PRSI-TBL,STR?304
	RSTACK	


	.FUNCT	ESSENCE-PRSI:ANY:0:0
	EQUAL?	ACTION-OBJECT,ESSENCE-EARTH \?CCL3
	ICALL	PRSI-SETUP,ESSENCE-AIR,ESSENCE-FIRE,ESSENCE-WATER
	JUMP	?CND1
?CCL3:	EQUAL?	ACTION-OBJECT,ESSENCE-AIR \?CCL5
	ICALL	PRSI-SETUP,ESSENCE-EARTH,ESSENCE-FIRE,ESSENCE-WATER
	JUMP	?CND1
?CCL5:	EQUAL?	ACTION-OBJECT,ESSENCE-FIRE \?CCL7
	ICALL	PRSI-SETUP,ESSENCE-EARTH,ESSENCE-AIR,ESSENCE-WATER
	JUMP	?CND1
?CCL7:	ICALL	PRSI-SETUP,ESSENCE-EARTH,ESSENCE-AIR,ESSENCE-FIRE
?CND1:	CALL	PRSI-INPUT,STR?304,TRUE-VALUE
	RSTACK	


	.FUNCT	GET-SPELL:ANY:2:2,C1,C2,TBL,E1,E2
	GETP	C1,P?ESSENCE >E1
	GETP	C2,P?ESSENCE >E2
	GETPT	E1,P?MIX-SPELL
	ZERO?	STACK /?CTR2
	GETPT	E2,P?MIX-SPELL
	ZERO?	STACK \?CCL3
?CTR2:	RETURN	TAG-POWDERS
?CCL3:	GETPT	E1,P?MIX-SPELL >TBL
	GETP	E2,P?TEMP
	GET	TBL,STACK
	RSTACK	


	.FUNCT	TELL-COLOR:ANY:2:2,E1,E2,TBL,P1,P2
	GETP	E1,P?COLOR >P1
	GETP	E2,P?COLOR >P2
	FSET?	P1,COARSE \?CCL3
	FSET?	P2,COARSE \?CCL3
	PRINTI	"coarse "
	JUMP	?CND1
?CCL3:	FSET?	P1,COARSE /?CCL7
	FSET?	P2,COARSE /?CCL7
	PRINTI	"fine "
	JUMP	?CND1
?CCL7:	PRINTI	"medium textured "
?CND1:	GETPT	P1,P?MIX-COLOR >TBL
	GETP	P2,P?TEMP
	GET	TBL,STACK
	PRINT	STACK
	RTRUE	


	.FUNCT	REMOVE-MISSING-POWDERS:ANY:0:0
	ICALL2	EP-CHECK,ESSENCE-FIRE
	ICALL2	EP-CHECK,ESSENCE-WATER
	ICALL2	EP-CHECK,ESSENCE-AIR
	CALL2	EP-CHECK,ESSENCE-EARTH
	RSTACK	


	.FUNCT	EP-CHECK:ANY:1:1,ESS
	IN?	ESS,ESSENCES /FALSE
	DEC	'NUM-POWDERS
	GETP	ESS,P?COLOR
	REMOVE	STACK
	RTRUE	


	.FUNCT	O-MIX:ANY:0:0
	EQUAL?	ACTOR,TAG \?CCL3
	ICALL1	REMOVE-MISSING-POWDERS
	CALL2	FIND-OBJECTS,TAG-POWDERS
	RSTACK	
?CCL3:	EQUAL?	HERE,ZAN-OUTSKIRTS \?CCL5
	FSET?	HERE,SEEN \?CCL5
	CALL2	FIND-OBJECTS,ESSENCES
	RSTACK	
?CCL5:	FIRST?	ESSENCES \FALSE
	CALL2	FIND-OBJECTS,REAGENTS
	RSTACK	


	.FUNCT	MIXTURE-CAST:ANY:0:0
	SET	'MIX-DONE,FALSE-VALUE
	ICALL1	FIXUP-PRAXIX-COMMANDS
	RTRUE	


	.FUNCT	SAVE-SPELL:ANY:0:1,SP
	ASSIGNED?	'SP /?CND1
	SET	'SP,ACTION-OBJECT
?CND1:	GETPT	SP,P?TEMP
	ZERO?	STACK \?CCL5
	PRINTI	"[Error: No Spell TEMP]"
	RTRUE	
?CCL5:	LOC	SP
	PUTP	SP,P?TEMP,STACK
	CALL	UPDATE-MOVE,SP,SAVED-SPELLS
	RSTACK	


	.FUNCT	RESTORE-SPELLS:ANY:0:0,F,N
	FIRST?	SAVED-SPELLS >F /?PRG2
?PRG2:	ZERO?	F /TRUE
	NEXT?	F >N /?BOGUS7
?BOGUS7:	GETP	F,P?TEMP
	ICALL	UPDATE-MOVE,F,STACK
	SET	'F,N
	JUMP	?PRG2


	.FUNCT	ANONF-41:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	TAG-SPELL,LIGHTNING-SPELL \?CCL6
	EQUAL?	TAG-PINCH,ESSENCE-EARTH \?CCL6
	ICALL2	GRAPHIC,G-EVIL-ONE
	PRINTI	"The time seemed right, so I flung the mixture of essences at the Dread Lord and, as an added touch, I grabbed Praxix' staff and pointed it at him as well.  The clouds approached, and before the demon could react, a single bolt of lightning was hurled from the sky, smiting him and the hideous creature that had borne him here. All that remained was his silver locket, which clattered to the ground at our feet."
	CRLF	
	CRLF	
	PRINTI	"But as the smoking remains of the Dread Lord rose into the sky, so did another shape, forming itself from the very ashes. Its face was a pale gray, its eyes a fiery red."
	CRLF	
	CRLF	
	PRINTI	"""You are fortunate to have defeated me,"" it said in a dark whisper, ""but, after all, my form was merely flesh and blood, as was the miserable creature that carried me here."""
	CRLF	
	CRLF	
	PRINTI	"And then, his eyes turned to me, and his gaze burned my skin. ""I shall make it a point that we meet again; and then, we shall see..."" The smoke dissipated, and the voice trailed off into nothingness."
	CRLF	
	CRLF	
	PRINTI	"Praxix, having missed the whole thing, now regained consciousness, and I told him what had happened. Then, I bent down and picked up the demon's locket, placing it in my pack."
	CRLF	
	CRLF	
	PRINTI	"""Well, well,"" he said, proudly. ""We shall be making a Wizard of you yet!"""
	CALL1	END-DEMON
	RSTACK	
?CCL6:	SET	'DEMON-COUNT,10
	ICALL2	HINT,HINT-MAGIC
	PRINTI	"As soon as the mixture left my fingertips, I knew I had failed. For what happened was that "
	EQUAL?	TAG-SPELL,LIGHTNING-SPELL \?CCL11
	PRINTI	"the clouds gathered slowly, and a few small bolts of lightning appeared, though they did not nearly reach the earth."
	RTRUE	
?CCL11:	EQUAL?	TAG-SPELL,LEVITATE-SPELL \?CCL13
	PRINTI	"the demon rose into the air! I had cast a spell of elevation on him, and he merely laughed at my futile effort."
	RTRUE	
?CCL13:	EQUAL?	TAG-SPELL,MUD-SPELL \?CCL15
	PRINTI	"the ground before us turned soft and squishy; I had a mud producing spell, and the demon laughed hideously at my ridiculous effort."
	RTRUE	
?CCL15:	EQUAL?	TAG-SPELL,LIGHT-SPELL \?CCL17
	PRINTI	"the demon's cape started to glow faintly - I had cast the glow spell my mistake!"
	RTRUE	
?CCL17:	EQUAL?	TAG-SPELL,FOG-SPELL \?CCL19
	PRINTI	"a thick fog started to form around us; the demon blew it away with a powerful breath! I had prepared the wrong mixture!"
	RTRUE	
?CCL19:	EQUAL?	TAG-SPELL,FAR-VISION-SPELL \?CCL21
	PRINTI	"a fireball flew from my fingertips, passing the demon by harmlessly - in my haste, I had prepared the wrong mixture!"
	RTRUE	
?CCL21:	PRINTI	"nothing whatever happened."
	RTRUE	


	.FUNCT	TAG-POWDER-MIX:ANY:0:0,OFF
	EQUAL?	ACTION,MIX-COMMAND \FALSE
	GETP	ACTION-PRSI,P?TEMP >OFF
	CALL	GET-SPELL,ACTION-OBJECT,ACTION-PRSI >TAG-SPELL
	REMOVE	ACTION-OBJECT
	REMOVE	ACTION-PRSI
	PRINTI	"Trying not to attract the attention of the demon, I quietly mixed roughly equal amounts of the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" powder and the "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	" powder, hoping the resulting combination would create a powerful lightning spell. In any event, I would soon find out."
	PUTP	TAG-C-RED-POWDER,P?PRSI,FALSE-VALUE
	PUTP	TAG-C-BLUE-POWDER,P?PRSI,FALSE-VALUE
	PUTP	TAG-C-YELLOW-POWDER,P?PRSI,FALSE-VALUE
	PUTP	TAG-C-WHITE-POWDER,P?PRSI,FALSE-VALUE
	PUTP	TAG-RED-POWDER,P?PRSI,FALSE-VALUE
	PUTP	TAG-BLUE-POWDER,P?PRSI,FALSE-VALUE
	PUTP	TAG-YELLOW-POWDER,P?PRSI,FALSE-VALUE
	PUTP	TAG-WHITE-POWDER,P?PRSI,FALSE-VALUE
	CALL	TRAVEL-COMMANDS,TAG,CAST-COMMAND,ADD-PINCH-COMMAND
	RSTACK	


	.FUNCT	V-ADD-PINCH:ANY:0:0
	GETP	ACTION-OBJECT,P?ESSENCE >TAG-PINCH
	ICALL	TRAVEL-COMMANDS,TAG,CAST-COMMAND
	PRINTI	"Then, I added to the mixture just the smallest pinch of the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" powder."
	RTRUE	


	.FUNCT	O-ADD-PINCH:ANY:0:0,F
	ICALL2	FIND-OBJECTS,TAG-POWDERS
	RTRUE	


	.FUNCT	PRSI-TAG-POWDERS:ANY:0:0
	REMOVE	ACTION-OBJECT
	ICALL2	FIND-OBJECTS,TAG-POWDERS
	MOVE	ACTION-OBJECT,TAG-POWDERS
	CALL2	PRSI-TBL,STR?304
	RSTACK	

	.ENDSEG

	.ENDI
