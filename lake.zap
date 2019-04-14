
	.SEGMENT "LAKE"


	.FUNCT	GATE-TO-HIGH-PLAIN:ANY:0:0
	PRINTI	"We awoke with the sun, and could see now where we had come. We were on a ridge above a high plain in the mountains, just a few hundred feet above a large, blue-green lake. Not long after starting, we had descended into the plain. The sky was starting to darken in the north, and this could only mean an approaching storm."
	CALL2	MOVE-TO,HIGH-PLAIN
	RSTACK	


	.FUNCT	ANONF-168:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	CLEAR-EXBIT
	EQUAL?	ACTOR,PRAXIX \?CCL6
	PRINTI	"Praxix gazed absently at the stream, then picked up a small stone, and skimmed it over the rippling surface."
	CRLF	
	CRLF	
	PRINTI	"""A storm is brewing,"" he said as the stone disappeared from sight. ""We should move quickly, lest we be caught in it!"""
	JUMP	?CND4
?CCL6:	ICALL	CLEAR-EXBIT,GOLD-STREAM-OBJ,PRAXIX
	ICALL	ADD-TRAVEL-COMMAND,HERE,FIND-GOLD-COMMAND
	FSET	HERE,ADVISE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" bent down and ran his fingers through the icy mountain waters. He was just about to stand when his eye caught a glimpse of a shiny golden object sitting in the stream bed. Rolling up his sleeve, he reached down for it, but failed to come up with anything."
	CRLF	
	CRLF	
	PRINTI	"""I would swear it was gold,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, as he stared intently into the waters. ""Now that would be something of value!"""
	FSET?	BERGON,IN-PARTY \?CND4
	CRLF	
	CRLF	
	PRINTI	"""It is possible,"" Bergon replied, thoughtfully, ""that there is gold in these mountain waters, but I should think not."""
?CND4:	CRLF	
	CRLF	
	PRINTI	"The dark clouds lowered as they rolled in from the north. The winds started to howl; it would not be long before the rains came."
	RTRUE	


	.FUNCT	ANONF-169:ANY:0:0,TMP
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	GETP	HERE,P?TEMP
	ZERO?	STACK \?CCL6
	PRINTI	"Unsure of whether to press on or to search for more gold, Bergon gathered us together. ""I fear the storm that is to come,"" he said, then asked the rest of us for our opinions."
	CRLF	
	CRLF	
	PRINTI	"It is true that we had not travelled here in search of gold, but gold is a rare and valuable commodity. And thus, it was difficult to know whether it would hurt to search just a little longer."
	FSET?	ESHER,IN-PARTY \?CND7
	PRINTI	" Esher put it best. ""A little rain won't hurt, and neither would a little gold,"" he said."
?CND7:	CALL	UPDATE-FCLEAR,HERE,ADVISE
	RSTACK	
?CCL6:	GETP	HERE,P?TEMP
	EQUAL?	STACK,1 \FALSE
	PRINTI	"Bergon was becoming increasingly concerned. But, as earlier, the group was less inclined to leave this opportunity behind."
	CALL	UPDATE-FCLEAR,HERE,ADVISE
	RSTACK	
?CCL3:	EQUAL?	ACTION,FIND-GOLD-COMMAND \?CCL12
	GETP	HERE,P?TEMP
	ADD	STACK,1 >TMP
	PUTP	HERE,P?TEMP,TMP
	EQUAL?	TMP,1 \?CCL15
	ICALL	UPDATE-FSET,HERE,ADVISE
	PRINTI	"We each scanned the stream for gold, with little luck. The clouds, dark and heavy, began to rain down upon us. ""Look!"" said Bergon, pointing at the chain lightning off to the north. Seconds later, the earth shook with the roar of thunder. ""It is not far now,"" he added, as his eyes drifted to the blackening sky."
	RTRUE	
?CCL15:	PRINTI	"Runoff from the nearby hills was forming into numerous streams, each coursing into the main channel in which we searched in vain for gold. Crash! A tree nearby cracked in two by a stroke of lightning. Rain was falling now in buckets, and Bergon screamed for us to take cover. As I turned upstream, a great torrent of water was heading right at me!"
	ICALL	QUEUE,I-TORRENT-HITS,1
	CALL1	REMOVE-TRAVEL-COMMAND
	RSTACK	
?CCL12:	EQUAL?	ACTION,INVENTORY-COMMAND \?CCL17
	FSET?	HERE,DEAD \?CCL17
	CALL	QSET?,HERE,BLUE-MIX
	ZERO?	STACK \?CCL17
	PRINTI	"Frantically, I searched my pack. "
	ZERO?	TORRENT-LOSER /?CCL23
	PRINTI	"Over and over I looked, but it was no use. The "
	ICALL2	WPRINTD,TORRENT-LOSER
	PRINTI	" was gone!"
	CRLF	
	CRLF	
	PRINTI	"Praxix looked grim. ""This is an evil omen,"" he said. ""We shall not be able to replace it!"""
	RTRUE	
?CCL23:	PRINTI	"Fortunately, we had lost nothing to the storm."
	RTRUE	
?CCL17:	EQUAL?	ACTION,CAST-COMMAND \?CCL25
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL25
	GETP	HERE,P?TEMP
	GRTR?	STACK,0 \?CCL25
	EQUAL?	ACTION-PRSI,TAG-OBJECT \?CCL31
	PRINTI	"Fortunately, Praxix had the presence of mind to cast his levitate spell upon me, so that the torrent that approached washed harmlessly beneath me, preventing an almost certain loss of our possessions, no less my life. The others fared less well, having been knocked quite a ways downstream before they regained their footing. "
	ICALL1	FIND-STREAM-ESSENCE
	PRINTI	" Having had the good fortune to have found some magical essence, we continued alongside the stream until we came to the shore of the lake."
	CALL2	MOVE-TO,LAKE-SHORE-1
	RSTACK	
?CCL31:	PRINTI	"Praxix, taking out his air and earth essences, cast his elevation spell on "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	", who rose slowly into the air before us. Still, the onrushing waters approached, and I tried desparately to get away. "
	ICALL1	TORRENT-HITS
	RTRUE	
