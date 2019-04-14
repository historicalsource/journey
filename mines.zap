
	.SEGMENT "CAVERNS"


	.FUNCT	ANONF-222:ANY:0:0
	EQUAL?	ACTION,DOWN-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Again, we started down these dismal stairs, but were soon met with disappointment - the walls around the stairs had crumbled, completely blocking our path."
	CRLF	
	CRLF	
	FSET?	HURTH,IN-PARTY \?CND4
	PRINTI	"""This bodes ill for us,"" said Hurth, ""if we are to reach the lower regions."""
	CRLF	
	CRLF	
?CND4:	FSET	HERE,TRAPPED
	PRINTI	"And so we trudged back up the stairs, finally reaching the landing above."
	RTRUE	
?CCL3:	EQUAL?	ACTION,THIS-LEVEL-COMMAND \FALSE
	PRINTI	"We marched quickly down the path as it began a wide curve toward the right.  Suddenly, "
	FSET?	HURTH,IN-PARTY \?CCL10
	PRINTI	"Hurth"
	JUMP	?CND8
?CCL10:	PRINTI	"Praxix"
?CND8:	PRINTI	", who had taken the lead, held us back. ""Orcs!"" he said in a harsh whisper, ""This is very bad. They block the road that lies ahead, and there is no other path on this level."""
	CALL2	MOVE-TO,MINE-1-W
	RSTACK	


	.FUNCT	ANONF-223:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Bergon suggested that we retreat in search of a better route, but was dissuaded by "
	FSET?	HURTH,IN-PARTY \?CCL6
	PRINTI	"Hurth. ""The principal route through this level heads to the north up ahead; there is no point in turning back, lest we foresake our purpose."""
	RTRUE	
?CCL6:	PRINTI	"Praxix. ""We have no choice, if we are to find the Stone, but to find a path to the lower caverns."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL8
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"Of the group, only Bergon felt strongly one way or the other. ""If we go past the orcs, we may not have another chance to explore the area to the north,"" he said."
	RTRUE	
?CCL8:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL10
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	PRINTI	"Thinking there might be an alternative way around the orcs, Bergon sent Hurth to explore the area nearby. Soon, Hurth had found a small slit in the rock and disappeared within it."
	CRLF	
	CRLF	
	PRINTI	"Returning a short while later, he reported on the situation, drawing a map in the dirt at our feet. ""We are here, on this east-west path; the orcs are guarding the junction where a larger path, leading north, crosses it. The slit I entered winds its way north and then east, opening out on the northern path not far from the orcs' position. There is at least a chance we could move that way without attracting their attention."""
	CRLF	
	CRLF	
	PRINTI	"Bergon stared at the crude map and was not convinced. ""There is also a chance we may be seen crossing over to the slit itself,"" he added glumly. ""But we must choose now: to head north, hoping to avoid the orcs altogether, or to head east, somehow getting past the orcs that stand guard at the junction."""
	ICALL	ADD-TRAVEL-COMMAND,HERE,AROUND-ORCS-COMMAND
	ICALL	ADD-TRAVEL-COMMAND,HERE,PAST-ORCS-COMMAND
	CALL	UPDATE-FSET,HERE,ADVISE
	RSTACK	
?CCL10:	EQUAL?	ACTION,PAST-ORCS-COMMAND \?CCL12
	PRINTI	"We decided to find a way through the orcs position, but were not quite certain how that might be accomplished."
	CALL2	SCENE,PRAXIX-DIVERSION
	RSTACK	
?CCL12:	EQUAL?	ACTION,AROUND-ORCS-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"One at a time, we ventured through the slit and thence out into the northern passage. Creeping ever northward, we heaved a collective sigh of relief as the path finally turned a corner, putting us out of sight of the orcs. Not long afterward, the path forked to the left and the right. Down the lefthand passage some muffled voices could be heard, and a dim glow could be seen down the righthand passage."
	FCLEAR	HERE,ADVISE
	CALL2	MOVE-TO,NORTH-ORC-FORK
	RSTACK	


	.FUNCT	ANONF-224:ANY:0:0
	EQUAL?	ACTION,LEFT-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"It didn't take long to learn that another, larger party of orcs was camped down the lefthand path."
	CRLF	
	CRLF	
	PRINTI	"""We cannot face so many of these monsters,"" Bergon said, disappointed that our narrow escape from the last party of orcs should lead instead to another one."
	FSET?	HURTH,IN-PARTY \TRUE
	CRLF	
	CRLF	
	PRINTI	"""It is all too clear that orcs now control this level of the caverns,"" Hurth replied, glumly."
	RTRUE	
