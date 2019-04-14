
	.SEGMENT "ZAN"


	.FUNCT	ANONF-318:ANY:0:0
	ICALL2	REMOVE-ALL,HURTH-STORIES
	REMOVE	SPIRIT-STONE
	ICALL2	UPDATE-REMOVE,SIXTH-STONE
	SET	'SUBGROUP-MODE,TRUE-VALUE
	GRTR?	RED-ROCK-COUNT,0 \?CND1
	MOVE	INVISIBLE-SPELL,ALWAYS-SPELLS
?CND1:	ICALL2	GRAPHIC,G-ASTRIX
	PRINTI	"Astrix took the Two stones in his hand, and it seemed that they became one, occupying the same space, and suffused with a brilliant white glow. Peering into the glow, Astrix went into a trance. ""The Anvil,"" he said in a breathless whisper, and collapsed to the ground, the Two separating as they fell from his grasp; the glow dimmed, then went out. Soon, Astrix' breath returned and he regained his composure."
	CRLF	
	CRLF	
	PRINTI	"""I have seen it, felt it,"" he said, closing his eyes tightly and drawing a deep breath. ""The Anvil shall be found near the place of its creation at the dawning of our Age; on the Misty Isle, far to the south. This is where your efforts lead - the end of your Journey, for good or ill."""
	CRLF	
	CRLF	
	PRINTI	"""I have not heard of such an island,"" Praxix said, ""though I am not unfamiliar with lore and legend."""
	CRLF	
	CRLF	
	PRINTI	"""The legends of your lands, perhaps,"" Astrix replied. ""The Misty Isle lies in the deep ocean, south of Zan, beyond the Twin Isles of Estril and Lethor. The sailors of Zan know it well, or rather they know of it. For it is shrouded in mist, and it is told that none who has entered that mist has returned alive. But that is where the Anvil is to be found, if indeed it can be found at all; it has a great power within it, and that is our last hope against the scourge from the North."""
	CRLF	
	CRLF	
	PRINTI	"""Rest here this night, and start fresh in the morning. The road to Zan lies here,"" he continued, taking out a crude map, ""It should be no more than a two-day march."" He paused, as if unsure of how to say what was to follow."
	CRLF	
	CRLF	
	PRINTI	"""Word of your quest is in the air,"" he said darkly, ""Even the "
	PRINT	BAD-GUY
	PRINTI	" himself cannot be unaware of the uniting of the Six Stones. And this he has long feared, for the Legend tells that Five, having gained the Six Stones, shall find the Anvil, and claim it for their own. As long as your party of five are abroad in the land, you cause the "
	PRINT	BAD-GUY
	PRINTI	" great alarm. Take care - for the "
	PRINT	BAD-GUY
	PRINTI	" has eyes and ears everywhere, and it is said that Zan itself is in his thrall. Do not tarry there; the sooner you reach the open seas, the better!"""
	RTRUE	


	.FUNCT	ANONF-319:ANY:0:0
	SET	'SUBGROUP-MODE,FALSE-VALUE
	RETURN	SUBGROUP-MODE


	.FUNCT	ANONF-320:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	CALL2	MOVE-TO,ZAN-OUTSKIRTS
	RSTACK	


	.FUNCT	ANONF-321:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Of our party, Hurth's vision was the most acute, and Praxix asked him to examine the shadow carefully."
	CRLF	
	CRLF	
	PRINTI	"""It is a great, black bird,"" Hurth said, twisting his head to follow the rapidly moving form, ""and on its back a dark rider!"""
	CRLF	
	CRLF	
	PRINTI	"""It searches for us,"" Praxix said glumly, ""and we are scarcely protected from its view! I must think...."""
	CALL	ADD-TRAVEL-COMMAND,HERE,HIDE-COMMAND
	RSTACK	


	.FUNCT	ATTENTION-GETTER?:ANY:0:0
	EQUAL?	ACTION-OBJECT,RAIN-SPELL,LIGHTNING-SPELL /TRUE
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL,FIRE-SPELL /TRUE
	RFALSE	


	.FUNCT	ANONF-322:ANY:0:0
	PRINTI	"It was a simple matter to locate the southern route that led to Zan, and by the afternoon of the second day we could see from afar the port of Zan at the shore of the great ocean."
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-ZAN-DEMON
	PRINTI	"As we descended through the open plains that led to the sea, it seemed that a cloud had passed before the sun, and the land was cast in shadow. But this was no cloud, but rather the form of some large creature that came from the north, spinning and diving through the sky like some bird of prey looking for its next meal."
	CRLF	
	CRLF	
	PRINTI	"""The great white bird,"" I said, thinking back to the graceful form we had seen as we descended from the high plain to the mountain lake. ""The one sent by Astrix to follow our progress!"""
	CRLF	
	CRLF	
	PRINTI	"But Praxix was concerned. ""You may be right,"" he said, ""but there are other creatures that roam the skies, and not all are friends of ours."""
	RTRUE	


	.FUNCT	ANONF-323:ANY:0:0,SP,?TMP2
	EQUAL?	ACTION,HIDE-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"A hiding place was nowhere to be found in this open plain, and all eyes turned to Praxix. A seeming eternity passed before he spoke."
	CRLF	
	CRLF	
	PRINTI	"""None of my spells will protect us, but..."" He paused again, tapping his head with his staff as if trying to unjam some piece of mental machinery. ""Now that I think of it, I can recall that one combination of essences produces a kind of fog or mist. All I need do is figure out which two..."""
	CRLF	
	CRLF	
	CALL2	COUNT,ESSENCES
	GRTR?	STACK,1 \?CCL6
	PRINTI	"The dark shadow lengthened as we breathlessly awaited the results of Praxix' magic."
	FSET	HERE,SEEN
	CALL	OPTION,PRAXIX,MIX-COMMAND
	RSTACK	
?CCL6:	PRINTI	"Praxix now removed his pouch, but discovered that he didn't have enough essences to make any mixture whatever."
	RTRUE	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL8
	FSET?	HERE,SEEN /?CCL8
	CALL	QSET?,HERE,TRIED
	ZERO?	STACK \?CCL8
	CALL1	ATTENTION-GETTER?
	ZERO?	STACK /?CCL8
	PRINTI	"Praxix, flustered by the approach of this demon of darkness, tried casting his """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell, but this had the disastrous effect of bringing attention to our party and its location."
	CRLF	
	CRLF	
	CALL1	DEMON-KILLS-AT-OUTSKIRTS
	RSTACK	