?CCL25:	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	GETP	HERE,P?TEMP >TMP
	LESS?	TMP,1 \?CCL36
	PRINTI	"We made our way along the stream down to the shore of the lake, as a great downpour was loosed from the sky. The stream rose steadily, and lightning filled the northern sky. Soon, the stream became a wild torrent, nearly washing us aside as we rushed to take cover. And then, as quickly as it came, the storm passed, and a wide rainbow filled the brightening sky."
	CRLF	
	CRLF	
	PRINTI	"""That was awfully close!"" I said, checking that the contents of my pack were secure."
	CRLF	
	CRLF	
	CALL	MOVE-TO,LAKE-SHORE-1,STR?490
	RSTACK	
?CCL36:	FSET?	HERE,DEAD \?CCL38
	CALL	MOVE-TO,LAKE-SHORE-1,STR?491
	RSTACK	
?CCL38:	ICALL1	TORRENT-HITS
	RTRUE	


	.FUNCT	ANONF-170:ANY:0:0
	FSET?	HERE,DEAD /FALSE
	EQUAL?	HERE,GOLD-STREAM \FALSE
	CRLF	
	CRLF	
	CALL1	TORRENT-HITS
	RSTACK	


	.FUNCT	TORRENT-HITS:ANY:0:0
	FSET	HERE,DEAD
	PRINTI	"Too late! We watched as a torrent flowed down the hillside, knocking us down and washing my pack downstream. I did my best to salvage its contents, then scrambled with the others to a rock-sheltered spot nearby, where we waited for the storm to abate."
	IN?	DWARF-STONE,INVENTORY \?CCL3
	SET	'TORRENT-LOSER,DWARF-STONE
	JUMP	?CND1
?CCL3:	IN?	WEBBA-MAP,INVENTORY \?CND1
	SET	'TORRENT-LOSER,WEBBA-MAP
?CND1:	ZERO?	TORRENT-LOSER /?CND5
	ICALL2	HINT,HINT-GOLD
	ICALL2	UPDATE-MOVE,TORRENT-LOSER
?CND5:	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	ICALL	UPDATE-FCLEAR,HERE,INVENTORIED
	ICALL2	REMOVE-PARTY-COMMAND,FIND-GOLD-COMMAND
	CALL1	FIND-STREAM-ESSENCE
	RSTACK	


	.FUNCT	FIND-STREAM-ESSENCE:ANY:0:0
	CRLF	
	CRLF	
	PRINTI	"Strangely, Praxix returned to the swollen stream, and pulled up a few peculiar golden stones."
	CRLF	
	CRLF	
	PRINTI	"""After all that, you of all people are looking for gold!"" Bergon huffed."
	CRLF	
	CRLF	
	PRINTI	"""Not gold, Bergon,"" he said, rubbing the golden veneer off of the stone. ""Water essence, though not altogether much, I'm afraid. I suspect that's what caught our eye in the first place."" Soon, Praxix had finished isolating the water essence from its golden facade, and had placed it safely away in his pouch."
	CALL	FIND-ESSENCE,ESSENCE-WATER,3
	RSTACK	


	.FUNCT	ANONF-171:ANY:0:0
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK \FALSE
	EQUAL?	PARTY-MAX,2 \?CND4
	PRINTI	"After a brief lunch at the lake, we continued around to the far shore."
	ICALL	REMOVE-TRAVEL-COMMAND,LAKE-SHORE-3,BACK-COMMAND
	ICALL2	MOVE-TO,LAKE-SHORE-3
	RTRUE	
?CND4:	CRLF	
	CRLF	
	PRINTI	"The sun was high in the sky; no sign, not even the rainbow, remained as testament to the deluge we had just witnessed. It had been a while since our last meal, and talk soon turned to lunch. Bergon strode to the shore of the glistening lake and eyed it hungrily."
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-LAKE-SHORE
	PRINTI	"""Have I ever told you about my fishing days at Lendros?"" he said. Nobody responded to this informal banter, but Bergon persisted."
	CRLF	
	CRLF	
	PRINTI	"""How would everyone feel about some fresh lake trout?"" he asked."
	CRLF	
	CRLF	
	PRINTI	"""Oh, my, yes; that would hit the spot!"" he replied, playfully."
	CRLF	
	CRLF	
	PRINTI	"Then, taking the slightest murmur from the group as a mandate, he dove into the icy clear waters."
	CRLF	
	CRLF	
	PRINTI	"He surfaced soon thereafter; though out of breath, he gasped something about our upcoming feast"
	ZERO?	2ND-PASS \?CCL8
	FSET?	DWARF-MEETING,SEEN /?CCL8
	CALL	FIRST-IN-PARTY,MINAR,ESHER >LAKE-VICTIM
	ZERO?	LAKE-VICTIM /?CCL13
	PRINTI	". Seeing how weakened Bergon had become, "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" pulled him from the lake and dove in to catch our lunch himself. But he did not surface, and, after a few agonizingly long minutes, our concern turned to alarm."
	ICALL2	PARTY-REMOVE,LAKE-VICTIM
	JUMP	?CND6
?CCL13:	PRINTI	". But Praxix convinced Bergon that, having already lost some of our party, he should not attempt such a dive in his breathless condition."
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	RTRUE	
?CCL8:	PRINTI	", laughed, then dove again into the lake. Only this time, he did not return."
	SET	'LAKE-VICTIM,BERGON
	ICALL2	PARTY-REMOVE,BERGON
?CND6:	FSET	LAKE-VICTIM,INCAPACITATED
	SET	'UPDATE-FLAG,TRUE-VALUE
	CALL2	ADD-PARTY-COMMAND,ENTER-LAKE-COMMAND
	RSTACK	


	.FUNCT	ANONF-172:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	EQUAL?	ACTOR,ESHER \?CCL6
	PRINTI	"Frant"
	JUMP	?CND4
?CCL6:	PRINTI	"Method"
?CND4:	PRINTI	"ically, "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" scouted the area along the shore looking for any sign of "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	". He returned frustrated, having found no sign of our missing friend."
	EQUAL?	ACTOR,MINAR \TRUE
	PRINTI	" He did, however, find something of interest, and not far from where we stood."
	CRLF	
	CRLF	
	PRINTI	"""There's a cave,"" he said, ""just a little farther along the shore."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL10
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	ICALL2	WPRINTD,LEADER
	EQUAL?	LAKE-VICTIM,BERGON \?CND11
	PRINTI	", taking charge and attempting at the same time not to sound overly pessimistic,"
?CND11:	PRINTI	" said, ""Perhaps "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" has been caught in a current, and carried further along the shore."""
	CRLF	
	CRLF	
	EQUAL?	LEADER,PRAXIX \?CCL15
	PRINTI	"Praxix continued. """
	JUMP	?CND13
?CCL15:	PRINTI	"Praxix concurred. """
	ICALL2	WPRINTD,LEADER
	PRINTI	" is right,"" he started, """
	EQUAL?	LEADER,ESHER \?CCL18
	PRINTI	"though I am loath to admit it. T"
	JUMP	?CND13
?CCL18:	PRINTC	116
?CND13:	PRINTI	"here is no sign of "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	", and that is very disturbing indeed! Perhaps we shall learn more as we progress along the lake shore."""
	RTRUE	
?CCL10:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL20
	ZERO?	LAKE-VICTIM /?CCL23
	CALL	MOVE-TO,LAKE-SHORE-2,STR?492
	RSTACK	
?CCL23:	PRINTI	"After a restful night at the shore of the lake, we marched around the shore until the path ended, continuing instead steeply upward into the surrounding hills."
	CRLF	
	CRLF	
	GETP	LAKE-SHORE-3,P?ACTION
	ICALL	STACK
	RTRUE	
?CCL20:	EQUAL?	ACTION,ENTER-LAKE-COMMAND \FALSE
	PRINTI	"With a sense of urgency, I jumped into the cold waters and dove vertically down along a vast rock wall which stretched out of sight beneath me. But whereas the wall bounded my movements on one side, the vastness of the lake stretched out before me on the other - clear and still - and there was no sign of "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTC	33
	CALL2	MOVE-TO,UNDERSHORE-1
	RSTACK	


	.FUNCT	ANONF-173:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went ahead, "
	FSET?	PRAXIX,LIT /?CCL6
	PRINTI	"but returned before long, telling us that the cave was too dark to explore without additional light."
	RTRUE	
?CCL6:	PRINTI	"taking Praxix' staff with him for light. When he returned, he related that the cave continued until it ended at the site of a deep, warm pool."
	RTRUE	