?CCL3:	EQUAL?	ACTION,RIGHT-COMMAND \?CCL7
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"The righthand path led to a gate fashioned with formidable iron bars. There was no visible locking mechanism, and yet the door would not yield. Praxix was the first to notice the series of dimly glowing runes that were carved into the lintel."
	CALL2	MOVE-TO,STRANGE-GATE
	RSTACK	
?CCL7:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	PRINTI	"Deeming discretion to be the better part of valor, we retraced our steps, eventually finding the slit through which we had entered this northern passage. It took some time, but we eluded the orcs yet again, and we safely arrived back at our earlier position no better off than we had been before."
	CRLF	
	CRLF	
	PRINTI	"""If we are to get any farther in these caverns,"" Bergon said, ""then we must find a way to get past those orcs."""
	CALL2	MOVE-TO,MINE-1-W
	RSTACK	


	.FUNCT	ANONF-225:ANY:0:0
	FSET	HERE,SEEN
	FSET?	GATE-RUNES,SEEN \FALSE
	CALL1	PRAXIX-SPEAK-COMMANDS
	RSTACK	


	.FUNCT	ANONF-226:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \FALSE
	PRINTI	"With little hope of getting past the gate, we returned to the fork nearby."
	CALL2	MOVE-TO,NORTH-ORC-FORK
	RSTACK	


	.FUNCT	ANONF-227:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	CLEAR-EXBIT
	EQUAL?	ACTOR,HURTH \?CCL6
	PRINTI	"Hurth squinted at the runes, but they apparently did not register. ""They are not Dwarvish,"" he said with finality."
	RTRUE	
?CCL6:	ICALL	CLEAR-EXBIT,GATE-RUNES,HURTH
	CALL	QSET?,GATE-RUNES,SEEN
	ZERO?	STACK \FALSE
	PRINTI	"Praxix scratched his head with his staff and began staring dreamily at the runes. ""I believe I know these runes,"" he began, ""though I cannot imagine how they got here."
	CRLF	
	CRLF	
	PRINTI	"Long ago, I came across a priceless copy of the only written dictionary of the ancient Wizards' runic language. Naturally, I memorized it as best I could, yet I never believed it would be of any value."" He then read the words aloud ""Lorem ara sequil hevant drai nons trivi azan-lam,"" he intoned."
	CRLF	
	CRLF	
	PRINTI	"""The words mean 'Please only say gate open to enter storage-room', or something near to that. The runes for 'gate', 'door', and 'entrance' are very similar, and I can never remember which is which - 'hevant', 'levant', or 'eivant'. The verb 'open' also causes me some concern, because it might be 'drai' or 'adrei', depending on a slight nuance of meaning. The word for 'enter' - it might be more general - 'access' or even 'entrance'. And 'storage room' is a literal translation, though it might mean 'closet' or 'trove', I suppose. It doesn't matter, really, since the meaning of the runes is quite clear."""
	CRLF	
	CRLF	
	PRINTI	"Bergon shuddered at this litany of linguistical subterfuge. ""Are you quite finished with your lecture?"" he asked. ""And, if so, would you mind very much opening the gate?"""
	ICALL	ADD-TRAVEL-COMMAND,HERE,REREAD-RUNES-COMMAND
	CALL1	PRAXIX-SPEAK-COMMANDS
	RSTACK	


	.FUNCT	V-REREAD-RUNES:ANY:0:0
	CALL	QSET?,GATE-RUNES,TRAPPED
	ZERO?	STACK \?CCL3
	PRINTI	"At our request, Praxix again read the runes aloud: ""Lorem ara sequil hevant drai nons trivi azan-lam."" And again, he translated the words as 'Please only say gate open to enter storage-room.'"
	CRLF	
	CRLF	
	PRINTI	"""Remember, though, that I'm not certain of the runes 'hevant' and 'drai'. They might well be 'levant' or even 'eivant' in the case of 'hevant', and 'adrei' in the case of 'drai'."""
	CRLF	
	CRLF	
	PRINTI	"""You are certain you know this language?"" Bergon asked."
	CRLF	
	CRLF	
	PRINTI	"""Let us say that I am certain of the runes, with the exceptions noted,"" came Praxix' reply."
	RTRUE	
