
	.SEGMENT "CASTLE"


	.FUNCT	ANONF-265:ANY:0:0
	FCLEAR	PRAXIX,LIT
	RTRUE	


	.FUNCT	ANONF-266:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" tried to scout out the area, but the heavy mist made his task all but impossible."
	CRLF	
	CRLF	
	EQUAL?	ACTOR,HURTH \?CCL6
	PRINTI	"""I cannot say what lies ahead,"" he announced, ""though I have found some heavy tracks in the mud which I fear to be orc footprints. We must be careful, and move quietly!"""
	RTRUE	
?CCL6:	PRINTI	"""It's not good,"" he said, ""There are footprints in the mud just ahead, and I doubt their owners are friendly."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	PRINTI	"Early the next morning, we started again. The air was heavy with mist, and it was difficult to see just a few paces before us. We had been moving silently for an hour when "
	ICALL2	WPRINTD,LEADER
	PRINTI	" became alarmed."
	CRLF	
	CRLF	
	PRINTI	"Gathering together, we soon learned that Praxix was missing from our ranks. ""Praxix! Praxix!"" we called, but there was no reply, only the sounds of the forest."
	CRLF	
	CRLF	
	PRINTI	"""Praxix! Praxix!"" The words fell only upon the deaf ears of the forest."
	ICALL1	DIVIDER
	ICALL2	MAKE-SUBGROUP,PRAXIX
	CALL2	MOVE-TO,TREE-FORK
	RSTACK	


	.FUNCT	V-ASK-TREE:ANY:0:0
	ICALL2	TELL-TALE,ACTION-OBJECT
	RTRUE	


	.FUNCT	O-ASK-TREE:ANY:0:0
	CALL2	FIND-OBJECTS,ASK-TREE-OBJECTS
	RSTACK	


	.FUNCT	ANONF-267:ANY:0:0
	PRINTI	"""Where am I?"" Praxix asked, thinking it might help. It didn't."
	CRLF	
	CRLF	
	PRINTI	"""You're here with me,"" the tree replied."
	CRLF	
	CRLF	
	PRINTI	"""And where would that be?"" Praxix tried."
	CRLF	
	CRLF	
	PRINTI	"""In the forest?"" the tree replied uncertainly, trying his best to be helpful."
	CRLF	
	CRLF	
	PRINTI	"Praxix slumped to the ground, rubbing his head. This was shaping up to be a miserable day, he thought. Best to leave this leaf-laden philosopher and try to find the others."
	RTRUE	


	.FUNCT	ANONF-268:ANY:0:0
	FSET	ASK-TREE-PATHS,SEEN
	ICALL	TRAVEL-COMMANDS,HERE,MILKY-WAY-COMMAND,ROAD-TO-RUIN-COMMAND,GARDEN-PATH-COMMAND
	ICALL2	UPDATE-REMOVE,ACTION-OBJECT
	PRINTI	"Hoping at least to get some useful information from this root-bound nuisance, Praxix asked, ""Do you know where these paths lead?"""
	CRLF	
	CRLF	
	PRINTI	"""Why, of course; on the left is the Milky Way, right in front of you is the road to ruin, and here on the right is the garden path,"" the tree replied matter-of-factly."
	CRLF	
	CRLF	
	PRINTI	"""I don't suppose you have a preference,"" Praxix asked with little hope."
	CRLF	
	CRLF	
	PRINTI	"""No, I've never felt the need for one,"" the tree responded, ""I'm not going much of anywhere."" And with that, he shook a few branches to indicate the limits of his movement."
	RTRUE	


	.FUNCT	ANONF-269:ANY:0:0
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK \FALSE
	PRINTI	"""Praxix! Praxix!"" the voice cried out. ""Wake up!"""
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-TALKING-TREE
	PRINTI	"Praxix rose slowly and took stock of his situation. After separating from the group, he had wandered aimlessly through the dense fog for the better part of the morning before stopping to indulge in the tasty, red berries that blanketed the ground beneath him. And then, he fell into a deep, yet restless, sleep."
	CRLF	
	CRLF	
	PRINTI	"Now, someone was calling him, but who? He swung around, but found himself alone. His head ached, and he wished for nothing more than to be left in peace until the pain subsided."
	CRLF	
	CRLF	
	PRINTI	"""Praxix! Don't you have anything better to do,"" the voice continued, ""than to sleep the day away?"""
	CRLF	
	CRLF	
	PRINTI	"Praxix swung around again and faced a modest-sized oak tree as it was just finishing the preceding question. ""You know my name?"" he asked, startled more by the personal reference than the fact that he was being addressed in whatever fashion by the local flora."
	CRLF	
	CRLF	
	PRINTI	"""Why, of course!"" the tree replied enthusiastically. ""All trees sing your praises."""
	CRLF	
	CRLF	
	PRINTI	"""They do?"" Praxix responded coyly, for he was not above flattery."
	CRLF	
	CRLF	
	PRINTI	"""Oh, my, yes! We know how you helped old Tully when his house caught fire. And then there was the poor Helspar widow, how you helped her..."""
	CRLF	
	CRLF	
	PRINTI	"""Yes, yes, I see,"" Praxix interrupted, not wishing to pursue the matter further. But he did not see, at least very clearly, and his head throbbed in much the same way that he expected the Tremor spell would cause if cast upon his cranium."
	CALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,ASK-TREE-COMMAND,EXAMINE-COMMAND
	RSTACK	


	.FUNCT	ANONF-270:ANY:0:0
	EQUAL?	ACTION,LEFT-COMMAND /?CTR2
	EQUAL?	ACTION,MILKY-WAY-COMMAND \?CCL3
?CTR2:	IN?	TALKING-TREE,HERE \?CCL8
	ICALL2	LEAVE-TREE,STR?55
	JUMP	?CND6
?CCL8:	PRINTI	"This time he took the leftmost path. "
?CND6:	PRINT	PATH-TO-MILL
	CALL2	MOVE-TO,MILL
	RSTACK	
?CCL3:	EQUAL?	ACTION,CENTER-COMMAND /?CTR9
	EQUAL?	ACTION,ROAD-TO-RUIN-COMMAND \?CCL10
?CTR9:	IN?	TALKING-TREE,HERE \?CCL15
	ICALL2	LEAVE-TREE,STR?172
	JUMP	?CND13
?CCL15:	PRINTI	"This time he took the center path. "
?CND13:	PRINTI	"Although the path twisted its way through the forest, it had been a more important thoroughfare long ago, as evidenced by the crumbling stonework lying by the wayside. "
	PRINT	MOAT-DESC
	CALL2	MOVE-TO,OUTSIDE-MOAT
	RSTACK	
?CCL10:	EQUAL?	ACTION,RIGHT-COMMAND \?CCL17
	ICALL1	REMOVE-TRAVEL-COMMAND
	CALL1	GUARDED-PATH
	RSTACK	
?CCL17:	EQUAL?	ACTION,GARDEN-PATH-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	CALL1	GUARDED-PATH
	RSTACK	


	.FUNCT	ANONF-271:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	FSET	MILL-MACHINERY,EXAMINED
	FSET	HERE,NEAR-DARK
	PRINTI	"Badly rusted from many years of disuse, the mill machinery stood as it had for countless years. Praxix attempted to turn the great water wheel, but it had rusted to the point of inoperability. He did, however, notice a small passageway leading down from the machinery into a darker area below."
	CALL	ADD-TRAVEL-COMMAND,HERE,DOWN-COMMAND
	RSTACK	


	.FUNCT	MILL-TO-ASTRIX:ANY:0:0
	ICALL2	HINT,HINT-CASTLE
	FSET?	MILL,SEEN \?CND1
	FSET?	XFER-1,SOLVED /?CND1
	ICALL2	HINT,HINT-MILL
