
	.SEGMENT "STAIR"


	.FUNCT	ANONF-158:ANY:0:0
	EQUAL?	ACTION,RIGHT-COMMAND \?CCL3
	PRINTI	"After another long climb, the stairs ended blindly. "
	FSET?	HURTH,IN-PARTY \?CCL6
	PRINTI	"""We have come to the Bern i-Zar,"" Hurth said, motioning to the blank wall that stood before us."
	CRLF	
	CRLF	
	PRINTI	"""It figures,"" I blurted out; Hurth laughed gently, then spoke the word of command that opened the gate."
	JUMP	?CND4
?CCL6:	PRINTI	"Praxix approached the blank wall that lay before us, and sure enough, a gate appeared, then opened."
	CRLF	
	CRLF	
	PRINTI	"""I don't believe I ever will get used to these gates,"" I said, and Praxix smiled."
?CND4:	CALL2	MOVE-TO,BERN-I-DEN
	RSTACK	
?CCL3:	EQUAL?	ACTION,LEFT-COMMAND \?CCL8
	FSET?	STAIR-CHASM,SEEN \?CCL11
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Again, we made the strenuous and dizzying climb to the crumbling stairs."
	CRLF	
	CRLF	
	PRINTI	"""I am not inclined to do this again,"" Bergon said, panting. ""Let us find some way across the chasm or explore elsewhere."""
	JUMP	?CND9
?CCL11:	PRINTI	"The left stair rose in tighter and tighter spirals, the air thinning as we went. Not long before we had hoped to reach the top, the stairs had crumbled and an abyss, perhaps ten paces wide, yawned before us. Beyond that, the stairs continued their seemingly endless climb."
?CND9:	CALL2	MOVE-TO,STAIR-CHASM
	RSTACK	
?CCL8:	EQUAL?	ACTION,DOWN-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Unsure of whether we had seen all there was to see in the lower parts of the caverns, we determined to return to the bottom of the stairs and continue our explorations."
	CALL2	MOVE-TO,STAIR-BOTTOM
	RSTACK	


	.FUNCT	ANONF-159:ANY:0:0
	CALL	TRAVEL-COMMAND?,STAIR-JUNCTION,DOWN-COMMAND
	ZERO?	STACK \FALSE
	CALL	TRAVEL-COMMAND?,STAIR-JUNCTION,LEFT-COMMAND
	ZERO?	STACK \FALSE
	CALL	REMOVE-TRAVEL-COMMAND,HERE,DOWN-COMMAND
	RSTACK	


	.FUNCT	ANONF-160:ANY:0:0
	EQUAL?	ACTION,EXIT-COMMAND \?CCL3
	ICALL2	UPDATE-REMOVE,TALE-BERN-I-ELAN
	PRINTI	"We stepped out of the Bern i-Zar, the Mountain Gate, late in the evening. It was a cold, windy night, filled with countless stars."
	FSET?	HURTH,IN-PARTY \?CCL6
	CRLF	
	CRLF	
	PRINTI	"Hurth stood at the gate. ""I cannot go on, as much as I might wish it; this is the command of Agrith. And yet, you are good friends and shall always be welcome in these halls."" He embraced us all in the Dwarf-fashion, turned, and started back into the gate. ""May the earth give you speed!"" he said as the great door closed behind him."
	JUMP	?CND4
?CCL6:	FSET?	MINAR,IN-PARTY \?CND4
	CRLF	
	CRLF	
	PRINTI	"Our camp had been long silent when Minar spoke. ""I grieve for the Dwarf,"" he said, ""though I knew him not. He was a brave man, and his reckless murder will not go unavenged."""
	CRLF	
	CRLF	
	PRINTI	"""The success of our journey will be our best revenge,"" replied Bergon. ""And I hope it will bring Hurth peace."""
?CND4:	CRLF	
	CRLF	
	PRINTI	"We spoke much of Hurth that evening, as we lay there beneath the moonlit sky."
	FSET?	HURTH,IN-PARTY /?CCL10
	PRINTI	" Praxix said, ""The Dwarves believe that after death, their souls rise up into the heavens as shooting stars."""
	CRLF	
	CRLF	
	PRINTI	"I laid awake for hours that night, eyes fixed on that twinkling firmament, but I saw no shooting stars and, happily, I drifted off into sleep."
	JUMP	?CND8
