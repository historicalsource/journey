
	.SEGMENT "CASTLE"


	.FUNCT	ANONF-309:ANY:0:0
	FSET?	UMBER,IN-PARTY \?CND1
	ICALL	PARTY-CHANGE,UMBER,TAG
	FSET	TAG,SUBGROUP
?CND1:	ZERO?	A-B-FLAG /?CCL5
	CALL	FIRST-IN-PARTY,BERGON,ESHER,MINAR >TRAP-VICTIM
	JUMP	?CND3
?CCL5:	CALL	FIRST-IN-PARTY,ESHER,MINAR >TRAP-VICTIM
?CND3:	ICALL1	DIVIDER
	PRINTI	"""There!"" "
	ICALL2	WPRINTCHR,TRAP-VICTIM
	PRINTI	" cried, pointing to the "
	EQUAL?	PRAXIX-SIGNAL,FAR-VISION-SPELL \?CCL8
	PRINTI	"ball of flame speeding away from an unseen spot"
	JUMP	?CND6
?CCL8:	EQUAL?	PRAXIX-SIGNAL,LIGHTNING-SPELL \?CCL10
	PRINTI	"bolts of lightning striking the ground somewhere"
	JUMP	?CND6
?CCL10:	PRINTI	"sheets of rain falling on a small piece of ground somewhere"
?CND6:	PRINTI	" to the north. ""It's Praxix, sending us a signal!"""
	CRLF	
	CRLF	
	PRINTI	"It had been six hours or more since we had separated from Praxix, and we were losing hope of finding him again. The sighting of this magical manifestation raised our spirits, and we prepared to make our way in his direction."
	CALL1	NEW-DEFAULT
	RSTACK	


	.FUNCT	ANONF-310:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	PRINTI	"It wasn't long before we were on our way toward what we presumed to be Praxix' location. The forest had thinned out somewhat, and we walked with ease through the leaf-covered ground. "
	ICALL2	WPRINTCHR,LEADER
	PRINTI	" was in the lead, and our spirits were high."
	CRLF	
	CRLF	
	FSET?	HURTH,IN-PARTY \?CND4
	PRINTI	"But this was not to be a pleasant afternoon. Just a minute after entering this forest, Hurth began complaining of difficult breathing. As his breathing became increasingly labored, he soon found it too strenuous to walk, and finally he collapsed beneath a tree, wheezing loudly."
	ICALL2	MOVE-TO,ALLERGY-SITE
	RTRUE	
?CND4:	PRINTI	"But all this changed in a moment, as "
	ICALL2	WPRINTCHR,TRAP-VICTIM
	PRINTI	" tripped an invisible cord, setting off a trap. A noose, hidden under the mat of fallen leaves, grabbed his ankle and lifted him high into the air. Before "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" had time to react, the guttural voices of orcs could be heard nearby, moving in "
	CALL2	MY/OUR,2
	PRINT	STACK
	PRINTI	" direction."
	ICALL2	PARTY-REMOVE,TRAP-VICTIM
	CALL2	MOVE-TO,TRAP-SITE
	RSTACK	


	.FUNCT	ANONF-311:ANY:0:0
	FSET?	ESHER,IN-PARTY /?CND1
	FSET	HINT-ALLERGY,BLUE-MIX
?CND1:	ICALL	MAKE-BUSY,HURTH,ILL-COMMAND
	ICALL	UPDATE-MOVE,HURTH-OBJECT,HERE
	CALL	UPDATE-FCLEAR,HURTH-OBJECT,DONT-EXAMINE
	RSTACK	


	.FUNCT	ANONF-312:ANY:0:0
	CALL	QSET?,HERE,BLACK-MIX
	ZERO?	STACK /FALSE
	FSET?	HURTH,IN-PARTY \FALSE
	FSET?	HURTH,BUSY \FALSE
	CRLF	
	CRLF	
	PRINTI	"A moment later, it was over. Hurth, unable to breathe, died there, under the tree. We buried him in silence under the shade of the tree."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CCL9
	PRINTI	"Esher was full of self-recriminations, feeling that he did not move quickly enough to help our friend. But there was little time for such thoughts, and much to be done if we were to accomplish our task."
	JUMP	?CND7