?CND1:	ICALL1	RESTORE-TAG-OBJECTS
	PRINTI	"Knowing the Sunset Mountain to be generally north and east of his position, Praxix slowly made his way to Astrix' tower."
	CRLF	
	CRLF	
	PRINTI	"The rest of us, having lost hope of reuniting with Praxix, also made our way back, arriving the next day. But while we were glad to have seen Praxix alive, we had failed at our quest for the Stones."
	CALL1	PART-TWO-ENDING
	RSTACK	


	.FUNCT	ANONF-272:ANY:0:0
	FSET?	PRAXIX,LIT \FALSE
	FSET?	MILL-MACHINERY,EXAMINED \FALSE
	CALL	FORCE-TRAVEL-COMMAND,HERE,DOWN-COMMAND
	RSTACK	


	.FUNCT	ANONF-273:ANY:0:0,TMP
	EQUAL?	ACTION,DOWN-COMMAND \?CCL3
	FSET?	PRAXIX,LIT /?CCL6
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"It took only a few steps for Praxix to realize that the path leading inside the mill mechanism was dark and potentially dangerous. Rather than risk injury, he returned to the open air."
	RTRUE	
?CCL6:	ZERO?	SUBGROUP-MODE \?CND7
	PRINTI	"Praxix insisted in exploring the mechanism himself, and we soon wished that he hadn't."
	CRLF	
	CRLF	
	ICALL2	MAKE-SUBGROUP,PRAXIX
?CND7:	PRINTI	"At first, it appeared that the passage was merely some maintenance path with access to the internal working parts of the mill mechanism. However, the path soon reached a set of stone steps that led down beneath ground level, ending at the junction of two paths."
	CRLF	
	CRLF	
	PRINTI	"But no sooner had Praxix started to think about where to proceed next, the ground collapsed beneath the steps, and the resulting avalanche of stone completely buried his only known route to the outside."
	ICALL2	MOVE-TO,XFER-JCN
	CALL2	PARTY-PCM,PRAXIX
	ADD	STACK,1 >TMP
	GET	PARTY,TMP >TAG-SWAP-CHR
	CALL2	PARTY-PCM,TAG
	PUT	PARTY,STACK,TAG-SWAP-CHR
	PUT	PARTY,TMP,TAG
	FSET	TAG,SHADOW
	CALL2	SCENE,MILL-SCENE
	RSTACK	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	CALL1	LEAVE-MILL-AREA
	RSTACK	


	.FUNCT	ANONF-274:ANY:0:0
	EQUAL?	ACTION,INVENTORY-COMMAND \?CCL3
	PRINTI	"Praxix took stock of his possessions finding "
	CALL2	LIST-CONTENTS,INVENTORY
	ZERO?	STACK \?CCL6
	PRINTI	"only"
	JUMP	?CND4
?CCL6:	PRINTI	" and"
?CND4:	PRINTI	" his magical paraphenalia - his staff and pouch of powders."
	CALL	UPDATE-FSET,HERE,INVENTORIED
	RSTACK	
?CCL3:	EQUAL?	ACTION,DROP-COMMAND \FALSE
	EQUAL?	HERE,XFER-1-ANTE,XFER-2-ANTE,XFER-3-ANTE \?CCL11
	EQUAL?	HERE,XFER-1-ANTE \?CCL14
	PUSH	XFER-1
	JUMP	?CND12
?CCL14:	EQUAL?	HERE,XFER-2-ANTE \?CCL16
	PUSH	XFER-2
	JUMP	?CND12
?CCL16:	PUSH	XFER-3
?CND12:	ICALL	UPDATE-MOVE,ACTION-OBJECT,STACK
	PRINTI	"Thinking it might be helpful, Praxix dropped the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" over the railing and down to the bottom of the pit, where it landed "
	EQUAL?	HERE,XFER-1-ANTE \?CCL19
	PRINTI	"almost immediately."
	RTRUE	
?CCL19:	PRINTI	"more than a couple of seconds later."
	CRLF	
	CRLF	
	PRINTI	"""An awfully long way down,"" he said, gazing absently into the abyss."
	RTRUE	
?CCL11:	PRINTI	"Praxix thought to drop the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	", but felt it imprudent to do so."
	RTRUE	


	.FUNCT	LEAVE-MILL-AREA:ANY:0:0
	ZERO?	REJOINED /?CCL3
	ICALL1	CLEAR-SUBGROUP
	ZERO?	A-B-FLAG /?CCL6
	CALL1	CASTLE-MILL-TO-ASTRIX
	RSTACK	
?CCL6:	CALL1	CASTLE-MILL-TO-CAVERNS
	RSTACK	
?CCL3:	FSET?	CASTLE-BRIDGE,SEEN \?CCL8
	CALL1	MILL-TO-ASTRIX
	RSTACK	
?CCL8:	PRINTI	"Leaving the vicinity of the mill, Praxix re-entered the forest, taking a more easterly course. "
	PRINT	MOAT-DESC
	CALL2	MOVE-TO,OUTSIDE-MOAT
	RSTACK	


	.FUNCT	LEAVE-TREE:ANY:1:1,STR
	PRINTI	"Happily ridding himself of this garrulous tree, Praxix strode off upon the "
	PRINT	STR
	PRINTI	" path. What little fog remained had now cleared, and the same could be said for the cottony feeling in his mouth and head."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	GUARDED-PATH:ANY:0:0
	IN?	TALKING-TREE,HERE \?CND1
	ICALL2	GRAPHIC,G-FOREST
	ICALL2	UPDATE-REMOVE,TALKING-TREE
	GETP	HERE,P?EXIT
	ICALL	STACK
	ICALL2	LEAVE-TREE,STR?57
?CND1:	PRINTI	"Before long, he approached a heavily guarded area, an armed compound of some kind. It took only a moment to realize that this was orc territory, and that he was in great danger. Carefully retracing his steps, he found his way back to the fork; the talking tree was gone."
	RTRUE	


	.FUNCT	ANONF-275:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Praxix' eye passed along the course of the bridge. Once supported by huge stone pillars which rose high into the air, the roadway was now barely suspended above the water, its wooden planking rotted nearly to non-existence."
	RTRUE	


	.FUNCT	ANONF-276:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Looking down at the moat itself was none too pleasant; the water had a dark greenish cast, and strange red weeds covered much of the surface. Every so often, large bubbles of air surfaced, from what source Praxix could only imagine."
	RTRUE	


	.FUNCT	ANONF-277:ANY:0:0
	ICALL	UPDATE-MOVE,MOAT-BRIDGE,HERE
	CALL	UPDATE-MOVE,MOAT-WATER,HERE
	RSTACK	


	.FUNCT	ANONF-278:ANY:0:0
	EQUAL?	ACTION,CROSS-COMMAND \FALSE
	PRINTI	"Praxix decided to explore the castle; gingerly, he made his way across the bridge, the boards creaking and groaning with each step he took. Halfway across, the board beneath his feet gave way, and he was nearly over the side when his arm caught hold of a supporting brace. Pulling himself to his feet, he realized that getting to the castle and back again would be chancy at best."
	CALL2	MOVE-TO,CASTLE-BRIDGE
	RSTACK	


	.FUNCT	ANONF-279:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"Resolved to go on, Praxix took greater care in crossing the final half of the bridge, arriving with no further incident to himself. The bridge was another matter; having had just about enough from the long ages, it crumbled and sank into the moat, leaving behind a single large pier standing (or, rather, leaning) near the moat's midpoint."
	CRLF	
	CRLF	
	PRINTI	"What remained of an ancient castle lay before him and he walked eagerly into what would have been the courtyard. Of the four towers which had guarded this fortress, only one stood, and that only barely; the others lay in piles of broken stone and mortar."
	CALL2	MOVE-TO,CASTLE-COURTYARD
	RSTACK	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	PRINTI	"Not wishing to chance being trapped on the castle grounds, Praxix returned to the safety of the near shore. "
	FSET?	MILL,SEEN \?CCL8
	CALL1	MILL-TO-ASTRIX
	RSTACK	
?CCL8:	PRINTI	"Following the only path nearby, he re-entered the forest and was soon at the edge of the river he presumed to be the same we had followed in leaving the lower levels of the caverns. At the river's edge stood the crumbling remains of an old mill building."
	CALL2	MOVE-TO,MILL
	RSTACK	


	.FUNCT	ANONF-280:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Praxix made a complete circle gazing at the remains of this castle. Besides the fragments of three towers and the ghostly spectre of the fourth, little remained to tell the tale of the castle's past."
	RTRUE	


	.FUNCT	ANONF-281:ANY:0:0
	FSET	HERE,SEEN
	FSET?	CASTLE-TOWER,SEEN /?PRD5
	ZERO?	PRAXIX-SIGNAL /FALSE
?PRD5:	FSET?	CASTLE-TROVE,SEEN /?CCL3
	FSET?	UMBER,IN-PARTY /FALSE
	FSET?	CASTLE-DUNGEON,SEEN \FALSE
?CCL3:	ZERO?	PRAXIX-SIGNAL /?CCL14
	CRLF	
	CRLF	
	CALL1	PRAXIX-WAITS-FOR-PARTY
	RSTACK	
?CCL14:	ICALL	REMOVE-TRAVEL-COMMAND,HERE,TOWER-COMMAND
	GETPT	HERE,P?TRAVEL-COMMANDS
	GET	STACK,0
	EQUAL?	STACK,NUL-COMMAND \FALSE
	CRLF	
	CRLF	
	PRINTI	"And so it was that Praxix became stranded on this man-made island, with no means of escape and no help in sight."
	CALL2	CHECK-ESSENCES,FAR-VISION-SPELL
	ZERO?	STACK \FALSE
	CALL2	CHECK-ESSENCES,LIGHTNING-SPELL
	ZERO?	STACK \FALSE
	CALL2	CHECK-ESSENCES,RAIN-SPELL
	ZERO?	STACK \FALSE
	ICALL2	HINT,HINT-SIGNAL
	ICALL1	DIVIDER
	PRINTI	"The rest of us, having lost hope of reuniting with Praxix, slowly made our way back to Astrix. Sadly, we never saw Praxix again."
	CALL1	PART-TWO-ENDING
	RSTACK	


	.FUNCT	ANONF-282:ANY:0:0
	CALL1	SENDING-SIGNAL?
	ZERO?	STACK /?CCL3
	CALL1	PRAXIX-SENDS-SIGNAL
	RSTACK	
?CCL3:	EQUAL?	ACTION,TOWER-COMMAND \?CCL5
	PRINTI	"Walking into the base of the tower, he saw two staircases, one rising to the battlements above, the other descending beneath the ground into darkness."
	CALL2	MOVE-TO,CASTLE-BASE
	RSTACK	
?CCL5:	EQUAL?	ACTION,MOAT-COMMAND \FALSE
	PRINTI	"Heading back toward the moat, Praxix surveyed the damage. Hardly a piece of the collapsed bridge remained above the surface; there would be no crossing here. And as for the water, it looked no more appetizing than when he first cast his eyes upon it."
	ICALL	TRAVEL-COMMANDS,HERE,TOWER-COMMAND
	ICALL	UPDATE-MOVE,MOAT-WATER,INSIDE-MOAT
	CALL2	MOVE-TO,INSIDE-MOAT
	RSTACK	


	.FUNCT	SENDING-SIGNAL?:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL /?PRD6
	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL /?PRD6
	EQUAL?	ACTION-OBJECT,RAIN-SPELL \FALSE
?PRD6:	ZERO?	PRAXIX-SIGNAL \FALSE
	RTRUE	


	.FUNCT	ANONF-283:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	EQUAL?	ACTION-OBJECT,WIND-SPELL /?PRD6
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL3
?PRD6:	CALL	QSET?,HERE,ENCHANTED
	ZERO?	STACK \?CCL3
	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix considered using some combination of elevation and wind to get him across the moat, but first he did some figuring. And the figuring told him that he was an odds-on favorite to land inside of the moat rather than beyond it. Praxix was not by nature a betting man, and it occurred to him that this would be a poor time to start."
	CRLF	
	CRLF	
	PRINTI	"""I could use a good length of rope,"" he said to a bird which had just perched nearby. ""If the others were here, I wouldn't have this problem, would I?"""
	RTRUE	