?CCL10:	ICALL2	PARTY-REMOVE,HURTH
?CND8:	FSET?	OUTSIDE-PRISON,SEEN /?CCL13
	ICALL2	HINT,HINT-PRISON
	JUMP	?CND11
?CCL13:	FSET?	PRISON,SEEN /?CND11
	ICALL2	HINT,HINT-RUNES
?CND11:	FSET?	STAIR-CHASM,SEEN \?CND15
	FSET?	FAR-CHASM,SEEN /?CND15
	ICALL2	HINT,HINT-CHASM
?CND15:	LOC	HINT-PRISON
	ZERO?	STACK \?CND19
	FSET?	DARK-EVIL-CAVERN,SOLVED /?CND19
	ICALL2	HINT,HINT-EVIL-CAVERN
?CND19:	ICALL1	NEXT-DAY
	ZERO?	2ND-PASS /?CND23
	FSET?	HIGH-PLAIN,SEEN \?CND23
	FSET?	BITE-FOREST,SEEN /?CCL29
	FSET?	MINAR,IN-PARTY /?CTR28
	FSET?	ESHER,IN-PARTY \?CCL29
?CTR28:	PRINTI	"The next morning, we retraced our earlier steps, skirting the edge of the lake, and descending back into the forest for our return to Astrix. It was soon midday, and we decided to stop in a nearby clearing for some lunch."
	ICALL2	MOVE-TO,BITE-FOREST
	RTRUE	
?CCL29:	CRLF	
	CRLF	
	ICALL2	N-DAY-TREK,4
	RTRUE	
?CND23:	CRLF	
	CRLF	
	CALL1	GATE-TO-HIGH-PLAIN
	RSTACK	
?CCL3:	EQUAL?	ACTION,DOWN-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Uncertain of whether we had explored enough of these caverns, we decended to the junction of the two stairs."
	CALL2	MOVE-TO,STAIR-JUNCTION
	RSTACK	


	.FUNCT	FIND-CHASM-STRAGGLER:ANY:0:0,A
	SET	'A,NUL-COMMAND
	FSET?	ESHER,IN-PARTY \?CCL3
	GETP	ESHER,P?ROBJ
	EQUAL?	FLOATER,STACK /?CCL3
	SET	'A,LEAVE-ESHER-COMMAND
	JUMP	?CND1
?CCL3:	FSET?	MINAR,IN-PARTY \?CCL7
	GETP	MINAR,P?ROBJ
	EQUAL?	FLOATER,STACK /?CCL7
	SET	'A,LEAVE-MINAR-COMMAND
	JUMP	?CND1
?CCL7:	FSET?	HURTH,IN-PARTY \?CND1
	GETP	HURTH,P?ROBJ
	EQUAL?	FLOATER,STACK /?CND1
	SET	'A,LEAVE-HURTH-COMMAND
?CND1:	GETP	BERGON,P?ROBJ
	EQUAL?	FLOATER,STACK /?CCL15
	CALL	OPTION,BERGON,USE-MAGIC-COMMAND,LEAVE-BERGON-COMMAND,A
	RSTACK	
?CCL15:	CALL	OPTION,BERGON,USE-MAGIC-COMMAND,LEAVE-PRAXIX-COMMAND,A
	RSTACK	


	.FUNCT	ANONF-161:ANY:0:0
	EQUAL?	ACTION,USE-MAGIC-COMMAND \?CCL3
	PRINTI	"Preferring to bring along our entire party, we decided to use Praxix' magic to get ourselves across the chasm on the way down. With that matter settled it was only a short time until we made our way across the abyss."
	CALL2	MOVE-TO,FAR-CHASM
	RSTACK	
?CCL3:	EQUAL?	ACTION,LEAVE-BERGON-COMMAND /?CTR4
	EQUAL?	ACTION,LEAVE-PRAXIX-COMMAND /?CTR4
	EQUAL?	ACTION,LEAVE-HURTH-COMMAND /?CTR4
	EQUAL?	ACTION,LEAVE-MINAR-COMMAND /?CTR4
	EQUAL?	ACTION,LEAVE-ESHER-COMMAND \?CCL5
?CTR4:	EQUAL?	ACTION,LEAVE-BERGON-COMMAND \?CCL13
	SET	'CHASM-STRAGGLER,BERGON
	JUMP	?CND11