?CCL9:	PRINTI	"In truth, there was nothing to be done, having neither Esher nor Praxix here to help us. It had happened so suddenly, it is entirely possible that they could not have done better."
?CND7:	FCLEAR	HURTH,BUSY
	ICALL2	UPDATE-REMOVE,HURTH-OBJECT
	ICALL2	HINT,HINT-ALLERGY
	CALL2	KILLED-OFF,HURTH
	RSTACK	


	.FUNCT	ANONF-313:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	FSET?	HURTH,BUSY \?CCL6
	PRINTI	"Hurth's condition was deteriorating with such severity, there was not even time to continue ahead in search of aid."
	RTRUE	
?CCL6:	FSET?	HURTH,IN-PARTY /?CCL8
	PRINTI	"Sobered, we started again"
	JUMP	?CND4
?CCL8:	PRINTI	"Gladdened by our success in reviving our stricken friend, we continued"
?CND4:	PRINTI	" in the direction of Praxix, but yet another tragedy befell us, as "
	ICALL2	WPRINTCHR,TRAP-VICTIM
	PRINTI	" tripped an invisible cord, setting off a trap. A net, hidden under the mat of fallen leaves, rose up from the ground, entangling him and lifting him high into the air. Before "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" had time to react, the guttural voices of orcs could be heard nearby, moving in "
	CALL2	MY/OUR,2
	PRINT	STACK
	PRINTI	" direction."
	ICALL2	PARTY-REMOVE,TRAP-VICTIM
	CALL2	MOVE-TO,TRAP-SITE
	RSTACK	
?CCL3:	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,HURTH-OBJECT \FALSE
	FSET	HURTH-OBJECT,BLACK-MIX
	PRINTI	"Esher now rushed over to Hurth and began to examine him, quickly coming to the conclusion that our Dwarvish friend was suffering from a severe allergic reaction, a life-threatening one at that."
	CRLF	
	CRLF	
	ICALL2	UPDATE-REMOVE,HURTH-OBJECT
	FSET?	WARREN-WALLS,SOLVED \?CCL15
	PRINTI	"Fortunately, Esher had found some hawkbane earlier in our journey, and he forced our stricken friend to swallow the bitter root, which he did with great difficulty. But the hawkbane worked within seconds, and Hurth was soon back on his feet, though surprised by the suddenness of the attack."
	CRLF	
	CRLF	
	PRINTI	"""Have you ever been outside of your caverns?"" Esher asked."
	CRLF	
	CRLF	
	PRINTI	"""Never,"" Hurth replied. ""It is generally forbidden."""
	CRLF	
	CRLF	
	PRINTI	"""Then that is the explanation,"" Esher responded. ""Your body is entirely unused to the spores and pollens in the air. It is a good thing I've got an ample supply of the remedy."""
	CALL2	MAKE-UNBUSY,HURTH
	RSTACK	
?CCL15:	PRINTI	"Tragically, Esher had neither potion, herb, nor root that could mitigate the severity of the attack. We tried to comfort Hurth as best we could, but he succumbed within minutes."
	CRLF	
	CRLF	
	PRINTI	"""I should have known,"" Esher said, despondently. ""He has never before walked on the earth, and his body is entirely unfamiliar with the common spores and pollens that we take for granted. I hate to admit it, but I wish Praxix had been here - perhaps he could have used his magic to save Hurth."""
	CRLF	
	CRLF	
	FSET?	BERGON,IN-PARTY \?CCL18
	PRINTI	"""Do not be so hard on yourself, Esher,"" Bergon said. ""There is nothing that could have been done. Let us bury our friend here, and move on."""
	JUMP	?CND16