?CCL3:	CALL1	SENDING-SIGNAL?
	ZERO?	STACK /?CCL10
	CALL1	PRAXIX-SENDS-SIGNAL
	RSTACK	
?CCL10:	EQUAL?	ACTION,COURTYARD-COMMAND \?CCL12
	PRINTI	"There was little for Praxix to do here than wonder how he had gotten himself into this predicament, so he returned to the courtyard."
	CALL2	MOVE-TO,CASTLE-COURTYARD
	RSTACK	
?CCL12:	EQUAL?	ACTION,SWIM-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"It occurred to Praxix to swim across the moat, but he decided to test the waters first. So, removing his shoe, he dipped an unwilling toe into the moat. The first sensation he felt was warmth; then, an odd tingling feeling gripped him. The water's surface rippled disturbingly, and Praxix swore he felt something pincer-like grab at his toe just as he pulled it from the water. Needless to say, Praxix gave up any thought of subjecting other body parts to the moat."
	RTRUE	


	.FUNCT	ANONF-284:ANY:0:0
	FSET?	CASTLE-TOWER,SEEN \?CCL3
	FSET?	CASTLE-DUNGEON,SEEN /FALSE
?CCL3:	CALL2	REMOVE-PARTY-COMMAND,COURTYARD-COMMAND
	RSTACK	


	.FUNCT	ANONF-285:ANY:0:0
	EQUAL?	ACTION,UP-COMMAND \?CCL3
	FSET?	CASTLE-TOWER,SEEN \?CND4
	ICALL1	REMOVE-TRAVEL-COMMAND
?CND4:	PRINTI	"Praxix"
	FSET?	UMBER,IN-PARTY \?CND6
	PRINTI	", with Umber in tow,"
?CND6:	PRINTI	" climbed the crumbling stairs and was soon atop the tower."
	CALL2	MOVE-TO,CASTLE-TOWER
	RSTACK	
?CCL3:	EQUAL?	ACTION,DOWN-COMMAND \?CCL9
	CALL1	CASTLE-DUNGEON-MOVE
	RSTACK	
?CCL9:	EQUAL?	ACTION,COURTYARD-COMMAND \FALSE
	PRINTI	"From there, it was a short walk back to the courtyard."
	CALL2	MOVE-TO,CASTLE-COURTYARD
	RSTACK	


	.FUNCT	CASTLE-DUNGEON-MOVE:ANY:0:0
	PRINTI	"Climbing down the darkened stairway, Praxix"
	FSET?	UMBER,IN-PARTY \?CND1
	PRINTI	" and Umber"
?CND1:	PRINTI	" soon reached the level below, a dungeon of crumbling prison cells. The oppressive moisture and the passage of time had taken a heavy toll on the wooden prison doors, which stood open in ghostly silence."
	CALL2	MOVE-TO,CASTLE-DUNGEON
	RSTACK	


	.FUNCT	ANONF-286:ANY:0:0
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK \?CCL3
	ICALL2	GRAPHIC,G-UMBER
	PRINTI	" Much to his surprise, he was not alone, for a man was already there, leaning over a battlement and staring toward the distant horizon. As Praxix approached, the man turned and greeted him with unrestrained enthusiasm, as though he were a dear friend long absent and presumed dead."
	CRLF	
	CRLF	
	PRINTI	"""Ah, Praxix, my friend! We meet again!"" he said."
	CRLF	
	CRLF	
	PRINTI	"Praxix approached this too cheerful young man of whom he had no particular recollection. ""Does this mean we have met before?"" he asked."
	CRLF	
	CRLF	
	PRINTI	"""Yes we have, though you were somewhat - what's the word - confused?"" he replied, and leaned forward towards Praxix' mouth, sniffing."
	CRLF	
	CRLF	
	PRINTI	"""Indeed?"" said Praxix, eyebrows raised."
	CRLF	
	CRLF	
	PRINTI	"""No. I think I meant to say 'incoherent.' "
	ZERO?	ASK-TREE-PATHS /?CCL6
	PRINTI	"First, you told all sorts of odd stories about yourself, and then you asked some questions. Told you about these ruins, as a matter of fact."
	JUMP	?CND4