?CCL8:	EQUAL?	ACTION,CAST-COMMAND \?CCL14
	EQUAL?	ACTION-OBJECT,INVISIBLE-SPELL \?CCL14
	PRINTI	"""Why not use the red rocks for invisibility,"" I said, thinking I had come up with a solution to our predicament."
	CRLF	
	CRLF	
	PRINTI	"""We have barely enough to make one person invisible,"" Praxix replied, ""and that would scarcely protect the rest of us. No, I must think of something else."""
	RTRUE	
?CCL14:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL18
	ZERO?	DEMON-VICTIM /?CCL21
	PRINTI	"With heavy hearts, we pressed onward"
	JUMP	?CND19
?CCL21:	FSET?	HERE,TRAPPED /?CCL23
	FSET	HERE,SEEN
	PRINTI	"Ignoring the shadow that grew ever closer, we continued down the path leading to the sea. But after only a few short moments, the sky again darkened and we watched in horror as the shadow dove at our party."
	CRLF	
	CRLF	
	ICALL1	DEMON-KILLS-AT-OUTSKIRTS
	ICALL2	HINT,HINT-DKAO
	RTRUE	
?CCL23:	PRINTI	"The fog had now completely cleared, and we could see no trace of the dark shadow. We pressed onward"
?CND19:	PRINTI	", all the time aware that dark and ominous clouds had been building above us all afternoon. Rain threatened at any moment, and then it came, heralded by the booming of thunder and the pungent smell of a nearby lightning strike. Soon, we were in the midst of a downpour, and we hustled for cover into a nearby shallow cave."
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-ZAN-CAVE
	PRINTI	"""We should be safe enough here,"" Bergon said, removing his flooded boots."
	CRLF	
	CRLF	
	PRINTI	"""Yes, well, safe enough, I suppose,"" a voice that was not one of our own replied. ""What I mean is, we're safer than out there, but as to whether or not we are truly safe...."" He paused in his monologue, interrupted by some passing thought, and then attempted to finish his sentence. ""Now what was I saying?"" he said."
	CRLF	
	CRLF	
	PRINTI	"From within our ranks came an unmistakable groan, and this brought a cry of recognition from the stranger."
	CRLF	
	CRLF	
	PRINTI	"""Ah, Praxix,"" he said, pulling back his cloak and moving toward us from the dark recesses of the cave. ""Imagine that! We meet yet again!"""
	CRLF	
	CRLF	
	PRINTI	"It was Umber, and he was at his most cheerful, happily telling of his exploits since we had last met. About an hour into his story, the storm abated and the sky brightened, but Umber did not seem to notice, or in any event, gave no indication of a desire to leave the cave."
	CALL2	MOVE-TO,ZAN-CAVE
	RSTACK	
?CCL18:	EQUAL?	ACTION,MIX-COMMAND \FALSE
	ZERO?	DEMON-SEARCHING? /FALSE
	FSET?	HERE,SEEN \FALSE
	CALL	QSET?,HERE,TRAPPED
	ZERO?	STACK \FALSE
	PRINTI	"Praxix came to a quick decision, mixing equal parts of "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" and "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	"; then he cast the mixture into the sky."
	CRLF	
	CRLF	
	GETPT	ACTION-OBJECT,P?MIX-SPELL >?TMP2
	GETP	ACTION-PRSI,P?TEMP
	GET	?TMP2,STACK >SP
	ICALL2	USE-ESSENCES,SP
	EQUAL?	SP,FOG-SPELL \?CCL32
	ICALL2	GRAPHIC,G-FOG-CLEARS
	PRINTI	"From nowhere, a dense fog formed, engulfing our party and the surrounding terrain in a heavy shroud of moisture. Yet even then we could sense the shadow as it passed above us, circled overhead, and departed to the south."
	JUMP	?CND30
?CCL32:	ICALL2	GRAPHIC,G-DEMON
	ICALL2	HINT,HINT-FOG
	SET	'DEMON-SEARCHING?,FALSE-VALUE
	PRINTI	"But Praxix mixed the wrong powders, producing "
	EQUAL?	SP,MUD-SPELL \?CCL35
	PRINTI	"what appeared to be the most useless of all possible spells - Mud"
	JUMP	?CND33
?CCL35:	PRINTI	"the """
	ICALL2	WPRINTD,SP
	PRINTI	""" spell instead of fog"
?CND33:	PRINTI	". Discouraged, we attempted to hide from the shadow as best we could, but to no avail."
	CRLF	
	CRLF	
	ICALL1	DEMON-KILLS-AT-OUTSKIRTS
?CND30:	FSET	HERE,DONT-CAST
	ICALL	UPDATE-FCLEAR,HERE,DANGEROUS
	CALL1	END-OPTION
	RSTACK	


	.FUNCT	DEMON-KILLS-AT-OUTSKIRTS:ANY:0:0
	SET	'DEMON-SEARCHING?,FALSE-VALUE
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,HIDE-COMMAND
	CALL	FIRST-IN-PARTY,HURTH,ESHER >DEMON-VICTIM
	PRINTI	"Black as the darkest caverns, it hovered, formless, in the sky above us. And then, with a terrifying scream, it dove down upon us, landing on the ground before us."
	CRLF	
	CRLF	
	PRINT	DEMON-DESC
	CRLF	
	CRLF	
	PRINTI	"Praxix, whose pouch of magical essences was already at hand, was attempting to prepare some spell that would foil this demon, but it was now too late."
	CRLF	
	CRLF	
	PRINTI	"""Fool!"" the demon boomed, and from his fingertips shot a bolt of red-hot flame that knocked Praxix to the ground, unconscious. ""I have no time for parlor magicians,"" he said mockingly."
	CRLF	
	CRLF	
	PRINTI	"""We know who you are, and we know what you are,"" the demon continued, ""but you will be needing a lesson in manners. Now who shall receive this lesson?"""
	CRLF	
	CRLF	
	PRINTI	"""Praxix will not do,"" the demon spat, ""I would not waste my energies on one so defenseless. No, I believe the honor should go to "
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	"."""
	CRLF	
	CRLF	
	PRINTI	"And then, the demon stretched out his arm, hand open, at "
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	" and, as he slowly closed his hand, it seemed that "
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	" was being squeezed mercilessly; he screamed in agony as the demon's fist closed ever tighter. Moments later, he was dead, crushed by this awful monster from Hell."
	CRLF	
	CRLF	
	PRINTI	"""The same fate, or worse, awaits all those who seek to defy the "
	PRINT	BAD-GUY
	PRINTI	". This is but a taste of what is to follow."" Then, he swung his arm to his side and opened his clenched fist; "
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	"'s body was flung into the sky and out of sight."
	CRLF	
	CRLF	
	PRINTI	"And then, mounting the awful creature that had borne him here, he flew off into the distant north. Praxix now rose, albeit unsteadily, and Bergon took upon himself the unpleasant task of relating what had happened."
	CALL2	PARTY-REMOVE,DEMON-VICTIM
	RSTACK	


	.FUNCT	O-ASK-UMBER:ANY:0:0
	CALL2	FIND-OBJECTS,ASK-UMBER-OBJECTS
	RSTACK	


	.FUNCT	ANONF-324:ANY:0:0
	PRINTI	"""Mudwargs?"" Bergon asked."
	CRLF	
	CRLF	
	PRINTI	"""Ah, I see your point,"" Umber replied. ""You're not from here, so you and the mudwargs are not well acquainted. Well, to be honest, I don't know much about them myself, except that they live underground and feed during the day when the ground is flooded. You'll never see one at night, which is just fine with me, but during the daytime they can be quite trying."""
	FSET	ASK-UMBER-MUDWARGS,SEEN
	CALL2	UPDATE-REMOVE,ASK-UMBER-MUDWARGS
	RSTACK	


	.FUNCT	ANONF-325:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	IN?	REAGENT,REAGENTS \?CND4
	MOVE	BLUE-REAGENT,REAGENTS
	PUT	ESSENCE-OBJECT-TBL,BLUEOFF,BLUE-REAGENT
	REMOVE	REAGENT
?CND4:	MOVE	BLACK-REAGENT,REAGENTS
	FSET	BLACK-REAGENT,SEEN
	PRINTI	"Umber was now snoring loudly and Praxix decided to find out what Umber was carrying in his sack. It turned out that it contained only a few stones, presumably from the trove in the castle's dungeons, as well as a single, large, multifaceted black stone that crumbled to the same consistency as that of Praxix' magical reagents. Carefully, Praxix broke off a piece of the stone, crushed it into a powder, and placed it among his own."
	RTRUE	


	.FUNCT	ANONF-326:ANY:0:0
	CALL	OPTION,LEADER,LEAVE-COMMAND,STAY-COMMAND
	RSTACK	


	.FUNCT	ANONF-327:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"""What do you propose that we do?"" Bergon asked Umber, who was now preparing some crude bedding on the ground."
	CRLF	
	CRLF	
	PRINTI	"""Sit tight, that's my advice,"" he replied all too cheerfully. ""They'll be gone by nighttime. Don't much like the dark, you know."""
	CRLF	
	CRLF	
	PRINTI	"""We haven't the luxury of that option,"" Bergon said. ""We must reach Zan this evening."""
	CRLF	
	CRLF	
	PRINTI	"""Ah,"" he replied, ""That will pose something of a problem."" And with that, he curled up into a ball and fell into a deep sleep."
	ICALL	TRAVEL-COMMANDS,BERGON,GET-ADVICE-COMMAND
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	CALL	UPDATE-MOVE,UMBER-SACK,HERE
	RSTACK	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL5
	EQUAL?	ACTION-OBJECT,INVISIBLE-SPELL \?CCL5
	ICALL1	SAVE-SPELL
	PRINTI	"Then, Praxix suggested using some of the red rock to make an invisibility spell. But even if this could have helped, he hadn't nearly enough to use on our entire party."
	CRLF	
	CRLF	
	PRINTI	"""No, I must think of something else,"" Praxix said."
	RTRUE	
?CCL5:	EQUAL?	ACTION,LEAVE-COMMAND \?CCL9
	CALL	QSET?,HERE,BLUE-MIX
	ZERO?	STACK \?CCL12
	PRINTI	"Trying to be as polite as possible, we told Umber of our eagerness to reach Zan by this evening, and excused ourselves. The air was warm, and the sky mostly clear, but large puddles of water covered our path."
	CRLF	
	CRLF	
	PRINTI	"We had not taken a dozen steps when I stepped into a puddle and felt something squirming beneath my feet. As it wrapped itself around my ankles, I let out a terrified scream and ran back toward the cave with the rest of our party at my heels."
	CRLF	
	CRLF	
	PRINTI	"""Ah, now I remember,"" Umber said as we hurried into the cave,"
	ICALL1	MUDWARG-TELL
	CALL1	END-OPTION
	RSTACK	
?CCL12:	ICALL	TRAVEL-COMMANDS,BERGON,GET-ADVICE-COMMAND
	ZERO?	DARKNESS-CAST? /?CCL15
	PRINTI	"Using Praxix' staff as a cloak of darkness, we marched down the soggy path. The earth was unnaturally still as we trudged through the mudwarg infested pools."
	FSET?	ASK-UMBER-MUDWARGS,SEEN \?CND16
	PRINTI	" But Umber had been right, or so it seemed - the mudwargs had no taste for those that travelled in darkness."
?CND16:	CRLF	
	CRLF	
	PRINTI	"Praxix now spoke, and his voice was filled with dread. ""I have been thinking about our friend, Umber,"" he began, ""and I cannot fathom how it is that he slept through our experiment"
	GRTR?	BLACK-COUNT,1 \?CND18
	PRINTC	115
?CND18:	PRINTI	" with the black powder."""
	CRLF	
	CRLF	
	PRINTI	"""He's a good sleeper?"" I tried, thinking it was just barely possible."
	CRLF	
	CRLF	
	PRINTI	"""Perhaps,"" Praxix replied. ""But I wonder how it is that Umber possessed the black reagent, and how conveniently it was placed at our disposal."" A deathly chill ran through me as Praxix went on. ""Umber is not what he would appear, and I can only guess at his purpose."""
	JUMP	?CND13
?CCL15:	CALL	FIRST-IN-PARTY,MINAR,HURTH,ESHER >ZAN-VICTIM
	PRINTI	"Seeing no alternative, we attempted to make our way through the mudwarg infested pools that lay along our path. It appeared we would come through our ordeal unscathed, when "
	ICALL2	WPRINTD,ZAN-VICTIM
	PRINTI	" let out a horrific scream. Two mudwargs had grabbed onto his ankles, pulling him to the ground. Another was there instantly, wrapping itself around his torso and neck. Before we could react, the three slithered into the earth, dragging our friend along with them."
	CRLF	
	CRLF	
	ICALL2	PARTY-REMOVE,ZAN-VICTIM
	SET	'DEMON-SEARCHING?,FALSE-VALUE
	ICALL2	HINT,HINT-MUDWARGS
	PRINTI	"""There is nothing we can do here,"" Praxix said, urging us onward. It sounded callous, but it was not - this was no time to mourn, and we simply had no choice but to continue down the road, which we did without further incident."
?CND13:	CRLF	
	CRLF	
	PRINTI	"It was nearly twilight when we reached the outskirts of Zan. Many homes were scattered in the hillsides that surrounded this busy port, but the main thoroughfare was nearly deserted. As we approached the center of town, two shops loomed before us: a curio shop and the local emporium."
	CALL	FIRST-IN-PARTY,MINAR,HURTH,ESHER >ZAN-VICTIM
	CALL2	MOVE-TO,ZAN-1
	RSTACK	
