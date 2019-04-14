
	.SEGMENT "BOAT"


	.FUNCT	ANONF-359:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Far off, near the southern horizon, we could see the Twin Isles of Estril and Lethor. Between them, the sea itself grew dim and lost definition."
	CRLF	
	CRLF	
	PRINTI	"""What do you make of that?"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" asked one of the crewmen working nearby."
	CRLF	
	CRLF	
	PRINTI	"""Why, that's the Misty Isle,"" he responded, surprised that this was not common knowledge. ""Sorry's the man that loses his way and enters those sinister seas."""
	RTRUE	


	.FUNCT	ANONF-360:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Praxix, having never been to sea, was fascinated by the crew of the "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTI	". There were perhaps half a dozen of them, and each was busily addressing himself to the various tasks and chores of the seafaring life."
	RTRUE	


	.FUNCT	ANONF-361:ANY:0:0
	EQUAL?	ACTION,USE-MIX-COMMAND \FALSE
	EQUAL?	MIXTURE,BEND-WILL-SPELL \FALSE
	EQUAL?	CHOSEN-BOAT,SOUTH-SEAS \?CCL8
	PRINTI	"I am certain now that Praxix "
	FSET?	BEND-WILL-SPELL,TRAPPED \?CCL11
	PRINTI	"sensed the treachery that lurked within the captain, for he cast the will bending spell at him. But Praxix was grappling with a will more powerful than his own - the will of the "
	PRINT	BAD-GUY
	PRINTI	" himself. It was a losing battle - Praxix'"
	JUMP	?CND9
?CCL11:	PRINTI	"did not anticipate the effect of the mixture he cast upon the captain. At first, nothing happened, but soon Praxix'"
?CND9:	PRINTI	" body soon began to writhe, and he clutched at his head as if to keep it from splitting apart. And then, with a horrible scream, he fell to the ground in a heap. I said nothing of this to the others, so overcome was I with fear."
	CRLF	
	CRLF	
	FSET	STORMY-SEAS,TRAPPED
	CALL2	MOVE-TO,STORMY-SEAS
	RSTACK	
?CCL8:	PRINTI	"Perhaps Praxix was bored, but he decided to cast one of his mixtures at the captain. Happily, the captain didn't complain about the cloud of dust that had been thrown in his face, though he did cough and sneeze a bit for a while afterwards. As for the mixture itself, it seemed to have no useful effect."
	RTRUE	


	.FUNCT	ANONF-362:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Above us and to the south, the sky was a brilliant blue. But a fast-moving storm was approaching rapidly from the north. Every so often, bolts of lightning danced among the clouds."
	CRLF	
	CRLF	
	PRINTI	"""Looks like rain,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, in what turned out to be one of the great understatements of our journey."
	RTRUE	


	.FUNCT	ANONF-363:ANY:0:0
	ICALL2	SAVE-SPELL,FIRE-SPELL
	ICALL2	SAVE-SPELL,TREMOR-SPELL
	CRLF	
	CRLF	
	PRINTI	"We were welcomed aboard by Captain "
	ICALL1	TELL-CAPTAIN
	PRINTI	", who"
	ZERO?	CAPTAIN \?CND1
	PRINTI	", surprisingly sober,"
?CND1:	PRINTI	" informed us that the ship was ready to sail. It was nearly an hour before the sails were raised and we were underway, but a favoring wind carried us swiftly to the south. Soon, the faint outline of the Twin Isles appeared at the horizon."
	EQUAL?	CHOSEN-BOAT,SOUTH-SEAS \FALSE
	FSET	HERE,FORBIDDING
	CALL1	CHECK-FOREBODING
	RSTACK	


	.FUNCT	ANONF-364:ANY:0:0
	EQUAL?	ACTION,RELAX-COMMAND \?CCL3
	CALL2	MOVE-TO,STORMY-SEAS
	RSTACK	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL5
	EQUAL?	ACTION-OBJECT,WIND-SPELL \?CCL8
	REMOVE	HYE-BOAT
	PRINTI	"Praxix, feeling himself a captive, sought to amuse himself by casting his wind spell. It was lucky that he used only a small amount of air essence, for the resulting gale nearly capsized our craft, causing great concern from the captain and crew."
	CRLF	
	CRLF	
	PRINTI	"""Promise you won't tell!"" Praxix said, seeing that I had observed the whole thing."
	RTRUE	
?CCL8:	EQUAL?	ACTION-OBJECT,RAIN-SPELL /?CTR9
	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?CCL10
?CTR9:	REMOVE	HYE-VOYAGE
	ICALL1	UNUSE-ESSENCES
	PRINTI	"Later, Praxix confided in me that he had considered casting the """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell, but one look at the approaching clouds convinced him that he could add nothing to what nature had in store."
	RTRUE	