?CCL3:	PRINTI	"Yet again, Praxix read the runes aloud: ""Lorem ara sequil hevant drai nons trivi azan-lam."" And again, he reiterated his uncertainty about the runes for 'hevant' and 'drai'."
	RTRUE	


	.FUNCT	PRAXIX-SPEAK-COMMANDS:ANY:0:0
	ZERO?	MIX-DONE /?CCL3
	PUSH	USE-MIX-COMMAND
	JUMP	?CND1
?CCL3:	PUSH	MIX-COMMAND
?CND1:	CALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,STACK,SPEAK-COMMAND
	RSTACK	


	.FUNCT	V-SPEAK:ANY:0:0,WDS,W1
	CALL2	READ-ELVISH,PRAXIX
	ZERO?	STACK /?CCL3
	GETB	E-LEXV,1 >WDS
	GET	E-LEXV,1 >W1
	PRINTC	34
	PRINTT	E-TEMP,E-TEMP-LEN
	PRINTI	","" Praxix said, trying to sound like a Wizard of old. "
	EQUAL?	WDS,1 \?CCL6
	EQUAL?	W1,W?LOREM \?CCL6
	PRINTI	"And then, a thin wind came up from behind us, and the door simply blew open. But even though Praxix had done the highly improbable in deciphering and correctly using the magical door, he was nonetheless disappointed. ""I should have studied the language further,"" he said, ""I never knew that the runic language read from right to left!"""
	CRLF	
	CRLF	
	PRINTI	"Once inside, we found small pouches of the magical essences of water, air, and earth, pleasing Praxix greatly. ""We can never have enough of these essences,"" he said."
	CRLF	
	CRLF	
	PRINTI	"Convinced there was nothing further to be found inside the storeroom, we returned to the nearby fork."
	FSET	STRANGE-GATE,SOLVED
	ICALL	FIND-ESSENCE,ESSENCE-WATER,3
	ICALL	FIND-ESSENCE,ESSENCE-AIR,3
	ICALL	FIND-ESSENCE,ESSENCE-EARTH,2
	CALL2	MOVE-TO,NORTH-ORC-FORK
	RSTACK	
?CCL6:	PRINTI	"But nothing happened, not the slightest movement."
	IGRTR?	'WIZSPEAK,4 \TRUE
	SET	'WIZSPEAK,0
	ICALL1	FIXUP-PRAXIX-COMMANDS
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,REREAD-RUNES-COMMAND
	CRLF	
	CRLF	
	PRINTI	"""I give up,"" Praxix said petulantly. ""It is clear that I know less than I suppose about the Wizards' language. There is no use in wasting any more time here."""
	RTRUE	
?CCL3:	PRINTI	"Strangely, Praxix opened his mouth and appeared to speak, but nothing came out. We stared at our Wizard friend with growing concern."
	RTRUE	


	.FUNCT	ANONF-228:ANY:0:0,TMP
	EQUAL?	ACTION,SCENE-START-COMMAND \?CCL3
	CRLF	
	CRLF	
	PRINTI	"""I've got an idea,"" Praxix whispered; he then dashed across to the narrow passage, and was gone."
	ICALL2	MAKE-SUBGROUP,PRAXIX
	ICALL2	UPDATE-REMOVE,LIGHT-SPELL
	CALL2	MOVE-TO,PRAXIX-DIVERSION-ROOM
	RSTACK	
?CCL3:	EQUAL?	ACTION,SCENE-END-COMMAND \FALSE
	ICALL1	CLEAR-SUBGROUP
	ICALL	UPDATE-MOVE,LIGHT-SPELL,ALWAYS-SPELLS
	FSET?	REAGENT,SOLVED \?CCL8
	ICALL1	FIXUP-PRAXIX-COMMANDS
	JUMP	?CND6
?CCL8:	ICALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,EXAMINE-COMMAND
?CND6:	FSET?	HERE,ENCHANTED \?CCL11
	CALL2	MOVE-TO,ORC-JUNCTION
	RSTACK	
?CCL11:	FSET?	PRAXIX,TRAPPED \?CCL13
	CRLF	
	CRLF	
	FCLEAR	PRAXIX,TRAPPED
	PRINTI	"From our point of view, whatever Praxix had done was working brilliantly. The orcs had fled, and we now gingerly entered the road junction, expecting to find Praxix nearby. But of orcs and Praxix there was none, and so we stood there, unsure of what to do next."
	CRLF	
	CRLF	
	PRINTI	"But we didn't have to wait long to find out, for the orcs were soon rampaging back in our direction. ""Quickly! This way!"" Bergon shouted, shepherding us down the passage that lay to the east."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CCL16
	SET	'TMP,ESHER
	JUMP	?CND14
?CCL16:	FSET?	MINAR,IN-PARTY \?CCL18
	SET	'TMP,MINAR
	JUMP	?CND14
?CCL18:	SET	'TMP,HURTH
?CND14:	PRINTI	"""Wait!"" shouted "
	ICALL2	WPRINTD,TMP
	PRINTI	", ""There's Praxix!"" "
	ICALL2	WPRINTD,TMP
	PRINTI	" pointed at the Wizard who had apparently managed to sneak back through the slit and was in danger of being cut off by the orcs before he could reach us. And then, "
	ICALL2	WPRINTD,TMP
	PRINTI	" charged at the oncoming orcs, giving Praxix enough time to reach our side."
	EQUAL?	TMP,HURTH /?CCL21
	PRINTI	" But it was too late for "
	ICALL2	WPRINTD,TMP
	PRINTI	"; he was cut to pieces, and left for dead on the ground."
	ICALL2	HINT,HINT-DIVERSION
	ICALL2	KILLED-OFF,TMP
	JUMP	?CND19
