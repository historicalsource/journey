
	.SEGMENT "LAKE"


	.FUNCT	FSET-SEEN:ANY:0:0
	FSET	HERE,SEEN
	RTRUE	


	.FUNCT	ANONF-209:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Sunlight danced on the surface of the lake that lay before us. It was large, perhaps three miles across, and its waters were a brilliant blue. Much of the shoreline was rocky, but below us lay a sandy beach. The lake sat in a bowl in the mountains, fed by alpine streams, most of which had run dry in the summer's heat. But "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" pointed out one, directly between ourselves and the lake, that still flowed."
	RTRUE	


	.FUNCT	ANONF-210:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"Descending from the high plain, we headed toward the near shore of the lake. Nearing the halfway point, we stopped at a wide stream whose waters careened down the slope and into the lake below. The sky was dark, and a storm threatened."
	CRLF	
	CRLF	
	PRINTI	"""Look!"" Praxix cried, pointing toward the lowering clouds. For a long time we saw nothing, but soon a great, white bird emerged from the cloud base and soared overhead in graceful spirals."
	CRLF	
	CRLF	
	PRINTI	"""I have seen nothing like it,"" Bergon said, as the bird disappeared into the eastern sky."
	CALL2	MOVE-TO,GOLD-STREAM
	RSTACK	
?CCL3:	EQUAL?	ACTION,FOLLOW-SMOKE-COMMAND \?CCL5
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"We followed "
	GETP	HERE,P?TEMP
	ICALL2	WPRINTD,STACK
	PRINTI	" to the crest of the rise, where we could see smoke rising from behind a smaller hill that lay in front of us."
	CRLF	
	CRLF	
	PRINTI	"It was a short walk to the next hill; before us sat a ramshackle hut, its battered door flapping slowly in the breeze. It was hard to believe that one could live in such a place, but the column of smoke rising from the chimney convinced us otherwise."
	FSET?	MINAR,IN-PARTY \?CND6
	PRINTI	"""The hut was not here last year,"" he said, ""I am at a loss to understand it."""
	CRLF	
	CRLF	
?CND6:	PRINTI	"""Most peculiar!"" said Praxix. ""Whom do you suppose would choose to live here?"""
	CALL2	MOVE-TO,HERMIT-HILL
	RSTACK	
?CCL5:	EQUAL?	ACTION,SCOUT-COMMAND \FALSE
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	PUTP	HERE,P?TEMP,ACTOR
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went on ahead, climbing a nearby ridge in hopes of getting a better view. "
	EQUAL?	ACTOR,ESHER \?CCL12
	PRINTI	"He came back slowly; evidently, scouting ahead was not one of Esher's favorite assignments. ""There's some forest burning behind the ridge, if any of you find that interesting,"" he said. ""Otherwise, there's nothing much there. Let's stop wasting time, and head down toward the lake."""
	RTRUE	
?CCL12:	PRINTI	"He returned, bringing strange news. ""There is smoke rising up from behind the ridge. I thought perhaps it was a fire, but the plume of smoke is small and localized, as if it were coming from a hearth or campfire. And that in itself is odd, for nobody lives up here, at least not that I have ever come across."""
	CALL	ADD-TRAVEL-COMMAND,HERE,FOLLOW-SMOKE-COMMAND
	RSTACK	


	.FUNCT	ANONF-211:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"The hut was small, made of rough-hewn logs. The thatched roof was so haphazardly constructed that it would hardly keep out the wind, no less the rain. It was difficult to believe that someone would choose to live here, but the evidence clearly pointed in that direction."
	CRLF	
	CRLF	
	EQUAL?	ACTOR,PRAXIX \?CCL6
	PRINTI	"""It would take a good deal of magic to fix this place up,"" Praxix said. ""Shall we take a closer look?"""
	RTRUE	
