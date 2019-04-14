
	.SEGMENT "0"


	.FUNCT	QSET?:ANY:2:2,OBJ,BIT
	FSET?	OBJ,BIT /TRUE
	FSET	OBJ,BIT
	RFALSE	


	.FUNCT	UPDATE-REMOVE:ANY:1:1,OBJ
	CALL2	UPDATE-MOVE,OBJ
	RSTACK	


	.FUNCT	UPDATE-FSET:ANY:2:2,OBJ,BIT
	SET	'UPDATE-FLAG,TRUE-VALUE
	FSET	OBJ,BIT
	RTRUE	


	.FUNCT	UPDATE-FCLEAR:ANY:2:2,OBJ,BIT
	SET	'UPDATE-FLAG,TRUE-VALUE
	FCLEAR	OBJ,BIT
	RTRUE	


	.FUNCT	UPDATE-MOVE:ANY:0:2,OBJ,TO,L
	ASSIGNED?	'OBJ /?CND1
	SET	'OBJ,ACTION-OBJECT
?CND1:	LOC	OBJ >L
	SET	'UPDATE-FLAG,TRUE-VALUE
	ZERO?	TO /?CCL5
	MOVE	OBJ,TO
	RTRUE	
?CCL5:	REMOVE	OBJ
	RTRUE	


	.FUNCT	ANONF-14:ANY:0:0
	EQUAL?	ACTION,DROP-COMMAND \?CCL3
	CALL2	CHARACTER-HERE?,PRAXIX
	ZERO?	STACK /?CCL3
	FSET	SPYGLASS,TRIED
	PRINTI	"I don't know why, but I suddenly had the urge to lighten my pack at the expense of the spyglass that I had taken in the Dwarves' high tower. When Praxix saw what I was about to do, he urged me to keep it, saying it was a rare antiquity of great beauty and, perhaps, value."
	RTRUE	
?CCL3:	EQUAL?	ACTION,PICK-UP-COMMAND \FALSE
	PRINTI	"Although wiser minds than I had concluded that the spyglass was unfit for use, I was nonetheless taken by its beauty, and quietly placed it in my pack. I do not think the others noticed, or, if they did, they said nothing."
	CALL	UPDATE-MOVE,SPYGLASS,INVENTORY
	RSTACK	


	.FUNCT	ANONF-15:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \?CCL3
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	EQUAL?	ACTOR,TAG \?CCL6
	PRINTC	73
	JUMP	?CND4
?CCL6:	ICALL2	WPRINTD,ACTOR
?CND4:	PRINTI	" took a moment to admire the amulet. It was a small, golden orb, and in its center lay a clear stone whose color was like that of the deep oceans. Surrounding the stone were many hundreds of small, white diamonds, woven into an intricate pattern of great beauty."
	RTRUE	
?CCL3:	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL8
	FSET	NYMPH-STONE,TRIED
	ICALL	UPDATE-MOVE,ACTION-OBJECT,INVENTORY
	ICALL1	TREASURY-GRAPHIC
	PRINTI	"Unsure of the wisdom of my intentions, I nonetheless grasped the amulet and took it from atop its pedestal. To my surprise, no alarms rang and no guards charged into the chamber. I held firmly on to the amulet, and planned my escape."
	RTRUE	
?CCL8:	EQUAL?	ACTION,DROP-COMMAND \FALSE
	PRINTI	"Having done so much to obtain the amulet, it would have been foolish to put it down on the ground, so I resisted the temptation to do just that."
	RTRUE	


	.FUNCT	ANONF-16:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	EQUAL?	ACTOR,TAG \?CCL6
	PRINTI	"I decided to check on the contents of the hermit's bag and found five smaller bags of powders, much like those used by Praxix. Presumably, Praxix would want to examine them himself."
	JUMP	?CND4
?CCL6:	EQUAL?	ACTOR,PRAXIX /?CCL8
	ICALL2	WPRINTD,ACTOR
	PRINTI	" looked in the bag, opened it, and sniffed its contents. ""Powders of some sort, I would guess,"" he said."
	CRLF	
	CRLF	
	PRINTI	"Praxix snatched the bag from "
	ICALL2	WPRINTD,ACTOR
	JUMP	?CND4
?CCL8:	PRINTI	"Praxix took the bag, opened it,"
?CND4:	FSET	HERMIT-POWDER,SEEN
	ICALL2	UPDATE-MOVE,HERMIT-POWDER
	ICALL	FIND-ESSENCE,ESSENCE-WATER,3
	ICALL	FIND-ESSENCE,ESSENCE-AIR,2
	ICALL	FIND-ESSENCE,ESSENCE-FIRE,3
	ICALL	FIND-ESSENCE,ESSENCE-EARTH,4
	PRINTI	" and reached inside. Nodding his head knowingly, he pulled five smaller packets from the bag, and said, ""Magical powders. Garlimon was quite resourceful to have salvaged these from the carnage of his party. Perhaps it is the reason he has survived this long."" And then, examining the contents of each packet, he continued. ""The four basic essences are here: air, earth, fire, and water - of course, there's not much of any of them here. But this fifth powder..."" His voice trailed off as he gazed intently at the blue-green powder"
	ZERO?	PART-TWO /?CCL11
	CALL	QSET?,REAGENT,SOLVED
	ZERO?	STACK \?CND12
	ICALL1	FIXUP-PRAXIX-COMMANDS