?CCL6:	PRINTI	"You told me all sorts of stories about yourself, then ran off."
?CND4:	PRINTI	" I don't mean to be getting personal, seeing as how we've just barely met, but I'd be staying away from those berries if I were you. At least early in the day."""
	CRLF	
	CRLF	
	PRINTI	"""Ah, yes. I do remember,"" Praxix admitted, turning the faintest shade of red. There was no talking tree, he realized; only a vivid hallucination brought upon, apparently, by the berries he had indulged in earlier in the day."
	CRLF	
	CRLF	
	PRINTI	"""I don't know about you, but I could use a little company. May I join you?"" the man asked."
	CALL	OPTION,PRAXIX,ACCEPT-COMMAND,DECLINE-COMMAND
	RSTACK	
?CCL3:	CALL2	GRAPHIC,G-UMBER
	RSTACK	


	.FUNCT	ANONF-287:ANY:0:0,CNT,CHR
	EQUAL?	ACTION,DOWN-COMMAND \?CCL3
	FSET?	CASTLE-TROVE,SEEN /?CTR5
	FSET?	CASTLE-DUNGEON,SEEN \?CCL6
	FSET?	UMBER,IN-PARTY /?CCL6
?CTR5:	CALL	MOVE-TO,CASTLE-BASE,STR?651
	RSTACK	
?CCL6:	CALL1	CASTLE-DUNGEON-MOVE
	RSTACK	
?CCL3:	EQUAL?	ACTION,ACCEPT-COMMAND \?CCL12
	PRINTI	"There was no apparent harm in this, so Praxix assented."
	CRLF	
	CRLF	
	ICALL	PARTY-CHANGE,TAG,UMBER
	FSET	UMBER,SUBGROUP
	SET	'UPDATE-FLAG,TRUE-VALUE
	PRINTI	"""Name's Umber,"" the man said by way of belated introduction, ""and I'm pleased to meet you."" He put out his hand, and smiled broadly, reminding Praxix of the used merchandise sellers whom he despised so deeply."
	CRLF	
	CRLF	
	PRINTI	"""What have I done?"" Praxix asked the heavens with upraised hands. ""Trapped up here with... with..."" He paused, choosing his words with care. ""With my party out there,"" he said, moving his hands across the broad expanse of forest that lay before him."
	CRLF	
	CRLF	
	PRINTI	"""Don't they know you're here?"" Umber asked, once again smiling."
	CRLF	
	CRLF	
	PRINTI	"A brilliant thought crossed Praxix' mind, then left as quickly as it had entered. ""No, we were separated in the fog this morning."""
	CRLF	
	CRLF	
	PRINTI	"""Ah. Did I hear you say 'trapped'?"" Umber asked, smile waning."
	CRLF	
	CRLF	
	PRINTI	"""Yes, trapped. The bridge collapsed as I crossed it. So unless you're up for a swim in the moat...,"" was Praxix' reply, and it left Umber at a loss for words and smiles."
	CALL1	END-OPTION
	RSTACK	
?CCL12:	EQUAL?	ACTION,DECLINE-COMMAND \?CCL14
	ICALL2	HINT,HINT-UMBER
	PRINTI	"""I'm sorry, but I think not,"" Praxix replied as graciously as possible."
	CRLF	
	CRLF	
	PRINTI	"""Well, then. Perhaps we shall meet again!"" the young man replied, and walked out of sight."
	CRLF	
	CRLF	
	PRINTI	"""And perhaps not,"" Praxix said, with a wave of his hand. He heaved a sigh of relief, and pondered what he should do next."
	CALL1	END-OPTION
	RSTACK	
?CCL14:	CALL1	SENDING-SIGNAL?
	ZERO?	STACK /FALSE
	CALL1	PRAXIX-SENDS-SIGNAL
	RSTACK	


	.FUNCT	PRAXIX-SENDS-SIGNAL:ANY:0:0,CHR,CNT
	PRINTI	"And there, standing "
	EQUAL?	HERE,CASTLE-COURTYARD \?CCL3
	PRINTI	"in the middle of the courtyard"
	JUMP	?CND1
?CCL3:	EQUAL?	HERE,INSIDE-MOAT \?CCL5
	PRINTI	"at the edge of the moat"
	JUMP	?CND1
?CCL5:	PRINTI	"on top of that high tower"
?CND1:	PRINTI	", Praxix removed his pouch of magical essences and cast the """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell."
	CRLF	
	CRLF	
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL8
	PRINTI	"The ball of flame shot out toward the horizon."
	JUMP	?CND6
?CCL8:	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?CCL10
	FSET	LIGHTNING-SPELL,SEEN
	PRINTI	"Dark clouds gathered round the castle, and soon bolts of lightning were hitting the darkened earth."
	JUMP	?CND6
?CCL10:	PRINTI	"Clouds gathered from nowhere, heavily laden with moisture. And then, the rain started to fall, a heavy, soaking rain."
?CND6:	PRINTI	" Praxix "
	EQUAL?	HERE,CASTLE-COURTYARD,INSIDE-MOAT \?CCL13
	PRINTI	"watched, impassively"
	JUMP	?CND11
?CCL13:	PRINTI	"leaned over the edge of the turret, and stared off into the forest"
?CND11:	PRINTI	", wondering whether there was anyone there to notice."
	SET	'PRAXIX-SIGNAL,ACTION-OBJECT
	SET	'PRAXIX-SIGNAL-ROOM,HERE
	SET	'SUBGROUP-MODE,TRUE-VALUE
	SET	'UPDATE-FLAG,TRUE-VALUE
	ICALL1	RESTORE-TAG-OBJECTS
?PRG14:	IGRTR?	'CNT,PARTY-MAX /?REP15
	GET	PARTY,CNT >CHR
	EQUAL?	CHR,PRAXIX \?CCL20
	FCLEAR	CHR,SUBGROUP
	JUMP	?PRG14
?CCL20:	FSET	CHR,SUBGROUP
	JUMP	?PRG14
?REP15:	CALL2	MOVE-TO,GROUP-FOREST
	RSTACK	


	.FUNCT	ANONF-288:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	ICALL	TRAVEL-COMMANDS,CASTLE-BASE,UP-COMMAND,COURTYARD-COMMAND
	IN?	SIXTH-STONE,PRAXIX /?CND4
	PRINTI	"Declining the offer to take some of the stones, "
?CND4:	PRINTI	"Praxix suggested he had seen enough; the two then ascended the stairs, arriving back at the base of the turret."
	ZERO?	PRAXIX-SIGNAL /?CCL8
	PRINTI	" They then took the few short steps back to the courtyard."
	CALL2	MOVE-TO,CASTLE-COURTYARD
	RSTACK	
?CCL8:	CALL2	MOVE-TO,CASTLE-BASE
	RSTACK	