?CCL6:	EQUAL?	ACTOR,ESHER \FALSE
	PRINTI	"Esher was not impressed. ""I don't see how someone living here could be of help to anyone,"" he said."
	RTRUE	


	.FUNCT	ANONF-212:ANY:0:0
	EQUAL?	ACTION,KNOCK-COMMAND \?CCL3
	PRINTI	"With Bergon in the lead, we approached the hut. But even as his raised hand came down upon that rickety door, it appeared to open of its own volition. We entered slowly; the hut was dark and smelled of incense. In the far corner, one eye gone, the other opaque with cataracts, an old man stared at us."
	CRLF	
	CRLF	
	PRINTI	"I say old, though the many lines on his face were more like the scars earned in battle than the wrinkles gathered over the long years. We stood motionless, as though afraid to speak or perhaps unsure of what to say. The silence was broken as the old man stood, toppling his stool, and took a few hobbling steps toward Bergon."
	CRLF	
	CRLF	
	PRINTI	"Then, staring straight into Bergon's eyes, he said, ""You come from the far plains of Lavos, and you seek a great Wizard."" Raising a deformed finger, he hissed accusingly, ""It is in your eyes!"""
	ICALL2	MOVE-TO,HERMIT-HUT
	CALL	OPTION,BERGON,TELL-TRUTH-COMMAND,LIE-COMMAND
	RSTACK	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	CALL	MOVE-TO,HIGH-PLAIN,STR?538
	RSTACK	


	.FUNCT	END-HERMIT-OPTION:ANY:0:0
	PRINTI	"Fools! There is no Wizard, there is only the Enemy - and he is strong - too strong for the likes of you!"""
	CRLF	
	CRLF	
	PRINTI	"""And how do you know this?"" Bergon demanded."
	CRLF	
	CRLF	
	PRINTI	"The hermit retreated to his stool, and sat again in the corner. ""I know nothing!"" he said, and sighed deeply."
	CALL1	END-OPTION
	RSTACK	


	.FUNCT	ANONF-213:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Old and stooped, the hermit looked at us through his single weary eye. He wore a tattered tunic, whose style was not unlike that used by our people in the plains."
	CRLF	
	CRLF	
	PRINTI	"""Your accent sounds familiar,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said. ""Have you travelled in our lands?"" The hermit was taken aback by "
	ICALL2	WPRINTD,ACTOR
	PRINTI	"'s offhand comment, though he did not respond."
	RTRUE	


	.FUNCT	ANONF-214:ANY:0:0
	EQUAL?	ACTION,EXIT-COMMAND \?CCL3
	FSET?	HERE,SCOUTED \?CCL6
	PRINTI	"We shuffled out of the hut, and Garlimon hobbled to the door as we made our way back to our path. ""Begone!"" he cried"
	FSET?	HERE,TRIED \?CCL9
	PRINTI	", and threw a small leather bag at our feet. ""Perhaps this will help you where you are going!"""
	JUMP	?CND7
?CCL9:	PRINTC	46
?CND7:	PRINTI	" He started to cackle madly, and began to chant in a sing-song fashion. ""The water that heals, the fire reveals, the earth..."" He was babbling incoherently now, and soon slammed the door behind us."
	FSET?	HERE,TRIED \?CND10
	ICALL	UPDATE-MOVE,HERMIT-POWDER,INVENTORY
	PRINTI	" Curious as to what we had been given, I bent down and picked up the bag."
?CND10:	CRLF	
	CRLF	
	CALL	MOVE-TO,HIGH-PLAIN,STR?540
	RSTACK	
?CCL6:	PRINTI	"We left the hut in silence and returned to the high plain."
	CRLF	
	CRLF	
	CALL	MOVE-TO,HIGH-PLAIN,STR?541
	RSTACK	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL13
	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix reached toward his cloak, but Bergon stayed his hand. ""Not now!"" he said."
	RTRUE	
?CCL13:	EQUAL?	ACTION,TELL-TRUTH-COMMAND \?CCL15
	PRINTI	"""We have journeyed from Lavos, as you say; we "
	ZERO?	2ND-PASS /?CCL18
	PRINTI	"have enlisted the aid of the great Wizard Astrix, and our efforts are now joined with his own."""
	CRLF	
	CRLF	
	JUMP	?CND16
?CCL18:	PRINTI	"seek the Wizard Astrix, to seek his aid."""
	CRLF	
	CRLF	
	PRINTC	34
?CND16:	FSET	HERE,TRIED
	CALL1	END-HERMIT-OPTION
	RSTACK	
?CCL15:	EQUAL?	ACTION,LIE-COMMAND \?CCL20
	PRINTI	"""We seek no Wizard; we are..."""
	CRLF	
	CRLF	
	PRINTI	"""You are liars!"" he roared. ""I know who you are; I know what you are. "
	CALL1	END-HERMIT-OPTION
	RSTACK	
?CCL20:	EQUAL?	ACTION,LOOK-AROUND-COMMAND \FALSE
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL	UPDATE-FSET,HERMIT-HUT-HERMIT,DONT-EXAMINE
	FSET	HERE,SCOUTED
	FSET	HERE,DONT-SCOUT
	ICALL2	WPRINTD,ACTOR
	PRINTI	", meanwhile, had been discreetly eyeing the hut when he caught a glimpse of a broadsword lying behind the door. He picked it up, and, still unseen, showed it to Bergon, who turned his back to examine it."
	CRLF	
	CRLF	
	PRINTI	"""A fine weapon!"" Bergon said, unsheathing the sword and holding it out toward the hermit. ""The finest of its kind; forged at Hervish, judging by its style, and fashioned by a great craftsman."" We thought it odd for Bergon to be ranting on about this undistinguished looking weapon, but we were wholly unprepared for what followed."
	CRLF	
	CRLF	
	PRINTI	"""Garlimon,"" Bergon said warmly, and reached out for the hermit."
	CRLF	
	CRLF	
	PRINTI	"But the hermit spurned Bergon's hand. ""Yes. Garlimon. What of it?"" he scowled, ""You seek Astrix; I sought him also. And I see you've gotten further than I - so far!"" He lifted his cane, and waved it at us menacingly. ""You are in great danger - all of you! You will die at His hand! You will all die!"""
	CRLF	
	CRLF	
	PRINTI	"Garlimon was mad! He stumbled backward, clutching a rotting table, and stared wildly at us. ""Leave me!"" he demanded. ""Leave this place at once!"""
	RTRUE	

	.ENDSEG

	.ENDI