?CCL9:	EQUAL?	ACTION,STAY-COMMAND \?CCL21
	PRINTI	"""Ah, now I remember,"" Umber said, finishing his earlier, misplaced thought."
	FSET	HERE,BLUE-MIX
	ICALL1	MUDWARG-TELL
	CALL1	END-OPTION
	RSTACK	
?CCL21:	EQUAL?	ACTION,USE-MIX-COMMAND \FALSE
	EQUAL?	MIX-REAGENT,BLACK-REAGENT \FALSE
	EQUAL?	MIXTURE,DARKNESS-SPELL \?CCL28
	SET	'DARKNESS-CAST?,TRUE-VALUE
	FCLEAR	PRAXIX,LIT
	PRINTI	"Praxix carefully applied a small bit of the mixture to the staff, and we watched in amazement as it began to glow (if that's the word) black. And then the blackness spread until we were are bathed in an eerie darkness that emanated from within the enchanted staff."
	JUMP	?CND26
?CCL28:	EQUAL?	MIXTURE,COLD-SPELL \?CCL30
	SET	'DARKNESS-CAST?,FALSE-VALUE
	FCLEAR	DARKNESS-SPELL,SEEN
	PRINTI	"As Praxix cast the mixture upon the staff, the air became still and the cave became cold. A chill came over us all, and Praxix excitedly pointed at the tip of the staff itself - it was frosted over with a deep blue ice."
	JUMP	?CND26
?CCL30:	EQUAL?	MIXTURE,ILLNESS-SPELL \?CCL32
	PRINTI	"Praxix placed a small measure of his mixture upon the staff, but there was no obvious effect. A moment later, I felt somewhat faint and kneeled on the ground, barely able to stand."
	CRLF	
	CRLF	
	PRINTI	"""You, too,"" said Bergon, who was clutching the rock walls of the cave."
	JUMP	?CND26
?CCL32:	PRINTI	"No sooner did Praxix place the mixture on his staff than a wave of despair, greater than any I have ever known, came over me. Bergon fell to his knees and began to weep; the others, too, were overcome with the same dark feelings of hopelessness and doom. The feeling soon passed, but the memory lingers to this day."
?CND26:	INC	'BLACK-COUNT
	EQUAL?	BLACK-COUNT,1 \?CCL35
	CRLF	
	CRLF	
	PRINTI	"""I have a bad feeling for the black powder,"" Bergon said, ""and for the magic it contains."" But Praxix was deep in thought, and said nothing."
	JUMP	?CND33
?CCL35:	EQUAL?	BLACK-COUNT,2 \?CCL37
	CRLF	
	CRLF	
	PRINTI	"""Bergon is right about the black reagent,"" Praxix said sternly. ""It is dangerous, and contains the essence of some evil thing of which I know nothing."""
	JUMP	?CND33
?CCL37:	EQUAL?	BLACK-COUNT,3 \?CND33
	CRLF	
	CRLF	
	PRINTI	"""Each mixture produces yet another dismal effect,"" Praxix said, ""I fear to know where this unnatural thing is from and by what means it was brought into the world."""
?CND33:	CALL1	MIXTURE-CAST
	RSTACK	


	.FUNCT	MUDWARG-TELL:ANY:0:0
	PRINTI	" ""I was about to tell you why it is safer in here."" He motioned us to gather around him, and then, in a conspiratorial voice, he whispered a single word, 'mudwargs,' and shook his head knowingly."
	CALL	TRAVEL-COMMANDS,BERGON,GET-ADVICE-COMMAND,ASK-UMBER-COMMAND
	RSTACK	


	.FUNCT	ANONF-328:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"The curio shop's window was filled with a seemingly arbitrary assortment of items; the light inside was still on, and the proprietor could still be seen inside, straightening things up."
	EQUAL?	ACTOR,PRAXIX,ESHER \TRUE
	CRLF	
	CRLF	
	PRINTI	"""Reminds me of Webba's shop, back in Lavos,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" remarked. I had been thinking much the same thing."
	CRLF	
	CRLF	
	PRINTI	"""Quite a nice fellow,"" I said, ""Webba, I mean."""
	RTRUE	


	.FUNCT	ANONF-329:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"From all appearances, the emporium was closed for the night."
	CRLF	
	CRLF	
	PRINTI	"""An exciting place,"" commented "
	ICALL2	WPRINTD,ACTOR
	FSET?	CURIO-SHOP,SEEN /?CCL6
	PRINTI	", ""Let's hope something around here is open."""
	RTRUE	
?CCL6:	PRINTC	46
	RTRUE	


	.FUNCT	ANONF-330:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL3
	ICALL1	SAVE-SPELL
	PRINTI	"Rather than make a public spectacle of ourselves, we convinced Praxix not to use his flare spell right here in the middle of town."
	RTRUE	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL7
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	PRINTI	"Moving swiftly ahead, "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" had gotten a feel for the layout of town."
	CRLF	
	CRLF	
	PRINTI	"""There is the main street here,"" he said, ""and the wharf at the end of the road. Otherwise, I can see only some scattered homes and shanties."""
	RTRUE	
?CCL7:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL9
	PRINTI	"Nighttime was approaching as we continued down the main thoroughfare and into the more central part of town. A tavern and an inn lay on either side of the road, and the wharf could now be seen a short distance beyond."
	CALL2	MOVE-TO,ZAN-2
	RSTACK	
?CCL9:	EQUAL?	ACTION,CURIO-SHOP-COMMAND \?CCL11
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"We entered the curio shop, just as the proprietor was preparing to close up for the night. Squinting, he eyed each of us in turn, and evidently did not like what he saw."
	CRLF	
	CRLF	
	PRINTI	"""I'm closing up now,"" he said in a decidedly unfriendly tone, ""If you must, have yourselves a quick look around."""
	CALL2	MOVE-TO,CURIO-SHOP
	RSTACK	
?CCL11:	EQUAL?	ACTION,EMPORIUM-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"We approached the emporium, but it had already closed for the evening."
	CRLF	
	CRLF	
	PRINTI	"""It is later than I had thought,"" Bergon said, ""Let us hope the tavern doesn't keep the same hours."""
	RTRUE	


	.FUNCT	ANONF-331:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	EQUAL?	ACTOR,ESHER \?CCL6
	PRINTI	"""A lovely name for a tavern!"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, pointing at the signpost which colorfully depicted its name, ""Stormy Seas."""
	JUMP	?CND4
?CCL6:	PRINTI	"""I have never been at a tavern,"" Hurth said, looking at the signpost hanging above the entrance, ""but the name, Stormy Seas, is not very appetizing."""
?CND4:	CRLF	
	CRLF	
	PRINTI	"But name to the contrary, and excusing the loud voices and smoke which emanated from the door, it still seemed a reasonable spot for dinner."
	RTRUE	


	.FUNCT	ANONF-332:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL3
	ICALL1	SAVE-SPELL
	PRINTI	"Rather than make a public spectacle of ourselves, we convinced Praxix not to use his flare spell right here in the middle of town."
	RTRUE	
?CCL3:	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Above the inn, a sign hung on a rusted chain. In the soft evening breeze, it made a loud squealing sound as it swung to and fro. Painted on the sign were the words, ""Rest Easy,"" nothing more."
	CRLF	
	CRLF	
	PRINTI	"""A pleasant enough thought,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, watching the almost hypnotic movement, ""and it is getting rather late."""
	RTRUE	


	.FUNCT	ANONF-333:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"Although there were two choices of how to spend the night, we all looked forward to a night of comfort at the inn."
	ZERO?	INN-TALK /TRUE
	CRLF	
	CRLF	
	PRINTI	"Bergon, however, urged caution. """
	ICALL1	WPRINTTAG
	PRINTI	" heard the men at the tavern talking about the inn and some task that they had to perform. I do not believe these were chambermaids, and I am loath to spend the night there and find out just what their task is."
	CRLF	
	CRLF	
	PRINTI	"Praxix agreed. ""Perhaps it would be best for us to camp out this night."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \?CCL7
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,BACK-COMMAND,CAMP-OUT-COMMAND
	PRINTI	"We started to backtrack to the shops, but this turned out not to be an alternative; they were closed now, and their lights darkened. Only the tavern and inn remained open, though there was some activity also before us, at the wharf."
	RTRUE	
?CCL7:	EQUAL?	ACTION,WHARF-COMMAND \?CCL9
	ICALL1	REMOVE-TRAVEL-COMMAND
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,BACK-COMMAND,CAMP-OUT-COMMAND
	PRINTI	"Although it was dark, the wharf was brightly lit. There were over a dozen piers in varying stages of decay, and a handful of boats were moored at each. On some, the captain could be seen, giving orders to deckhands; others were deserted."
	CRLF	
	CRLF	
	PRINTI	"Bergon drew a deep breath of ocean spray and said, ""Did I ever finish telling you about my fishing days at Lendros?"""
	CRLF	
	CRLF	
	PRINTI	"The group gave out a single groan, which persuaded Bergon to change the subject. ""Let us check out the boats,"" he said."
	CALL2	MOVE-TO,WHARF
	RSTACK	
?CCL9:	EQUAL?	ACTION,TAVERN-COMMAND \?CCL11
	ICALL1	REMOVE-TRAVEL-COMMAND
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,BACK-COMMAND,CAMP-OUT-COMMAND
	REMOVE	ZAN-2-TAVERN
	PRINTI	"It was time for dinner, and it had been a long time since we had sat down to a meal."
	CRLF	
	CRLF	
	PRINTI	"""Shall we?"" I asked, bowing and motioning to the entrance."
	CRLF	
	CRLF	
	PRINTI	"""How can we refuse?"" said Bergon, smiling widely. ""I believe we've earned ourselves a fine meal or two these past weeks."""
	CRLF	
	CRLF	
	PRINTI	"The tavern was a large and noisy place, with a few dozen tables and a large bar. Either the drinks were exceptionally good or the food exceptionally bad, for the bar was filled with noisy sailors and townsfolk while "
	ZERO?	DEMON-SEARCHING? /?CCL14
	PRINTI	"only one table was occupied, and nobody there was eating."
	JUMP	?CND12