?CCL3:	EQUAL?	ACTION,ENTER-CAVE-COMMAND \?CCL8
	FSET	HERE,DONT-SCOUT
	FSET?	LAKE-CAVE,SEEN \?CCL11
	ICALL1	REMOVE-TRAVEL-COMMAND
	ICALL	REMOVE-TRAVEL-COMMAND,LAKE-SHORE-3,BACK-COMMAND
	PRINTI	"Determined not to give up hope, we again entered the cave"
	FSET?	LAKE-POOL,SEEN \?CCL14
	PRINTI	", continuing down the narrow path until we reached the edge of the warm pool"
	ICALL2	MOVE-TO,LAKE-POOL
	JUMP	?CND12
?CCL14:	ICALL2	MOVE-TO,LAKE-CAVE
?CND12:	PRINTC	46
	JUMP	?CND9
?CCL11:	PRINTI	"Following the side of the warm spring into the cave, we passed through caverns whose water-polished walls gave testimony to the torrents that had flowed through these chambers many long years ago."
	ICALL2	MOVE-TO,LAKE-CAVE
?CND9:	EQUAL?	HERE,LAKE-CAVE \TRUE
	FSET?	PRAXIX,LIT /TRUE
	PRINTI	" We were now far enough into the cave that the available light was fading quickly. It would be far too dangerous to proceed any further."
	RTRUE	
?CCL8:	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	PRINTI	"The path along the shore soon ended, continuing instead steeply upward into the surrounding hills. Further progress along the shore would be impossible."
	FSET?	LAKE-VICTIM,IN-PARTY /?CND21
	CALL	QSET?,HERE,BLUE-MIX
	ZERO?	STACK \?CND21
	PRINTI	" If we continued now, it was almost certain we'd never see "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" again."
?CND21:	CALL2	MOVE-TO,LAKE-SHORE-3
	RSTACK	


	.FUNCT	ANONF-174:ANY:0:0
	FSET?	LAKE-VICTIM,IN-PARTY \FALSE
	CALL2	REMOVE-PARTY-COMMAND,BACK-COMMAND
	RSTACK	


	.FUNCT	ANONF-175:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	ZERO?	LAKE-VICTIM /?CCL6
	FSET?	LAKE-VICTIM,IN-PARTY /?CCL6
	ICALL2	HINT,HINT-LAKE
	PRINTI	"""I am afraid we have no alternative,"" "
	ICALL2	WPRINTD,LEADER
	PRINTI	" said, ""but to go on without "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	"."""
	CRLF	
	CRLF	
	JUMP	?CND4
?CCL6:	ZERO?	LAKE-VICTIM /?CND4
	IN?	NYMPH-STONE,INVENTORY /?CND4
	ICALL2	HINT,HINT-NYMPH-STONE
?CND4:	ZERO?	2ND-PASS /?CND12
	FSET?	BITE-FOREST,SEEN /?CCL16
	FSET?	MINAR,IN-PARTY /?CTR15
	FSET?	ESHER,IN-PARTY \?CCL16
?CTR15:	PRINTI	"The next morning, we retraced our earlier steps, skirting the edge of the lake, and descending back into the forest for our return to Astrix. It was soon midday, and we decided to stop in a nearby clearing for some lunch."
	ICALL2	MOVE-TO,BITE-FOREST
	RTRUE	
?CCL16:	ICALL2	N-DAY-TREK,3
	RTRUE	
?CND12:	PRINTI	"We left the lake, climbing out of the valley and into the northeastern hills. Following a narrow path, we marched until, late in the afternoon, the path climbed steeply up a high ridge. We arrived as dusk approached and stood in awe of the world that surrounded us."
	CRLF	
	CRLF	
	CALL1	MOVE-TO-FOREST-RIDGE
	RSTACK	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Unwilling to leave the lake without making another attempt at finding "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	", we retraced our steps and soon arrived back at the mouth of the cave."
	CALL2	MOVE-TO,LAKE-SHORE-2
	RSTACK	


	.FUNCT	ANONF-176:ANY:0:0
	FSET?	PRAXIX,LIT \FALSE
	CALL	FORCE-TRAVEL-COMMAND,HERE,PROCEED-COMMAND
	RSTACK	


	.FUNCT	ANONF-177:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	FSET?	PRAXIX,LIT /?CCL6
	PRINTI	"Despite the darkness, we continued down the narrow path until it became clearly futile to do so."
	CRLF	
	CRLF	
	PRINTI	"""It is bad enough that we have lost "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	","" Praxix said. ""It would be folly to risk other lives."""
	CALL1	REMOVE-TRAVEL-COMMAND
	RSTACK	
?CCL6:	CALL	MOVE-TO,LAKE-POOL,STR?495
	RSTACK	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	PRINTI	"It appeared "
	FSET?	PRAXIX,LIT \?CCL11
	PRINTI	"the cave would lead nowhere"
	JUMP	?CND9
?CCL11:	PRINTI	" we would not learn where the cave led"
?CND9:	CALL	MOVE-TO,LAKE-SHORE-2,STR?496
	RSTACK	


	.FUNCT	ANONF-178:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	FSET?	UNDERPOOL-2,SEEN /?CTR5
	FSET?	ESHER,IN-PARTY /?CCL6
?CTR5:	PRINTI	"We huddled among ourselves, but few words were spoken. And yet I could see in Praxix' eyes the desire that I"
	FSET?	UNDERPOOL-2,SEEN \?CND9
	PRINTI	" once again"
?CND9:	PRINTI	" attempt the descent."
	RTRUE	
?CCL6:	FSET?	UNDERPOOL-2,SEEN \?CCL12
	PRINTI	"Esher felt it would be dangerous to explore the pool further, but Praxix was more optimistic. ""This pool appears natural, yet it is clearly the handiwork of great artisans; the search for knowledge is always dangerous, Esher, and yet is it not the purpose of our Journey?"" he said."
	RTRUE	
?CCL12:	ICALL2	WPRINTD,LEADER
	PRINTI	" stood a long while in thought, then asked for advice."
	GRTR?	PARTY-MAX,2 \?CND13
	PRINTI	" When none spoke, I made a rare suggestion of my own."
?CND13:	PRINTI	" ""I am happy to have a look underwater, if you think it would help,"" I said."
	EQUAL?	LEADER,PRAXIX /TRUE
	CRLF	
	CRLF	
	PRINTI	"Praxix said nothing; he turned toward the pool and stared."
	RTRUE	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND /?CTR17
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL18
?CTR17:	ICALL	REMOVE-TRAVEL-COMMAND,HERE,PROCEED-COMMAND
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL23
	ICALL2	WPRINTD,ACTOR
	JUMP	?CND21
?CCL23:	PRINTI	"Praxix, going on ahead,"
?CND21:	PRINTI	" tried to find another path through the cave, but failed. ""This is as far as it goes,"" he said."
	RTRUE	
?CCL18:	EQUAL?	ACTION,BACK-COMMAND \?CCL25
	FSET?	UNDERPOOL-2,SEEN \?CCL28
	PRINTC	87
	JUMP	?CND26
?CCL28:	PRINTI	"It appeared the cave would lead nowhere; and so, w"
?CND26:	PRINTI	"ith hope fading for our lost friend, we returned to the mouth of the cave."
	CALL2	MOVE-TO,LAKE-SHORE-2
	RSTACK	
?CCL25:	EQUAL?	ACTION,ENTER-POOL-COMMAND \?CCL30
	FSET	HERE,ADVISE
	ZERO?	SUBGROUP-MODE \?CND31
	ICALL2	MAKE-TAG-SUBGROUP,TRUE-VALUE
