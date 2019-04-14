
	.SEGMENT "RIVER"


	.FUNCT	ANONF-137:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	CLEAR-EXBIT
	ICALL2	WPRINTD,ACTOR
	GETP	ACTION-OBJECT,P?EXBITS
	ZERO?	STACK \?CND4
	PRINTI	", on the other hand,"
?CND4:	EQUAL?	ACTOR,PRAXIX \?CCL8
	PRINTI	" felt the raft was sturdy enough for an uneventful trip, though it would probably not fare so well in heavy or rocky waters. Nonetheless, as our only way of crossing the river, it would have to serve."
	RTRUE	
?CCL8:	PRINTI	" was doubtful that we would live to see the far side of the river since, in his words, the raft ""probably would not survive a good minute in a bathtub."""
	RTRUE	


	.FUNCT	RIVER-N-ENTER:ANY:0:1,GFX?
	ASSIGNED?	'GFX? /?CND1
	SET	'GFX?,TRUE-VALUE
?CND1:	ZERO?	GFX? /?CND3
	ICALL2	GRAPHIC,G-RIVER
?CND3:	FSET?	RAFT,SEEN \?CND5
	EQUAL?	HERE,RIVER-FALLS /?CND5
	MOVE	RAFT,HERE
	ICALL	CHANGE-PARTY-COMMAND,BUILD-RAFT-COMMAND,LAUNCH-RAFT-COMMAND
?CND5:	MOVE	RIVER,HERE
	EQUAL?	HERE,RIVER-FALLS \FALSE
	FSET	FALLS,SEEN
	MOVE	FALLS,HERE
	RTRUE	


	.FUNCT	ANONF-138:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" motioned "
	CALL2	ME/US,2
	PRINT	STACK
	PRINTI	" to the edge of the falls. They were both beautiful and terrible; a raging, boiling fury the like of which we had not experienced before. At the bottom, the troubled river was crowned with a misty rainbow; from there, the water tumbled over jagged rocks as it flowed out of sight into a narrow, winding gorge."
	RTRUE	


	.FUNCT	ANONF-139:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	FSET?	RIVER,EXAMINED /FALSE
	ICALL	UPDATE-FSET,RIVER,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" ripped a small branch from a nearby tree and cast it into the river. Within moments, it had been carried out of sight. ""It is as I feared. The river flows with great speed."
	FSET?	FALLS,SEEN \?CCL8
	PRINTI	" How shall we cross without being carried over the falls?"" He got no answer."
	RTRUE	
?CCL8:	EQUAL?	ACTOR,PRAXIX \?CCL10
	PRINTI	" We shall not cross before we have been taken far downstream."""
	RTRUE	
?CCL10:	EQUAL?	ACTOR,ESHER \TRUE
	PRINTI	" We will not survive the crossing!"""
	RTRUE	


	.FUNCT	ANONF-140:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	CALL1	SHORE-CAST
	RSTACK	
?CCL3:	EQUAL?	ACTION,DOWNSTREAM-COMMAND \?CCL5
	CALL2	SHORE-MOVE,RIVER-2
	RSTACK	
?CCL5:	EQUAL?	ACTION,UPSTREAM-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	ICALL1	RIVER-N-ENTER
	PRINTI	"Exploring the shore upstream of our position, we quickly found it too rocky for use as any sort of raft launching site, and it was decided to go no further."
	RTRUE	


	.FUNCT	ANONF-141:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	CALL1	SHORE-CAST
	RSTACK	
?CCL3:	EQUAL?	ACTION,DOWNSTREAM-COMMAND \?CCL5
	CALL2	SHORE-MOVE,RIVER-3
	RSTACK	
?CCL5:	EQUAL?	ACTION,UPSTREAM-COMMAND \?CCL7
	CALL2	SHORE-MOVE,RIVER-1
	RSTACK	
?CCL7:	EQUAL?	ACTION,SCOUT-COMMAND \FALSE
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	CALL1	SHORE-SCOUT
	RSTACK	


	.FUNCT	SHORE-SCOUT:ANY:0:0
	FSET	RIVER-2,DONT-SCOUT
	FSET	RIVER-3,DONT-SCOUT
	FSET?	RIVER-FALLS,SEEN /FALSE
	EQUAL?	ACTOR,ESHER \?CCL6
	ICALL2	WPRINTD,ACTOR
	PRINTI	" made his way downstream along the shore, finally leaving our sight as followed the river's edge around a corner. He returned a few minutes later, out of breath. ""A falls!"" he said. ""Not far downstream!"""
	RTRUE	