?CCL18:	PRINTI	"There was little more to be done here than to bury our friend and hope to continue in search of Praxix."
?CND16:	ICALL2	HINT,HINT-ALLERGY
	FCLEAR	HURTH,BUSY
	CALL2	KILLED-OFF,HURTH
	RSTACK	


	.FUNCT	ANONF-314:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"In discussing our course of action, we were inclined to pursue the faint hope of rescuing "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" from his captors."
	CRLF	
	CRLF	
	PRINTI	"""I'm afraid "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" may not survive the orcs long enough for us to find Praxix and return here,"" I said."
	RTRUE	
?CCL3:	EQUAL?	ACTION,TO-PRAXIX-COMMAND \?CCL5
	CALL1	LEAVE-VICTIM-WITH-ORCS
	RSTACK	
?CCL5:	EQUAL?	ACTION,FOLLOW-ORCS-COMMAND \?CCL7
	PRINTI	"Subtlety of movement not being among their strengths, it was a simple matter to find the orcs' camp, not far from where the trap had been set. As "
	CALL1	I/WE
	PRINT	STACK
	PRINTI	" approached, a noisome odor permeated the air, in itself a sign that orcs were near. When "
	CALL1	I/WE
	PRINT	STACK
	PRINTI	" arrived, "
	CALL1	I/WE
	PRINT	STACK
	PRINTI	" found that dozens of orcs were here, perhaps hundreds, living in abject squalor, either out in the open or in makeshift tents of rotten cloth. There was no sign of "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTC	46
	CALL2	MOVE-TO,OUTSIDE-ORC-CAMP
	RSTACK	
?CCL7:	EQUAL?	ACTION,FREE-HIM-COMMAND /?CCL9
	EQUAL?	ACTION,HIDE-COMMAND \FALSE
?CCL9:	ICALL	UPDATE-FSET,HERE,ADVISE
	EQUAL?	ACTION,FREE-HIM-COMMAND \?CCL14
	PRINTI	"""Quickly!"" "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" said, ""The orcs are almost here!"""
	CRLF	
	CRLF	
	PRINTI	"Hurrying to cut the heavily intertwined layers of rope, "
	CALL2	I-WAS/WE-WERE,2
	PRINT	STACK
	PRINTI	" swiftly running out of time. The orcs were nearly upon "
	CALL2	ME/US,2
	PRINT	STACK
	PRINTI	", and "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" would be badly outnumbered. Having little choice"
	JUMP	?CND12
?CCL14:	PRINTI	"With little chance of helping "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" before the orcs arrived"
?CND12:	PRINTI	", "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" hid in the brush nearby, waiting for a better opportunity to help. It was a matter of moments before a half-dozen orcs arrived, armed to the teeth."
	CRLF	
	CRLF	
	PRINTI	"Laughing and taunting, the hideous creatures poked and prodded our friend while "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" could do nothing more than watch in horror. Finally, they took him down and bound him, then led him off into the forest."
	CALL	TRAVEL-COMMANDS,HERE,TO-PRAXIX-COMMAND,FOLLOW-ORCS-COMMAND
	RSTACK	


	.FUNCT	V-USE:ANY:0:0
	PRINTI	"There was little of the red rock left, and this did not appear to be a good time to use it."
	RTRUE	


	.FUNCT	O-USE:ANY:0:0
	CALL2	FIND-OBJECT,RED-ROCK
	RSTACK	


	.FUNCT	ANONF-315:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" asked for advice, and between us we thought up a few suggestions, all bad. We would certainly be massacred if we attempted storming the orc camp, and even then we could not know where "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" was being held."
	FSET?	ACTIVE-MINE,SOLVED \TRUE
	FSET?	RED-ROCK,DEAD /TRUE
	CRLF	
	CRLF	
	PRINTI	"""I wish I knew how the miner did it,"" I said, wistfully thinking back to his magical disappearances."
	RTRUE	
?CCL3:	EQUAL?	ACTION,INVENTORY-COMMAND \?CCL9
	CALL	QSET?,HERE,EXAMINED
	ZERO?	STACK \?CCL9
	PRINTI	"The situation appeared grim, and I wondered if there might be anything in my pack which would help."
	IN?	RED-ROCK,INVENTORY \?CCL14
	FSET	RED-ROCK,DEAD
	PRINTI	" To my astonishment, I came up literally empty-handed, for as I pulled my hand from the pack, I found it to be entirely transparent. And then I put two pieces together: the disappearing miner and the pieces of red rock that had inadvertantly fallen from his sack."
	CRLF	
	CRLF	
	PRINTI	"Reaching back into the pack, I noticed that some powder had been scraped off one of the red rocks. ""A magical reagent!"" I said to myself, proud to have made such an important discovery. ""Praxix will be pleased - if we find him, that is."""
	CALL	TRAVEL-COMMANDS,TAG,PICK-UP-COMMAND,USE-COMMAND,INVENTORY-COMMAND
	RSTACK	
?CCL14:	PRINTI	" It appeared there was not; "
	FSET?	ACTIVE-MINE,SOLVED \?CCL17
	PRINTI	"how I wished we had found the secret to the miner's disappearing trick. It would certainly come in handy just about now!"
	RTRUE	
?CCL17:	PRINTI	"I sighed deeply, certain that "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" was beyond help."
	RTRUE	