?CCL3:	EQUAL?	ACTION,USE-MIX-COMMAND \FALSE
	EQUAL?	MIXTURE,SPECIAL-VISION-SPELL \FALSE
	EQUAL?	ACTION-OBJECT,STONE-PILE \FALSE
	MOVE	SIXTH-STONE,PRAXIX
	ICALL2	UPDATE-REMOVE,STONE-PILE
	ICALL	GRAPHIC,FALSE-VALUE,G-TROVE-STONE,TOP-RIGHT
	PRINTI	"Praxix cast his mixture at the pile of stones, and for an instant, it appeared that nothing would happen. And then, slowly, from the middle of the pile, a dim glow appeared, strengthening with each passing moment. Praxix scrambled onto the pile, shovelling stones away with his bare hands until the source of light was revealed. It was a small black stone, perfectly round, and glowing with a powerful dark light."
	CRLF	
	CRLF	
	PRINTI	"""The Earth Stone,"" he said, under his breath, taking the black stone and placing it inside his cloak."
	CRLF	
	CRLF	
	PRINTI	"""Pardon me,"" Umber said, ""but did you just say 'Erstin'? I once knew a man with that name, but I wouldn't think he'd be an acquaintance of yours."""
	CRLF	
	CRLF	
	PRINTI	"""Yes, of course,"" Praxix mumbled, without knowing why. But it had the desirable effect of ending the conversation, as Umber could find nothing beyond a befuddled ""Ah"" to reply."
	CALL1	MIXTURE-CAST
	RSTACK	


	.FUNCT	ANONF-289:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"There were thousands upon thousands of stones in the chest, of all colors, shapes, and sizes. A profitable business for Umber, to be sure."
	CRLF	
	CRLF	
	PRINTI	"""Not too valuable, I would say,"" Umber said, picking up a few more of the stones. ""But don't let the townsfolk know it!"""
	RTRUE	


	.FUNCT	ANONF-290:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Praxix went through each of the cells in the dungeon, finding only rusted chains and manacles. Perhaps there had been prisoners here in days long past, but their remains would long since have turned to dust."
	RTRUE	


	.FUNCT	ANONF-291:ANY:0:0
	FSET	HERE,SEEN
	FSET?	UMBER,IN-PARTY \FALSE
	CALL	QSET?,HERE,SCOUTED
	ZERO?	STACK \FALSE
	CRLF	
	CRLF	
	PRINTI	"The dungeons were dark and damp, but Umber was as cheerful as ever. ""There are many secrets in these dungeons,"" he said. ""If you give me your word you will tell no one, I will show you my favorite."""
	CRLF	
	CRLF	
	PRINTI	"Praxix agreed, and Umber led him to the farthest of the dungeon cells. Then, he removed one of the blocks in the cell wall, and reached for an unseen lever that was hidden behind. As he did so, the entire wall slid aside, revealing a large chamber."
	CRLF	
	CRLF	
	PRINTI	"The chamber was bare, save the rusted manacles hanging from the walls, but in the center sat a large chest, brimming with precious stones."
	CRLF	
	CRLF	
	PRINTI	"""I see you have been here before,"" Praxix said, with the slightest hint of sarcasm."
	CRLF	
	CRLF	
	PRINTI	"""Many times,"" Umber responded, ""I make my living selling these stones. I figure it's safer to leave the bulk of them here so that folks back in town don't get too suspicious. Every week or so, I come here and pick up a few dozen."""
	CALL2	MOVE-TO,CASTLE-TROVE
	RSTACK	


	.FUNCT	ANONF-292:ANY:0:0
	EQUAL?	ACTION,UP-COMMAND \FALSE
	PRINTI	"Disappointed at having found nothing of interest, Praxix climbed the crumbling stairs and was soon "
	FSET?	CASTLE-TOWER,SEEN /?CCL6
	PRINTI	"atop the tower."
	CALL2	MOVE-TO,CASTLE-TOWER
	RSTACK	
?CCL6:	PRINTI	"back at ground level."
	CALL2	MOVE-TO,CASTLE-BASE
	RSTACK	


	.FUNCT	ANONF-293:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" examined the talking tree skeptically, walking around it as an art expert would a hideous piece of sculpture, but finally arrived at the inescapable conclusion that this was indeed a talking tree, about seven feet in height, neatly trimmed, and covered in wide, oddly shaped leaves."
	RTRUE	

	.ENDSEG

	.SEGMENT "MILL"


	.FUNCT	ANONF-294:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"It was no use; no matter how Praxix tried, he could not move enough debris to make his escape possible."
	RTRUE	
?CCL3:	EQUAL?	ACTION,LEFT-COMMAND \?CCL5
	ICALL1	FIRST-XFER-ANTE
	CALL2	MOVE-TO,XFER-1-ANTE
	RSTACK	
?CCL5:	EQUAL?	ACTION,RIGHT-COMMAND /?CCL7
	EQUAL?	ACTION,CONTROL-ROOM-COMMAND \FALSE
?CCL7:	PRINTI	"A narrow doorway led Praxix into a small, closetlike chamber. On one wall, a large glass window overlooked a shallow pit. Otherwise, the room was bare except for a strange device mounted against another of the walls."
	ICALL2	MOVE-TO,XFER-MASTER
	ICALL	CHANGE-TRAVEL-COMMAND,XFER-JCN,RIGHT-COMMAND,CONTROL-ROOM-COMMAND
	RTRUE	


	.FUNCT	FIRST-XFER-ANTE:ANY:0:0
	PRINTI	"The passage led onward and around a corner until it reached a protective railing, over or under which a shallow pit could be entered. Looking back, he could see "
	FSET?	XFER-MASTER,SEEN \?CCL3
	PRINTI	"the window of the control room."
	JUMP	?CND1
?CCL3:	PRINTI	"a large plate window behind which it was impossible to see."
?CND1:	PRINTI	" Before him, the passage continued out of sight into the darkness."
	CALL	QSET?,XFER-1-ANTE,SEEN
	ZERO?	STACK \FALSE
	PRINTI	" Everything here was drab and nondescript; the walls and floor of the passage were covered in countless layers of dust and grime. It had clearly been ages since these halls had been visited."
	RTRUE	


	.FUNCT	ANONF-295:ANY:0:0
	FSET	HERE,SEEN
	FSET?	XFER-CONTROLS,SEEN /?CCL3
	CALL2	GRAPHIC,G-XFER-MASTER
	RSTACK	
?CCL3:	CALL1	COMPLETE-DIAL-GRAPHICS
	RSTACK	


	.FUNCT	ANONF-296:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND /?CCL3
	EQUAL?	ACTION,BACK-TO-PITS-COMMAND \FALSE
?CCL3:	CALL	QSET?,HERE,BLACK-MIX
	ZERO?	STACK \?CCL8
	PRINTI	"Praxix then left this control room, or whatever it was, and reached the base of the crumbled stairs. Seeing no way of getting through in that direction, he started down the other path."
	CRLF	
	CRLF	
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,BACK-COMMAND,BACK-TO-PITS-COMMAND,TRUE-VALUE
	ICALL1	FIRST-XFER-ANTE
	JUMP	?CND6
?CCL8:	PRINTI	"It took only a few moments for Praxix to pass the rubble of the stairs and continue onward to the railing above the shallow pit."
?CND6:	CALL2	MOVE-TO,XFER-1-ANTE
	RSTACK	


	.FUNCT	COMPLETE-DIAL-GRAPHICS:ANY:0:0
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	ICALL2	GRAPHIC,G-XFER-CONTROLS
	CALL1	DIAL-GRAPHICS
	RSTACK	


	.FUNCT	DIAL-GRAPHICS:ANY:0:0
	GET	RUNE-TBL,LEFT-DIAL
	GETP	STACK,P?GRAPHIC
	ICALL	GRAPHIC,FALSE-VALUE,STACK,TOP-LEFT
	GET	RUNE-TBL,RIGHT-DIAL
	GETP	STACK,P?GRAPHIC
	CALL	GRAPHIC,FALSE-VALUE,STACK,TOP-RIGHT
	RSTACK	


	.FUNCT	V-RIGHT-DIAL:ANY:0:0
	GETP	ACTION-OBJECT,P?TEMP
	EQUAL?	RIGHT-DIAL,STACK \?CCL3
	PRINT	PRAXIX-NO-DIAL
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" rune."
	RTRUE	
?CCL3:	GETP	ACTION-OBJECT,P?TEMP >RIGHT-DIAL
	CALL2	TELL-DIAL,STR?57
	RSTACK	


	.FUNCT	V-LEFT-DIAL:ANY:0:0
	GETP	ACTION-OBJECT,P?TEMP
	EQUAL?	LEFT-DIAL,STACK \?CCL3
	PRINT	PRAXIX-NO-DIAL
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" rune."
	RTRUE	
?CCL3:	GETP	ACTION-OBJECT,P?TEMP >LEFT-DIAL
	CALL2	TELL-DIAL,STR?55
	RSTACK	


	.FUNCT	TELL-DIAL:ANY:1:1,STR
	SET	'FIDDLED-WITH-DEVICE,TRUE-VALUE
	PRINTI	"Slowly, Praxix twisted the dial on the "
	PRINT	STR
	PRINTI	" until its pointer was aimed directly at the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" rune."
	ICALL1	COMPLETE-DIAL-GRAPHICS
	RTRUE	


	.FUNCT	V-WAIT:ANY:0:0
	PRINTI	"As Praxix waited, the droning noise grew ever louder."
	SET	'I-BUTTON-PUSH-FLAG,100
	RTRUE	


	.FUNCT	V-PUSH-BUTTON:ANY:0:0
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,PUSH-BUTTON-COMMAND,WAIT-COMMAND
	SET	'BUTTON-PUSHED,TRUE-VALUE
	SET	'FIDDLED-WITH-DEVICE,TRUE-VALUE
	ICALL	QUEUE,I-BUTTON-PUSH,-1
	PRINTI	"Praxix pushed the button, and it appeared that nothing was happening. A dull droning noise, however, could soon be discerned, and it grew stronger as the moments passed."
	RTRUE	


	.FUNCT	ANONF-297:ANY:0:0,FROM,TO
	INC	'I-BUTTON-PUSH-FLAG
	EQUAL?	I-BUTTON-PUSH-FLAG,1 \?CCL3
	CRLF	
	CRLF	
	PRINTI	"The droning was now quite loud and echoed throughout the chamber."
	RTRUE	
?CCL3:	GRTR?	I-BUTTON-PUSH-FLAG,1 \FALSE
	SET	'BUTTON-PUSHED,FALSE-VALUE
	SET	'I-BUTTON-PUSH-FLAG,-1
	REMOVE	I-BUTTON-PUSH
	ICALL	CHANGE-TRAVEL-COMMAND,XFER-MASTER,WAIT-COMMAND,PUSH-BUTTON-COMMAND
	CRLF	
	CRLF	
	PRINTI	"The droning noise had grown to an overwhelming intensity when it suddenly stopped. The silence in these dark halls was now nearly as deafening."
	GET	XFER-TBL,LEFT-DIAL >FROM
	GET	XFER-TBL,RIGHT-DIAL >TO
	EQUAL?	TO,FROM /?CND6
	EQUAL?	HERE,XFER-MASTER \?CCL10
	FIRST?	FROM \?CCL10
	EQUAL?	TO,XFER-1 \?CCL10
	CRLF	
	CRLF	
	PRINTI	"But something peculiar caught Praxix' eye as he looked through the glass and down into the pit below. Something was down there, but he couldn't tell what."
	JUMP	?CND6
?CCL10:	EQUAL?	HERE,FROM \?CCL15
	ICALL2	MOVE-TO,TO
	CRLF	
	CRLF	
	CALL	QSET?,XFER-MASTER,TRAPPED
	ZERO?	STACK \?CCL18
	PRINTI	"You can well imagine Praxix' surprise when he"
	JUMP	?CND16
?CCL18:	PRINTI	"Suddenly, though unsurprisingly, Praxix"
?CND16:	PRINTI	" found himself standing at the bottom of a "
	EQUAL?	TO,XFER-1 \?CCL21
	PRINTI	"shallow"
	JUMP	?CND19
?CCL21:	PRINTI	"seemingly bottomless"
?CND19:	PRINTI	" pit."
	ICALL2	XFER-OBJECTS-CHECK,TO
	FIRST?	FROM \?CND22
	PRINTI	" Not only that, but everything that had been on the ground before was now here as well."
?CND22:	EQUAL?	TO,XFER-3 \?CCL26
	PRINTI	" Fortunately, a shaft of light piercing the darkness indicated an exit nearby."
	JUMP	?CND6
?CCL26:	SET	'XFER-TRAP,TRUE-VALUE
	JUMP	?CND6
?CCL15:	EQUAL?	HERE,TO \?CND6
	FIRST?	FROM \?CND6
	CRLF	
	CRLF	
	CALL	QSET?,XFER-MASTER,DEAD
	ZERO?	STACK \?CCL32
	PRINTI	"You can well imagine Praxix' surprise when "
	JUMP	?CND30
?CCL32:	PRINTI	"Praxix was merely startled this time, as "
?CND30:	ICALL2	LIST-CONTENTS,FROM
	PRINTI	" suddenly appeared on the ground beside him."
?CND6:	SET	'UPDATE-FLAG,TRUE-VALUE
	CALL	MOVE-ALL,FROM,TO
	RSTACK	


	.FUNCT	O-DIAL:ANY:0:0
	COPYT	DIAL-O-TABLE,O-TABLE,14
	RTRUE	


	.FUNCT	INIT-RUNES:ANY:0:0,CNT,RUNE
	ZERO?	RUNES-SET \TRUE
	SET	'RUNES-SET,TRUE-VALUE
	RANDOM	6 >LEFT-DIAL
	RANDOM	6 >RIGHT-DIAL
?PRG3:	IGRTR?	'CNT,6 /TRUE
	CALL2	PICK-ONE,INITIAL-RUNE-TBL >RUNE
	PUTP	RUNE,P?TEMP,CNT
	PUT	RUNE-TBL,CNT,RUNE
	JUMP	?PRG3


	.FUNCT	ANONF-298:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	CALL	QSET?,XFER-CONTROLS,EXAMINED
	ZERO?	STACK \FALSE
	FSET	XFER-CONTROLS,SEEN
	ICALL1	COMPLETE-DIAL-GRAPHICS
	PRINTI	"Two devices that resembled dials of some sort were imbedded in the wall of the chamber. Around each of the dials were the same six peculiar runes, in a language that he could not recognize. Below and between the two dials sat a short, stubby, black button."
	PUTP	ACTION-OBJECT,P?SDESC,STR?682
	SET	'UPDATE-FLAG,TRUE-VALUE
	CALL	TRAVEL-COMMANDS,HERE,BACK-COMMAND,LEFT-DIAL-COMMAND,RIGHT-DIAL-COMMAND,PUSH-BUTTON-COMMAND
	RSTACK	


	.FUNCT	NXFER:ANY:0:0
?FCN:	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL3
	EQUAL?	HERE,NXFER-1,NXFER-2,NXFER-3 /?CTR7
	CALL	CHECK-ESSENCES,LEVITATE-SPELL,3
	ZERO?	STACK \?CCL8
?CTR7:	PRINTI	"With few options indeed, Praxix used all of his remaining powders to elevate himself out of the pit. Sadly, he rose upward and upward without ever finding a way out."
	CRLF	
	CRLF	
	SET	'ACTION,UP-COMMAND
	JUMP	?FCN
?CCL8:	ICALL2	USE-ESSENCES,LEVITATE-SPELL
	ICALL2	USE-ESSENCES,LEVITATE-SPELL
	PRINTI	"It took quite a lot of powders, perhaps three times what he might have ordinarily used, but Praxix finally managed to elevate himself out of the pit and back behind the railing. He could see that he was at the middle of the three pits, but was grateful indeed to be anywhere at all."
	CALL2	MOVE-TO,XFER-2-ANTE
	RSTACK	
?CCL3:	EQUAL?	ACTION,UP-COMMAND \FALSE
	PRINTI	"Praxix tried in vain to extricate himself from that deep hole, but there simply wasn't any way he could think of. He died in that pit, cold and alone, after eight days."
	CRLF	
	CRLF	
	PRINTI	"It is odd, certainly, that we should have know this story at all, but Astrix, when next we met him, knew it as though he had been with Praxix himself, which would not entirely surprise me. Much is not known to us, especially the ways of those like Astrix."
	CRLF	
	CRLF	
	PRINTI	"There is not much more to tell. Astrix became disconsolate at our failure, and sat long and silently before he next spoke."
	CRLF	
	CRLF	
	ICALL2	HINT,HINT-MILL-TRAPPED
	CALL1	PART-ONE-BAD-ENDING
	RSTACK	


	.FUNCT	TELL-ANTE-RUNE:ANY:1:1,CNT
	PRINTI	" Alongside the opening to the chamber below was "
	FSET?	XFER-CONTROLS,SEEN \?CCL3
	PRINTI	"the "
	GET	RUNE-TBL,CNT
	ICALL2	WPRINTD,STACK
	PRINTI	" rune from the dials in the control room."
	RTRUE	
?CCL3:	PRINTI	"an unfamiliar rune."
	RTRUE	


	.FUNCT	ANONF-299:ANY:0:0
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	ICALL2	GRAPHIC,G-XFER-ANTE
	FSET?	XFER-MASTER,SEEN \?CND1
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,BACK-COMMAND
	ICALL	FORCE-TRAVEL-COMMAND,HERE,CONTROL-ROOM-COMMAND
?CND1:	FSET?	XFER-MASTER,SOLVED \FALSE
	CALL2	TELL-ANTE-RUNE,1
	RSTACK	


	.FUNCT	ANONF-300:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"Continuing down the passageway, Praxix came to another railing separating him from a rather more precipitous drop than at the previous pit. In fact, he could not discern a bottom anywhere."
	CALL2	MOVE-TO,XFER-2-ANTE
	RSTACK	
?CCL3:	EQUAL?	ACTION,DOWN-COMMAND \?CCL5
	FSET?	XFER-1,SOLVED /?CCL8
	PRINTI	"With an agility that belied his advancing years, Praxix flung himself over the railing and down into the pit below. To his amazement, long strips of fire and earth essences coursed through the rock. It would be quite a haul, indeed, if he could mine any of the precious material."
	JUMP	?CND6
?CCL8:	PRINTI	"Praxix again flung himself over the railing and down into the pit below."
?CND6:	ICALL2	XFER-OBJECTS-CHECK,XFER-1
	CALL2	MOVE-TO,XFER-1
	RSTACK	
?CCL5:	EQUAL?	ACTION,BACK-COMMAND /?CTR9
	EQUAL?	ACTION,CONTROL-ROOM-COMMAND \?CCL10
?CTR9:	FSET?	XFER-MASTER,SEEN /?CCL15
	PRINTI	"Praxix now retraced his steps to the base of the fallen stairs. Having little choice, he entered the narrow doorway into a small, closetlike chamber. On one wall, a large glass window overlooked a shallow pit. Otherwise, the room was bare except for a strange device mounted against another of the walls."
	JUMP	?CND13
?CCL15:	PRINTI	"Then, Praxix quickly retraced his steps back to the control room."
?CND13:	CALL2	MOVE-TO,XFER-MASTER
	RSTACK	
?CCL10:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,WIND-SPELL \FALSE
	FSET?	XFER-MASTER,ENCHANTED /FALSE
	CALL1	DO-XFER-WIND
	RSTACK	


	.FUNCT	XFER-OBJECTS-CHECK:ANY:1:1,RM
	FIRST?	RM \FALSE
	PRINTI	" There beside him at the bottom of the pit was "
	ICALL2	LIST-CONTENTS,RM
	PRINTC	46
	RTRUE	


	.FUNCT	DO-XFER-WIND:ANY:0:0
	FSET	XFER-MASTER,SOLVED
	PRINTI	"Thinking that some wind would remove the thick layers of dirt and dust that had accumulated everywhere, Praxix cast his wind spell. Within seconds, a gale arose, choking the air with a dense plume of dust, and making both breathing and seeing nearly impossible. Fortunately, it subsided before long, and Praxix was able to again see clearly. What he found was a previously hidden rune chiselled into the wall beside the opening to the chamber below: it "
	FSET?	XFER-CONTROLS,SEEN /?CCL3
	PRINTI	"looked entirely unfamiliar."
	RTRUE	
?CCL3:	EQUAL?	HERE,XFER-1-ANTE \?CCL5
	PRINTI	"looked exactly like the "
	GET	RUNE-TBL,1
	ICALL2	WPRINTD,STACK
	JUMP	?CND1
?CCL5:	EQUAL?	HERE,XFER-2-ANTE \?CCL7
	PRINTI	"looked exactly like the "
	GET	RUNE-TBL,2
	ICALL2	WPRINTD,STACK
?CND1:	PRINTI	" rune he had seen on the strange dials back in the control room."
	RTRUE	
?CCL7:	PRINTI	"was too worn to be read."
	RTRUE	


	.FUNCT	FORCE-MINE-ROCK:ANY:0:0
	LOC	PICK-AXE
	EQUAL?	STACK,HERE,INVENTORY \FALSE
	FSET?	XFER-1,SOLVED /FALSE
	CALL	FORCE-TRAVEL-COMMAND,HERE,MINE-ROCK-COMMAND
	RSTACK	


	.FUNCT	ANONF-301:ANY:0:0
	FSET	HERE,SEEN
	CALL1	FORCE-MINE-ROCK
	RSTACK	


	.FUNCT	ANONF-302:ANY:0:0
	EQUAL?	ACTION,MINE-ROCK-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	LOC	PICK-AXE
	EQUAL?	STACK,HERE,INVENTORY \?CCL6
	ICALL	FIND-ESSENCE,ESSENCE-FIRE,5
	ICALL	FIND-ESSENCE,ESSENCE-EARTH,5
	FSET	XFER-1,SOLVED
	PRINTI	"Having the perfect tool at hand, Praxix gathered as much of the rock containing the earth and fire essences as was practical, considering the great deal of time necessary to crush the rocks down into powder. Rather than spend the rest of the day at it, he settled for taking a moderate amount of each."
	CRLF	
	CRLF	
	PRINTI	"""Not bad for a day's work,"" he said aloud, as he climbed out of the pit and stood again alongside the railing. ""Now, my only problem is getting out of this place alive."""
	CALL2	MOVE-TO,XFER-1-ANTE
	RSTACK	