?CCL14:	PRINTI	"none of the tables in the dining area was occupied."
?CND12:	CRLF	
	CRLF	
	PRINTI	"Pleasantly surprised that our arrival had not attracted undue attention, we sat ourselves down for dinner, with the expectation of checking out the wharf later that evening."
	CALL2	MOVE-TO,ZAN-TAVERN
	RSTACK	
?CCL11:	EQUAL?	ACTION,INN-COMMAND \?CCL16
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,BACK-COMMAND,CAMP-OUT-COMMAND
	FSET?	INN,BLACK-MIX /?CCL18
	FSET?	WHARF,SOLVED /?CND17
?CCL18:	FSET	HERE,BLACK-MIX
	ICALL1	REMOVE-TRAVEL-COMMAND
?CND17:	FSET?	INN,SEEN \?CCL23
	PRINTI	"Again, we entered the inn; the old man was still there, and he smiled as we approached his desk."
	CRLF	
	CRLF	
	PRINTI	"""Not much happening this time of night, is there?"" he asked, and smiled broadly enough to see that he had but three teeth left in his mouth."
	JUMP	?CND21
?CCL23:	PRINTI	"We entered the inn through swinging doors. Inside, an old man, his long, stringy hair hidden beneath a dark, felt cap, was standing behind the counter, leaning on his elbow as if bored."
	CRLF	
	CRLF	
	PRINTI	"""Can I help you folks?"" he said, tapping his fingers on the counter."
?CND21:	CALL2	MOVE-TO,INN
	RSTACK	
?CCL16:	EQUAL?	ACTION,CAMP-OUT-COMMAND \FALSE
	ZERO?	CHOSEN-BOAT \?CCL28
	ICALL2	REMOVE-PARTY-COMMAND,CAMP-OUT-COMMAND
	PRINT	HAVENT-CHOSEN-BOAT
	RTRUE	
?CCL28:	ZERO?	DEMON-SEARCHING? /?CCL30
	FSET?	INN,SCOUTED \?CCL30
	FSET?	ZAN-TAVERN,SOLVED \?CCL35
	PRINTI	"Concerned about the suspicious men at the tavern"
	JUMP	?CND33
?CCL35:	PRINTI	"For some reason"
?CND33:	PRINTI	", we decided to avoid the inn, finding instead"
	PRINT	COMFORTABLE-SPOT
	CRLF	
	CRLF	
	PRINTI	"Shortly before dawn, we were awakened by the sound of alarm bells ringing in town. We rose and approached town cautiously, and found the inn ablaze with fire."
	CRLF	
	CRLF	
	PRINTI	"""This is no coincidence,"" Bergon said, absently rubbing his room key between his fingers, ""The fire was meant for us. It is well that we depart this morning."""
	CRLF	
	CRLF	
	PRINTI	"The eastern sky was now a dull orange, and we were soon expected at the wharf. With little time to spare, we hastily packed our things and headed back into town. But our arrival in town did not go unnoticed, and we were soon surrounded by an angry crowd. Things could have gotten pretty ugly in a hurry were it not for the presence of the local sheriff."
	CRLF	
	CRLF	
	PRINTI	"""Come with me, boys,"" he said, ""unless you'd like a taste of mob justice."""
	CRLF	
	CRLF	
	PRINTI	"Seeing little alternative, we were marched inside the small building that housed the town's single jail cell. ""You boys make yourselves comfortable,"" the sheriff said, ""You'll want to be resting up before your trial; you know, arson is a pretty serious crime, and we don't go lightly on criminals - especially strangers."""
	CRLF	
	CRLF	
	FSET?	GRAY-STONE,INCAPACITATED \?CND36
	PRINTI	"Just then, we heard a familiar voice entering the sheriff's office. ""Scoundrels and thieves!"" he cried as he made his way toward our crowded jail cell."
	CRLF	
	CRLF	
	PRINTI	"""Oh, dear,"" Praxix said under his breath. The proprietor of the curio shop now appeared, holding a bag of cold water to his head."
	CRLF	
	CRLF	
	PRINTI	"""That's them,"" he said, ""Stole a rare stone from my shop just last night. Not surprised to find them in jail."" And then, waving a finger in Praxix' face, he proclaimed, ""This is the one that knocked me on the head!"""
	CRLF	
	CRLF	
	ICALL2	UPDATE-REMOVE,POUCH
	PRINTI	"The sheriff called Praxix out of the cell and searched him thoroughly, confiscating his bag of powders. ""No stone,"" he reported, ""but don't you worry - we'll see that justice is done!"""
	CRLF	
	CRLF	
	PRINTI	"The proprietor harumphed and stormed out of the building as the sheriff returned Praxix to the cell, throwing him to the floor like a common criminal, which, in fact, was not far from the truth."
	CRLF	
	CRLF	
	ICALL	TRAVEL-COMMANDS,PRAXIX,EXAMINE-COMMAND
?CND36:	PRINTI	"And with that, he walked back to his front office and began snoring loudly. Outside our window, the sky had turned a brilliant orange; we had little time left before our boat would depart."
	ICALL	REMOVE-ALL,INVENTORY,JAIL-STORAGE,TRUE-VALUE
	CALL2	MOVE-TO,JAIL
	RSTACK	
?CCL30:	ZERO?	DEMON-SEARCHING? /?CCL39
	SET	'DEMON-SEARCHING?,FALSE-VALUE
	PRINTI	"It seemed wise to avoid the inn, so we found"
	PRINT	COMFORTABLE-SPOT
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-ASSASSINS
	PRINTI	"Shortly before dawn, a band of marauders surprised us in our sleep, attacking us viciously with swords and knives. "
	ICALL2	WPRINTCHR,ZAN-VICTIM
	PRINTI	", who lay closest to our campfire, awakening us with his scream, but was cut down before he could rise to defend himself."
	CRLF	
	CRLF	
	PRINTI	"The rest of us, as quietly as we could, took our weapons and crouched in the pre-dawn gloom."
	CRLF	
	CRLF	
	PRINTI	"""The others are around here,"" said a gruff voice in the darkness."
	CRLF	
	CRLF	
	PRINTI	"""I think we've done 'em enough damage,"" said another, apparently more anxious to depart."
	CRLF	
	CRLF	
	PRINTI	"""I'm with Pregar,"" said a third man, ""They'll be running back to wherever it is they're from, that's for sure. Let's go."""
	CRLF	
	CRLF	
	PRINTI	"The men departed, and we rushed to "
	ICALL2	WPRINTD,ZAN-VICTIM
	PRINTI	"'s side - as we feared, he been killed instantly by a savage sword thrust."
	CRLF	
	CRLF	
	PRINTI	"The eastern sky was now starting to brighten, and it would soon be time to board the "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTI	" on our voyage to the Misty Isle. With no time to waste, we quickly buried our fallen friend, and Praxix intoned the words of our burial ritual."
	CRLF	
	CRLF	
	PRINTI	"With heavy hearts, we made our way back to the wharf and boarded the "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTC	46
	ICALL2	HINT,HINT-CAMPGROUND
	ICALL2	PARTY-REMOVE,ZAN-VICTIM
	CALL2	MOVE-TO,BOAT
	RSTACK	
?CCL39:	PRINTI	"Opting to spend the night under the stars, our party found a comfortable spot outside of town and camped there. We arose at dawn and hastily made our way back through town and onto the "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTC	46
	CALL2	MOVE-TO,BOAT
	RSTACK	


	.FUNCT	ANONF-334:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"Praxix took the gray stone in his hand, and confirmed what he had seen as I picked it up: that it was composed of a fine powder whose consistency was immediately suggestive of a magical reagent. It might be just an ordinary stone, of course, but we could only tell by mixing it with Praxix' essences."
	RTRUE	


	.FUNCT	ANONF-335:ANY:0:0
	FSET	HERE,SEEN
	ICALL2	SAVE-PROVISION-COMMANDS,PRAXIX
	ICALL2	SAVE-PROVISION-COMMANDS,TAG
	CALL	PROVISION-COMMANDS,TAG,BUY-COMMAND,INVENTORY-COMMAND
	RSTACK	


	.FUNCT	ANONF-336:ANY:0:0
	ICALL2	RESTORE-PROVISION-COMMANDS,PRAXIX
	CALL2	RESTORE-PROVISION-COMMANDS,TAG
	RSTACK	


	.FUNCT	ANONF-337:ANY:0:0,CNT,CHR
	EQUAL?	ACTION,LOOK-AROUND-COMMAND \?CCL3
	CALL	QSET?,HERE,SCOUTED
	ZERO?	STACK \?CCL3
	PRINTI	"The shop was large, and filled with a vast assortment of artifacts; it would have taken hours to see everything (everything in plain view, that is) so "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went off to explore on his own."
	GRTR?	PARTY-MAX,3 \?CND6
	PRINTI	" This sounded like a good enough idea to the rest of us and soon we had separated to the far corners of the shop."