?CND31:	FSET?	UNDERPOOL-2,SEEN \?CCL35
	PRINTI	"With Praxix' encouragement, I descended again through the warm waters, coming finally to the lip of the tube. I had only seconds to make a decision."
	JUMP	?CND33
?CCL35:	PRINTI	"It was the consensus that we search the depths of the pool in search of whatever lay below. I volunteered, giving my pack to Praxix for safe keeping. Then, taking a deep breath, I plunged into the warming waters."
	CRLF	
	CRLF	
	PRINTI	"I descended along the rock formations which bounded the pool, admiring the flowing forms that the water had created through the long ages. And then, a knot formed in my stomach. For the walls surrounding me were now smooth, like polished glass. I shuddered, thinking of what might lie beyond."
	CRLF	
	CRLF	
	PRINTI	"I had just about reached the limit of my descent, when I came to the end of the tube as it opened out into what I could only imagine was the greater part of the lake. I had to think fast: no matter which choice I made, I would have to surface at once!"
?CND33:	CALL2	MOVE-TO,UNDERPOOL-2
	RSTACK	
?CCL30:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \FALSE
	PRINTI	"Praxix was intrigued by this pool, and decided to see just how deep it was. And so he pulled out some fire and air essence, and shot a ball of flame into the water; it fizzled out even as it penetrated the surface."
	FSET?	ESHER,IN-PARTY \?CND40
	PRINTI	" Esher raised an eyebrow;"
?CND40:	PRINTI	" I stifled a laugh."
	CRLF	
	CRLF	
	PRINTI	"Praxix straightened up and, trying his best to sound sincere, said, ""As I suspected!"""
	RTRUE	


	.FUNCT	POOL-MOVE:ANY:1:1,STR
	ICALL1	CLEAR-SUBGROUP
	ICALL1	RESTORE-TAG-COMMANDS
	ICALL1	RESTORE-TAG-OBJECTS
	CALL	MOVE-TO,LAKE-POOL,STR
	RSTACK	


	.FUNCT	ANONF-179:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Having little time, I nonetheless examined the tube. It was smooth to the touch, and of a material completely foreign to me. Here, at the bottom, it was only four feet across, making it difficult to maneuver."
	RTRUE	


	.FUNCT	ANONF-180:ANY:0:0
	EQUAL?	ACTION,LEAVE-TUBE-COMMAND \?CCL3
	PRINTI	"Now I am not a cowardly person, yet I was sorely tempted to rise back to the surface. But some inner reserve of strength guided my actions; I pulled myself through the lip of the tube, then rose steadily toward the unknown."
	CALL1	UL-1-MOVE
	RSTACK	
?CCL3:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	CALL	QSET?,HERE,TRIED
	ZERO?	STACK \?CCL8
	PRINTI	"Now I am not a cowardly person, though by returning to the surface it may appear otherwise. And yet, how could I know what I might find when I rose to the surface outside of the tube? For that matter, I could not even be sure there was a surface to reach!"
	JUMP	?CND6
?CCL8:	ICALL	REMOVE-TRAVEL-COMMAND,LAKE-POOL,ENTER-POOL-COMMAND
	PRINTI	"Once again, however, I found myself unable to leave the tube and venture forth into the unknown."
?CND6:	CRLF	
	CRLF	
	CALL2	POOL-MOVE,STR?503
	RSTACK	


	.FUNCT	ANONF-181:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Each of us was mesmerized by this lovely pool, whose depth appeared infinite. "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" picked up a rock lying nearby and tossed it into the water; we watched it as it fell and when it finally disappeared from sight, we were watching still."
	RTRUE	


	.FUNCT	ANONF-182:ANY:0:0
	ICALL2	MAKE-SUBGROUP,TAG
	CALL	TRAVEL-COMMANDS,TAG,NUL-COMMAND
	RSTACK	


	.FUNCT	ANONF-183:ANY:0:0
	ICALL1	CLEAR-SUBGROUP
	CALL1	RESTORE-TAG-COMMANDS
	RSTACK	


	.FUNCT	ANONF-184:ANY:0:0
	EQUAL?	ACTION,DIVE-COMMAND \?CCL3
	PRINTI	"Mustering my remaining strength, I dove farther along the rock wall. Almost out of air, I caught sight of the wall's bottom some fifty or more feet below me. ""He could not have gone this way,"" I said to myself. ""There is not a person alive strong enough!"" And yet, gazing into the expanse of lake before me, I could hardly imagine where else he could have gone without leaving the slightest trace."
	CRLF	
	CRLF	
	CALL	MOVE-TO,LAKE-SHORE-1,STR?507
	RSTACK	
?CCL3:	EQUAL?	ACTION,SURFACE-COMMAND \FALSE
	ICALL	TRAVEL-COMMANDS,LAKE-SHORE-1,PROCEED-COMMAND
	PRINTI	"With no sign of "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	", I returned to the surface and reported back to the group."
	CALL2	MOVE-TO,LAKE-SHORE-1
	RSTACK	

	.ENDSEG

	.SEGMENT "NYMPHS"


	.FUNCT	UL-1-MOVE:ANY:0:0
	PICINF	G-NYMPH-CHAMBER,PICINF-TBL /?BOGUS1
?BOGUS1:	ZERO?	SUBGROUP-MODE \?CND2
	ICALL2	MAKE-TAG-SUBGROUP,TRUE-VALUE
?CND2:	CRLF	
	CRLF	
	PRINTI	"Within moments, I had arrived at the surface, pulling myself out of another, larger pool and onto a sandy area. Exhausted, yet exhilarated, I rose to my feet and found myself standing in a wide chamber cut from the surrounding rock; a finely carved archway led into a dimly glowing passage. On the archway were runes quite unlike any I had ever seen before."
	CRLF	
	CRLF	
	PRINTI	"Still somewhat lightheaded from my time underwater, I walked into the passage, which soon widened into a grander chamber adorned with colorful banners. This would be the land of the Nymphs, if "
	ZERO?	2ND-PASS /?CCL6
	PRINTI	"Astrix"
	JUMP	?CND4
?CCL6:	PRINTI	"my book of legends"
?CND4:	PRINTI	" was to be believed. And there, to my surprise, was "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	", lying on a bed of straw and covered in a heavy woolen blanket."
	CRLF	
	CRLF	
	ICALL	TRAVEL-COMMANDS,TAG,PICK-UP-COMMAND,DROP-COMMAND,EXAMINE-COMMAND
	CALL	MOVE-TO,UL-2,STR?508
	RSTACK	


	.FUNCT	ANONF-185:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	CALL1	EXAMINE-LAKE-VICTIM
	RSTACK	


	.FUNCT	ANONF-186:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	CALL1	EXAMINE-LAKE-VICTIM
	RSTACK	


	.FUNCT	ANONF-187:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	CALL1	EXAMINE-LAKE-VICTIM
	RSTACK	


	.FUNCT	EXAMINE-LAKE-VICTIM:ANY:0:0
	FSET?	LAKE-VICTIM,INCAPACITATED \?CCL3
	FSET	LAKE-VICTIM,TRIED
	PRINTI	"At first, "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" appeared unnaturally still, perhaps dead. But the blanket which covered him heaved slowly with his breath, and for this, I was greatly relieved."
	FSET?	HERE,EXAMINED \?CND4
	CRLF	
	CRLF	
	PRINTI	"But as I knelt beside him, my foot inadvertantly caught the end of the blanket, and pulled it to the floor. "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" was not only unconscious, but his feet and hands had been tightly bound!"