?CCL21:	PRINTI	" Hurth fought brilliantly, and was nearly cut to ribbons before arriving back at our sides."
?CND19:	CRLF	
	CRLF	
	PRINTI	"With no time to lose, we sped down the eastern path. But any relief we may have felt"
	CALL	MOVE-TO,MINE-1-E,SHORT-LIVED-RELIEF
	RSTACK	
?CCL13:	CALL2	MOVE-TO,MINE-1-W
	RSTACK	


	.FUNCT	ANONF-229:ANY:0:0
	PRINTI	" Following the tunnel to the main road leading north, Praxix peered around the corner, spying the orcs nearby. The path was dark, but not perfectly so, as the light from the orcs' torches flickered dimly on the rocky walls. It would be difficult enough to surprise these orcs, so Praxix laid down his glowing staff in the blackness of the tunnel and stepped out into the darkness."
	RTRUE	


	.FUNCT	ANONF-230:ANY:0:0
	FSET?	HERE,SCOUTED \?CCL3
	CALL1	GAME-COMMAND?
	ZERO?	STACK \?CCL3
	PRINTI	"It was only moments before the orcs were racing down the road in Praxix' direction, howling their war-cries."
	EQUAL?	ACTION,CAST-COMMAND \?CCL8
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL8
	ICALL2	GRAPHIC,G-CHARGING-ORCS-FROM-ABOVE
	PRINTI	" But Praxix had prepared his elevation spell beforehand, and he rose into the air in time to marvel at the sight of a dozen or so rampaging orcs charging down the halls beneath him. Descending back to earth, Praxix brushed himself off, retrieved his staff, and nonchalantly walked back to the junction."
	CRLF	
	CRLF	
	PRINTI	"""Come along, come along!"" he said, prodding us with his staff. ""I expect they'll be back soon enough."""
	FSET?	HURTH,IN-PARTY \?CND11
	CRLF	
	CRLF	
	PRINTI	"""I am impressed,"" said Hurth, and so were we all."
?CND11:	FSET	HERE,ENCHANTED
	JUMP	?CND6
?CCL8:	EQUAL?	ACTION,CAST-COMMAND /?CTR13
	EQUAL?	ACTION,USE-MIX-COMMAND /?CTR13
	EQUAL?	ACTION,MIX-COMMAND \?CCL14
?CTR13:	FSET	PRAXIX,TRAPPED
	PRINTI	" ""Oh, dear. I wasn't expecting this,"" Praxix said to himself as he hurriedly tried to "
	EQUAL?	ACTION,MIX-COMMAND \?CCL20
	PRINTI	"mix his enchantment."
	JUMP	?CND6
?CCL20:	PRINTI	"cast his enchantment at the oncoming orcs. It can truly be said that the orcs were startled by the show of thaumaturgical skills, but this was not going to hold them for long!"
	JUMP	?CND6
?CCL14:	EQUAL?	ACTION,RETURN-COMMAND \?CND6
	FSET	PRAXIX,TRAPPED
	PRINTI	" Now, it had been Praxix' idea to quickly retreat to the narrow passage and thereby rejoin the group. In practice, however, he was seen by the oncoming orcs, and rather than lead them back toward our party, he withdrew farther into the northern path. The orcs approached with weapons drawn and a fire in their eyes."
?CND6:	ICALL2	SCENE,FALSE-VALUE
	RTRUE	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL23
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL26
	ICALL1	SAVE-SPELL
	REMOVE	HYE-DIVERSION
	PRINTI	"As an experiment, he cast the elevation spell on himself, and rose into the darkness. A moment later, he located the top of the passageway with his skull. ""Oomph!"" he blurted out in a muffled sort of way that came dangerously close to attracting the attention of the orcs. Biting his lower lip and rubbing his head, he soon settled to the ground. ""Should do nicely,"" he said to himself, and he brushed some crumbled rock off of his cloak."
	RTRUE	
?CCL26:	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL /?CCL28
	EQUAL?	ACTION-OBJECT,WIND-SPELL /?CCL28
	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \FALSE
?CCL28:	ICALL1	RESTORE-SPELLS
	PRINTI	"Praxix' plan was this: to create a diversion which would draw the entire contingent of orcs in his direction, thereby allowing the group to pass unseen through the junction. And so, taking the "
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL34
	PRINTI	"essences of fire and air"
	JUMP	?CND32
?CCL34:	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \?CCL36
	PRINTI	"essence of earth"
	JUMP	?CND32
?CCL36:	PRINTI	"essence of air"
?CND32:	PRINTI	" from his pouch, he cast the enchantment."
	CRLF	
	CRLF	
	ICALL	TRAVEL-COMMANDS,HERE,RETURN-COMMAND
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL39
	PRINTI	"The ball of flame flew from his fingertips, and shot forward toward the unsuspecting orcs, who reacted predictably by grabbing their weapons and shouting in their guttural tongue. It was a good thing that the fireball blinded"
	JUMP	?CND37
?CCL39:	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \?CCL41
	PRINTI	"A great roar erupted from the earth, and the ground started to split before him. The unsuspecting orcs were startled and frightened, and were soon grabbing their weapons. It was lucky, though, that their confusion distracted"
	JUMP	?CND37
?CCL41:	PRINTI	"A cold gust of wind blew toward the unsuspecting orcs, who were very nearly swept off their feet. It was a safe bet that their attention had been grabbed; next it would be their weapons. Fortunately, the blowing dust and wind distracted"
?CND37:	PRINTI	" them enough to momentarily protect Praxix from their view."
	FSET	HERE,SCOUTED
	RTRUE	
?CCL23:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	FSET?	HERE,SCOUTED /FALSE
	CALL2	PARTY-PCM,PRAXIX
	ICALL	NEW-DEFAULT,STACK,1
	PRINTI	"Sadly, though predictably, Praxix had forgotten his idea and prepared to return to the group. Fortunately, he thought again. ""A spell,"" he said to himself with some assurance, ""Yes, that's it. I was going to cast a spell. Now which spell was it?"""
	FIRST?	ESSENCES /TRUE
	CRLF	
	CRLF	
	PRINTI	"But it didn't much matter, as Praxix had already run out of magical essences. And then he had another thought - if only he could get the orcs attention, then he might cause enough of a diversion to allow the others to get past. And, having no magic to use, he chose a more mundane method: whistling. This certainly had some effect, for the orcs were soon grabbing for their weapons and preparing to charge at their as yet unseen enemy."
	FSET	HERE,SCOUTED
	RTRUE	


	.FUNCT	ANONF-231:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	PRINTI	"It was with great relief that we headed away from the junction. But the relief"
	PRINT	SHORT-LIVED-RELIEF
	CRLF	
	CRLF	
	PRINTI	"""I fear the orcs are somewhat more clever than we anticipated,"" Praxix said, trying not to appear disturbed. ""Let us hope there is some escape for us farther along the way."""
	CALL2	MOVE-TO,MINE-1-E
	RSTACK	


	.FUNCT	ANONF-232:ANY:0:0
	FSET?	STRANGE-GATE,SEEN /?CCL3
	CALL2	HINT,HINT-STRANGE-GATE
	RSTACK	