?CCL6:	ICALL2	WPRINTD,ACTOR
	PRINTI	" nimbly followed the river's edge out of sight. A minute later, he returned, reporting a large waterfall just downstream from where we stood."
	RTRUE	


	.FUNCT	ANONF-142:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	CALL1	SHORE-CAST
	RSTACK	
?CCL3:	EQUAL?	ACTION,DOWNSTREAM-COMMAND \?CCL5
	CALL2	SHORE-MOVE,RIVER-FALLS
	RSTACK	
?CCL5:	EQUAL?	ACTION,UPSTREAM-COMMAND \?CCL7
	CALL2	SHORE-MOVE,RIVER-2
	RSTACK	
?CCL7:	EQUAL?	ACTION,SCOUT-COMMAND \FALSE
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	CALL1	SHORE-SCOUT
	RSTACK	


	.FUNCT	ANONF-143:ANY:0:0
	CALL2	RIVER-N-ENTER,FALSE-VALUE
	RSTACK	


	.FUNCT	ANONF-144:ANY:0:0
	EQUAL?	ACTION,UPSTREAM-COMMAND \FALSE
	CALL2	SHORE-MOVE,RIVER-3
	RSTACK	


	.FUNCT	SHORE-CAST:ANY:0:0
	EQUAL?	ACTION-OBJECT,WIND-SPELL /?PRD5
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \FALSE
?PRD5:	CALL	QSET?,RIVER-1,TRIED
	ZERO?	STACK \FALSE
	PRINTI	"""Perhaps,"" "
	FSET?	BERGON,IN-PARTY \?CCL10
	PRINTI	"Bergon"
	JUMP	?CND8
?CCL10:	PRINTC	73
?CND8:	PRINTI	" suggested, turning to Praxix, ""there is some magic that could propel us across the river."""
	CRLF	
	CRLF	
	PRINTI	"""I have already considered this,"" Praxix replied. ""But the river is far too wide to attempt sending even one of us across."""
	RTRUE	


	.FUNCT	SHORE-MOVE:ANY:1:1,RM,TMP
	ZERO?	LAST-SHORE-MOVE \?CCL3
	PRINTI	"Not knowing which way was best, we headed "
	JUMP	?CND1
?CCL3:	EQUAL?	LAST-SHORE-MOVE,ACTION \?CCL5
	PRINTI	"We continued "
	JUMP	?CND1
?CCL5:	PRINTI	"Then, we turned around and walked "
?CND1:	SET	'LAST-SHORE-MOVE,ACTION
	EQUAL?	ACTION,UPSTREAM-COMMAND \?CCL8
	PRINTI	"up"
	JUMP	?CND6
?CCL8:	PRINTI	"down"
?CND6:	PRINTI	"stream along the shore"
	IN?	RAFT,HERE \?CND9
	EQUAL?	RM,RIVER-FALLS /?CND9
	PRINTI	", dragging the raft along with us,"
?CND9:	EQUAL?	RM,RIVER-2 \?CCL15
	PRINTI	" and finally arrived back at our starting point along the shore."
	JUMP	?CND13
?CCL15:	EQUAL?	HERE,RIVER-FALLS \?CCL17
	PRINTI	", clambering down the rocks and back to the river's edge."
	JUMP	?CND13
?CCL17:	EQUAL?	RM,RIVER-1 \?CCL19
	FSET?	RM,SEEN /?CCL22
	PRINTI	" to"
	JUMP	?CND20
?CCL22:	PRINTI	" and were soon back at"
?CND20:	PRINTI	" the furthest point easily accessible on foot. From here, the river appeared quieter than at the place we had started."
	JUMP	?CND13