?CCL10:	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \FALSE
	REMOVE	HYE-BOAT
	PRINTI	"Bored to distraction by this ocean voyage, Praxix decided to get a better look around, and cast his elevation spell on himself. Fifty feet above decks, he gazed out toward the Twin Isles, much to the surprise of the captain and crew, who had never seen such a magical display before."
	CRLF	
	CRLF	
	PRINTI	"""Do you think it wise to flaunt your powers, Praxix?"" Bergon asked, irritated at the Wizard's display."
	CRLF	
	CRLF	
	PRINTI	"""I suppose you are right,"" Praxix replied, ""but being at sea makes me rather nervous."""
	RTRUE	
?CCL5:	EQUAL?	ACTION,SCOUT-COMMAND \FALSE
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL	MAKE-BUSY,ACTOR,GONE-COMMAND
	ICALL2	WPRINTD,ACTOR
	PRINTI	" then went off to explore the boat; in fact, there was little else to do."
	RTRUE	


	.FUNCT	ANONF-365:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"The boat was badly damaged by the storm; the mizzenmast had collapsed and fallen into the ocean; the main mast still stood, though it was heavily weakened and nearly ready to collapse under its own weight. The main sail, though torn, was serviceable, but the rudder had been destroyed, making steering all but impossible."
	CRLF	
	CRLF	
	PRINTI	"""What a mess,"" said "
	ICALL2	WPRINTD,ACTOR
	PRINTI	", who had not yet recovered from the shock."
	CRLF	
	CRLF	
	PRINTI	"""What are we to do?"" I asked, ""Not only the air is still, but - see here - the ocean itself is perfectly still and glassy. I think I understand why it is that people never return from this place."""
	RTRUE	


	.FUNCT	ANONF-366:ANY:0:0
	CALL2	CHECK-ESSENCES,WIND-SPELL
	ZERO?	STACK \FALSE
	CRLF	
	CRLF	
	PRINTI	"The boat floated in the unrelenting mist for many days, without even a hint of movement. Praxix, sadly, could do nothing, having run entirely out of air essence. But then, on the third day at sea, another storm rose up and tossed the boat violently, flinging it into a submerged reef."
	CALL2	ILL-WIND,TRUE-VALUE
	RSTACK	


	.FUNCT	ANONF-367:ANY:0:0
	EQUAL?	ACTION,CLIMB-MAST-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	ZERO?	TRIED-CASTING-WIND? /?CCL6
	PRINTI	"I tried to locate the Misty Isle"
	JUMP	?CND4
?CCL6:	PRINTI	"I tried to gain some view of our situation"
?CND4:	PRINTI	" by climbing the mast, but it shook so badly as I clambered up that I became frightened and returned to the deck."
	CRLF	
	CRLF	
	PRINTI	"""A wise decision,"" Praxix said, ""You will do us no good by falling from the mast."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL8
	CALL1	ILL-WIND
	RSTACK	
?CCL8:	EQUAL?	ACTION,STOP-COMMAND \?CCL10
	PRINTI	"Thinking it better to hold off for the moment, Praxix put his air essence away and considered what to do next."
	CALL1	END-OPTION
	RSTACK	
?CCL10:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL15
	PRINTI	"It was reasonable to give Praxix' flare spell a try, but his fireball was enveloped by the gloom almost as it left his fingertips."
	RTRUE	
?CCL15:	EQUAL?	ACTION-OBJECT,WIND-SPELL \?CCL17
	ZERO?	SPOTTED-ISLAND? /?CCL20
	PRINTI	"Using my fix on the island as a reference, Praxix cast his wind spell into the air. The wind blew fiercely, as the "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTI	" made its way through the fog. It was only minutes later when we escaped the fog; an island was ahead..."
	CRLF	
	CRLF	
	PRINTI	"""The Misty Isle,"" said Praxix, ""And, wouldn't you know it - it's not even misty!"""
	CRLF	
	CRLF	
	ZERO?	DEMON-SEARCHING? /?CCL23
	CALL1	DEMON-TELL
	RSTACK	
?CCL23:	CALL1	ISLAND-ENDING
	RSTACK	
?CCL20:	ZERO?	TRIED-CASTING-WIND? /?CCL25
	REMOVE	HYE-MIST
	CALL1	ILL-WIND
	RSTACK	
?CCL25:	SET	'TRIED-CASTING-WIND?,TRUE-VALUE
	PRINTI	"Praxix started to remove the air essence from his pouch, but was struck with a dilemma."
	CRLF	
	CRLF	
	PRINTI	"""From which direction shall the wind blow?"" he asked me, not expecting an answer."
	CRLF	
	CRLF	
	PRINTI	"I answered anyway, trying to make light of our desperate situation. ""Onshore,"" I said."
	CALL	OPTION,PRAXIX,PROCEED-COMMAND,STOP-COMMAND
	RSTACK	