?CND12:	PRINTI	". ""This must be the reagent that Astrix told us about. How silly of me to have forgotten to examine Garlimon's bag sooner!"""
	JUMP	?CND9
?CCL11:	EQUAL?	HERE,HIGH-PLAIN \?CND14
	PRINTI	", then turned his eyes back toward the hermit's hut"
?CND14:	PRINTI	". ""I have never seen this before. Ah, well! Perhaps Astrix will know it."""
?CND9:	PRINTI	" And with that, he placed the powders among his own."
	RTRUE	


	.FUNCT	ANONF-17:ANY:0:0
	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL3
	ICALL	UPDATE-MOVE,RED-ROCK,INVENTORY
	FSET?	RED-ROCK,DONT-EXAMINE \?CCL6
	PRINTI	"Praxix was very much more interested in the red rock than the miner, though he did not say why. Just in case, I picked up a few small rocks"
	JUMP	?CND4
?CCL6:	PRINTI	"The red rocks intrigued me, so I picked a few up"
?CND4:	PRINTI	" and placed them in my pack for safe keeping."
	FSET	RED-ROCK,DONT-EXAMINE
	FSET	RED-ROCK,SOLVED
	RTRUE	
?CCL3:	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" reached down to pick up the red rock, but was interrupted by the miner."
	CRLF	
	CRLF	
	PRINTI	"""That, my friend, is what you might call junk rock,"" the miner said with an unmistakable tension in his voice. ""Pretty enough, but not worth a tinker's damn."""
	RTRUE	


	.FUNCT	ANONF-18:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"The amulet was a golden brown stone that had been set in another, darker stone, and hung at the end of a chain of gold."
	RTRUE	


	.FUNCT	ANONF-19:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"The stone in the amulet that N'dar had given us was a rich green, like that of the forest itself, and hung on a single strand of some vine-like material that was unfamiliar to me; certainly, no such thing grew back in the plains."
	RTRUE	


	.FUNCT	ANONF-20:ANY:0:0,TMP
	EQUAL?	ACTION,EXAMINE-COMMAND \?CCL3
	EQUAL?	HERE,WEBBAS \?CCL6
	FSET	WEBBA-MAP,DONT-EXAMINE
	IN?	WEBBA-MAP,INVENTORY /?CND7
	PRINTI	"Praxix expressed a keen interest in the map, and Webba obliged him by taking the old parchment from the wall and, not letting it out of his grasp, holding it up before the Wizard. "
?CND7:	ICALL2	SINGLE-MOVE-GRAPHIC,G-MAP
	PRINTI	"The map was old and worn, and of a land unknown to us. Suddenly looking grave, Webba asked, ""So you're going on... to the Outlands?"""
	CALL	OPTION,ACTOR,REPLY-COMMAND,IGNORE-COMMAND
	RSTACK	
?CCL6:	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	FSET?	WEBBA-MAP,ENCHANTED /?CND9
	PRINTI	"As we stood, unsure of which way to proceed, I was asked by "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" to bring out the map we had bought at Webba's. Removing it from my pack, I unfolded it and handed it to him."
	CRLF	
	CRLF	
?CND9:	FSET?	WEBBA-MAP,INCAPACITATED \?CND11
	ICALL2	UPDATE-REMOVE,WEBBA-MAP
	PRINTI	"""Why, this is terrible,"" he said, looking at the mud-soaked and hopelessly damaged map. My fears in the mossy, underground maze had been realized, and I tossed the map away in disgust."
	EQUAL?	HERE,ASTRIX-MAZE /TRUE
	PRINTI	" All we could do was hope the map wouldn't be needed."
	RTRUE	
?CND11:	EQUAL?	HERE,SUNSET-TOWER \?CCL17
	PRINTI	"""Yes,"" Praxix said, looking over the map. ""The paths on the map are there, across the great river. They appear to lead to the tower of Astrix - it is a good thing we bought the map after all!"
?CND15:	FSET?	WEBBA-MAP,DEAD \?CND19
	ICALL	UPDATE-FSET,WEBBA-MAP,DONT-EXAMINE
	ICALL2	SINGLE-MOVE-GRAPHIC,G-MAP
	PRINTI	"Once again, we examined the map carefully, but could discern no method by which we could determine the correct path to Astrix' tower."
	CRLF	
	CRLF	
	PRINTI	"""The map is of no use to us,"" Praxix said finally, and he was right."
	RTRUE	
?CCL17:	EQUAL?	HERE,ASTRIX-MAZE /?CND15
	PRINTI	"His eyes darted from the map to our surroundings, and back again to the map. Then, he slowly shook his head in the negative. ""The map indicates both a river and mountain paths,"" he said. ""It would seem that the map refers to someplace else."" Discouraged, I took back the map and returned it to my pack."
	RTRUE	
?CND19:	PRINTI	"""Yes!"" he said, knowingly. ""There is the river we crossed with the forest behind it, and the mountains - here - lie ahead of us."""
	CRLF	
	CRLF	
	FSET?	WEBBA-MAP,SOLVED \?CCL23
	FSET	WEBBA-MAP,BLUE-MIX
	PRINTI	"""And these runes here, the ones which are glowing faintly,"" Praxix began, ""These mark the path we are to take."
	EQUAL?	ASTRIX-MAZE-ROUTE,1 /?CND24
	PRINTI	" Of course, we'll have to backtrack to the river first, but no matter."