?CCL19:	EQUAL?	RM,RIVER-FALLS \?CCL24
	PRINTI	", as we followed the curve of the river to the right. The river's edge grew more rugged, and we needed to clamber up some rocks before we reached an outcropping high above a towering falls."
	FSET?	ESHER,IN-PARTY \?CND25
	FSET	FALLS,EXAMINED
	CRLF	
	CRLF	
	PRINTI	"""It's wonderful!"" I said. ""No, not wonderful."" Esher replied, frowning. ""Dangerous... deadly..."" He had turned pale, almost ashen, as he spoke, his eyes tranfixed on the torrent that roared beneath us."
?CND25:	IN?	RAFT,RIVER-3 \?CND13
	FSET?	BERGON,IN-PARTY \?CND13
	FSET?	RM,SEEN /?CND13
	CRLF	
	CRLF	
	PRINTI	"""We had best cross the river quickly."" Bergon said. ""I would not like to think of the alternative."""
	JUMP	?CND13
?CCL24:	FSET?	RM,SEEN /?CCL33
	PRINTI	". The river moved more swiftly here, and the sound of rushing water became ever louder as we progressed. Just ahead, the river curved to the right and out of sight."
	JUMP	?CND13
?CCL33:	PRINTI	" to the point at which the river started its curve to the right."
?CND13:	FSET	RM,SEEN
	CALL2	MOVE-TO,RM
	RSTACK	


	.FUNCT	ANONF-145:ANY:0:0
	GETP	HERE,P?TEMP
	MOD	STACK,5
	EQUAL?	STACK,4 \FALSE
	MOVE	FALLS,HERE
	RTRUE	


	.FUNCT	ANONF-146:ANY:0:0
	FSET?	HERE,ENCHANTED \?CCL3
	FCLEAR	HERE,ENCHANTED
	EQUAL?	ACTION,CAST-COMMAND \?CCL6
	EQUAL?	ACTION-OBJECT,WIND-SPELL \?CCL6
	ICALL2	USE-ESSENCES,WIND-SPELL
	GETP	HERE,P?TEMP
	GRTR?	STACK,13 \?CCL11
	PRINTI	"Using more air essence than he would have liked, Praxix cast a wind spell at the levitated raft, blowing it (and us) across to the far shore of the river, where we tumbled onto the ground."
	CALL1	CROSSED-RIVER
	RSTACK	
?CCL11:	PRINTI	"It was far too risky to try blowing us across the entire expanse of river, but there was enough air essence in Praxix' pouch to propel us back to the near shore, where we landed in a twisted heap, destroying the raft entirely."
	FCLEAR	RAFT,SEEN
	CALL2	MOVE-TO,RIVER-2
	RSTACK	
?CCL6:	PRINTI	"It wasn't long before we found out. We watched, helplessly as our raft sank down into the churning waters and started drifting downstream. "
	SET	'ACTION,UPSTREAM-COMMAND
	CALL2	RIVER-MOVE,1
	RSTACK	
?CCL3:	EQUAL?	ACTION,CROSS-COMMAND \?CCL13
	CALL2	RIVER-MOVE,6
	RSTACK	
?CCL13:	EQUAL?	ACTION,DOWNSTREAM-COMMAND \?CCL15
	CALL2	RIVER-MOVE,1
	RSTACK	
?CCL15:	EQUAL?	ACTION,UPSTREAM-COMMAND \?CCL17
	CALL2	RIVER-MOVE,1
	RSTACK	
?CCL17:	EQUAL?	ACTION,RETURN-COMMAND \?CCL19
	CALL2	RIVER-MOVE,-4
	RSTACK	
?CCL19:	EQUAL?	ACTION,CAST-COMMAND \?CCL21
	EQUAL?	ACTION-OBJECT,RAIN-SPELL \?CCL21
	ICALL1	SAVE-SPELL
	REMOVE	HYE-RIVER
	PRINTI	"It wasn't particularly funny when Praxix cast his rain spell and the level of the river grew even higher."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CCL26
	PRINTI	"""Will somebody take that child's toys away from him?"" Esher snarled."
	RTRUE	