?CCL9:	EQUAL?	ACTION,USE-COMMAND \?CCL19
	DEC	'RED-ROCK-COUNT
	ICALL1	RESTORE-TAG-COMMANDS
	PRINTI	"Determined to save "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	", I took one of the red rocks from my pack and pummelled it into a fine powder which I then spread across my body. In a matter of moments, I was completely invisible! Not knowing how long the powder would work, I moved quickly into the heart of the orcs' camp."
	CRLF	
	CRLF	
	PRINTI	"It took quite a while, but I finally found "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	", bound and gagged inside a tent alongside the cooking area."
	CRLF	
	CRLF	
	PRINTI	"""Psst! "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	"!"" I whispered from just beside his right ear. He nearly jumped out of his bonds at the sound of my voice."
	CRLF	
	CRLF	
	PRINTI	"""Mmgmm rumggm,"" he said frantically through his gag."
	CRLF	
	CRLF	
	PRINTI	"""Calm down,"" I said, ""I'm just invisible."" It didn't take long to free him, but we now faced a difficult decision."
	ICALL2	PARTY-ADD,TRAP-VICTIM
	ICALL	MAKE-SUBGROUP,TAG,TRAP-VICTIM
	CALL2	MOVE-TO,ORCS-CAMP
	RSTACK	
?CCL19:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL21
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went off to scout out the orcs camp. A few minutes later, he returned."
	CRLF	
	CRLF	
	PRINTI	"""Lots of orcs,"" he said, panting, ""but no sign of "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	". He's probably being held in one of the tents."""
	RTRUE	
?CCL21:	EQUAL?	ACTION,TO-CAMP-COMMAND \?CCL23
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"One thought was to enter the orcs' camp, and attempt to find our captured friend. But the odds of success were staggeringly small; after all, "
	CALL2	I-WAS/WE-WERE,2
	PRINT	STACK
	PRINTI	" not invisible! No, that would not work, but "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" felt that there must be some strategy that would."
	RTRUE	
?CCL23:	EQUAL?	ACTION,TO-PRAXIX-COMMAND \FALSE
	CALL1	LEAVE-VICTIM-WITH-ORCS
	RSTACK	


	.FUNCT	LEAVE-VICTIM-WITH-ORCS:ANY:0:0
	ICALL2	HINT,HINT-ORC-TRAP
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" was finished; the orcs did not keep prisoners, except for the amusement of their torture. It was a difficult decision, but there was no alternative - "
	CALL2	I/WE,2
	PRINT	STACK
	CALL2	REJOIN-AT-CASTLE,STR?700
	RSTACK	


	.FUNCT	ANONF-316:ANY:0:0
	CALL	CIT,TAG,GET-ADVICE-COMMAND
	RSTACK	


	.FUNCT	ANONF-317:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"First, I looked out from the tent and, indeed, the coast was clear. But how long would that last? It would be safest to use the red rock, but there was only one left, and I feared wasting what little we had of this potent magic. After all, what would Praxix say?"
	CRLF	
	CRLF	
	PRINTI	"""Your instincts have served you well thus far,"" "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" said. ""I would advise you to use them again."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,USE-RED-ROCK-COMMAND \?CCL5
	DEC	'RED-ROCK-COUNT
	ICALL2	UPDATE-REMOVE,RED-ROCK
	PRINTI	"Taking the last of the red rocks from my pack, I crushed it into a powder and spread it over "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	", who obligingly disappeared. Leaving the orcs' camp had been as simple as entering, and we were soon out of danger. Not long afterward, we reappeared."
	CALL1	TRAP-VICTIM-SAVED
	RSTACK	
?CCL5:	EQUAL?	ACTION,RUN-FOR-IT-COMMAND \FALSE
	PRINTI	"Hoping to save as much reagent as possible, we waited for an opportune moment, then dashed into the safety of the nearby trees. Certain we had not been seen, we put some more distance between ourselves and the orcs."
	CALL1	TRAP-VICTIM-SAVED
	RSTACK	


	.FUNCT	TRAP-VICTIM-SAVED:ANY:0:0
	CRLF	
	CRLF	
	PRINTI	"""Thank you, "
	ICALL1	WPRINTTAG
	PRINTI	","" "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" said, placing his arm around my shoulder. ""I hope the orcs are not too disappointed; it seems I was expected for dinner!"" We laughed, but then "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	"'s face turned grim."
	CRLF	
	CRLF	
	PRINTI	"""I am afraid the orcs have seen Praxix' signal as well,"" he said. ""We had best move quickly; I would hate to have them arrive first!"""
	CRLF	
	CRLF	
	CALL2	REJOIN-AT-CASTLE,STR?706
	RSTACK	


	.FUNCT	REJOIN-AT-CASTLE:ANY:1:1,STR
	SET	'REJOINED,TRUE-VALUE
	PRINT	STR
	PRINTI	", "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" came within the hour to the edge of a large clearing, inside of which stood the ruins of an ancient castle."
	FSET?	BERGON,IN-PARTY \?CND1
	CRLF	
	CRLF	
	PRINTI	"""Praxix is here,"" Bergon said, ""I can feel it."""