?CND6:	PRINTI	" Only Praxix remained alongside the counter, staring at the walls with indifference."
	CRLF	
	CRLF	
	PRINTI	"""I don't suppose there's something in particular you're looking for?"" asked the proprietor, sourly."
?PRG8:	IGRTR?	'CNT,PARTY-MAX /?REP9
	GET	PARTY,CNT >CHR
	EQUAL?	CHR,PRAXIX,TAG /?PRG8
	ICALL	MAKE-BUSY,CHR,GONE-COMMAND
	JUMP	?PRG8
?REP9:	CALL	OPTION,PRAXIX,REPLY-COMMAND,IGNORE-COMMAND
	RSTACK	
?CCL3:	EQUAL?	ACTION,REPLY-COMMAND \?CCL15
	ICALL	GRAPHIC,FALSE-VALUE,G-GRAY-STONE,BOTTOM-RIGHT
	PRINTI	"""I have always had a keen interest,"" Praxix replied casually, ""in rare stones and jewels, though I don't suppose you would have any."""
	CRLF	
	CRLF	
	PRINTI	"""Rare stones and jewels,"" the proprietor echoed in an ornery tone, and shrugging added, ""It's possible I've got something you'd like. You just wait here."" He then ambled into his back room and soon ambled back again carrying a small wooden case filled with stones and gems. ""One of these priceless gems might interest you,"" he said with an odd mix of curiosity and disdain."
	CRLF	
	CRLF	
	PRINTI	"Praxix glanced absently at the collection of stones, musing about whether the proprietor had some confusion between the words 'priceless' and 'worthless'. Just then, I returned to Praxix' side, having found little in the shop to interest me. But these stones were quite another matter, for I found them quite beautiful, particularly a pale gray stone cut in the shape of a pyramid. Under the proprietor's watchful eye, I grasped the stone, admired it for a moment, then returned it to its case."
	CRLF	
	CRLF	
	PRINTI	"And then, from a seeming stupor, Praxix sprang to life. ""We'll take the gray stone,"" he said crisply, ""How much do you ask?"""
	CRLF	
	CRLF	
	PRINTI	"The proprietor pursed his lips, and gave a little shrug. ""Oh, I don't know about that,"" he said, ""That's quite a valuable stone. I don't expect you'll be able to afford it."""
	ICALL1	END-OPTION
	ICALL	UPDATE-MOVE,GRAY-STONE,HERE
	ICALL	PROVISION-COMMANDS,TAG,BUY-COMMAND,SELL-COMMAND,INVENTORY-COMMAND
	FSET	GRAY-STONE,SEEN
	RTRUE	
?CCL15:	EQUAL?	ACTION,STEAL-STONE-COMMAND \?CCL17
	REMOVE	ZAN-1-CURIO-SHOP
	REMOVE	HYE-STEAL
	PRINTI	"Praxix regarded the stone intently, tapping his fingers nervously on the counter. And then, with a suddenness that surprised us all, he took matters into his own hands, grabbing the gray stone with his free hand and knocking the proprietor on the head with his staff. He then crushed the stone into a powder and placed it among his other magical items."
	CRLF	
	CRLF	
	PRINTI	"""This would be a good time to leave,"" he said, levelheadedly, as "
	GRTR?	PARTY-MAX,3 \?CCL20
	PRINTI	"the others"
	JUMP	?CND18
?CCL20:	PRINTI	"Bergon"
?CND18:	PRINTI	" arrived on the scene."
	CRLF	
	CRLF	
	PRINTI	"Outside of the shop, Bergon could hardly believe what had happened. ""I don't know what's gotten into you,"" he said to Praxix in a disapproving tone, ""I hope the stone is worth it!"""
	CRLF	
	CRLF	
	PRINTI	"""As do I,"" Praxix replied. ""The stone appears to be a magical reagent, and the proprietor was oddly disinclined to sell. Since I am certain we can put the stone to better use than he would, I thought it would do no harm to twist his arm a little. And now, I would suggest we leave the scene of the crime before the poor man recovers from his headache and discovers what is missing."""
	FSET	GRAY-STONE,SOLVED
	MOVE	GRAY-REAGENT,REAGENTS
	IN?	REAGENT,REAGENTS \?CND21
	MOVE	BLUE-REAGENT,REAGENTS
	REMOVE	REAGENT
?CND21:	FSET	GRAY-STONE,INCAPACITATED
	ICALL2	UPDATE-REMOVE,GRAY-STONE
	CALL2	MOVE-TO,ZAN-1
	RSTACK	
?CCL17:	EQUAL?	ACTION,BUY-COMMAND \?CCL24
	FSET	GRAY-STONE,EXAMINED
	PRINTI	"I took out my purse and looked expectantly at the proprietor. ""Let's say fifty silver pieces,"" he said."
	CRLF	
	CRLF	
	PRINTI	"We were aghast at the outrageous price; we had not nearly enough silver to make the purchase."
	ICALL	CHANGE-PROVISION-COMMAND,TAG,BUY-COMMAND,TRADE-COMMAND
	CALL	PROVISION-COMMANDS,PRAXIX,STEAL-STONE-COMMAND
	RSTACK	
?CCL24:	EQUAL?	ACTION,SELL-COMMAND \?CCL26
	PRINTI	"It occurred to me that selling something to the proprietor might help, but I wished to reserve this option as a last resort."
	CALL	UPDATE-FSET,HERE,DONT-DROP
	RSTACK	
?CCL26:	EQUAL?	ACTION,TRADE-COMMAND \?CCL28
	EQUAL?	ACTION-OBJECT,SPYGLASS \?CCL31
	ICALL2	UPDATE-REMOVE,SPYGLASS
	FSET	GRAY-STONE,SOLVED
	MOVE	GRAY-REAGENT,REAGENTS
	IN?	REAGENT,REAGENTS \?CND32
	MOVE	BLUE-REAGENT,REAGENTS
	REMOVE	REAGENT
?CND32:	PRINTI	"Pulling the spyglass from my pack, I held it out to the proprietor who examined it with keen interest."
	CRLF	
	CRLF	
	PRINTI	"""Quite a rare piece,"" he said, expressing little of the enthusiasm we could read in his eyes. Oddly, he was still reluctant to make the trade, although the spyglass was many times more valuable than the stone possibly could have been. But then, out of greed, perhaps, he relented. ""The gray stone for the spyglass,"" he said. ""Now, if you don't mind, it's closing time."""
	CRLF	
	CRLF	
	PRINTI	"After handing Praxix the gray stone, he ushered us back onto the street, where he bade us a perfunctory farewell with a wave of his hand."
	FSET?	SPYGLASS,TRIED /?CND34
	CRLF	
	CRLF	
	PRINTI	"""I did not realize you had taken the spyglass,"" Praxix said to me as he crumbled the gray stone into a fine powder, ""You are indeed a fine one; full of surprises! I'm certain nothing else would have satisfied him."""
?CND34:	CRLF	
	CRLF	
	PRINTI	"""I, for one, do not trust him,"" Bergon said, discreetly glancing back toward the shop. ""See how he peers at us still through his darkened window!"""
	ICALL2	UPDATE-REMOVE,ZAN-1-CURIO-SHOP
	CALL2	MOVE-TO,ZAN-1
	RSTACK	
?CCL31:	FSET?	ACTION-OBJECT,DONT-DROP \?CCL37
	PRINTI	"I took the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" out of my pack, and prepared to offer it to the proprietor, but thought better of it. No matter how valuable the gray stone might be, it was not worth giving this up for."
	RTRUE	
?CCL37:	IGRTR?	'TRADE-COUNT,1 /?CCL39
	PRINTI	"Removing the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" from my pack, I held it up to the proprietor's view, but elicited only a frown in response. ""I have no time for haggling with strangers,"" he said, ""and it's past closing time."""
	RTRUE	
?CCL39:	PRINTI	"The proprietor showed even less interest in the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	". ""I must be closing up now,"" he said, ""Perhaps you will find something else of interest tomorrow. Good day."" And with that, he hustled us out the door and back onto the street."
	CRLF	
	CRLF	
	PRINT	TELL-NO-SALE
	CALL2	MOVE-TO,ZAN-1
	RSTACK	
?CCL28:	EQUAL?	ACTION,IGNORE-COMMAND \?CCL41
	FSET	GRAY-STONE,TRAPPED
	PRINTI	"""No, nothing in particular,"" Praxix replied, for in fact nothing whatsoever had caught his eye, only odd trinkets and wood carvings of questionable value."
	CRLF	
	CRLF	
	PRINTI	"""Then, perhaps you and your friends would leave,"" he scowled. ""It's past closing time, and I've no interest in waiting on strangers."""
	ICALL1	END-OPTION
	CRLF	
	CRLF	
	PRINTI	"And with that, he escorted us out of his shop and back onto the street."
	CALL2	MOVE-TO,ZAN-1
	RSTACK	
?CCL41:	EQUAL?	ACTION,EXIT-COMMAND \FALSE
	FSET?	BERGON,BUSY \?CCL46
	FSET?	GRAY-STONE,EXAMINED \?CCL49
	PRINTI	"It seemed we would be unable to buy the stone at any price, so we returned to the street, the proprietor closing the shop behind us."
	CRLF	
	CRLF	
	PRINT	TELL-NO-SALE
	JUMP	?CND44
?CCL49:	PRINTI	"Praxix abruptly motioned for us to leave, which we did. The only item of interest had been the gray stone, but Praxix had become highly suspicious of the shopkeeper."
	CRLF	
	CRLF	
	PRINT	TELL-NO-SALE
	JUMP	?CND44
?CCL46:	PRINTI	"Unsurprisingly, we found mostly worthless trinkets and handicrafts here. It was just as well, for the proprietor was in a hurry to close up, and he nervously hustled us out of the shop, locking the door behind us."
?CND44:	CALL2	MOVE-TO,ZAN-1
	RSTACK	


	.FUNCT	O-TRADE:ANY:0:0
	ICALL	FIND-OBJECTS,INVENTORY,NEVER-DROP
	RTRUE	


	.FUNCT	ANONF-338:ANY:0:0
	EQUAL?	PARTY-MODE,OPTION-MODE /FALSE
	IN?	TAVERN-OTHER-TABLE,HERE \FALSE
	ICALL2	UPDATE-REMOVE,TAVERN-OTHER-TABLE
	CRLF	
	CRLF	
	PRINTI	"Just then, the group at the other table rose and walked out of the tavern; peculiarly, three of the men huddled around the fourth, as if protecting him; from what, we could not imagine."
	RTRUE	


	.FUNCT	ANONF-339:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ICALL2	GRAPHIC,G-OTHER-TABLE
	PUTP	HERE,P?CAST-LIMIT,2
	ICALL	UPDATE-FCLEAR,HERE,DONT-CAST
	ICALL	QUEUE,T-O-T-LEAVES,6
	FSET	TAVERN-OTHER-TABLE,EXAMINED
	ICALL	UPDATE-FSET,HERE,ADVISE
	EQUAL?	ACTOR,HURTH \?CCL6
	PRINTI	"""One moment"
	JUMP	?CND4
?CCL6:	PRINTI	"""Shh!"
?CND4:	PRINTI	""" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, silencing one of my reminiscences of home. But what I took for uncharacteristic rudeness was nothing of the sort."
	CRLF	
	CRLF	
	PRINTI	"""Those men at the next table,"" he whispered, ""They talk of us!"""
	CRLF	
	CRLF	
	PRINTI	"""Come now,"" Bergon replied, a little too loudly, ""Why would they be interested in us?"" And as if to prove that there was nothing suspicious going on, he turned and stared at the men at the table. As one, they turned away and their conversation grew quieter. In the dim light of the tavern, it appeared that Bergon blushed."
	CRLF	
	CRLF	
	PRINTI	"""This is grave, indeed,"" Praxix said, voice lowered. ""They know us, yet they are no friends of ours."""
	RTRUE	


	.FUNCT	TAVERN-TALK:ANY:0:0,TMP,CNT
	GETP	HERE,P?TEMP >TMP
	CALL	MIN,TMP,3 >CNT
	ZERO?	CNT \?CCL3
	SET	'INN-TALK,TRUE-VALUE
	PRINTI	"The man farthest away was now speaking. ""...less concerned about what you desire than about our reward. This is not a barbarian land like the northern hinterlands, with all respect. If we get caught, there will be hell to pay."""
	JUMP	?CND1