?CCL26:	PRINTI	"""I think we've had enough magic for the present,"" Bergon said, trying his best to conceal his anger."
	RTRUE	
?CCL21:	EQUAL?	ACTION,CAST-COMMAND \?CCL28
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL28
	FSET?	HERE,TRAPPED \?CCL28
	CALL	QSET?,HERE,ENCHANTED
	ZERO?	STACK \?CCL28
	PRINTI	"Praxix hurriedly attempted to cast an elevation spell to forestall our encounter with the falls, and this he accomplished not a moment before we were to plunge over the falls."
	FSET?	BERGON,IN-PARTY \FALSE
	CRLF	
	CRLF	
	PRINTI	"""Out of curiosity,"" Bergon asked, turning to Praxix, ""what happens when the enchantment wears off?"""
	RTRUE	
?CCL28:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \FALSE
	ICALL1	SAVE-SPELL
	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix thought to cast his elevation spell on the raft, but the situation was not yet serious enough to take such a risk."
	RTRUE	


	.FUNCT	ANONF-147:ANY:0:0
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK /?CND1
	PRINTI	" But this was to be our last attempt at crossing: the river had beaten us."
	ICALL1	DIVIDER
	ICALL1	GIVE-UP-ENDING
	RTRUE	
?CND1:	ICALL2	UPDATE-REMOVE,RAFT
	FCLEAR	RAFT,SEEN
	ZERO?	FALLS-VICTIM \FALSE
	CALL2	REMOVE-PARTY-COMMAND,COMB-AREA-COMMAND
	RSTACK	


	.FUNCT	ANONF-148:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	CALL1	FALLS-SCOUT
	RSTACK	
?CCL3:	EQUAL?	ACTION,COMB-AREA-COMMAND \?CCL5
	CALL1	FALLS-COMB
	RSTACK	
?CCL5:	EQUAL?	ACTION,UP-COMMAND \FALSE
	SET	'FALLS-VICTIM,FALSE-VALUE
	ICALL1	NEXT-DAY
	FCLEAR	RAFT,SEEN
	CALL	MOVE-TO,RIVER-FALLS,STR?458
	RSTACK	


	.FUNCT	FALLS-COMB:ANY:0:0
	ICALL2	REMOVE-PARTY-COMMAND,COMB-AREA-COMMAND
	PRINTI	"Stumbling through the rocky shore, we spread out in search of "
	ICALL2	WPRINTD,FALLS-VICTIM
	PRINTI	"; after an hour with no results, we regrouped."
	CRLF	
	CRLF	
	PRINTI	"""I fear we have lost our friend, but we must go on without him."" Bergon said. ""He would wish it so."""
	EQUAL?	FALLS-VICTIM,ESHER \TRUE
	FSET?	FALLS,EXAMINED \TRUE
	CRLF	
	CRLF	
	PRINTI	"I thought back to what Esher had said earlier - could he have known what fate was in store for him?"
	RTRUE	


	.FUNCT	ANONF-149:ANY:0:0
	ZERO?	FALLS-VICTIM \FALSE
	CALL2	REMOVE-PARTY-COMMAND,COMB-AREA-COMMAND
	RSTACK	


	.FUNCT	ANONF-150:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	CALL1	FALLS-SCOUT
	RSTACK	
?CCL3:	EQUAL?	ACTION,COMB-AREA-COMMAND \?CCL5
	CALL1	FALLS-COMB
	RSTACK	
?CCL5:	EQUAL?	ACTION,UP-COMMAND \FALSE
	ICALL1	NEXT-DAY
	PRINTI	"Scrambling up the rocks, we came to the top of the falls. Exhausted and hurt, we quickly fell asleep and did not rise until late the next morning."
	CRLF	
	CRLF	
	CALL1	GO-TO-ASTRIX-MAZE
	RSTACK	


	.FUNCT	GO-TO-ASTRIX-MAZE:ANY:0:0
	PRINTI	"The next day, we started toward the mountains upon a well-travelled path. By mid-morning, having climbed well into the foothills of the Sunrise Mountain, we came to the first of what was destined to be many forks."
	CALL2	MOVE-TO,ASTRIX-MAZE
	RSTACK	


	.FUNCT	FALLS-SCOUT:ANY:0:0
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went ahead, scouting out the area, while the rest of us tended to our wounds. ""The shore goes only a short ways before the river enters a deep gorge."" he said, upon returning."
	ZERO?	FALLS-VICTIM /TRUE
	PRINTI	" ""I found no sign of "
	ICALL2	WPRINTD,FALLS-VICTIM
	PRINTI	"."""
	CRLF	
	CRLF	
	PRINTI	"I walked to the river's edge, and gazed up at the deadly falls. ""I hope it is we who are the lucky ones!"" I said, thinking of the dangers to come."
	RTRUE	


	.FUNCT	FIRST-IN-PARTY:ANY:2:4,CHR1,CHR2,CHR3,CHR4
	FSET?	CHR1,IN-PARTY \?CCL3
	RETURN	CHR1