?CCL6:	PRINTI	"The only problem for Praxix was that the rock in which the essences were embedded was harder than any other he had come across. There was no chance he would be able to mine the rocks without the proper tools."
	RTRUE	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL8
	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \?CCL8
	PRINTI	"Thinking that his tremor spell might shake some of the rocks loose, Praxix carefully measured out a small amount of earth essence and cast it at the ground. The ensuing tremor nearly caused an avalanche of its own, without so much as budging the rocks in which he had such a keen interest."
	RTRUE	
?CCL8:	EQUAL?	ACTION,UP-COMMAND \FALSE
	PRINTI	"Finished with his examination of the pit, Praxix clambered up the side walls and was soon back on the other side of the railing."
	CALL2	MOVE-TO,XFER-1-ANTE
	RSTACK	


	.FUNCT	ANONF-303:ANY:0:0
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	ICALL2	GRAPHIC,G-XFER-ANTE
	FSET?	XFER-MASTER,SEEN \?CND1
	ICALL	FORCE-TRAVEL-COMMAND,HERE,CONTROL-ROOM-COMMAND
?CND1:	FSET?	XFER-MASTER,SOLVED \FALSE
	CALL2	TELL-ANTE-RUNE,2
	RSTACK	


	.FUNCT	ANONF-304:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"The passageway ended abruptly before him at the site of yet another railing and associated pit. From the looks of things, an avalanche had permanently sealed the way to what could only be presumed to be another set of pits. As he leaned on the railing, "
	FSET?	XFER-MASTER,SOLVED /?CND4
	PRINTI	"resting his elbows into an inch or so of accumulated dust, "