?CCL17:	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \FALSE
	ZERO?	SPOTTED-ISLAND? \FALSE
	SET	'SPOTTED-ISLAND?,TRUE-VALUE
	PRINTI	"Praxix whipped up a large batch of his elevation spell and cast it at me. I had risen only a few dozen feet before I lost sight of the deck, and then I climbed a while longer, terrified by the gray nothingness that surrounded me. And then, I cleared the mist and was suspended in the clear afternoon air. Before me, an island stood, basking in the warmth of a cloudless sky."
	CRLF	
	CRLF	
	PRINTI	"Slowly, I descended to the deck, indicating to Praxix in which direction the island lay."
	CRLF	
	CRLF	
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,CLIMB-MAST-COMMAND
	PRINTI	"""Well, well,"" he said, ""We may survive this voyage after all!"""
	RTRUE	


	.FUNCT	ILL-WIND:ANY:0:1,STUCK?
	ZERO?	STUCK? \?CCL3
	ICALL2	HINT,HINT-REEF
	PRINTI	"""Ah, well,"" Praxix said, finishing the preparation of his wind spell, ""it can't be any worse than sitting here!"""
	CRLF	
	CRLF	
	PRINTI	"But he was wrong - it could be far worse. He flung the powder into the air, and a gale blew. For a time we sailed smoothly, but then, suddenly, we ran aground on a submerged reef."
	JUMP	?CND1
?CCL3:	ICALL2	HINT,HINT-REEF-STUCK
?CND1:	PRINTI	" The "
	ICALL2	WPRINTD,CHOSEN-BOAT
	PRINTI	" listed, then capsized, and I lost track of the others in the mist."
	CRLF	
	CRLF	
	PRINTI	"But it was my good fortune to have been saved by the boat's main mast."
	PRINT	WAVE-SAVE
	CALL1	BAD-ENDING
	RSTACK	


	.FUNCT	TELL-STORM:ANY:0:0
	FSET?	STORMY-SEAS,TRAPPED /?CND1
	PRINTI	"And so we settled in; Bergon with the captain, the rest of us exploring one part of the ship or another. "
?CND1:	PRINTI	"The sky had now darkened, and though it was barely noon, it could as well have been twilight. The storm was nearly upon us, and the sound of thunder, once distant, now rumbled overhead."
	CRLF	
	CRLF	
	EQUAL?	CHOSEN-BOAT,SOUTH-SEAS,ELFENTIDE \?CCL5
	ICALL2	GRAPHIC,G-TREACHERY
	PRINTI	"And then, disaster struck; the crew, on the command of the captain, drew their weapons and attacked our party, catching us entirely by surprise. As I watched in abject horror, Bergon was butchered by a pair of crewmen using battle axes and bludgeons."
	FSET?	STORMY-SEAS,TRAPPED /?CND6
	PRINTI	" Praxix was soon cornered and his throat slit by another pair of assassins."
?CND6:	GRTR?	PARTY-MAX,3 \?CND8
	PRINTI	" As for the others, I cannot but think they met a similar fate."
?CND8:	CRLF	
	CRLF	
	PRINTI	"That I was saved is a strange twist of fate, for the storm unleashed its violence upon the ship just as I had run into a dead-end in a frantic attempt to escape my pursuers. And just as all hope faded, a stroke of lightning shattered the main mast, which in its fall killed my assailants and cast me into the churning sea."
	CRLF	
	CRLF	
	PRINTI	"I soon lost sight of the boat, but again its main mast saved my life."
	ICALL2	HINT,HINT-SOUTH-SEAS
	PRINT	WAVE-SAVE
	CALL1	BAD-ENDING
	RSTACK	