?CCL3:	FSET?	STRANGE-GATE,SOLVED /FALSE
	CALL2	HINT,HINT-GATE-RUNES
	RSTACK	


	.FUNCT	ANONF-233:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"Ahead, the passage opened up into a wider hall, and we moved quickly in anticipation of escape. But the hall ended blindly. All around, the sound of water was nearly deafening, and moment by moment, the dull thump of orc footsteps moved ever closer; it appeared that tragedy was close at hand."
	CALL2	MOVE-TO,ABOVE-FLUME
	RSTACK	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND /?CCL5
	EQUAL?	ACTION,SCOUT-COMMAND \FALSE
	CALL	QSET?,HERE,SCOUTED
	ZERO?	STACK \FALSE
?CCL5:	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	ICALL2	REMOVE-PARTY-COMMAND,BACK-COMMAND
	EQUAL?	ACTION,BACK-COMMAND \?CND10
	CALL	FIRST-IN-PARTY,HURTH,ESHER,PRAXIX >ACTOR
?CND10:	PRINTI	"Rather than attempt to retrace our steps and fall into the hands of the orcs, we sent "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" to quickly and quietly check out our rear. Moments later, he returned. ""They are not far behind, but they move more slowly and there is hope in that."""
	CRLF	
	CRLF	
	PRINTI	"""I fear there is another explanation,"" Praxix replied gloomily, and we soon found out what he meant."
	RTRUE	

	.ENDSEG

	.SEGMENT "MINES"


	.FUNCT	ANONF-234:ANY:0:0
	EQUAL?	ACTION,ENTER-CLEFT-COMMAND \?CCL3
	MOVE	ACTIVE-MINE-WALLS,ACTIVE-MINE
	CALL2	MOVE-TO,ACTIVE-MINE
	RSTACK	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	PRINTI	"Unable to determine the cause of the tapping, and finding only a dead-end passage here, we returned to the "
	FSET?	OLD-MINE,SOLVED \?CCL8
	CALL	MOVE-TO,MINE-LOWER-STAIR,STR?585
	RSTACK	
?CCL8:	CALL	MOVE-TO,MINE-JUNCTION,STR?586
	RSTACK	


	.FUNCT	V-ASK-MINER:ANY:0:0
	ICALL2	TELL-TALE,ACTION-OBJECT
	RTRUE	


	.FUNCT	ANONF-235:ANY:0:0
	ICALL	UPDATE-MOVE,RED-ROCK,HERE
	PRINTI	"""So what exactly is it you're mining here?"" asked "
	ICALL2	WPRINTD,ACTOR
	PRINTI	", who was trying to get a better look at the miner's sack."
	CRLF	
	CRLF	
	PRINTI	"""Lots of things,"" he said. ""The stuff of the earth, if you know what I mean."" He reached into his sack and pulled out a few large rocks. ""Now this here is mostly gold, but I reckon you've seen that before. And this,"" he said, holding up a shiny black stone, ""is obsidian - fetch a good price for that in Zan, I figure."""
	CRLF	
	CRLF	
	PRINTI	"He rummaged through his sack, dropping some small red rocks on the ground, and announced, ""That's about it, so far anyway. But I've found silver, platinum, even a couple of diamonds once! You never know what you'll find in these walls!"""
	RTRUE	


	.FUNCT	ANONF-236:ANY:0:0
	ICALL2	WPRINTD,ACTOR
	PRINTI	" was curious about how the miner had managed to elude the orcs. ""Could be I'm just a lucky fella,"" he started, chuckling. ""Oh, sure, there's orcs around, and worse things too. But these orcs aren't very clever, if you know what I mean. And I've got some ways of protecting myself as well. What I'd like to know is how you've eluded them!"" And with that, he laughed again."
	RTRUE	


	.FUNCT	O-ASK-MINER:ANY:0:0
	CALL2	FIND-OBJECTS,ASK-MINER-OBJECTS
	RSTACK	


	.FUNCT	ANONF-237:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" wasn't the only one looking over this strange man, for we were "
	EQUAL?	PARTY-MAX,2 \?CCL6
	PRINTI	"both"
	JUMP	?CND4