?CND4:	PRINTI	"he peered down into the depths of the pit and discerned a narrow shaft of sunlight piercing the darkness."
	CALL2	MOVE-TO,XFER-3-ANTE
	RSTACK	
?CCL3:	EQUAL?	ACTION,CONTROL-ROOM-COMMAND \?CCL7
	PRINTI	"In a matter of moments, Praxix had retraced his steps back to the control room."
	CALL2	MOVE-TO,XFER-MASTER
	RSTACK	
?CCL7:	EQUAL?	ACTION,BACK-COMMAND \?CCL9
	PRINTI	"In just a few moments, Praxix was back at the first of the pits."
	CALL2	MOVE-TO,XFER-1-ANTE
	RSTACK	
?CCL9:	EQUAL?	ACTION,DOWN-COMMAND \?CCL11
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Getting down into the pit would pose something of a dilemma for Praxix. It was painfully obvious that falling or jumping into the pit would mean certain death."
	RTRUE	
?CCL11:	EQUAL?	ACTION,CAST-COMMAND \?CCL13
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL13
	CALL2	XFER-DESCEND,XFER-2
	RSTACK	
?CCL13:	EQUAL?	ACTION,CAST-COMMAND \?CCL17
	EQUAL?	ACTION-OBJECT,WIND-SPELL \?CCL17
	FSET?	XFER-MASTER,ENCHANTED /?CCL17
	CALL1	DO-XFER-WIND
	RSTACK	