?CCL3:	EQUAL?	CNT,1 \?CCL5
	PRINTI	"The man whose face I could not see spoke in a deep, rasping voice. An involuntary shudder ran down my spine."
	CRLF	
	CRLF	
	PRINTI	"""Hell to pay? What can you know of Hell?"" He had raised his voice, but now spoke more softly, in a hypnotic tone. ""Do as I ask; how you do it is not my concern. Have you checked the inn?"""
	JUMP	?CND1
?CCL5:	EQUAL?	CNT,2 \?CCL7
	PRINTI	"The man to my left replied. ""We have spoken to the innkeeper. I believe he will be reliable."" A long silence followed, and then the hidden man spoke again."
	CRLF	
	CRLF	
	PRINTI	"""And the waterfront?"" he asked, hissing. ""Is it arranged?"""
	CRLF	
	CRLF	
	PRINTI	"The reply came quickly. ""We have gone to the waterfront, and spoken to the captains of the ships in port..."""
	CRLF	
	CRLF	
	PRINTI	"It was at just this point that I started, slowly, to materialize. Rather than be observed, I hurried back to our table. "
	ZERO?	RED-ROCK-COUNT \?CCL10
	FSET	TAVERN-OTHER-TABLE,DEAD
	PRINTI	"But Praxix had no more of his invisibility spell, having used the last of the red rocks."
	CRLF	
	CRLF	
	PRINT	TAVERN-MATERIALIZE
	REMOVE	TAVERN-OTHER-TABLE
	EQUAL?	PARTY-MODE,OPTION-MODE \TRUE
	ICALL1	END-OPTION
	RTRUE	
?CCL10:	ICALL1	CAST-INVISIBLE
	PRINTI	"Fortunately, Praxix still had just enough of the red rock with which to cast another invisibility spell upon me. This done, I returned to the other table, ready to overhear the remainder of the conversation."
	JUMP	?CND1
?CCL7:	EQUAL?	CNT,3 \?CND1
	PRINTI	"The man at my left was still speaking, though I had missed some of what he had been saying. ""...easy, but we spoke to them all, except for the drunkard "
	PRINT	GOOD-CAPTAIN-NAME
	FSET	TAVERN-OTHER-TABLE,SOLVED
	PRINTI	", of course, but he hasn't been sober in over a week. Don't worry. If they leave by boat, I guarantee they will have an unpleasant voyage, to say the least."""
	CRLF	
	CRLF	
	PRINTI	"The hidden man had the final words. ""Succeed in your task,"" he said, ""and your reward will befit they who walk with kings. I must leave Zan at once, but I shall return in three days. I know I have chosen well here today."""
	REMOVE	TAVERN-OTHER-TABLE
	CRLF	
	CRLF	
	PRINTI	"And that ended the conversation. The men stood up and left the tavern in a group, and it seemed they protected the fourth man, the one whose face was hidden from me, making it impossible for me to get a closer look."
	CRLF	
	CRLF	
	PRINT	TAVERN-MATERIALIZE
	EQUAL?	PARTY-MODE,OPTION-MODE \?CND1
	ICALL1	END-OPTION
?CND1:	ADD	TMP,1
	PUTP	HERE,P?TEMP,STACK
	RTRUE	


	.FUNCT	ANONF-340:ANY:0:0
	ICALL1	RESTORE-TAG-COMMANDS
	ZERO?	DEMON-SEARCHING? /FALSE
	FSET?	TAVERN-OTHER-TABLE,SOLVED /FALSE
	CALL2	HINT,HINT-TAVERN
	RSTACK	


	.FUNCT	ANONF-341:ANY:0:0
	ZERO?	DEMON-SEARCHING? \?CCL3
	ICALL2	UPDATE-REMOVE,TAVERN-OTHER-TABLE
	JUMP	?CND1
?CCL3:	ICALL1	CHECK-FOREBODING
	FSET	HERE,SEEN
?CND1:	ICALL2	TRAVEL-COMMANDS,TAG
	PUTP	HERE,P?TEMP,MOVE-NUMBER
	RTRUE	


	.FUNCT	ANONF-342:ANY:0:0
	EQUAL?	ACTION,EAVESDROP-COMMAND \?CCL3
	CALL1	TAVERN-TALK
	RSTACK	
?CCL3:	EQUAL?	ACTION,RETURN-COMMAND \?CCL5
	PRINTI	"I had heard enough. "
	PRINT	TAVERN-MATERIALIZE
	ICALL2	GRAPHIC,G-ZAN-TAVERN
	CALL1	END-OPTION
	RSTACK	
?CCL5:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL7
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"""What do you think?"" Bergon asked, motioning toward the other table."
	CRLF	
	CRLF	
	PRINTI	"""I think we'd best stay clear of them,"" I responded, ""There is malice in their eyes - I fear to imagine what they are saying!"""
	RTRUE	
?CCL7:	EQUAL?	ACTION,CAST-COMMAND \?CCL9
	EQUAL?	ACTION-OBJECT,INVISIBLE-SPELL \?CCL9
	FSET?	TAVERN-OTHER-TABLE,EXAMINED \?CCL9
	IN?	TAVERN-OTHER-TABLE,HERE \?CCL9
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"""Are you thinking what I'm thinking?"" I said, turning to Praxix."
	CRLF	
	CRLF	
	PRINTI	"He was; in fact, he had already taken a red rock from his pack and powdered it, taking care to avoid spilling it on himself. Then, he stood up and, placing himself between me and the other table, spread the dust over me. In a moment, I had vanished, and it appears nobody noticed. Praxix nonchalantly took his seat, and I headed over to the neighboring table to find out what I could."
	CRLF	
	CRLF	
	PRINTI	"The group was in conversation; there were four men at the table; of these, there was only one whose face I could not see."
	CRLF	
	CRLF	
	ICALL1	CAST-INVISIBLE
	FSET	HERE,SOLVED
	GETP	HERE,P?TEMP
	SUB	MOVE-NUMBER,STACK
	SUB	STACK,2
	DIV	STACK,2
	PUTP	HERE,P?TEMP,STACK
	ICALL1	TAVERN-TALK
	GETP	HERE,P?TEMP
	GRTR?	STACK,3 /TRUE
	ICALL	OPTION,TAG,EAVESDROP-COMMAND,RETURN-COMMAND
	RTRUE	
?CCL9:	EQUAL?	ACTION,USE-MIX-COMMAND \?CCL17
	EQUAL?	MIXTURE,BEND-WILL-SPELL \?CCL17
	EQUAL?	ACTION-PRSI,WAITER,TAVERN-OTHER-TABLE \?CCL17
	EQUAL?	ACTION-PRSI,WAITER \?CCL23
	ICALL	UPDATE-FSET,WAITER,DONT-CAST
	PRINTI	"Discreetly, Praxix cast his mixture at a passing waiter. The waiter sniffled just a bit, then sneezed once and continued on his way toward the bar."
	CRLF	
	CRLF	
	PRINTI	"""You know, I'm getting a bit thirsty,"" Praxix said. ""A pint of ale would fit the bill nicely."""
	CRLF	
	CRLF	
	PRINTI	"Not a minute later, the waiter arrived, bearing a cold pint of ale for our Wizard-friend. Just as suddenly, he left, returning to the bar."
	CRLF	
	CRLF	
	PRINTI	"""Must be a mind-reader,"" Praxix said, sipping his drink."
	JUMP	?CND21
?CCL23:	PRINTI	"Praxix tried to cast his powders toward the other table, but they dropped harmlessly to the ground before reaching their intended target."
?CND21:	CALL1	MIXTURE-CAST
	RSTACK	
?CCL17:	EQUAL?	ACTION,CAST-COMMAND \?CCL25
	CALL1	PRAXIX-TOO-DANGEROUS-TO-CAST
	RSTACK	
?CCL25:	EQUAL?	ACTION,ORDER-MEAL-COMMAND \?CCL27
	ICALL1	REMOVE-TRAVEL-COMMAND
	FSET	HERE,SCOUTED
	PRINTI	"We were soon waited upon by a stout fellow with a cheery disposition. ""Can I bring you folks some dinner?"" he asked."
	CRLF	
	CRLF	
	PRINTI	"Assuring him that he could, we ordered some of the local seafood specialties with some draught beer. The meal arrived in short order, and we ate like starving men: quickly and noisily."
	RTRUE	
?CCL27:	EQUAL?	ACTION,EXIT-COMMAND \FALSE
	FSET?	HERE,SCOUTED \?CCL32
	PRINTI	"Our dinners finished"
	FSET?	HERE,SOLVED \?CCL35
	PRINTI	" and our heads full of worry from the ominous conversation I had overheard, we returned to the street. The men were gone without a trace"
	JUMP	?CND30
?CCL35:	FSET?	TAVERN-OTHER-TABLE,EXAMINED \?CCL37
	PRINTI	", we returned to the street. We were concerned about the men at the other table, but soon put it out of our minds"
	JUMP	?CND30
?CCL37:	PRINTI	", we returned to the street"
	JUMP	?CND30
?CCL32:	PRINTI	"We had not yet eaten, but "
	FSET?	HERE,SOLVED \?CCL40
	PRINTI	"the results of my eavesdropping"
	JUMP	?CND38
?CCL40:	FSET?	TAVERN-OTHER-TABLE,EXAMINED \?CCL42
	PRINTI	"our suspicions about the nearby table"
	JUMP	?CND38
?CCL42:	PRINTI	"but some ill-defined feeling"
?CND38:	PRINTI	" had caused us to lose our appetites. We rose from the table and returned to the street"
	FSET?	TAVERN-OTHER-TABLE,EXAMINED \?CND30
	IN?	TAVERN-OTHER-TABLE,HERE /?CND30
	PRINTI	". There was no sign of the men at the table, and this alarmed us even further"
?CND30:	PRINTC	46
	CRLF	
	CRLF	
	PRINTI	"It was now almost dark, though there was still some activity at the wharf."
	CALL2	MOVE-TO,ZAN-2
	RSTACK	


	.FUNCT	RESET-FOREBODING:ANY:0:0
	FSET?	FOREBODING-SPELL,ENCHANTED \FALSE
	CRLF	
	CRLF	
	PRINTI	"Checking again on Praxix' staff, I found that it had now stopped glowing altogether."
	FCLEAR	FOREBODING-SPELL,ENCHANTED
	RTRUE	


	.FUNCT	CHECK-FOREBODING:ANY:0:0
	FSET?	FOREBODING-SPELL,ENCHANTED \?CCL3
	FSET?	FOREBODING-SPELL,SEEN /?CCL3
	FSET	HERE,ENCHANTED
	FSET	FOREBODING-SPELL,SEEN
	CRLF	
	CRLF	
	PRINTI	"I don't know why, but at that very moment I glanced at Praxix' staff - it was now glowing with a dark red glow."
	CRLF	
	CRLF	
	PRINTI	"""Perhaps the mixture has made itself useful, after all,"" Praxix said, ""All that's left is to find out what it means!"""
	FSET?	ESHER,IN-PARTY \TRUE
	CRLF	
	CRLF	
	PRINTI	"""Is that all that's left?"" Esher asked, rolling his eyes skyward."
	CRLF	
	CRLF	
	PRINTI	"""I believe so,"" Praxix replied, ""In fact, I'm quite certain."""
	RTRUE	