?CCL6:	PRINTI	"all"
?CND4:	PRINTI	" filled with curiosity. He was a short man of middle age, and badly in need of a shave and a bath. His dark complexion was more in keeping with a man from the plains or the desert than an inhabitant of these caverns, yet he acted completely at ease in his surroundings."
	RTRUE	


	.FUNCT	ANONF-238:ANY:0:0
	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL3
	PRINTI	"""Whoa there, son!"" the miner said, as I reached for his sack. ""You can just leave that right there, if you don't mind."""
	FSET	ACTION-OBJECT,DONT-TAKE
	SET	'UPDATE-FLAG,TRUE-VALUE
	RETURN	UPDATE-FLAG
?CCL3:	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" tried to get a better look at the miner's sack, but the miner was protecting it with his body. We could tell, however, that it was a very sturdy sack, made of burlap, and it was about half full with rocks of some kind."
	RTRUE	


	.FUNCT	ANONF-239:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	FSET?	HERE,EXAMINED /?CCL6
	PUTP	HERE,P?TEMP,ACTOR
	ICALL2	WPRINTD,ACTOR
	PRINTI	", looking over our surroundings, made a strange discovery."
	CRLF	
	CRLF	
	PRINTI	"""Look over here,"" he said, indicating an area of recent excavation in the walls. """
	EQUAL?	ACTOR,ESHER,PRAXIX \?CCL9
	PRINTI	"Looks like somebody's been doing some digging...."""
	RTRUE	