?CND1:	ICALL1	DIVIDER
	FSET?	UMBER,SUBGROUP \?CCL5
	ICALL	PARTY-CHANGE,TAG,UMBER
	ICALL	MAKE-SUBGROUP,PRAXIX,UMBER
	JUMP	?CND3
?CCL5:	ICALL2	MAKE-SUBGROUP,PRAXIX
?CND3:	PRINTI	"Praxix laughed to himself. What were the odds, he thought, of the signal being seen by the others? It little mattered, for there was little else for him to do."
	IN?	SIXTH-STONE,PRAXIX \?CCL8
	ICALL	UPDATE-FSET,SIXTH-STONE,DONT-EXAMINE
	CRLF	
	CRLF	
	CALL1	PRAXIX-WAITS-FOR-PARTY
	RSTACK	
?CCL8:	CALL2	MOVE-TO,PRAXIX-SIGNAL-ROOM
	RSTACK	


	.FUNCT	PRAXIX-WAITS-FOR-PARTY:ANY:0:0
	IN?	SIXTH-STONE,PRAXIX \?CND1
	ICALL	UPDATE-MOVE,SIXTH-STONE,INVENTORY
	PRINTI	"In truth, he had already done extremely well; the Stone was his. "
?CND1:	PRINTI	"All that was left was to wait and hope. Sitting down at the side of the moat, he "
	FSET?	UMBER,IN-PARTY \?CND3
	PRINTI	"and Umber "
?CND3:	PRINTI	"rested"
	FSET?	UMBER,IN-PARTY \?CND5
	PRINTI	"; hoping to avoid any further conversation with Umber, Praxix feigned sleep"
?CND5:	PRINTC	46
	ICALL1	DIVIDER
	ICALL2	GRAPHIC,G-PARTY-RESCUES-PRAXIX
	FSET?	UMBER,IN-PARTY \?CCL9
	FSET?	CASTLE-TROVE,SEEN /?CCL9
	ICALL2	HINT,HINT-DUNGEON
	JUMP	?CND7
?CCL9:	FSET?	UMBER,IN-PARTY \?CND7
	IN?	SIXTH-STONE,INVENTORY /?CND7
	ICALL2	HINT,HINT-STONES
?CND7:	FSET?	UMBER,IN-PARTY \?CCL17
	PRINTI	"They were both"
	JUMP	?CND15
?CCL17:	PRINTI	"He was"
?CND15:	PRINTI	" awakened by the sound of my voice. ""Praxix! Wake up!"" I shouted from across the moat. "
	FSET?	UMBER,IN-PARTY \?CCL20
	ICALL	PARTY-CHANGE,UMBER,TAG
	PRINTI	"I tossed my rope across to Umber, who held it firmly as Praxix slowly pulled himself across the moat. With Praxix safe, it was time for Umber to attempt the crossing. Strangely, he preferred to stay on the castle grounds, perhaps to stock up on more jewels from the chest in the dungeon."
	CRLF	
	CRLF	
	PRINTI	"""Until we meet again!"" he shouted across to Praxix, and with a wave of his hand he retreated toward the castle."
	CRLF	
	CRLF	
	PRINTI	"""Interesting fellow,"" Praxix said, ""though I believe I preferred him as a tree."""
	CRLF	
	CRLF	
	JUMP	?CND18
?CCL20:	PRINTI	"It wasn't easy, yet "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" managed to rescue him from the castle by using the rope to make up for the broken sections of the bridge; and, thus, we were reunited."
	CRLF	
	CRLF	
?CND18:	ICALL1	CLEAR-SUBGROUP
	ZERO?	A-B-FLAG /?CCL23
	PRINTI	"Praxix listened with great interest as "
	CALL2	I/WE,2
	PRINT	STACK
	PRINTI	" told of "
	CALL2	MY/OUR,2
	PRINT	STACK
	PRINTI	" adventures."
	FSET?	RED-ROCK,SOLVED \?CCL26
	CRLF	
	CRLF	
	PRINTI	"""Tell me, "
	ICALL1	WPRINTTAG
	PRINTI	","" Praxix said, ""Do you still have those red rocks we found in the mines?"""
	CRLF	
	CRLF	
	IN?	RED-ROCK,INVENTORY \?CCL29
	PRINTI	"I said that I did, and, rummaging through my pack, retrieved what remained, giving them to Praxix."
	CRLF	
	CRLF	
	JUMP	?CND27