?CCL5:	ICALL2	GRAPHIC,G-MAST-FALLS
	PRINTI	"The seas became rough, and soon the rains fell, but "
	ICALL1	TELL-CAPTAIN
	PRINTI	" chose to continue onward."
	CRLF	
	CRLF	
	PRINTI	"The air took on a pungent smell as lightning lit up the now darkened sky. Crewmen cowered as the sky thundered around us."
	CRLF	
	CRLF	
	PRINTI	"""Be stout, men,"" shouted the captain, as he implored his men to lower the sails. But it was too late! A stroke of lightning shattered the mizzenmast, which in its fall headed directly at Bergon, still standing standing at the wheelhouse with the captain."
	CRLF	
	CRLF	
	PRINTI	"But "
	PRINT	GOOD-CAPTAIN-NAME
	PRINTI	", ignoring the danger to himself, pushed Bergon out of harm's way, saving his life. The captain himself was knocked overboard, and seeing the destruction around them, the crew abandoned ship, leaving only the "
	GET	INT-STR,PARTY-MAX
	PRINT	STACK
	PRINTI	" of us aboard."
	CRLF	
	CRLF	
	PRINTI	"It was hours later that the storm abated, but we rode it out without harm. The darkness lifted as we approached a thick wall of fog; though we felt no wind, yet we were drawn inexorably toward it. All too suddenly, the mist enveloped us and an eerie silence settled over the boat."
	CRLF	
	CRLF	
	PRINTI	"""The sea has borne us into the mist,"" Praxix said, staring into the shimmering gloom. ""The Misty Isle is near at hand!"""
	ICALL2	GRAPHIC,G-BOAT-FOG
	CALL	ADD-TRAVEL-COMMAND,HERE,CLIMB-MAST-COMMAND
	RSTACK	


	.FUNCT	TELL-CAPTAIN:ANY:0:0
	ZERO?	CAPTAIN /?CCL3
	PRINT	CAPTAIN
	RTRUE	
?CCL3:	PRINT	GOOD-CAPTAIN-NAME
	RTRUE	


	.FUNCT	ANONF-368:ANY:0:0
	EQUAL?	ACTION,PICK-UP-COMMAND \FALSE
	ICALL	UPDATE-FSET,PRAXIX-POUCH,DONT-TAKE
	SET	'TAG-HOLDING-POUCH,TRUE-VALUE
	ICALL	TRAVEL-COMMANDS,TAG,MIX-COMMAND
	PRINTI	"Lying beside Praxix was his pouch of magical powders, and, as discreetly as I could, I picked them up. Inside the pouch were a number of smaller bags. Of these, only the reagents were simple to recognize. But the others numbered "
	GET	INT-STR,NUM-POWDERS
	PRINT	STACK
	PRINTI	", not four as I had expected. Each of these bags held a powder, and these powders were of different colors and consistencies."
	CRLF	
	CRLF	
	PRINTI	"I tried to think what Praxix would do, what he was trying to do, when he was struck down by this messenger of evil. "
	FSET?	LIGHTNING-SPELL,SEEN \?CND4
	PRINTI	"And then it occurred to me: lightning, which"
?CND4:	FSET?	LIGHTNING-SPELL,SEEN /?CCL8
	PRINTI	"I thought about the various spells that Praxix had cast during our journey, but none seemed powerful enough. Perhaps Praxix had a spell to call forth a bolt of lightning, but even so, I had no idea of which combination of essences would produce it?"
	RTRUE	
?CCL8:	FSET?	LIGHTNING-SPELL,INCAPACITATED \?CCL10
	PRINTI	", I remembered, was a mixture of fire and water essences, with just a pinch of earth essence. The only problem was: which essence was which?"
	RTRUE	
?CCL10:	PRINTI	" I suspected would be the combination of fire and water essences. The only problem was: which essence was which?"
	FSET?	TALE-MAGIC,SEEN \TRUE
	PRINTI	" And was there a third essence involved, as Praxix said was sometimes the case?"
	RTRUE	


	.FUNCT	ANONF-369:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \?CND1
	EQUAL?	ACTION-OBJECT,PRAXIX-OBJECT /TRUE
?CND1:	INC	'DEMON-COUNT
	CRLF	
	CRLF	
	ZERO?	DEMON-COUNT \?CCL7
	PRINTI	"""We know who you are, and we know what you seek,"" the demon continued, ""but you will be needing a lesson in manners."""
	RTRUE	
?CCL7:	EQUAL?	DEMON-COUNT,1 \?CCL9
	PRINTI	"""Let me see,"" the demon went on, ""Who, do you suppose, should receive this lesson?"""
	RTRUE	
?CCL9:	EQUAL?	DEMON-COUNT,2 \?CCL11
	CALL	FIRST-IN-PARTY,HURTH,ESHER,MINAR,BERGON >DEMON-VICTIM
	PRINTI	"""Praxix will not do,"" the demon spat, ""I would not like to be accused of destroying one so defenseless. No, I believe the honor should go to "
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	"."""
	RTRUE	