?CCL9:	PRINTI	"These marks come from this pick-axe, or I am no Dwarf,"" he said."
	RTRUE	
?CCL6:	GETP	HERE,P?TEMP
	EQUAL?	ACTOR,STACK \?CCL12
	PRINTI	"Once again"
	JUMP	?CND10
?CCL12:	GETP	HERE,P?TEMP
	ZERO?	STACK \?CCL14
	PRINTI	"Confused"
	JUMP	?CND10
?CCL14:	PRINTI	"This time"
?CND10:	PRINTI	", "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" examined the chamber's walls, and found some "
	GETP	HERE,P?TEMP
	ZERO?	STACK /?CCL17
	PRINTI	"more loose"
	JUMP	?CND15
?CCL17:	PRINTI	"recently broken"
?CND15:	PRINTI	" rock both within the walls and on the ground nearby."
	CALL1	MINER-APPEARS
	RSTACK	


	.FUNCT	MINER-APPEARS:ANY:0:0
	CRLF	
	CRLF	
	PRINTI	"""What's going on here?"" "
	CALL	FIRST-IN-PARTY,BERGON,PRAXIX
	ICALL2	WPRINTD,STACK
	PRINTI	" demanded of the empty room, and it replied with a soft giggling sound that echoed through the chamber."
	CRLF	
	CRLF	
	FSET	ACTIVE-MINE-WALLS,DONT-EXAMINE
	ICALL	UPDATE-MOVE,MINER-SACK,HERE
	ICALL	UPDATE-MOVE,MINER,HERE
	FSET	HERE,SOLVED
	FSET?	BERGON,IN-PARTY \?CCL3
	ICALL	TRAVEL-COMMANDS,BERGON,GET-ADVICE-COMMAND,ASK-MINER-COMMAND
	JUMP	?CND1
?CCL3:	ICALL	CHANGE-TRAVEL-COMMAND,PRAXIX,CAST-COMMAND,ASK-MINER-COMMAND
?CND1:	PRINTI	"We each spun around, but we were as alone as before. Just then, the giggling turned to laughter, and before our eyes a grizzled man appeared, holding a large sack. Rubbing the tears from his eyes, he looked us over, and howled with laughter."
	CRLF	
	CRLF	
	ICALL	GRAPHIC,FALSE-VALUE,G-MINER,TOP-LEFT
	PRINTI	"""You are the sorriest lot I've ever seen,"" he said, restraining himself from another bout of laughter. ""Tell me, are you folks lost or just plain stupid?"" He wiped his nose and eyes with his right sleeve, sniffled, and then just stood there in amused bewilderment."
	RTRUE	


	.FUNCT	ANONF-240:ANY:0:0
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK \?CCL3
	PRINTI	"As quietly as we could, we squeezed our way through the cleft and soon came upon a wide, circular chamber with no exit other than the one through which we had entered."
	CRLF	
	CRLF	
	PRINTI	"""I would swear the tapping came from here,"" "
	FSET?	BERGON,IN-PARTY \?CCL6
	PRINTI	"Bergon"
	JUMP	?CND4
?CCL6:	PRINTI	"Praxix"
?CND4:	PRINTI	" said."
	CRLF	
	CRLF	
	PRINTI	"""And so would I. You don't think the pick-axe was working here on its own?"" I asked."
	RTRUE	