?CCL13:	EQUAL?	ACTION,LEAVE-MINAR-COMMAND \?CCL15
	SET	'CHASM-STRAGGLER,MINAR
	JUMP	?CND11
?CCL15:	EQUAL?	ACTION,LEAVE-HURTH-COMMAND \?CCL17
	SET	'CHASM-STRAGGLER,HURTH
	JUMP	?CND11
?CCL17:	EQUAL?	ACTION,LEAVE-ESHER-COMMAND \?CCL19
	SET	'CHASM-STRAGGLER,ESHER
	JUMP	?CND11
?CCL19:	SET	'CHASM-STRAGGLER,PRAXIX
?CND11:	PRINTI	"Preferring to preserve Praxix' supply of magical essences, we decided to leave "
	ICALL2	WPRINTD,CHASM-STRAGGLER
	PRINTI	" behind while we explored the far side of the chasm. It was just a matter of moments until "
	LESS?	PARTY-MAX,4 \?CCL22
	PRINTC	73
	JUMP	?CND20
?CCL22:	PRINTI	"the rest of us"
?CND20:	PRINTI	" made the crossing."
	ICALL2	PARTY-REMOVE,CHASM-STRAGGLER
	CALL2	MOVE-TO,FAR-CHASM
	RSTACK	
?CCL5:	EQUAL?	ACTION,CAST-COMMAND \?CCL24
	EQUAL?	ACTION-OBJECT,WIND-SPELL \?CCL24
	FSET?	HERE,ENCHANTED \?CCL29
	FCLEAR	HERE,ENCHANTED
	GETP	ESHER,P?ROBJ
	EQUAL?	FLOATER,STACK \?CCL32
	PRINTI	"As Esher turned slowly above us, screaming monosyllables at our Wizard-friend, Praxix was busily wiping the "
	ICALL	TELL-COLOR,ESSENCE-AIR,ESSENCE-EARTH
	PRINTI	" residue from his hands and measuring out some additional air essence. ""Have no fear! You'll be down in a moment!"" he said. Then, pausing for a second, he smiled broadly and added some more. With a sharp flick of the wrist, Praxix cast the potent dust at our floating comrade, who quite literally flew across the abyss in a gale-force wind."
	CRLF	
	CRLF	
	PRINTI	"""What did I say?"" shouted Praxix at the Esher-heap that scowlingly stumbled to his feet on the other side. Bergon, unwilling to see this conversation progress, tossed Esher"
	JUMP	?CND30
?CCL32:	PRINTI	"""Do not be alarmed, "
	ICALL2	WPRINTD,FLOATER
	PRINTI	"!"" Praxix said, as he wiped the "
	ICALL	TELL-COLOR,ESSENCE-AIR,ESSENCE-EARTH
	PRINTI	" residue from his hands, and measured out some additional air essence. ""It will just be a moment."" And then, casting the powder at our floating friend, a great wind came up and carried him across the abyss. We tossed "
	ICALL2	WPRINTD,FLOATER
?CND30:	PRINTI	" our rope, and we were soon ready to cross to the far side of the chasm. There was only one problem: since we could find no good anchor for our rope on either side of the abyss, we had to consider how we were to return once we got across. "
	CALL2	CHECK-ESSENCES,WIND-SPELL
	ZERO?	STACK \?CCL35
	GETP	BERGON,P?ROBJ
	EQUAL?	FLOATER,STACK /?CCL38
	SET	'CHASM-STRAGGLER,BERGON
	JUMP	?CND36
?CCL38:	SET	'CHASM-STRAGGLER,PRAXIX
?CND36:	PRINTI	"Our options were limited by the fact that Praxix had no remaining air essence with which to blow somebody back, which left no choice but to have "
	ICALL2	WPRINTD,CHASM-STRAGGLER
	PRINTI	" remain behind. And so it was that "
	ICALL2	WPRINTD,CHASM-STRAGGLER
	PRINTI	" did not follow us across the chasm."
	ICALL2	PARTY-REMOVE,CHASM-STRAGGLER
	CALL2	MOVE-TO,FAR-CHASM
	RSTACK	