?CCL11:	EQUAL?	DEMON-COUNT,3 \?CCL13
	PRINTC	34
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	", rise!"" the demon ordered, and, face contorted hideously, the demon's victim stood and approached the foul monster."
	RTRUE	
?CCL13:	ICALL2	PARTY-REMOVE,DEMON-VICTIM
	PRINTI	"And then, the demon stretched out his arm, hand open, at "
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	" and, as he slowly closed his hand, it seemed that "
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	" was being squeezed mercilessly; he screamed in agony as he demon's fist closed ever tighter. Moments later, he was dead, crushed by this awful monster."
	CRLF	
	CRLF	
	PRINTI	"""The same fate, or worse, awaits all those who seek to defy the "
	PRINT	BAD-GUY
	PRINTI	". This is but a taste of what is to follow."" Then, he swung his arm to his side and opened his clenched fist; "
	ICALL2	WPRINTD,DEMON-VICTIM
	PRINTI	"'s body was flung from the boat and into the ocean waters."
	CRLF	
	CRLF	
	PRINTI	"Mounting the awful creature that had borne him here, he flew off into the distant north."
	ZERO?	TAG-HOLDING-POUCH \?CND14
	ICALL2	HINT,HINT-POUCH
?CND14:	CALL1	END-DEMON
	RSTACK	


	.FUNCT	DEMON-TELL:ANY:0:0
	ICALL2	GRAPHIC,G-DEMON
	ICALL	QUEUE,DEMON-DEMON,-1
	PUTP	STORMY-SEAS,P?CLOCK,FALSE-VALUE
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,CLIMB-MAST-COMMAND
	ICALL	UPDATE-MOVE,PRAXIX-OBJECT,HERE
	ICALL	UPDATE-FSET,STORMY-SEAS-BOAT,DONT-EXAMINE
	PRINTI	"We were drifting on the waves, moving ever closer to the Misty Isle, when a dark shadow passed over the boat. Black as the darkest caverns, it hovered, formless, in the sky above us. And then, with a terrifying scream, it dove down upon us, landing on the prow of the boat."
	CRLF	
	CRLF	
	PRINT	DEMON-DESC
	FSET?	ZAN-TAVERN,SEEN \?CND1
	PRINTI	" And then, I remembered: this was the man we had seen at the tavern; the one who had arranged for our deaths!"
?CND1:	CRLF	
	CRLF	
	PRINTI	"""At last I have found you,"" he said, scornfully. ""The invincible Five, who have united the Six Stones! A ragtag gang of carpenters, cooks, and charlatans. Oh, and a Dwarf, that most despicable of races! You are clever to have eluded my associates in Zan. But, as you shall soon learn, my arm grows longer with each passing hour and there are none alive who can escape my judgement."""
	CRLF	
	CRLF	
	PRINTI	"Praxix, meanwhile, was hurriedly removing his pouch of magical essences in the hopes of foiling this demon of darkness."
	CRLF	
	CRLF	
	PRINTI	"""Fool!"" the demon boomed, and from his fingertips shot a bolt of red-hot flame that knocked Praxix to the ground, unconscious. ""I have no time for parlor magicians,"" he said mockingly."
	ICALL	UPDATE-MOVE,PRAXIX-POUCH,HERE
	ICALL	MAKE-BUSY,PRAXIX,ILL-COMMAND
	CALL2	PARTY-PCM,TAG
	CALL	NEW-DEFAULT,STACK,1
	RSTACK	


	.FUNCT	ANONF-370:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went over to where Praxix lay and examined him thoroughly."
	CRLF	
	CRLF	
	PRINTI	"""He's not hurt badly,"" he said."
	CRLF	
	CRLF	
	PRINTI	"""How very thoughful you are, "
	ICALL2	WPRINTD,ACTOR
	PRINTI	","" the demon boomed. ""But do not concern yourself, for I shall not kill your Wizard friend - at least not yet. But now to business."""
	RTRUE	


	.FUNCT	END-DEMON:ANY:0:0
	CRLF	
	CRLF	
	PRINTI	"The Dread Lord was gone, and we had hardly noticed that we had drifted up to the very shore of the Misty Isle."
	CRLF	
	CRLF	
	ICALL1	CLEAR-BUSY
	ICALL1	RESTORE-TAG-COMMANDS
	REMOVE	PRAXIX-OBJECT
	ICALL2	UPDATE-REMOVE,PRAXIX-POUCH
	REMOVE	DEMON-DEMON
	CALL1	ISLAND-ENDING
	RSTACK	

	.ENDSEG

	.ENDI