?CCL3:	CALL	QSET?,HERE,EXAMINED
	ZERO?	STACK \FALSE
	PRINTI	"Once again, we made our way through the cleft and into the circular chamber. Once again, there was nobody there."
	CRLF	
	CRLF	
	PRINTI	"""Doesn't make a bit of sense,"" "
	ICALL2	WPRINTD,PRAXIX
	PRINTI	" said."
	RTRUE	


	.FUNCT	ANONF-241:ANY:0:0
	EQUAL?	ACTION,USE-MIX-COMMAND \?CCL3
	EQUAL?	ACTION-OBJECT,MINER \?CCL3
	PRINTI	"Praxix cast the mixture at the miner but the effect was mainly that of infuriating him."
	CRLF	
	CRLF	
	PRINTI	"""Now listen here,"" he said, wagging an arthritic finger at Praxix, ""I ain't got time for none of that magical business, so if you are done nosing around here, I'd appreciate some peace and quiet."""
	CRLF	
	CRLF	
	ICALL1	MIXTURE-CAST
	FSET?	BERGON,IN-PARTY \?CCL8
	ICALL	TRAVEL-COMMANDS,BERGON,GET-ADVICE-COMMAND
	JUMP	?CND6
?CCL8:	ICALL	CHANGE-TRAVEL-COMMAND,PRAXIX,ASK-MINER-COMMAND,CAST-COMMAND
?CND6:	CALL1	LEAVE-ACTIVE-MINE
	RSTACK	
?CCL3:	EQUAL?	ACTION,ASK-MINER-COMMAND \?CCL10
	CALL	QSET?,HERE,BUSY
	ZERO?	STACK \?CCL10
	ICALL2	WPRINTD,ACTOR
	PRINTI	" started to ask the miner a question, but the miner interrupted. ""Before I answer your questions, I've got one of my own,"" he said. ""What are you doing in my mine?"""
	CRLF	
	CRLF	
	ICALL2	WPRINTD,ACTOR
	PRINTI	" replied with a condensed version of the truth, as the miner listened in scornful disbelief."
	CRLF	
	CRLF	
	PRINTI	"""Just plain stupid,"" was his conclusion; he spat on the ground and continued, ""Go on, ask your questions and get out. I've got lots more work to do!"""
	RTRUE	
?CCL10:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	FSET?	HERE,EXAMINED /?CCL17
	PRINTI	"Baffled, we snaked our way through the narrow passage, but no sooner did we arrive back that the tapping started again."
	CRLF	
	CRLF	
	PRINTI	"""Spirits?"" I suggested, instinctively turning back toward the darkened slit."
	CALL2	MOVE-TO,MINER-PASSAGE
	RSTACK	
?CCL17:	FSET?	BERGON,IN-PARTY \?CCL20
	ICALL	TRAVEL-COMMANDS,BERGON,GET-ADVICE-COMMAND
	JUMP	?CND18
?CCL20:	ICALL	CHANGE-TRAVEL-COMMAND,PRAXIX,ASK-MINER-COMMAND,CAST-COMMAND
?CND18:	CALL1	LEAVE-ACTIVE-MINE
	RSTACK	


	.FUNCT	LEAVE-ACTIVE-MINE:ANY:0:0
	IN?	MINER,HERE \?CCL3
	PRINTI	"We were filled with curiosity about this strange miner, and had many questions to ask him, but we had now overstayed our welcome in his mine. And so we said our good-byes and"
	FSET?	OLD-MINE,SOLVED \?CCL6
	ICALL	REMOVE-TRAVEL-COMMAND,MINE-LOWER-STAIR,LEFT-COMMAND
	PRINTI	", leaving the mines, returned to the bottom of the stairs."
	ICALL2	MOVE-TO,MINE-LOWER-STAIR
	JUMP	?CND4
?CCL6:	ICALL	TRAVEL-COMMANDS,MINE-JUNCTION,OLD-MINE-COMMAND,BACK-COMMAND
	ICALL	MOVE-TO,MINE-JUNCTION,STR?593
?CND4:	IN?	RED-ROCK,INVENTORY \TRUE
	CRLF	
	CRLF	
	PRINTI	"""Excellent, "
	ICALL1	WPRINTTAG
	PRINTI	", to have taken those red rocks,"" Praxix said, ""I believe they are far more valuable than they appear. Keep them safe! I shall tell you more when we are more at leisure."""
	RTRUE	
?CCL3:	PRINTI	"We returned to the entrance of the mine, utterly confused about the meaning of the tapping sounds."
	CRLF	
	CRLF	
	PRINTI	"""Do you believe in spirits?"" I asked Praxix."
	CRLF	
	CRLF	
	PRINTI	"""Spirits, yes, but not spirits that go about rock mining in caverns. There is another explanation, I am sure of that!"" he replied."
	ICALL	REMOVE-TRAVEL-COMMAND,MINE-JUNCTION,NEW-MINE-COMMAND
	CALL2	MOVE-TO,MINE-JUNCTION
	RSTACK	

	.ENDSEG

	.ENDI