?CCL35:	PRINTI	"Since Praxix had some air essence in his pouch, it would be possible to use his wind spell to fling one of our party across the chasm on the way down. On the other hand, we could just as easily leave one of our party behind, and avoid using magic altogether."
	ICALL1	FIND-CHASM-STRAGGLER
	RTRUE	
?CCL29:	CALL	QSET?,HERE,SCOUTED
	ZERO?	STACK \?CCL40
	FSET	HERE,DEAD
	PRINTI	"I don't know what Praxix was thinking when he removed some air essence from his pouch and tossed it at Bergon. A fierce wind came up and blew Bergon to the edge of the abyss; it was only quick thinking "
	FSET?	ESHER,IN-PARTY \?CND41
	PRINTI	"by Esher "
?CND41:	FSET	HERE,GRAY-MIX
	PRINTI	"that saved him from plunging down into that bottomless void. Bergon was quite displeased, though his temper was restrained. ""Let us be a little more careful with our magic,"" he said."
	RTRUE	
?CCL40:	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix gave Bergon a look saying ""How about trying the wind spell again?"" Bergon shot back a look saying, in effect, ""I will murder you if you do."""
	RTRUE	
?CCL24:	FSET?	HERE,ENCHANTED \?CCL44
	CALL1	FLOATER-TO-EARTH
	ZERO?	STACK \TRUE
?CCL44:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL48
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"Bergon asked for our advice; he himself thought of trying to jump across, but got a negative reaction. Praxix suggested that he might have some magic that would help, and this was greeted with some measure of skepticism. Overall, no consensus was achieved."
	RTRUE	
?CCL48:	EQUAL?	ACTION,CROSS-COMMAND \?CCL50
	ICALL1	REMOVE-TRAVEL-COMMAND
	FSET	HERE,DEAD
	PRINTI	"Bergon, being the most powerful member of the group, thought he might try jumping across the gap, then use the rope to bring the rest of us along."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CCL53
	PRINTI	"For once, Esher's pessimism was hard to fault. ""You can't get a running start; the footing's no good; and the stairs at the other end appear to turn a corner. Otherwise, you've got a fine idea."" Bergon reluctantly agreed."
	RTRUE	
?CCL53:	PRINTI	"It didn't take long, however, to convince him that this would be far too dangerous to attempt."
	RTRUE	
?CCL50:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL55
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" suggested trying to scout out an alternative way up the stairs, but this was felt to be fruitless."
	RTRUE	
?CCL55:	EQUAL?	ACTION,CAST-COMMAND \?CCL57
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL57
	FSET	HERE,DEAD
	ICALL1	SAVE-SPELL
	SET	'FLOATER,ACTION-PRSI
	FSET?	HERE,BLUE-MIX \?CCL62
	PRINTI	"Praxix again levitated "
	ICALL2	WPRINTD,FLOATER
	PRINTI	" with his elevation spell."
	CRLF	
	CRLF	
	PRINTI	"""Not again!"" "
	ICALL2	WPRINTD,FLOATER
	PRINTI	" protested, but there was little he could do suspended there, ten feet above our heads."
	JUMP	?CND60
?CCL62:	PRINTI	"Praxix, "
	FSET?	HERE,GRAY-MIX \?CCL65
	PRINTI	"though chastened"
	JUMP	?CND63