?CND4:	PRINTI	" Fortunately, it was a simple matter to remove his bonds. Bringing him back to consciousness would be another thing entirely, and it was likely that the creature that bound him would return before long."
	CRLF	
	CRLF	
	PRINTI	"But this problem was soon solved of itself, for "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" slowly started to wake. He was too weak to be moved, so I calmed him the best I could by urging him to rest."
	FCLEAR	LAKE-VICTIM,INCAPACITATED
	RTRUE	
?CCL3:	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" was already quite a bit stronger and appeared fit enough to return with me to the cave where our party stood waiting."
	RTRUE	


	.FUNCT	ANONF-188:ANY:0:0
	FSET?	LAKE-VICTIM,INCAPACITATED \?CND1
	FCLEAR	LAKE-VICTIM,INCAPACITATED
	ICALL	CHANGE-TRAVEL-COMMAND,UL-2,RETURN-ALONE-COMMAND,TO-CAVE-COMMAND
	EQUAL?	HERE,UL-2 \?CND1
	CRLF	
	CRLF	
	PRINTI	"Just then, "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" stirred and I moved to his side. Within a few minutes, he had regained consciousness, but I advised him to remain quiet and calm"
	FSET?	LAKE-VICTIM,TRIED \?CCL7
	PRINTI	" until we were ready to make our escape."
	JUMP	?CND1
?CCL7:	PRINTI	". Although short of breath, he told of his underwater capture by the Nymphs. He did not know their purpose, nor could he guess, yet he was certain of their evil designs."
	CRLF	
	CRLF	
	PRINTI	"""We must leave here at once,"" he said, ""for surely they will return before long."""
?CND1:	REMOVE	I-LAKE-VICTIM-COMES-TO
	RTRUE	


	.FUNCT	ANONF-189:ANY:0:0
	ICALL2	TORCH-CHECK,HERE
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK \FALSE
	ICALL	QUEUE,I-LAKE-VICTIM-COMES-TO,8
	EQUAL?	LAKE-VICTIM,MINAR \?CCL6
	ICALL	UPDATE-MOVE,UL-2-MINAR,HERE
	JUMP	?CND4
?CCL6:	EQUAL?	LAKE-VICTIM,ESHER \?CCL8
	ICALL	UPDATE-MOVE,UL-2-ESHER,HERE
	JUMP	?CND4
?CCL8:	ICALL	UPDATE-MOVE,UL-2-BERGON,HERE
?CND4:	CALL	OPTION,TAG,STAND-COMMAND,HIDE-COMMAND
	RSTACK	


	.FUNCT	ANONF-190:ANY:0:0
	EQUAL?	ACTION,TO-CAVE-COMMAND \?CCL3
	FSET?	LAKE-VICTIM,INCAPACITATED \?CCL6
	PRINTI	"It was clear that we were in great danger, and my immediate reaction was to return to the pool with "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	". But it was painfully obvious that he was in no condition to be moved, no less withstand the dive. No, I could return, but it would not be with "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTC	46
	CALL	CHANGE-TRAVEL-COMMAND,HERE,TO-CAVE-COMMAND,RETURN-ALONE-COMMAND
	RSTACK	
?CCL6:	PRINTI	"Now conscious and regaining his strength, I managed to help "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" back to the pool"
	IN?	TORCH,INVENTORY \?CCL9
	PRINTI	". As much as I would have preferred to take the torch along, I simply could not handle both it and "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	". Holding my friend firmly, we dove"
	JUMP	?CND7
?CCL9:	PRINTI	" and then down"
?CND7:	PRINTI	" into the warm waters, finally reaching the tube which led back to"
	CALL2	END-NYMPH-STORY,TRUE-VALUE
	RSTACK	
?CCL3:	EQUAL?	ACTION,RETURN-ALONE-COMMAND \?CCL11
	PRINTI	"There was no way that I could help poor "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	". In a few moments, his captors would no doubt arrive, and then both of us might well be doomed. Heavy of heart, I dove back into the pool, and from there back into the tube which led back to"
	CALL1	END-NYMPH-STORY
	RSTACK	
?CCL11:	EQUAL?	ACTION,WIDE-PATH-COMMAND \?CCL13
	CALL2	UL-MOVE-CHECK,UL-JCN
	ZERO?	STACK /FALSE
	PRINTI	"With a good deal of apprehension, I ventured through the doorway and into a hallway which came to a large, empty chamber, with an ornate doorway to the right and a simpler one to the left, from which a nasty smell emanated. Ahead, another passage led into the distance."
	CALL2	UL-MOVE,UL-JCN
	RSTACK	
?CCL13:	EQUAL?	ACTION,NARROW-PATH-COMMAND \?CCL18
	CALL2	UL-MOVE-CHECK,UL-2-PIT
	ZERO?	STACK /FALSE
	PRINTI	"The narrow path snaked through the rock until it ended blindly at a very small, rounded chamber, in the middle of which lay a "
	FSET?	UL-2-PIT,SCOUTED \?CCL24
	PRINTI	"perfectly round pool of water."
	JUMP	?CND22
?CCL24:	PRINTI	"large stone cover."
?CND22:	CALL2	UL-MOVE,UL-2-PIT
	RSTACK	
?CCL18:	EQUAL?	ACTION,HIDE-COMMAND \?CCL26
	ICALL2	SINGLE-MOVE-GRAPHIC,G-LIURA
	FSET	HERE,TRIED
	ICALL	QUEUE,I-NYMPHS-ARRIVE,40
	PRINTI	"With some hesitation, I decided to wait outside of the chamber until I could see who was coming. And then it came, whatever creature it was that inhabited these halls. It moved slowly, but gracefully, to "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	"'s side, as if checking on his health. Relieved, I was about to greet this unknown being, when I noticed the ropes which bound together "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	"'s hands and feet! A moment later, the being glided out of the room, and I again reentered."
	CALL1	END-OPTION
	RSTACK	
?CCL26:	EQUAL?	ACTION,WAIT-COMMAND \?CCL28
	PRINTI	"I did as the creature asked, but this was a tragic mistake. Within minutes"
	PRINT	ARMED-CREATURES
	CALL1	END-NYMPH-STORY
	RSTACK	