?CND24:	PRINTI	""" "
	CALL1	ARRIVE-AT-ASTRIX-TOWER
	RSTACK	
?CCL23:	FSET	WEBBA-MAP,DEAD
	ICALL2	SINGLE-MOVE-GRAPHIC,G-MAP
	PRINTI	"""But which path is the right one?"" I asked, pointing at the bewildering array of marks which adorned each and every fork."
	CRLF	
	CRLF	
	PRINTI	"""I'm afraid we cannot know,"" Praxix admitted. ""Perhaps they are all good paths,"" he added, with little conviction."
	RTRUE	
?CCL3:	EQUAL?	ACTION,BUY-COMMAND \FALSE
	PRINTI	"Not knowing if it would ever be of use to us, we nevertheless decided to buy the strange map."
	CRLF	
	CRLF	
	GETP	HERE,P?TEMP >TMP
	ZERO?	TMP /?CND28
	ICALL1	CLEAR-BUSY
	PRINTI	"Just then, "
	ICALL2	WPRINTD,TMP
	PRINTI	", having concluded his survey of the shop, wandered back into our midst and stared blankly at the parchment. "
	ICALL	CHANGE-CIT,TMP,1,NUL-COMMAND
?CND28:	PRINTI	"""Rivers, forests, and mountains,"" "
	ZERO?	TMP /?CCL32
	PRINTI	"he"
	JUMP	?CND30
?CCL32:	PRINTI	"Esher"
?CND30:	PRINTI	" said sourly, glancing at the map as I stowed it away in my pack, ""Why, this place could be anywhere!"""
	CRLF	
	CRLF	
	PRINTI	"""Yes,"" answered Praxix, ""and I fear that is precisely where we are headed."""
	CALL	UPDATE-MOVE,WEBBA-MAP,INVENTORY
	RSTACK	


	.FUNCT	ANONF-21:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	GETP	HERE,P?TEMP
	EQUAL?	ACTOR,STACK \?CCL6
	ICALL2	WPRINTD,ACTOR
	PRINTI	" asked us to look over the key more closely. We did, reporting back into the hole that it had no markings, and, given its enormous size, must have been intended for a door of similar proportions."
	RTRUE	
?CCL6:	ICALL2	WPRINTD,ACTOR
	PRINTI	" took the key and looked it over. It was ludicrously large and without markings; the door it was intended to open would presumably match it in proportions."
	RTRUE	


	.FUNCT	ANONF-22:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND /?CCL3
	EQUAL?	ACTION,PICK-UP-COMMAND \FALSE
?CCL3:	ICALL	UPDATE-FSET,SPIRIT-STONE,DONT-EXAMINE
	ICALL	UPDATE-MOVE,SPIRIT-STONE,INVENTORY
	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL8
	PRINTC	73
	JUMP	?CND6
?CCL8:	ICALL2	WPRINTD,ACTOR
?CND6:	PRINTI	" took the white stone from around the neck of Cedrith and held it up before him."
	CRLF	
	CRLF	
	PRINTI	"""It is weightless, or so it seems,"" "
	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL11
	PRINTC	73
	JUMP	?CND9
?CCL11:	PRINTI	"he"
?CND9:	PRINTI	" said, suddenly filled with fear."
	EQUAL?	PRAXIX,ACTOR /?CCL14
	CRLF	
	CRLF	
	JUMP	?CND12
?CCL14:	PRINTC	32
?CND12:	PRINTI	"""It is not of this world!"""
	EQUAL?	PRAXIX,ACTOR /?CND15
	PRINTI	" Praxix responded, taking it in his hand."
?CND15:	CRLF	
	CRLF	
	PRINTI	"""If I heard Astrix correctly, this stone is one of the Two."
	FSET?	STORY-CEDRITH,EXAMINED \?CCL19
	PRINTI	" Cedrith's prize,"" Praxix said, holding up the white stone."
	JUMP	?CND17
?CCL19:	PRINTC	34
?CND17:	PRINTI	" He handed it to me, and I placed it securely in my pack."
	RTRUE	


	.FUNCT	ANONF-23:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"Praxix peered into the round, black stone, and as he did, its blackness grew deeper and darker until Praxix was certain he had gone completely blind. He pressed his eyes tightly closed and thrust the stone within his cloak; when he opened his eyes, his vision had been restored."
	RTRUE	

	.ENDSEG

	.ENDI