?CCL3:	FSET?	FOREBODING-SPELL,ENCHANTED \?CCL9
	FSET	HERE,ENCHANTED
	CRLF	
	CRLF	
	PRINTI	"Looking down, I again noticed that Praxix' staff shone peculiarly, this time with a deep red glow."
	RTRUE	
?CCL9:	FSET?	HERE,ENCHANTED \FALSE
	CRLF	
	CRLF	
	PRINTI	"Unlike the last time we were here, Praxix' staff was not glowing a deep red."
	CRLF	
	CRLF	
	PRINTI	"""I'm beginning to believe the mixture I cast on the staff wears off after a length of time,"" Praxix said, mainly to himself."
	RTRUE	


	.FUNCT	ANONF-343:ANY:0:0
	FSET?	BEND-WILL-SPELL,TRAPPED \FALSE
	CALL	QSET?,BEND-WILL-SPELL,DEAD
	ZERO?	STACK \FALSE
	FSET?	ESHER,IN-PARTY \FALSE
	CRLF	
	CRLF	
	PRINTI	"Back outside, Praxix explained the odd happenings inside the inn."
	CRLF	
	CRLF	
	PRINTI	"""It would appear that the mixture was quite effective. You see, Esher had just made one of his typically insulting remarks, and I, not unnaturally, became angry. But what I was fantasizing, the innkeeper actually did! I have not heard of such a mind-controlling spell, but I cannot doubt its power."
	CRLF	
	CRLF	
	PRINTI	"We could not fault Esher for his lack of enthusiasm. ""I don't suppose there might have been another way to find this out?"" he asked."
	CRLF	
	CRLF	
	PRINTI	"""None that I am aware of,"" Praxix replied, with just the slightest hint of a smile."
	RTRUE	


	.FUNCT	ANONF-344:ANY:0:0
	FSET	HERE,SEEN
	CALL1	CHECK-FOREBODING
	RSTACK	


	.FUNCT	ANONF-345:ANY:0:0
	EQUAL?	ACTION,ACCEPT-COMMAND \?CCL3
	PRINTI	"""No, we've been travelling long enough that even doubling up is something of a luxury,"" Bergon replied. ""Two rooms, just for tonight."""
	CRLF	
	CRLF	
	PRINTI	"The rooms were inexpensive enough, and we paid in advance, expecting to leave early the next morning. The innkeeper gave us our keys, and told us how to find our rooms. ""Have a pleasant night. Rest easy,"" he said."
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,CHECK-IN-COMMAND,TO-ROOM-COMMAND
	FSET	HERE,SCOUTED
	CALL1	END-OPTION
	RSTACK	
?CCL3:	EQUAL?	ACTION,USE-MIX-COMMAND \?CCL5
	EQUAL?	ACTION-OBJECT,INNKEEPER \?CCL5
	EQUAL?	MIXTURE,BEND-WILL-SPELL \?CCL5
	REMOVE	HYE-INNKEEPER
	PRINTI	"Praxix cast his mixture at the innkeeper, who merely sniffled a few times at first. Then his eyes turned red and he stared blankly, as if in a trance."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CND9
	PRINTI	"""Praxix, you've outdone yourself this time,"" Esher said, ""I don't believe I've ever seen an allergy spell before!"""
	CRLF	
	CRLF	
	PRINTI	"""I'd like to bust him one,"" or words to that effect were going through Praxix' mind when the most peculiar thing happened. The innkeeper, still entranced, walked from behind his counter and slugged poor Esher in the jaw, knocking him down. Then, calmly, he returned to the counter."
	CRLF	
	CRLF	
	FSET	BEND-WILL-SPELL,TRAPPED
?CND9:	PRINTI	"A moment later, the innkeeper recovered. ""As I was saying,"" he began, then stopped. ""What was I saying?"""
	FSET?	ESHER,IN-PARTY \?CND11
	CRLF	
	CRLF	
	PRINTI	"About this time, Esher was getting back to his feet, preparing to counterattack. Praxix held him back. ""I'll explain later,"" he said."
?CND11:	CALL1	MIXTURE-CAST
	RSTACK	
?CCL5:	EQUAL?	ACTION,DECLINE-COMMAND \?CCL14
	PRINTI	"""No, thank you,"" replied Bergon, ""We'll just rough it, I suppose. Good night to you."""
	FSET?	WHARF,SOLVED \?CND15
	ICALL	REMOVE-TRAVEL-COMMAND,ZAN-2,INN-COMMAND
?CND15:	ICALL2	MOVE-TO,ZAN-2
	CALL1	END-OPTION
	RSTACK	
?CCL14:	EQUAL?	ACTION,CHECK-IN-COMMAND \?CCL18
	PRINTI	"""We would like rooms for the night,"" Bergon said."
	CRLF	
	CRLF	
	PRINTI	"The innkeeper was happy to oblige, but there was a slight hitch. ""I've only got two rooms,"" he said. ""You'll have to double up, I reckon, or camp out!"""
	CALL	OPTION,LEADER,ACCEPT-COMMAND,DECLINE-COMMAND
	RSTACK	
?CCL18:	EQUAL?	ACTION,TO-ROOM-COMMAND \?CCL20
	ZERO?	CHOSEN-BOAT \?CND21
	PRINT	HAVENT-CHOSEN-BOAT
	ICALL2	REMOVE-PARTY-COMMAND,TO-ROOM-COMMAND
	RTRUE	
?CND21:	PRINTI	"Our rooms were not together; Praxix and I took one, and "
	EQUAL?	PARTY-MAX,3 \?CCL25
	PRINTI	"Bergon"
	JUMP	?CND23
?CCL25:	PRINTI	"the others"
?CND23:	PRINTI	" took the second. It had been a strenuous day, and a long time since we had slept in a real bed. And so we fell off into a deep and dreamless sleep."
	CRLF	
	CRLF	
	ZERO?	DEMON-SEARCHING? /?CCL28
	ICALL2	HINT,HINT-INN
	SET	'DEMON-SEARCHING?,FALSE-VALUE
	PRINTI	"But our slumber turned to horror, as we were awakened by shouting and screaming. ""Fire! Awake!"" came the cries. Outside our door, the corridor was consumed in smoke and flame, and we had barely enough time to escape through our window as the acrid fumes filled our lungs."
	CRLF	
	CRLF	
	PRINTI	"Back at the street, we waited for the others to escape the inferno. Before long, Bergon ran from the inn, filled with despair. """
	ICALL2	WPRINTD,ZAN-VICTIM
	PRINTI	"'s been trapped inside!"" he shouted. Praxix and I started to run toward the building, but were held back. ""It's too late!"" he said, now holding back tears. """
	ICALL2	WPRINTD,ZAN-VICTIM
	PRINTI	" is dead."""
	CRLF	
	CRLF	
	PRINTI	"The eastern sky glowed a fiery orange, as with heavy hearts we made our way back to the wharf and boarded the "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTC	46
	ICALL2	PARTY-REMOVE,ZAN-VICTIM
	JUMP	?CND26
?CCL28:	PRINTI	"We awoke the next morning before dawn and quickly checked ourselves out of the inn. Soon we had reached the wharf and boarded the "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTC	46
?CND26:	CALL2	MOVE-TO,BOAT
	RSTACK	