?CCL3:	FSET?	CHR2,IN-PARTY \?CCL5
	RETURN	CHR2
?CCL5:	ZERO?	CHR3 /?CCL7
	FSET?	CHR3,IN-PARTY \?CCL7
	RETURN	CHR3
?CCL7:	ZERO?	CHR4 /FALSE
	FSET?	CHR4,IN-PARTY \FALSE
	RETURN	CHR4


	.FUNCT	CROSSED-RIVER:ANY:0:0
	CRLF	
	CRLF	
	PRINTI	"""That was enough excitement for a lifetime,"" I gasped, stumbling off the raft and onto the swaying earth."
	FSET?	BERGON,IN-PARTY \?CND1
	CRLF	
	CRLF	
	PRINTI	"Bergon laughed. ""I don't know about a lifetime,"" he said, ""but I suppose it will do for today!"""
?CND1:	PRINTI	" It was, in fact, late in the day, so we camped for the night alongside the river, expecting this to be our last night before meeting the Wizard Astrix."
	CRLF	
	CRLF	
	CALL1	GO-TO-ASTRIX-MAZE
	RSTACK	


	.FUNCT	RIVER-MOVE:ANY:1:1,NUM,OLD,NEW,MD,DV,VICTIM
	GETP	HERE,P?TEMP >OLD
	ADD	OLD,NUM >NEW
	MOD	NEW,5 >MD
	DIV	NEW,5 >DV
	PUTP	HERE,P?TEMP,NEW
	ZERO?	MD \?CCL3
	PRINTI	"The roar of the falls filled our ears. We frantically paddled "
	JUMP	?CND1
?CCL3:	ZERO?	PADDLE-FLAG \?CCL5
	PRINTI	"Now that we were on the water, we started paddling "
	JUMP	?CND1
?CCL5:	EQUAL?	PADDLE-FLAG,ACTION /?CCL7
	EQUAL?	ACTION,RETURN-COMMAND \?CCL10
	PRINTI	"It was clear that we weren't going to make it across, so we changed direction and"
	JUMP	?CND8
?CCL10:	PRINTI	"Next, we"
?CND8:	PRINTI	" started paddling "
	JUMP	?CND1
?CCL7:	CALL2	PICK-ONE,PADDLE-TBL
	PRINT	STACK
?CND1:	SET	'PADDLE-FLAG,ACTION
	EQUAL?	ACTION,RETURN-COMMAND \?CCL13
	PRINTI	"back toward shore"
	JUMP	?CND11
?CCL13:	EQUAL?	ACTION,DOWNSTREAM-COMMAND \?CCL15
	PRINTI	"downstream"
	JUMP	?CND11
?CCL15:	EQUAL?	ACTION,UPSTREAM-COMMAND \?CCL17
	ICALL2	REMOVE-PARTY-COMMAND,UPSTREAM-COMMAND
	PRINTI	"upstream"
	JUMP	?CND11
?CCL17:	PRINTI	"across the river"
?CND11:	EQUAL?	NEW,10,15,20 /?CTR19
	EQUAL?	NEW,5 \?CCL20
	EQUAL?	NUM,1 \?CCL20
?CTR19:	ICALL2	GRAPHIC,G-FALLS
	PRINTI	", but it was no use! Down we went, tumbling end over end, lungs so filled with water that we could not even scream! I must have blacked out, for I have no memory of reaching the shore."
	CRLF	
	CRLF	
	PRINTI	"Bruised, but otherwise uninjured, I stumbled along the shore and came upon "
	EQUAL?	PARTY-MAX,2 \?CCL27
	PRINTI	"Praxix"
	JUMP	?CND25
?CCL27:	PRINTI	"the others"
?CND25:	ICALL2	HINT,HINT-RIVER
	CALL1	SPARE-VICTIM >VICTIM
	ZERO?	VICTIM /?CND28
	SET	'FALLS-VICTIM,VICTIM
	ICALL2	PARTY-REMOVE,VICTIM
	GRTR?	PARTY-MAX,2 \?CCL32
	PRINTI	"; all, that is, but "
	ICALL2	WPRINTD,VICTIM
	PRINTI	", who"
	JUMP	?CND30