?CCL65:	PRINTI	"on his own"
?CND63:	PRINTI	", decided to try a little magic to get us across. Pulling some earth and air essences from his concealed pouch, Praxix mixed them, then cast the mixture onto "
	ICALL2	WPRINTD,FLOATER
	PRINTC	46
	CRLF	
	CRLF	
	PRINTI	"""Hey, wait a minute!"" he said as he rose ten feet into the air before us."
?CND60:	FSET	HERE,ENCHANTED
	FSET	HERE,BLUE-MIX
	RTRUE	
?CCL57:	EQUAL?	ACTION,CAST-COMMAND \?CCL67
	CALL1	PRAXIX-NO-CAST
	RSTACK	
?CCL67:	EQUAL?	ACTION,DOWN-COMMAND \FALSE
	FSET?	HERE,DEAD \?CCL72
	PRINTI	"Having tried our best to cross the chasm, we admitted defeat; slowly,"
	JUMP	?CND70
?CCL72:	PRINTI	"It was pointless to attempt the crossing; slowly,"
?CND70:	PRINTI	" we made our way back down to the junction of the stairs."
	CALL2	MOVE-TO,STAIR-JUNCTION
	RSTACK	


	.FUNCT	ANONF-162:ANY:0:0
	EQUAL?	ACTION,UP-COMMAND \FALSE
	PRINTI	"We continued climbing up the narrow stairs, and finally climbed through the heavy oak door which led into the Sunset Tower."
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-SUNSET-TOWER
	PRINTI	"The view was magnificent! The sun was just setting, and the western sky was ablaze with colors reflected by the high wispy clouds at the horizon. To the east, far-off and shrouded in cloud, stood this mighty tower's twin: the Sunrise Tower"
	ZERO?	2ND-PASS /?CCL6
	PRINTI	", home of Astrix."
	JUMP	?CND4
?CCL6:	PRINTI	" where, it was said, we would find a mighty ally in the Wizard Astrix. To the north, beyond a desert-like plain, the sky was strangely dark and seemingly choked by a heavy, black cloud."
?CND4:	FSET?	HURTH,IN-PARTY \?CND7
	CRLF	
	CRLF	
	PRINTI	"""Our fathers would come to this place to meditate at day's end and pray for the day when we should leave this world,"" Hurth said. ""Only Agrith comes here now, and far less often than in the past. Now that the stair is broken, he may never come again. The world is changing; even this strong tower will not survive what is to come!"""
?CND7:	CALL2	MOVE-TO,SUNSET-TOWER
	RSTACK	


	.FUNCT	ANONF-163:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" looked more closely at the Sunrise Mountain, and the route we would eventually follow to reach the Tower which stood atop the highest crag. It appeared as though numerous paths wound their way up from the shore of the great river, but there was no indication of which would be the best to take."
	RTRUE	


	.FUNCT	ANONF-164:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" took a long look at the Sunrise Tower, and motioned for us to do likewise. ""What do you make of that?"" he said, pointing at a dark shadow which appeared to circle the hooded tower."
	CRLF	
	CRLF	
	FSET?	HURTH,IN-PARTY \?CCL6
	PRINTI	"Hurth, whose vision"
	JUMP	?CND4
?CCL6:	FSET?	BERGON,IN-PARTY \?CCL8
	PRINTI	"Bergon, whose vision"
?CND4:	PRINTI	" was the most acute in our party, peered at the darkening Tower and said, ""If it weren't so far away, I would say it was a bird. But at this distance..."" He paused, shaking his head, then gazed at the shadow yet again. ""It cannot be!"""
	FSET?	PRAXIX,IN-PARTY \TRUE
	CRLF	
	CRLF	
	PRINTI	"Praxix did not agree. ""There are many creatures that cannot be, and yet are. We have seen them ourselves; we have "
	FSET?	HURTH,IN-PARTY /?CND11
	PRINTI	"had "
?CND11:	PRINTI	"one among us! Doubt not your judgement."""
	RTRUE	
?CCL8:	PRINTI	"I peered at the shadow, but could discern nothing more than had Praxix. ""It is too bad that we don't have Bergon here with us,"" I said. ""His vision is quite a bit better than mine,"" I said."
	RTRUE	


	.FUNCT	ANONF-165:ANY:0:0
	ICALL2	SAVE-PROVISION-COMMANDS,TAG
	ICALL2	SAVE-PROVISION-COMMANDS,PRAXIX
	ICALL	PROVISION-COMMANDS,TAG,PICK-UP-COMMAND,DROP-COMMAND,INVENTORY-COMMAND
	ICALL	PROVISION-COMMANDS,PRAXIX,CAST-COMMAND,EXAMINE-COMMAND
	ZERO?	2ND-PASS /FALSE
	REMOVE	SUNRISE-MOUNTAIN
	CALL2	UPDATE-REMOVE,SUNRISE-TOWER-OBJECT
	RSTACK	


	.FUNCT	ANONF-166:ANY:0:0
	ICALL2	RESTORE-PROVISION-COMMANDS,TAG
	CALL2	RESTORE-PROVISION-COMMANDS,PRAXIX
	RSTACK	


	.FUNCT	ANONF-167:ANY:0:0
	EQUAL?	ACTION,LOOK-AROUND-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	ICALL2	WPRINTD,ACTOR
	PRINTI	" searched the tower, finding what appeared to be a spyglass of some kind. It was old and delicately crafted, but many of its lenses were broken, making it more a thing of beauty than an object to be used."
	FSET?	PRAXIX,IN-PARTY \?CCL6
	CRLF	
	CRLF	
	PRINTI	"""It is a work of art,"" Praxix said, ""far more valuable than it would appear. Such handiworks are rare these days; it is a shame that we cannot put it to good use."""
	JUMP	?CND4