?CCL17:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \FALSE
	CALL2	DO-XFER-FLARE,XFER-2
	RSTACK	


	.FUNCT	XFER-DESCEND:ANY:1:1,RM
	ICALL2	USE-ESSENCES,LEVITATE-SPELL
	ICALL2	USE-ESSENCES,LEVITATE-SPELL
	FCLEAR	ESSENCE-AIR,USED-UP
	FCLEAR	ESSENCE-EARTH,USED-UP
	PRINTI	"Knowing full well the futility of descending into the pit by conventional means, Praxix decided to try his levitation spell in reverse by casting small amounts of his mixture on himself as he fell feet first into the pit."
	CRLF	
	CRLF	
	PRINTI	"This rather unorthodox procedure worked, but at the expense of a great deal of magical powders, so much so that he was now "
	IN?	ESSENCE-AIR,ESSENCES /?CCL3
	IN?	ESSENCE-EARTH,ESSENCES /?CCL3
	PRINTI	"out of both earth and air essences"
	JUMP	?CND1
?CCL3:	IN?	ESSENCE-AIR,ESSENCES /?CCL7
	PRINTI	"out of air essence"
	JUMP	?CND1
?CCL7:	IN?	ESSENCE-EARTH,ESSENCES /?CCL9
	PRINTI	"out of earth essence"
	JUMP	?CND1
?CCL9:	PRINTI	"getting fairly low on both air and earth essences"
?CND1:	FSET	XFER-3,SCOUTED
	PRINTC	46
	ICALL2	XFER-OBJECTS-CHECK,RM
	FSET?	XFER-1,SOLVED \?CND10
	CRLF	
	CRLF	
	PRINTI	"""There must be a better way,"" Praxix said, brushing himself off. ""Whoever used this place would hardly be dropping into pits this way!"""
?CND10:	CALL2	MOVE-TO,RM
	RSTACK	


	.FUNCT	DO-XFER-FLARE:ANY:1:1,RM
	PRINTI	"Praxix now cast his flare spell into the pit, lighting its walls with a brilliant red-orange glow. The pit was deep - very deep, "
	EQUAL?	RM,XFER-3 /?CCL3
	PRINTI	"with no sign of exits."
	JUMP	?CND1
?CCL3:	PRINTI	"with a single shaft of light giving evidence that some exit might be found at the bottom."
?CND1:	FIRST?	RM \TRUE
	PRINTI	" As the fireball hit the bottom, its light glanced off of something lying on the ground. Its identity, however, was a mystery, for it was too far away to discern clearly."
	RTRUE	


	.FUNCT	ANONF-305:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \?CCL3
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"At this point, Praxix examined the axe more carefully. It was nearly new, though, like everything else, it was covered in dust."
	RTRUE	
?CCL3:	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL5
	CALL	QSET?,PICK-AXE,USED-UP
	ZERO?	STACK \?CCL8
	PRINTI	"""This should come in rather useful,"" Praxix said, as he picked up the pick axe and slung it over his shoulder."
	JUMP	?CND6
?CCL8:	PRINTI	"Praxix then picked up the pick-axe and slung it over his shoulder, as he had done before."
?CND6:	CALL	UPDATE-MOVE,PICK-AXE,INVENTORY
	RSTACK	
?CCL5:	EQUAL?	ACTION,DROP-COMMAND \FALSE
	ICALL2	UPDATE-REMOVE,PICK-AXE
	PRINTI	"Rather than carry the pick-axe any longer, Praxix rested it against a nearby wall."
	RTRUE	


	.FUNCT	ANONF-306:ANY:0:0
	FSET	HERE,SEEN
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	ICALL	GRAPHIC,G-XFER-ANTE,G-XFER-ANTE-LIGHT,BOTTOM-RIGHT
	FSET?	XFER-MASTER,SEEN \?CND1
	ICALL	FORCE-TRAVEL-COMMAND,HERE,CONTROL-ROOM-COMMAND
?CND1:	FSET?	XFER-MASTER,SOLVED \FALSE
	PRINTI	" Alongside the opening to the chamber below was a rune that had been obliterated by the passage of the long years."
	RTRUE	


	.FUNCT	ANONF-307:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"It didn't take more than two looks at the debris before him for Praxix to realize that he wasn't going any further in this direction."
	RTRUE	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \?CCL5
	PRINTI	"Quickly, Praxix retreated to the middle of the three pits."
	CALL2	MOVE-TO,XFER-2-ANTE
	RSTACK	
?CCL5:	EQUAL?	ACTION,CONTROL-ROOM-COMMAND \?CCL7
	PRINTI	"Quickly, Praxix passed by the two other pits as he made his way back to the control room."
	CALL2	MOVE-TO,XFER-MASTER
	RSTACK	
?CCL7:	EQUAL?	ACTION,DOWN-COMMAND \?CCL9
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Getting down into the pit would pose something of a dilemma for Praxix. It was painfully obvious that falling or jumping into the pit would mean certain death."
	RTRUE	
?CCL9:	EQUAL?	ACTION,CAST-COMMAND \?CCL11
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL11
	CALL2	XFER-DESCEND,XFER-3
	RSTACK	
?CCL11:	EQUAL?	ACTION,CAST-COMMAND \?CCL15
	EQUAL?	ACTION-OBJECT,WIND-SPELL \?CCL15
	FSET?	XFER-MASTER,ENCHANTED /?CCL15
	CALL1	DO-XFER-WIND
	RSTACK	
?CCL15:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \FALSE
	CALL2	DO-XFER-FLARE,XFER-3
	RSTACK	


	.FUNCT	ANONF-308:ANY:0:0,TMP
	EQUAL?	ACTION,FOLLOW-LIGHT-COMMAND \?CCL3
	IN?	PICK-AXE,INVENTORY \?CND4
	REMOVE	PICK-AXE
	PRINTI	"Having no further need for the pick-axe, Praxix dropped it on the ground. He then started following the stream of light, following a dirt path. "
?CND4:	PRINTI	"The path wound its way up a crumbling set of stairs, but these soon were nearly unrecognizable. Clambering the rest of the way back to ground level, he finally extricated himself from the ground about one hundred paces away from the mill itself. And as he looked back toward the large grinding wheel, he realized that he had been dead wrong from the outset."
	CRLF	
	CRLF	
	PRINTI	"""The mill is not for grains at all,"" he said aloud, ""but for milling the stones of magical essences! To think I've been exploring a magic mine!"""
	CRLF	
	CRLF	
	ZERO?	REJOINED /?CND6
	PRINTI	"You can imagine our relief at seeing our Wizard friend again, for it had been quite some time since he had disappeared into the mill's mechanism, triggering the avalanche that prevented us from following him."
	CRLF	
	CRLF	
	PRINTI	"""Come, come, don't stand there gawking,"" he said, wagging his finger at us. ""We still have much to do."""
	CRLF	
	CRLF	
?CND6:	FCLEAR	TAG,SHADOW
	CALL2	PARTY-PCM,PRAXIX
	ADD	STACK,1 >TMP
	CALL2	PARTY-PCM,TAG-SWAP-CHR
	PUT	PARTY,STACK,TAG
	PUT	PARTY,TMP,TAG-SWAP-CHR
	ICALL2	SCENE,FALSE-VALUE
	CALL1	LEAVE-MILL-AREA
	RSTACK	
?CCL3:	CALL1	NXFER
	RSTACK	

	.ENDSEG

	.ENDI