?CCL32:	PRINTI	"; "
	ICALL2	WPRINTD,VICTIM
?CND30:	PRINTI	" was nowhere to be seen"
?CND28:	PRINTC	46
	CRLF	
	CRLF	
	EQUAL?	NEW,5,10,15 \?CCL35
	FSET?	PRAXIX,IN-PARTY \?CCL38
	PRINTI	"""And for all our trouble, we're not even across the river!"" said Praxix. And this was true"
	JUMP	?CND36
?CCL38:	PRINTI	"We had not even made it across the river"
?CND36:	PRINTI	"; at best, we could climb back up the rocks to the top of the falls and be back near our starting point."
	ICALL2	MOVE-TO,BEACHED-NEAR
	RTRUE	
?CCL35:	FSET?	PRAXIX,IN-PARTY \?CCL41
	PRINTI	"""If nothing else, we have made it across the river,"" said Praxix. And this was true"
	JUMP	?CND39
?CCL41:	PRINTI	"We were across the river, however"
?CND39:	PRINTI	"; the riverfront was rough and rocky here, but it would be a simple matter to climb to our destination at the top of the falls."
	ICALL2	MOVE-TO,BEACHED-FAR
	RTRUE	
?CCL20:	EQUAL?	NEW,5,25,0 \?CCL43
	PRINTI	", and it seemed we must go over the falls. I closed my eyes, and a moment later the raft lurched forward as it struck some rocks not twenty paces from the falls. "
	CALL	FIRST-IN-PARTY,BERGON,MINAR,ESHER,PRAXIX
	ICALL2	WPRINTD,STACK
	PRINTI	" swung himself off the raft, and pulled "
	CALL2	ME/US,2
	PRINT	STACK
	PRINTI	" ashore."
	EQUAL?	NEW,5,0 \?CCL46
	ICALL2	MOVE-TO,RIVER-FALLS
	RTRUE	
?CCL46:	ICALL1	CROSSED-RIVER
	RTRUE	
?CCL43:	EQUAL?	ACTION,UPSTREAM-COMMAND \?CCL48
	PRINTI	", but we were no contest for the fierce current, which pulled our raft further downstream."
	JUMP	?CND18
?CCL48:	EQUAL?	ACTION,DOWNSTREAM-COMMAND \?CCL50
	PRINTI	", but the strong current needed little of our help."
	JUMP	?CND18
?CCL50:	PRINTI	" and were soon "
	EQUAL?	DV,1 \?CCL53
	PRINTI	"a third"
	JUMP	?CND51
?CCL53:	EQUAL?	DV,2 \?CCL55
	PRINTI	"about half"
	JUMP	?CND51
?CCL55:	EQUAL?	DV,3 \?CND51
	PRINTI	"two thirds"
?CND51:	ZERO?	DV /?CND57
	PRINTI	" of the way "
?CND57:	EQUAL?	ACTION,CROSS-COMMAND \?CCL61
	PRINTI	"to the far shore."
?CND18:	EQUAL?	MD,2 \?CCL66
	PRINTI	" The river was picking up speed, that was clear, and I was filled with foreboding about what lay beyond the curve ahead."
	RTRUE	
?CCL61:	PRINTI	"back to shore."
	LESS?	NEW,0 \?CND18
	ADD	NEW,5
	GET	SHORE-ROOMS,STACK
	ICALL2	MOVE-TO,STACK
	RTRUE	
?CCL66:	EQUAL?	MD,3 \?CCL68
	PRINTI	" We were rushing downstream now, and a loud, roaring noise could be heard from around the curve ahead."
	FSET?	BERGON,IN-PARTY \TRUE
	CRLF	
	CRLF	
	PRINTI	"""Paddle harder!"" Bergon implored, sensing the danger ahead."
	RTRUE	
?CCL68:	PRINTI	" As our raft turned the corner to the right, we could see "
	FSET?	FALLS,SEEN \?CCL73
	PRINTI	"the falls looming before us!"
	JUMP	?CND71
?CCL73:	PRINTI	"the reason for the quickening river: a large falls, and directly ahead of us!"
?CND71:	PRINTI	" We had just moments to act!"
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,DOWNSTREAM-COMMAND
	ICALL1	RESTORE-SPELLS
	FSET	HERE,TRAPPED
	RTRUE	

	.ENDSEG

	.ENDI