?CCL20:	EQUAL?	ACTION,EXIT-COMMAND \FALSE
	FSET?	HERE,SCOUTED \?CCL33
	CALL	QSET?,HERE,BLACK-MIX
	ZERO?	STACK \?CCL33
	PRINTI	"Keys in hand, we started for the door. ""We shall return later,"" Bergon said."
	CRLF	
	CRLF	
	PRINTI	"""We're open all night,"" was the reply, and, thanking the man again, we returned to the street."
	JUMP	?CND31
?CCL33:	FSET?	HERE,SCOUTED \?CCL37
	PRINTI	"Once again, we headed back toward the street. ""Make up your minds,"" the innkeeper shouted after us."
	JUMP	?CND31
?CCL37:	PRINTI	"""We may be needing rooms,"" Bergon said to the innkeeper, ""We shall return before long if we do. Thank you."""
	CRLF	
	CRLF	
	PRINTI	"""We've only a few rooms left; don't spend all night thinking about it!"" the innkeeper replied with a mischievous giggle."
?CND31:	CALL2	MOVE-TO,ZAN-2
	RSTACK	


	.FUNCT	ANONF-346:ANY:0:0
	EQUAL?	ACTION,CALL-SHERIFF-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"We called for the sheriff, but he just yelled back at us, ""I'm trying to get some sleep! You know, I'm not only the sheriff around here, but the judge as well, and I can tell you I'm one ornery fellow when I get too little sleep!"""
	RTRUE	
?CCL3:	EQUAL?	ACTION,ESCAPE-COMMAND \?CCL5
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Escape from this cell was unlikely, if not impossible, but the thought filled our minds."
	RTRUE	
?CCL5:	EQUAL?	ACTION,WAIT-COMMAND \?CCL7
	CALL1	DO-JAIL-WAIT
	RSTACK	
?CCL7:	EQUAL?	ACTION,MIX-COMMAND,CAST-COMMAND \?CCL9
	IN?	SHERIFF,HERE \?CCL9
	PRINTI	"Praxix took out his pouch of magical powders, but could not hide that fact from the sheriff. ""Here, I'll have those!"" he said, and demanded the powders from Praxix, who had little choice but to comply."
	CRLF	
	CRLF	
	PRINTI	"""What do you know?"" the sheriff said, spitting on the ground, ""We've got ourselves a Wizard in jail!"" Laughing, he returned to his office."
	CRLF	
	CRLF	
	CALL1	DO-JAIL-WAIT
	RSTACK	
?CCL9:	EQUAL?	ACTION,USE-MIX-COMMAND \?CCL13
	EQUAL?	ACTION-OBJECT,SHERIFF \?CCL13
	EQUAL?	MIXTURE,BEND-WILL-SPELL \?CCL13
	PRINTI	"And then, Praxix cast the mixture at the sheriff. At first, he grabbed for his sword; then, it appeared he would sneeze; finally, his eyes glazed over, and he took on a trance-like expression."
	CRLF	
	CRLF	
	FSET?	BEND-WILL-SPELL,TRAPPED \?CCL19
	PRINTI	"Praxix, meanwhile, concentrated on having the cell door opened. And"
	JUMP	?CND17
?CCL19:	FSET	BEND-WILL-SPELL,TRAPPED
	PRINTI	"Praxix, meanwhile, was uncertain of just what the spell would do. ""We need to get out of this cell!"" he reminded himself, and just"
?CND17:	PRINTI	" then, the sheriff unlocked the cell door and motioned us outside."
	CRLF	
	CRLF	
	PRINTI	"I waved my hand before the sheriff's eyes, but he did not blink. ""Potent stuff,"" I said, ""Reminds me of the winner of last year's ale drinking contest."""
	CRLF	
	CRLF	
	ICALL	REMOVE-ALL,JAIL-STORAGE,INVENTORY
	PRINTI	"Taking our things, we quietly left the sheriff's office. The nearby streets were deserted, the fire having been brought under control sometime earlier. It took but a few minutes to reach the wharf and we were soon on board the "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTC	46
	ICALL1	MIXTURE-CAST
	CALL2	MOVE-TO,BOAT
	RSTACK	
?CCL13:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,TREMOR-SPELL,WIND-SPELL,FAR-VISION-SPELL \?CCL24
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,CALL-SHERIFF-COMMAND
	PRINTI	"If it was Praxix' goal to get the sheriff's attention, he certainly did so by casting the """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell. But the pace of the sheriff's life was not appreciably quickened, and it was quite a while later that he finally arrived; he did not seem pleased."
	CRLF	
	CRLF	
	PRINTI	"""What's going on here?"" he boomed."
	ICALL	GRAPHIC,FALSE-VALUE,G-SHERIFF,BOTTOM-RIGHT
	FSET?	TAG,TRAPPED \?CND25
	FCLEAR	TAG,TRAPPED
	CRLF	
	CRLF	
	PRINTI	"Well, you can imagine the sheriff's surprise when I started to materialize with my fingers grasping for the key chain on his belt. I braced for the worst, but it never came. Rather, the sheriff started to chuckle."
	CRLF	
	CRLF	
	PRINTI	"""Hell,"" he said, ""there's one I haven't seen before. Now you boys keep out of trouble or things will be a lot worse for you than they already are."""
	CRLF	
	CRLF	
	PRINTI	"And with that, he sauntered back to his desk, presumably for another snooze. I slinked into the far corner of the cell where the dark shadows concealed the redness on my face."
	RTRUE	
?CND25:	ICALL	QUEUE,SHERIFF-LEAVES,3
	CALL	UPDATE-MOVE,SHERIFF,HERE
	RSTACK	
?CCL24:	EQUAL?	ACTION-OBJECT,INVISIBLE-SPELL \?CCL28
	ICALL2	UPDATE-REMOVE,INVISIBLE-SPELL
	REMOVE	HYE-JAIL
	PRINTI	"Hope fading, I suggested that we use our remaining piece of red rock to make one of our party invisible. Praxix was intrigued by the idea, and consented to casting the spell. I was nominated to become invisible, and the task was soon accomplished."
	FSET	TAG,TRAPPED
	CALL	QUEUE,TAG-BECOMES-VISIBLE,2
	RSTACK	
?CCL28:	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \FALSE
	FSET	LIGHTNING-SPELL,SEEN
	PRINTI	"When Praxix suggested using his Lightning spell, we talked him out of it."
	CRLF	
	CRLF	
	PRINTI	"""It is a small cell,"" Bergon noted, ""and I'm not certain I care to find out how accurate you are!"""
	CRLF	
	CRLF	
	PRINTI	"""Nor I,"" replied Praxix, ""Perhaps there is another spell that would be less dangerous."""
	RTRUE	


	.FUNCT	ANONF-347:ANY:0:0
	FSET?	TAG,TRAPPED \FALSE
	FCLEAR	TAG,TRAPPED
	CRLF	
	CRLF	
	PRINTI	"It was then that I materialized, having failed to turn my invisibility to our advantage."
	CRLF	
	CRLF	
	PRINTI	"""Don't be cross with yourself,"" Praxix said reassuringly, ""It was worth a try; perhaps there is something else we can do."""
	CRLF	
	CRLF	
	PRINTI	"If there was, we had precious little time to think of it."
	RTRUE	


	.FUNCT	DO-JAIL-WAIT:ANY:0:0
	ICALL2	HINT,HINT-JAIL
	PRINTI	"There was nothing to do here but wait. A court convened later in the day, and we were convicted of burning down the old inn"
	FSET?	GRAY-STONE,INCAPACITATED \?CND1
	PRINTI	", as well as of assault and theft"
?CND1:	PRINTI	". I suppose it could have gone far worse for us, for after the public flogging they took our possessions and deposited us outside of town with a warning that we would best not be seen again."
	CRLF	
	CRLF	
	PRINTI	"Dispirited, we returned to Astrix, who was despondent at the outcome of our venture into Zan."
	CRLF	
	CRLF	
	CALL2	PART-ONE-BAD-ENDING,TRUE-VALUE
	RSTACK	


	.FUNCT	ANONF-348:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"The sheriff had a pleasant enough face, and he didn't seem particularly evil or dangerous. But his look was determined, and he was entirely convinced of our guilt. After all, hadn't we checked into the inn, then hidden outside of town, returning only after the deed had been done?"
	CRLF	
	CRLF	
	PRINTI	"""I don't believe he's going to let us out of here,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said in a whisper."
	CRLF	
	CRLF	
	PRINTI	"""Perhaps not,"" Praxix replied obtusely, ""but it is always possible that he will have a change of heart."""
	RTRUE	


	.FUNCT	ANONF-349:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	", restless, walked to the window and pulled on the heavy iron bars; then, he walked back to the cell door, examined it, and quickly reached the conclusion that escape would be nearly impossible. Our possessions having been taken from us, there was little we could do but wait."
	CRLF	
	CRLF	
	PRINTI	"""If we only had our things,"" Bergon said"
	IN?	SHERIFF,HERE \?CND4
	PRINTI	" quietly"
?CND4:	PRINTI	", ""we might have some chance of escape."""
	FSET?	GRAY-STONE,INCAPACITATED /TRUE
	CRLF	
	CRLF	
	PRINTI	"""I have some of my things,"" Praxix "
	IN?	SHERIFF,HERE \?CCL10
	PRINTI	"whispered, discretely indicating the pouch of powders hidden beneath his cloak."
	RTRUE	
?CCL10:	PRINTI	"replied, removing his pouch of magical powders, ""It is a good thing the sheriff does not fear old men."""
	RTRUE	


	.FUNCT	ANONF-350:ANY:0:0
	EQUAL?	HERE,JAIL \FALSE
	ICALL2	UPDATE-REMOVE,SHERIFF
	SET	'CURRENT-GRAPHIC,FALSE-VALUE
	ICALL2	GRAPHIC,G-JAIL
	CRLF	
	CRLF	
	PRINTI	"""I'm going back to sleep now; you boys do yourselves a favor and don't be waking me up!"" And with that, he returned to his office and the snoring followed closely upon his departure."
	RTRUE	

	.ENDSEG

	.ENDI