?CCL29:	PRINTI	"I admitted that I did not, having used them both in saving "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" from almost certin death at the hands of the orcs."
	CRLF	
	CRLF	
	PRINTI	"""Then you have used them well,"" Praxix replied reassuringly, ""I would happily take "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" over any number of magical spells."" And yet, I sensed Praxix' disappointment over not having this powerful magic at his disposal."
?CND27:	ICALL2	UPDATE-REMOVE,RED-ROCK
	EQUAL?	RED-ROCK-COUNT,3 \?CCL32
	PRINTI	"""As you may have guessed, the miner used these rocks to make himself invisible,"" Praxix continued, putting the rocks in his cloak, ""An invisibility spell may well come in useful!"""
	FSET?	OUTSIDE-ORC-CAMP,SEEN \?CND30
	CRLF	
	CRLF	
	PRINTI	"""It might have saved "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	","" I said, frustrated at having "
	FSET?	RED-ROCK,DEAD \?CCL37
	PRINTI	"not used them."
	JUMP	?CND35
?CCL37:	PRINTI	"having forgotten that I had been carrying them. ""If only I had understood!"""
?CND35:	CRLF	
	CRLF	
	PRINTI	"""Do not be so hard on yourself, "
	ICALL1	WPRINTTAG
	PRINTI	","" Praxix replied, ""Only a Wizard could have known the secret of the red rock."""
	JUMP	?CND30
?CCL32:	PRINTI	"""As you have discovered, these rocks are the key to the miner's 'disappearances,'"" Praxix continued, putting the red rocks in his cloak, ""An invisibility spell may be useful again some day!"""
?CND30:	CRLF	
	CRLF	
	JUMP	?CND24
?CCL26:	PRINTC	32
?CND24:	FSET?	MILL,SEEN \?CCL40
	CALL1	CASTLE-MILL-TO-ASTRIX
	RSTACK	
?CCL40:	PRINTI	"We then left the grounds of the castle, following a nearby path. "
	PRINT	PATH-TO-MILL
	CALL2	MOVE-TO,MILL
	RSTACK	
?CCL23:	PRINTI	"""It is good we have found you, Praxix,"" Bergon said, ""for we have still not found the Dwarvish gate that Astrix has sent us to find."""
	CRLF	
	CRLF	
	PRINTI	"""My sense is that is due west of here,"" Praxix responded, and there were none to dispute his instinct."
	CRLF	
	CRLF	
	FSET?	MILL,SEEN \?CCL43
	CALL1	CASTLE-MILL-TO-CAVERNS
	RSTACK	
?CCL43:	PRINTI	"And so we headed west upon the nearest path. "
	PRINT	PATH-TO-MILL
	CALL2	MOVE-TO,MILL
	RSTACK	


	.FUNCT	CASTLE-MILL-TO-CAVERNS:ANY:0:0
	FSET?	XFER-1,SOLVED /?CND1
	ICALL2	HINT,HINT-MILL
?CND1:	FSET?	BERGON,IN-PARTY /?CCL5
	PRINTI	"Praxix now appeared troubled. ""Without Bergon, I fear we should return to Astrix and receive his counsel."" We started marching north, and two days later arrived at Astrix' Sunrise Tower."
	CALL1	PART-TWO-ENDING
	RSTACK	
?CCL5:	PRINTI	"Following Praxix' advice, we now marched west, coming to a path which led directly to the place Astrix had described, the Bern i-Fen. And here, under a cloudy sky, we camped for the night."
	ICALL1	NEXT-DAY
	CALL2	MOVE-TO,FOREST-GATE
	RSTACK	


	.FUNCT	CASTLE-MILL-TO-ASTRIX:ANY:0:0
	FSET?	XFER-1,SOLVED /?CND1
	ICALL2	HINT,HINT-MILL
?CND1:	PRINTI	"And then, we started back to Astrix in his Sunrise Tower."
	CALL1	PART-TWO-ENDING
	RSTACK	

	.ENDSEG

	.ENDI