?CCL28:	EQUAL?	ACTION,STAND-COMMAND \FALSE
	ICALL2	SINGLE-MOVE-GRAPHIC,G-LIURA
	ICALL	QUEUE,I-NYMPHS-ARRIVE,24
	PRINTI	"I stood there as a strange creature entered the chamber, and I cannot honestly say which of us was the more surprised. But a moment later, it spoke with an utterly foreign accent and a hint of what I could only call nervousness."
	CRLF	
	CRLF	
	PRINTI	"""Your friend is quite ill,"" it said. ""It would be best for you to wait by his side until I return. Do not touch or examine him! He clings perilously to life!"" And with that, the creature left the chamber."
	ICALL	ADD-TRAVEL-COMMAND,HERE,WAIT-COMMAND
	FSET	HERE,EXAMINED
	CALL1	END-OPTION
	RSTACK	


	.FUNCT	ANONF-191:ANY:0:0
	SET	'NYMPHS-COMING?,TRUE-VALUE
	RETURN	NYMPHS-COMING?


	.FUNCT	ANONF-192:ANY:0:0,TMP
	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL3
	EQUAL?	HERE,UL-PIT \?CCL6
	FCLEAR	HERE,TORCHBIT
	ICALL	FORCE-TRAVEL-COMMAND,HERE,DIVE-COMMAND
	ICALL	UPDATE-MOVE,TORCH,INVENTORY
	GETP	TORCH,P?TEMP
	ZERO?	STACK \?CCL9
	PRINTI	"Not knowing which chambers might be unlighted, I thought it best to take one of the torches."
	JUMP	?CND7
?CCL9:	PRINTI	"Again, I attempted to take one of the torches, but this time I succeeded."
?CND7:	PRINTI	" It's light was bright but cold, and its flame gave off little heat."
	RTRUE	
?CCL6:	ICALL	UPDATE-FSET,TORCH,DONT-TAKE
	GETP	TORCH,P?TEMP
	ADD	STACK,1 >TMP
	PUTP	TORCH,P?TEMP,TMP
	GRTR?	TMP,1 \?CND10
	PRINTI	"Again, "
?CND10:	PRINTI	"I tried to take one of the torches, but failed. They were too firmly attached to the wall."
	RTRUE	
?CCL3:	EQUAL?	ACTION,DROP-COMMAND \FALSE
	PRINTI	"I considered putting down the torch but decided against it, believing that it might well come in useful later."
	RTRUE	


	.FUNCT	TORCH-CHECK:ANY:1:1,RM
	FSET?	RM,TORCHBIT \FALSE
	IN?	TORCH,INVENTORY /FALSE
	ICALL	UPDATE-MOVE,TORCH,RM
	CALL	UPDATE-FCLEAR,TORCH,DONT-TAKE
	RSTACK	


	.FUNCT	UL-MOVE-CHECK:ANY:1:1,RM
	IN?	TORCH,INVENTORY /TRUE
	FSET?	RM,TORCHBIT /TRUE
	FCLEAR	RM,LIT
	PRINTI	"I slowly entered the chamber, but it was pitch black inside and, rather than risk injury (or worse), I decided to retrace my steps."
	RFALSE	


	.FUNCT	UL-MOVE:ANY:1:1,RM
	ICALL2	TORCH-CHECK,RM
	FSET	RM,LIT
	EQUAL?	HERE,RM \?CND1
	FSET?	RM,TORCHBIT /?CCL2
	EQUAL?	RM,UL-PIT \?CND1
?CCL2:	FSET?	HERE,TORCHBIT /?CCL9
	PRINTI	" A single torch, mounted alongside"
	JUMP	?CND7
?CCL9:	PRINTI	" Torches, mounted on either side of"
?CND7:	PRINTI	" the entrance, cast cold, flickering shadows on the stone walls."
?CND1:	CALL2	MOVE-TO,RM
	RSTACK	


	.FUNCT	END-NYMPH-STORY:ANY:0:1,PA
	REMOVE	I-NYMPHS-ARRIVE
	PRINTC	32
	EQUAL?	PARTY-MAX,3 \?CCL3
	PRINTI	"Praxix"
	JUMP	?CND1
?CCL3:	PRINTI	"our party"
?CND1:	PRINTI	". After retelling the story of my adventures, we left the cave, returning to the shore of the lake."
	ICALL1	CLEAR-SUBGROUP
	ICALL1	RESTORE-TAG-OBJECTS
	ICALL1	RESTORE-TAG-COMMANDS
	ICALL	UPDATE-MOVE,TALE-NYMPHS,PRAXIX-TALES
	ZERO?	PA /?CND4
	ICALL2	PARTY-ADD,LAKE-VICTIM
?CND4:	ZERO?	2ND-PASS /?CCL8
	FSET?	LAKE-VICTIM,IN-PARTY /?CND9
	ICALL2	HINT,HINT-LAKE
?CND9:	FSET?	BITE-FOREST,SEEN /?CCL13
	FSET?	MINAR,IN-PARTY /?CTR12
	FSET?	ESHER,IN-PARTY \?CCL13
?CTR12:	PRINTI	"The next morning, we retraced our earlier steps, skirting the edge of the lake, and descending back into the forest for our return to Astrix. It was soon midday, and we decided to stop in a nearby clearing for some lunch."
	CALL2	MOVE-TO,BITE-FOREST
	RSTACK	
?CCL13:	CRLF	
	CRLF	
	ICALL2	N-DAY-TREK,3
	RTRUE	
?CCL8:	ICALL	REMOVE-TRAVEL-COMMAND,LAKE-SHORE-3,BACK-COMMAND
	CALL2	MOVE-TO,LAKE-SHORE-3
	RSTACK	


	.FUNCT	ANONF-193:ANY:0:0
	PRINTI	"Praxix, now in a garrulous mood, told the tale of the Nymphs. ""Long ago, at the beginning of things, it is said that the Nymphs took to the waters, becoming, well, fish-like: able to remain submerged for extended periods, swimming silent and deep, hunting for their meals in the great lakes and oceans of the world. That any remain today is indeed a surprise, though perhaps not a happy one. It would appear that they are less than friendly now, but who is to be the judge in these difficult times?"
	RTRUE	


	.FUNCT	ANONF-194:ANY:0:0
	ZERO?	NYMPHS-COMING? /?CCL3
	CRLF	
	CRLF	
	PRINTI	"Just then"
	PRINT	ARMED-CREATURES
	CALL1	END-NYMPH-STORY
	RSTACK	
?CCL3:	CALL2	GRAPHIC,G-UNDERLAND-JCN
	RSTACK	


	.FUNCT	ANONF-195:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	CALL2	UL-MOVE-CHECK,UL-2
	ZERO?	STACK /FALSE
	PRINTI	"Thinking it best to check on my wounded friend, I returned to "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	"'s side. Thankfully, he was now conscious, though confused."
	FCLEAR	LAKE-VICTIM,INCAPACITATED
	IN?	NYMPH-STONE,INVENTORY \?CND7
	ICALL	TRAVEL-COMMANDS,UL-2,TO-CAVE-COMMAND
?CND7:	CALL2	UL-MOVE,UL-2
	RSTACK	
?CCL3:	EQUAL?	ACTION,LEFT-COMMAND /?CTR9
	EQUAL?	ACTION,SMELLY-POOL-COMMAND \?CCL10
?CTR9:	CALL2	UL-MOVE-CHECK,UL-PIT
	ZERO?	STACK /FALSE
	EQUAL?	ACTION,LEFT-COMMAND \?CCL18
	PRINTI	"The lefthand path led to a good-sized chamber in the middle of which sat a large pool. A frightful smell emanated from the pool's depths, though I could not see just what it was that caused it."
	JUMP	?CND16
?CCL18:	PRINTI	"Holding my nose to avoid becoming sick, I moved gingerly toward the smelly pit and was soon staring into its murky depths."
?CND16:	ICALL	CHANGE-TRAVEL-COMMAND,HERE,LEFT-COMMAND,SMELLY-POOL-COMMAND
	CALL2	UL-MOVE,UL-PIT
	RSTACK	
?CCL10:	EQUAL?	ACTION,RIGHT-COMMAND /?CTR19
	EQUAL?	ACTION,TREASURY-COMMAND \?CCL20
?CTR19:	CALL2	UL-MOVE-CHECK,UL-TREASURY
	ZERO?	STACK /FALSE
	FSET?	UL-TREASURY,SEEN /?CCL28
	PRINTI	"The ornate path led to a beautifully appointed chamber in which hundreds of jewels and other age-old relics were kept. One, however, stood out from among the others. It was a simple amulet with a large blue stone which shone with a light of another world. I stood transfixed before it, not knowing whether I dare take it for my own."
	JUMP	?CND26
?CCL28:	PRINTI	"Again, I entered the treasury "
	IN?	NYMPH-STONE,UL-TREASURY \?CCL31
	PRINTI	" and found myself facing the blue amulet."
	JUMP	?CND26
?CCL31:	PRINTI	" and stared at the empty pedestal from which I had taken the blue amulet."
?CND26:	ICALL	CHANGE-TRAVEL-COMMAND,HERE,RIGHT-COMMAND,TREASURY-COMMAND
	CALL2	UL-MOVE,UL-TREASURY
	RSTACK	
?CCL20:	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"I continued away from the chamber and soon caught sight of a group of creatures conversing. Rather than reveal myself, I returned to the junction."
	RTRUE	


	.FUNCT	ANONF-196:ANY:0:0
	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL3
	ICALL2	UPDATE-REMOVE,ACTION-OBJECT
	FSET	HERE,SCOUTED
	PRINTI	"The cover was quite heavy, but I did manage to move it aside, revealing a dark pool of water, about three feet across."
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	ICALL	GRAPHIC,G-UNDERLAND-GRATE,G-UNDERLAND-PIT,BOTTOM-RIGHT
	ICALL	ADD-TRAVEL-COMMAND,HERE,DIVE-COMMAND
	RTRUE	
?CCL3:	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"The cover itself was made of stone, and appeared quite heavy."
	RTRUE	


	.FUNCT	ANONF-197:ANY:0:0
	IN?	UL-2-PIT-GRATE,HERE \?CCL3
	CALL2	GRAPHIC,G-UNDERLAND-GRATE
	RSTACK	
?CCL3:	CALL	GRAPHIC,G-UNDERLAND-GRATE,G-UNDERLAND-PIT,BOTTOM-RIGHT
	RSTACK	


	.FUNCT	ANONF-198:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK /?CND4
	ICALL	REMOVE-TRAVEL-COMMAND,UL-2,NARROW-PATH-COMMAND
?CND4:	CALL2	UL-MOVE-CHECK,UL-2
	ZERO?	STACK /FALSE
	PRINTI	"I could discern no purpose to this place, so I returned to the chamber outside."
	CALL2	UL-MOVE,UL-2
	RSTACK	
?CCL3:	EQUAL?	ACTION,DROP-COMMAND \?CCL10
	CALL1	UL-PIT-DROP
	RSTACK	
?CCL10:	EQUAL?	ACTION,DIVE-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINT	NARROW-POOL
	RTRUE	


	.FUNCT	UL-PIT-DROP:ANY:0:0
	FSET?	HERE,SCOUTED \FALSE
	INC	'UL-DROPPED
	ICALL	UPDATE-MOVE,ACTION-OBJECT,UL-PIT-BOTTOM
	ICALL	ADD-TRAVEL-COMMAND,UL-2,NARROW-PATH-COMMAND
	PRINTI	"I dropped the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" into the pool, where it sank slowly into the dark waters and out of sight."
	RTRUE	


	.FUNCT	ANONF-199:ANY:0:0
	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL3
	ICALL2	UPDATE-REMOVE,ACTION-OBJECT
	FSET	HERE,SCOUTED
	PRINTI	"The cover was indeed heavy, but I did manage to move it aside, revealing a dark pool of water, about three feet across. I held my torch up to its surface, but nothing was revealed."
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	ICALL	GRAPHIC,G-UNDERLAND-GRATE,G-UNDERLAND-PIT,BOTTOM-RIGHT
	ICALL	ADD-TRAVEL-COMMAND,HERE,DIVE-COMMAND
	RTRUE	
?CCL3:	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"The cover itself was made of stone, and appeared quite heavy."
	RTRUE	


	.FUNCT	ANONF-200:ANY:0:0
	IN?	UL-TREASURY-PIT-GRATE,HERE \?CCL3
	CALL2	GRAPHIC,G-UNDERLAND-GRATE
	RSTACK	
?CCL3:	CALL	GRAPHIC,G-UNDERLAND-GRATE,G-UNDERLAND-PIT,BOTTOM-RIGHT
	RSTACK	


	.FUNCT	ANONF-201:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	CALL2	UL-MOVE-CHECK,UL-TREASURY
	ZERO?	STACK /FALSE
	PRINTI	"There was little point of staying here longer, so I returned to the treasury."
	CALL2	UL-MOVE,UL-TREASURY
	RSTACK	
?CCL3:	EQUAL?	ACTION,JUNCTION-COMMAND \?CCL8
	IN?	NYMPH-STONE,INVENTORY \?CCL11
	CALL1	TRY-TO-LEAVE-TREASURY
	RSTACK	
?CCL11:	PRINTI	"Having nothing further to do here, I passed through the treasury and back out into the hallway beyond."
	CALL2	UL-MOVE,UL-JCN
	RSTACK	
?CCL8:	EQUAL?	ACTION,DROP-COMMAND \?CCL13
	IN?	UL-TREASURY-PIT-GRATE,HERE /?CCL13
	EQUAL?	ACTION-OBJECT,NYMPH-STONE \?CCL13
	FSET?	UL-TREASURY,TRAPPED \?CCL19
	PRINTI	"There was no great likelihood of removing the amulet through the usual means, so I thought there would be no harm of dropping it into the pool. Sure enough, no magic prevented it from making a rapid descent into the dark waters."
	JUMP	?CND17
?CCL19:	PRINTI	"On a hunch, I dropped the amulet into the pool and watched it sink rapidly into the dark waters."
?CND17:	CALL	UPDATE-MOVE,NYMPH-STONE,UL-PIT-BOTTOM
	RSTACK	
?CCL13:	EQUAL?	ACTION,DIVE-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINT	NARROW-POOL
	RTRUE	


	.FUNCT	ANONF-202:ANY:0:0
	EQUAL?	HERE,UL-PIT-BOTTOM \FALSE
	CRLF	
	CRLF	
	PRINTI	"Having spent as much time underwater as was possible, I swam back to the surface to catch my breath."
	CALL2	MOVE-TO,UL-PIT
	RSTACK	


	.FUNCT	ANONF-203:ANY:0:0
	FSET	HERE,SEEN
	ICALL	QUEUE,I-PIT-SURFACE,3
	IN?	NYMPH-STONE,HERE \?CCL3
	CALL	GRAPHIC,G-UNDERLAND-PIT-BOTTOM,G-UNDERLAND-PIT-BOTTOM-STONE,BOTTOM-LEFT
	RSTACK	
?CCL3:	CALL2	GRAPHIC,G-UNDERLAND-PIT-BOTTOM
	RSTACK	


	.FUNCT	ANONF-204:ANY:0:0
	EQUAL?	ACTION,SURFACE-COMMAND \?CCL3
	IN?	NYMPH-STONE,INVENTORY \?CCL6
	PRINTI	"In just a few moments, I had returned to the surface."
	JUMP	?CND4
?CCL6:	PRINTI	"With nothing to show for my diving exploration, I returned to the surface."
?CND4:	CALL2	MOVE-TO,UL-PIT
	RSTACK	
?CCL3:	EQUAL?	ACTION,PICK-UP-COMMAND \FALSE
	PRINTI	"Reaching down through the muck, I grabbed onto the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" and held it firmly in my hand."
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	ICALL2	GRAPHIC,G-UNDERLAND-PIT-BOTTOM
	CALL	UPDATE-MOVE,ACTION-OBJECT,INVENTORY
	RSTACK	


	.FUNCT	ANONF-205:ANY:0:0
	ICALL	GRAPHIC,G-UNDERLAND-GRATE,G-UNDERLAND-PIT,BOTTOM-RIGHT
	IN?	TORCH,INVENTORY \FALSE
	FSET	HERE,DEAD
	CALL	FORCE-TRAVEL-COMMAND,HERE,DIVE-COMMAND
	RSTACK	


	.FUNCT	ANONF-206:ANY:0:0,RM
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	IN?	NYMPH-STONE,INVENTORY \?CCL6
	SET	'RM,UL-2
	JUMP	?CND4
?CCL6:	SET	'RM,UL-JCN
?CND4:	CALL2	UL-MOVE-CHECK,RM
	ZERO?	STACK /FALSE
	IN?	NYMPH-STONE,INVENTORY \?CCL12
	ICALL	TRAVEL-COMMANDS,RM,TO-CAVE-COMMAND
	PRINTI	"With the amulet in hand, I made a hasty return to the chamber in which I had left "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	". Thankfully, he was conscious."
	JUMP	?CND10
?CCL12:	IN?	TORCH,INVENTORY \?CCL15
	FSET?	HERE,DEAD /?CCL15
	PRINTI	"With the torch now in my possession"
	JUMP	?CND13
?CCL15:	PRINTI	"Having nothing to show from this excursion"
?CND13:	PRINTI	", I returned to the chamber outside."
?CND10:	CALL2	UL-MOVE,RM
	RSTACK	
?CCL3:	EQUAL?	ACTION,DIVE-COMMAND \FALSE
	IN?	TORCH,INVENTORY \?CCL22
	CALL	QSET?,HERE,BLUE-MIX
	ZERO?	STACK \?CCL25
	PRINTI	"As I dove into the water, I was filled with amazement that the torch I was carrying had not been extinguished. If anything, it appeared to glow more brightly, and the flame became warmer. Soon, I had reached the bottom of the pool, which was covered with every sort of putrifying debris you can imagine, and some that you probably couldn't. Decaying debris lowered the visibility considerably, making it difficult to gauge anything much about the pool itself."
	JUMP	?CND23
?CCL25:	PRINTI	"Again, I took the torch down into the miserable pit and descended to the bottom, peering with difficulty through the cloudy waters"
	FIRST?	UL-PIT-BOTTOM /?CND26
	PRINTI	", yet finding nothing of import"
?CND26:	PRINTC	46
?CND23:	IN?	NYMPH-STONE,UL-PIT-BOTTOM \?CCL30
	PRINTI	" But then, at the bottom of the pool, in the midst of the unspeakable filth, I caught a glimpse of the the amulet I had taken from the treasury"
	GRTR?	UL-DROPPED,0 \?CND31
	PRINTI	", but nothing else"
?CND31:	PRINTC	46
	JUMP	?CND28
?CCL30:	FIRST?	UL-PIT-BOTTOM \?CND28
	PRINTI	" Imagine my surprise when there, at the bottom, lay "
	ICALL	LIST-CONTENTS,UL-PIT-BOTTOM,FALSE-VALUE
	PRINTI	" I had dropped into the pit earlier."
?CND28:	CALL2	MOVE-TO,UL-PIT-BOTTOM
	RSTACK	
?CCL22:	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"I dove down into the foul-smelling pool and swam into its dismal depths. By the time I reached the bottom, it was too dark to see anything at all. Unable to learn anything new, I returned to the surface."
	RTRUE	


	.FUNCT	TREASURY-GRAPHIC:ANY:0:0
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	IN?	NYMPH-STONE,HERE \?CCL3
	CALL	GRAPHIC,G-UNDERLAND-TREASURY-NO-STONE,G-UNDERLAND-TREASURY,BOTTOM-RIGHT
	RSTACK	
?CCL3:	CALL2	GRAPHIC,G-UNDERLAND-TREASURY-NO-STONE
	RSTACK	


	.FUNCT	ANONF-207:ANY:0:0
	FSET	HERE,SEEN
	ICALL1	TREASURY-GRAPHIC
	ICALL	FORCE-TRAVEL-COMMAND,HERE,BACK-COMMAND
	FSET?	HERE,TRAPPED \FALSE
	IN?	NYMPH-STONE,INVENTORY /FALSE
	FCLEAR	HERE,TRAPPED
	RTRUE	


	.FUNCT	ANONF-208:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	CALL2	UL-MOVE-CHECK,UL-TREASURY-PIT
	ZERO?	STACK /FALSE
	PRINTI	"At the far end of the treasury, a narrow path led a short way, ending at a simple, rounded chamber, in the middle of which lay a "
	FSET?	UL-TREASURY-PIT,SCOUTED \?CCL9
	PRINTI	"perfectly round pool of water"
	JUMP	?CND7
?CCL9:	PRINTI	"large stone cover"
?CND7:	PRINTI	". It was odd that such a nondescript chamber would be placed adjacent to the rather opulent treasury, and I could only guess at its purpose."
	CALL2	UL-MOVE,UL-TREASURY-PIT
	RSTACK	
?CCL3:	EQUAL?	ACTION,DROP-COMMAND \?CCL11
	EQUAL?	ACTION-OBJECT,NYMPH-STONE \?CCL11
	FSET?	HERE,TRAPPED \?CCL16
	PRINTI	"It was clear that I wasn't leaving this treasury with the amulet, so I replaced it on its pedestal and pondered my next move."
	FCLEAR	HERE,TRAPPED
	ICALL	ADD-TRAVEL-COMMAND,HERE,BACK-COMMAND
	JUMP	?CND14
?CCL16:	PRINTI	"Thinking it was perhaps ill-advised to take the amulet, I gingerly returned it to its pedestal."
?CND14:	ICALL	UPDATE-MOVE,NYMPH-STONE,HERE
	ICALL1	TREASURY-GRAPHIC
	RTRUE	
?CCL11:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	CALL1	TRY-TO-LEAVE-TREASURY
	RSTACK	


	.FUNCT	TRY-TO-LEAVE-TREASURY:ANY:0:0
	IN?	NYMPH-STONE,INVENTORY \?CCL3
	CALL	QSET?,UL-TREASURY,SCOUTED
	ZERO?	STACK \?CCL6
	PRINTI	"With the amulet firmly in hand, I started out of the treasury. But I didn't get very far. At first, I thought I had become paralyzed below my waist, but that was clearly not so. No, something unnatural was holding me inside the treasury. And I was reasonably certain it was the amulet."
	JUMP	?CND4
?CCL6:	PRINTI	"Again, some unknown and unseen force prevented me from leaving the treasury while I held the blue amulet."
?CND4:	EQUAL?	HERE,UL-TREASURY /?CND7
	ICALL2	UL-MOVE,UL-TREASURY
?CND7:	ICALL	REMOVE-TRAVEL-COMMAND,UL-TREASURY,BACK-COMMAND
	FSET	UL-TREASURY,TRAPPED
	RTRUE	
?CCL3:	CALL2	UL-MOVE-CHECK,UL-JCN
	ZERO?	STACK /FALSE
	PRINTI	"There was nothing more I could think to do inside the treasury, so I returned to the chamber just outside."
	CALL2	UL-MOVE,UL-JCN
	RSTACK	

	.ENDSEG

	.ENDI