?CCL6:	CRLF	
	CRLF	
	PRINTI	"""It is crafted beautifully,"" Bergon said. ""What a shame it cannot be put to good use."""
?CND4:	EQUAL?	ACTOR,ESHER \?CCL9
	CRLF	
	CRLF	
	PRINTI	"""And just how would we put a broken spyglass to use?"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" asked, placing it down on a dusty shelf nearby."
	JUMP	?CND7
?CCL9:	EQUAL?	ACTOR,MINAR \?CND7
	CRLF	
	CRLF	
	PRINTI	"""A shame indeed,"" replied Minar, and placed the spyglass down on a nearby shelf."
?CND7:	FSET	SUNSET-TOWER,SOLVED
	CALL	UPDATE-MOVE,SPYGLASS,HERE
	RSTACK	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL12
	ZERO?	CHASM-STRAGGLER \?CCL12
	CALL2	CHECK-ESSENCES,WIND-SPELL
	ZERO?	STACK \?CCL12
	PRINTI	"Praxix then had the notion of casting his """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell, but he quickly realized that he would be using the air essence we needed for crossing the chasm."
	RTRUE	
?CCL12:	EQUAL?	ACTION,CAST-COMMAND \?CCL17
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL17
	CALL	QSET?,FAR-VISION-SPELL,INCAPACITATED
	ZERO?	STACK \?CCL17
	ICALL	UPDATE-FSET,HERE,DONT-CAST
	CALL1	ASTRIX-RESPONDS-TO-FLARE
	RSTACK	
?CCL17:	EQUAL?	ACTION,DOWN-COMMAND \FALSE
	ICALL1	NEXT-DAY
	ICALL	TRAVEL-COMMANDS,STAIR-JUNCTION,RIGHT-COMMAND,DOWN-COMMAND
	PRINTI	"It was getting late, so we started down the stairs, coming quickly to the chasm"
	ZERO?	CHASM-STRAGGLER /?CCL25
	ICALL2	PARTY-ADD,CHASM-STRAGGLER
	PRINTI	", where "
	ICALL2	WPRINTD,CHASM-STRAGGLER
	PRINTI	" was waiting impatiently."
	SET	'CHASM-STRAGGLER,FALSE-VALUE
	JUMP	?CND23
?CCL25:	ICALL2	USE-ESSENCES,WIND-SPELL
	PRINTI	". Using Praxix' wind spell, Bergon was blown over the edge and onto the far side of the chasm, from which he was able to help the rest of us across."
?CND23:	CRLF	
	CRLF	
	PRINTI	"We were all very tired now from our arduous climb, so we decided to spend the night there on the landing, and in fact did not arise until the next afternoon. It was nearly time for dinner when we started down the stairs."
	CALL2	MOVE-TO,STAIR-JUNCTION
	RSTACK	


	.FUNCT	ASTRIX-RESPONDS-TO-FLARE:ANY:0:0
	REMOVE	HYE-TOWER
	PRINTI	"Praxix thought to signal Astrix using his flare enchantment and so he sent a ball of flame screaming toward the Sunrise Mountain. And then a second ball of flame shot out of the Sunrise Tower! When they met, perhaps three-fourths of the way across, the resulting explosion lit the darkening sky with its blue-white flame and caused the mountains to shudder."
	CRLF	
	CRLF	
	PRINTI	"""It seems we are expected,"" Praxix said."
	RTRUE	


	.FUNCT	FLOATER-TO-EARTH:ANY:0:0
	FCLEAR	HERE,ENCHANTED
	ICALL1	RESTORE-SPELLS
	PRINTI	"Slowly, "
	ICALL2	WPRINTD,FLOATER
	PRINTI	" descended back to the stairs. ""Don't ever do that again!"" he shouted. Praxix shrugged, unconcerned in the least."
	CRLF	
	CRLF	
	RFALSE	

	.ENDSEG

	.ENDI
