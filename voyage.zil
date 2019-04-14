"VOYAGE for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT BOAT>

<OBJECT BOAT-TWIN-ISLES
	(LOC BOAT)
	(SDESC "Twin Isles")
	(8DESC "TwinIsle")
	(FLAGS DONT-TAKE)
	(KBD %<ASCII !\T>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Far off, near the southern horizon, we could see the Twin Isles of Estril
and Lethor. Between them, the sea itself grew dim and lost definition." CR CR>
		 <TELL
"\"What do you make of that?\" " ACT " asked one of the crewmen working
nearby." CR CR>
		 <TELL
"\"Why, that's the Misty Isle,\" he responded, surprised that this was not
common knowledge. \"Sorry's the man that loses his way and enters those
sinister seas.\"">)>)>

<OBJECT BOAT-CREW
	(LOC BOAT)
	(SDESC "crew")
	(FLAGS DONT-TAKE)
	(KBD %<ASCII !\C>)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Praxix, having never been to sea, was fascinated by the crew of the "
D ,CHOSEN-BOAT ". There were perhaps half a dozen of them, and each
was busily addressing himself to the various tasks and chores of
the seafaring life.">)>)>

<OBJECT BOAT-CAPTAIN
	(LOC BOAT)
	(SDESC "captain")
	(FLAGS DONT-TAKE DONT-EXAMINE)
	(KBD %<ASCII !\C>)
	(ACTION
	 <ACOND ()
		(<AND <ACTION? USE-MIX>
		      <EQUAL? ,MIXTURE ,BEND-WILL-SPELL>>
		 <COND (<EQUAL? ,CHOSEN-BOAT ,SOUTH-SEAS>
			;"Nasty captain..."
			<TELL
"I am certain now that Praxix ">
			<COND (<FSET? ,BEND-WILL-SPELL ,TRAPPED>
			       <TELL
"sensed the treachery that lurked within the captain, for he cast the will
bending spell at him. But Praxix was grappling with a will more
powerful than his own - the will of the " ,BAD-GUY " himself. It was a losing
battle - Praxix'">)
			      (T
			       <TELL
"did not anticipate the effect of the mixture he cast upon the captain. At first,
nothing happened, but soon Praxix'">)>
			<TELL
" body soon began to writhe, and he clutched at his head as if to keep it
from splitting apart. And then, with a horrible scream, he fell to the ground
in a heap. I said nothing of this to the others, so overcome was I with
fear." CR CR>
			<FSET ,STORMY-SEAS ,TRAPPED>
			<MOVE-TO ,STORMY-SEAS>)
		       (T
			;"OK captain..."
			<TELL
"Perhaps Praxix was bored, but he decided to cast one of his mixtures at
the captain. Happily, the captain didn't complain about the cloud of dust
that had been thrown in his face, though he did cough and sneeze a bit
for a while afterwards. As for the mixture itself, it seemed to have no
useful effect.">)>)>)> 

<OBJECT BOAT-SKY
      (LOC BOAT)
      (SDESC "sky")
      (FLAGS DONT-TAKE)
      (KBD %<ASCII !\S>)
      (EXBITS <+ ,PRAXIXBIT ,HURTHBIT>)
      (ACTION
       <ACOND ()
	      (EXAMINE:REMOVE
	       <TELL
"Above us and to the south, the sky was a brilliant blue. But a
fast-moving storm was approaching rapidly from the north. Every so
often, bolts of lightning danced among the clouds." CR CR>
	       <TELL
"\"Looks like rain,\" " ACT " said, in what turned out to be one of
the great understatements of our journey.">)>)>

<COMMAND RELAX>

<ROOM BOAT
      (TRAVEL-COMMANDS RELAX-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT INF)
      (GRAPHIC G-BOAT)
      (FLAGS ENCLOSED)
      (ENTER
       <EXECUTE ()
		<SAVE-SPELL ,FIRE-SPELL>
		<SAVE-SPELL ,TREMOR-SPELL>
		<TELL CR CR
"We were welcomed aboard by Captain ">
		<TELL-CAPTAIN>
		<TELL ", who">
		<COND (<NOT ,CAPTAIN>
		       <TELL ", surprisingly sober,">)>
		<TELL " informed us that
the ship was ready to sail. It was nearly an hour before the sails were
raised and we were underway, but a favoring wind carried us swiftly to
the south. Soon, the faint outline of the Twin Isles appeared at the
horizon.">
		<COND (<EQUAL? ,CHOSEN-BOAT ,SOUTH-SEAS>
		       <FSET ,HERE ,FORBIDDING>
		       <CHECK-FOREBODING>)>>)
      (ACTION
       <ACOND ()
	      (RELAX
	       <MOVE-TO ,STORMY-SEAS>)
	      (CAST
	       <COND (<OBJECT? WIND-SPELL>
		      <REMOVE ,HYE-BOAT>
		      <TELL
"Praxix, feeling himself a captive, sought to amuse himself by casting
his wind spell. It was lucky that he used only a small amount of air
essence, for the resulting gale nearly capsized our craft, causing great
concern from the captain and crew." CR CR>
		      <TELL
"\"Promise you won't tell!\" Praxix said, seeing that I had observed the
whole thing.">)
		     (<OR <OBJECT? RAIN-SPELL>
			  <OBJECT? LIGHTNING-SPELL>>
		      <REMOVE ,HYE-VOYAGE>
		      <UNUSE-ESSENCES>
		      <TELL
"Later, Praxix confided in me that he had considered casting the \""
AO "\" spell, but one look at the approaching clouds convinced him that
he could add nothing to what nature had in store.">)
		     (<OBJECT? LEVITATE-SPELL>
		      <REMOVE ,HYE-BOAT>
		      <TELL
"Bored to distraction by this ocean voyage, Praxix decided to get a
better look around, and cast his elevation spell on himself. Fifty
feet above decks, he gazed out toward the Twin Isles, much to the
surprise of the captain and crew, who had never seen such a magical
display before." CR CR>
		      <TELL
"\"Do you think it wise to flaunt your powers, Praxix?\" Bergon asked,
irritated at the Wizard's display." CR CR>
		      <TELL
"\"I suppose you are right,\" Praxix replied, \"but being at sea makes me
rather nervous.\"">)>)
	      (SCOUT:REMOVE
	       <MAKE-BUSY ,ACTOR ,GONE-COMMAND>
	       <TELL ACT
" then went off to explore the boat; in fact, there was little else to
do.">)>)>

<OBJECT STORMY-SEAS-BOAT
	(LOC STORMY-SEAS)
	(SDESC "boat")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"The boat was badly damaged by the storm; the mizzenmast had collapsed
and fallen into the ocean; the main mast still stood, though it was
heavily weakened and nearly ready to collapse under its own weight. The
main sail, though torn, was serviceable, but the rudder had been destroyed,
making steering all but impossible." CR CR>
		 <TELL
"\"What a mess,\" said " ACT ", who had not yet recovered from the
shock." CR CR>
		 <TELL
"\"What are we to do?\" I asked, \"Not only the air is still, but - see
here - the ocean itself is perfectly still and glassy. I think I understand
why it is that people never return from this place.\"">)>)>

<COMMAND (CLIMB-MAST CLIMB)>

<GLOBAL SPOTTED-ISLAND? <>>
<GLOBAL TRIED-CASTING-WIND? <>>

<ROOM STORMY-SEAS
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT INF)
      (ENTER TELL-STORM)
      (FLAGS DANGEROUS DONT-SCOUT)
      (CLOCK
       <EXECUTE ()
		<COND (<NOT <CHECK-ESSENCES ,WIND-SPELL>>
		       <TELL CR CR
"The boat floated in the unrelenting mist for many days, without even a hint
of movement. Praxix, sadly, could do nothing, having run entirely out of air
essence. But then, on the third day at sea, another storm rose up and tossed
the boat violently, flinging it into a submerged reef.">
		       <ILL-WIND T>)>>)
      (ACTION
       <ACOND ()
	      (CLIMB-MAST:REMOVE
	       <COND (,TRIED-CASTING-WIND?
		      <TELL
"I tried to locate the Misty Isle">)
		     (T
		      <TELL
"I tried to gain some view of our situation">)>
	       <TELL
" by climbing the mast, but it shook so badly as I clambered up that I became
frightened and returned to the deck." CR CR>
	       <TELL
"\"A wise decision,\" Praxix said, \"You will do us no good by falling from
the mast.\"">)
	      (PROCEED
	       <ILL-WIND>)
	      (STOP
	       <TELL
"Thinking it better to hold off for the moment, Praxix put his
air essence away and considered what to do next.">
	       <END-OPTION>) 
	      (CAST
	       <COND (<OBJECT? FAR-VISION-SPELL>
		      <TELL
"It was reasonable to give Praxix' flare spell a try, but his fireball
was enveloped by the gloom almost as it left his fingertips.">)
		     (<OBJECT? WIND-SPELL>
		      <COND (,SPOTTED-ISLAND?
			     <TELL
"Using my fix on the island as a reference, Praxix cast his wind spell
into the air. The wind blew fiercely, as the " D ,CHOSEN-BOAT " made
its way through the fog. It was only minutes later when we escaped
the fog; an island was ahead..." CR CR>
			     <TELL
"\"The Misty Isle,\" said Praxix, \"And, wouldn't you know it - it's
not even misty!\"" CR CR>
			     <COND (,DEMON-SEARCHING?
				    <DEMON-TELL>)
				   (T
				    <ISLAND-ENDING>)>)
			    (,TRIED-CASTING-WIND?
			     <REMOVE ,HYE-MIST>
			     <ILL-WIND>)
			    (T
			     <SETG TRIED-CASTING-WIND? T>
			     <TELL
"Praxix started to remove the air essence from his pouch, but
was struck with a dilemma." CR CR>
			     <TELL
"\"From which direction shall the wind blow?\" he asked me, not
expecting an answer." CR CR>
			     <TELL
"I answered anyway, trying to make light of our desperate situation.
\"Onshore,\" I said.">
			     <OPTION ,PRAXIX
				     ,PROCEED-COMMAND
				     ,STOP-COMMAND>)>)
		     (<AND <OBJECT? LEVITATE-SPELL>
			   <NOT ,SPOTTED-ISLAND?>>
		      <SETG SPOTTED-ISLAND? T>
		      ;<GRAPHIC ,G-ABOVE-FOG>
		      <TELL
"Praxix whipped up a large batch of his elevation spell and cast it
at me. I had risen only a few dozen feet before I lost sight of the deck,
and then I climbed a while longer, terrified by the gray nothingness
that surrounded me. And then, I cleared the mist and was suspended in
the clear afternoon air. Before me, an island stood, basking in the
warmth of a cloudless sky." CR CR>
		      <TELL
"Slowly, I descended to the deck, indicating to Praxix in which direction
the island lay." CR CR>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,CLIMB-MAST-COMMAND>
		      <TELL
"\"Well, well,\" he said, \"We may survive this voyage after all!\"">)>)>)>

<ROUTINE ILL-WIND ("OPTIONAL" (STUCK? <>))
	 <COND (<NOT .STUCK?>
		<HINT ,HINT-REEF>
		<TELL
"\"Ah, well,\" Praxix said, finishing the preparation of his wind spell,
\"it can't be any worse than sitting here!\"" CR CR>
		<TELL
"But he was wrong - it could be far worse. He flung the powder into the air,
and a gale blew. For a time we sailed smoothly, but then, suddenly, we ran
aground on a submerged reef.">)
	       (T
		<HINT ,HINT-REEF-STUCK>)>
	 <TELL " The " D ,CHOSEN-BOAT " listed, then capsized,
and I lost track of the others in the mist." CR CR>
	 <TELL
"But it was my good fortune to have been saved by the boat's main mast.">
	 <TELL ,WAVE-SAVE>
	 <BAD-ENDING>>

<COMMAND STOP>

<ROUTINE TELL-STORM ()
	 <COND (<NOT <FSET? ,STORMY-SEAS ,TRAPPED>>
		<TELL
"And so we settled in; Bergon with the captain, the rest of us exploring
one part of the ship or another. ">)>
	 <TELL
"The sky had now darkened, and though it was barely noon, it could as well have
been twilight. The storm was nearly upon us, and the sound of thunder, once
distant, now rumbled overhead." CR CR>
	 <COND (<EQUAL? ,CHOSEN-BOAT ,SOUTH-SEAS ,ELFENTIDE>
		<GRAPHIC ,G-TREACHERY>
		<TELL
"And then, disaster struck; the crew, on the command of the captain,
drew their weapons and attacked our party, catching us entirely by
surprise. As I watched in abject horror, Bergon was butchered by a pair
of crewmen using battle axes and bludgeons.">
		<COND (<NOT <FSET? ,STORMY-SEAS ,TRAPPED>>
		       <TELL
" Praxix was soon cornered and his throat slit by another
pair of assassins.">)>
		<COND (<G? ,PARTY-MAX 3>
		       <TELL
" As for the others, I cannot but think they met a similar fate.">)>
		<TELL CR CR
"That I was saved is a strange twist of fate, for the storm unleashed
its violence upon the ship just as I had run into a dead-end in a frantic
attempt to escape my pursuers. And just as all hope faded, a stroke of
lightning shattered the main mast, which in its fall killed my assailants
and cast me into the churning sea." CR CR>
		<TELL
"I soon lost sight of the boat, but again its main mast saved
my life.">
		<HINT ,HINT-SOUTH-SEAS>
		<TELL ,WAVE-SAVE>
		<BAD-ENDING>)
	       (T
		<GRAPHIC ,G-MAST-FALLS>
		<TELL
"The seas became rough, and soon the rains fell, but ">
		<TELL-CAPTAIN>
		<TELL " chose to continue onward." CR CR>
		<TELL
"The air took on a pungent smell as lightning lit up the now darkened
sky. Crewmen cowered as the sky thundered around us." CR CR>
		<TELL
"\"Be stout, men,\" shouted the captain, as he implored his men to lower
the sails. But it was too late! A stroke of lightning shattered the
mizzenmast, which in its fall headed directly at Bergon, still standing
standing at the wheelhouse with the captain." CR CR>
		<TELL "But " ,GOOD-CAPTAIN-NAME>
		<TELL
", ignoring the danger to himself, pushed Bergon out of harm's
way, saving his life. The captain himself was knocked overboard, and seeing
the destruction around them, the crew abandoned ship, leaving only the ">
		<TELL <GET ,INT-STR ,PARTY-MAX>>
		<TELL " of us aboard.">
		<TELL CR CR
"It was hours later that the storm abated, but we rode it out without harm.
The darkness lifted as we approached a thick wall of fog; though we felt no
wind, yet we were drawn inexorably toward it. All too suddenly, the
mist enveloped us and an eerie silence settled over the boat." CR CR>
		<TELL
"\"The sea has borne us into the mist,\" Praxix said, staring into the
shimmering gloom. \"The Misty Isle is near at hand!\"">
		<GRAPHIC ,G-BOAT-FOG>
		<ADD-TRAVEL-COMMAND ,HERE ,CLIMB-MAST-COMMAND>)>>

<ROUTINE TELL-CAPTAIN ()
	 <COND (,CAPTAIN <TELL ,CAPTAIN>)
	       (T <TELL ,GOOD-CAPTAIN-NAME>)>>

<CONSTANT WAVE-SAVE
" Tossed with me into the tumult, it had split in two, its larger piece intact
and floating on the waves. Grabbing hold of that precious flotsam, I pulled myself
up and fell unconscious atop it. The next day, the storm having passed, I was found
by passing fishermen and taken back to Zan where, after a few sleepless nights, I
booked passage to Lendros, and my home in the plains.">

<OBJECT PRAXIX-POUCH
	(SDESC "Praxix' pouch")
	(12DESC "pouch")
	(8DESC "pouch")
	(KBD %<ASCII !\P>)
	(FLAGS DONT-EXAMINE)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <UPDATE-FSET ,PRAXIX-POUCH ,DONT-TAKE>
		 <SETG TAG-HOLDING-POUCH T>
		 <TRAVEL-COMMANDS ,TAG ,MIX-COMMAND>
		 <TELL
"Lying beside Praxix was his pouch of magical powders, and, as
discreetly as I could, I picked them up. Inside the pouch were a number
of smaller bags. Of these, only the reagents were simple to recognize. But
the others numbered " <GET ,INT-STR ,NUM-POWDERS> ", not four as I had expected.
Each of these bags held a powder, and these powders were of different colors and
consistencies." CR CR>
		 <TELL
"I tried to think what Praxix would do, what he was trying to do, when he was
struck down by this messenger of evil. ">
		 <COND (<FSET? ,LIGHTNING-SPELL ,SEEN>
			<TELL "And then it occurred to me: lightning, which">)>
		 <COND (<NOT <FSET? ,LIGHTNING-SPELL ,SEEN>>
			<TELL
"I thought about the various spells that Praxix had cast during our
journey, but none seemed powerful enough. Perhaps Praxix had a spell
to call forth a bolt of lightning, but even so, I had no idea of which
combination of essences would produce it?">)
		       (<FSET? ,LIGHTNING-SPELL ,INCAPACITATED>
			<TELL ", I remembered, was a mixture
of fire and water essences, with just a pinch of earth essence.
The only problem was: which essence was which?">)
		       (T
			<TELL " I suspected would be the
combination of fire and water essences. The only problem was: which essence
was which?">
		        <COND (<FSET? ,TALE-MAGIC ,SEEN>
			       <TELL
" And was there a third essence involved, as Praxix said was
sometimes the case?">)>
			<RTRUE>)>)>)>

<GLOBAL TAG-HOLDING-POUCH <>>

<OBJECT DEMON-DEMON
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<AND <ACTION? EXAMINE>
			      <OBJECT? PRAXIX-OBJECT>>
			 <RTRUE>)>
		  <SETG DEMON-COUNT <+ ,DEMON-COUNT 1>>
		  <TELL CR CR>
		  <COND (<ZERO? ,DEMON-COUNT>
			 <TELL
"\"We know who you are, and we know what you seek,\" the demon continued,
\"but you will be needing a lesson in manners.\"">)
			(<EQUAL? ,DEMON-COUNT 1>
			 <TELL
"\"Let me see,\" the demon went on, \"Who, do you suppose, should receive
this lesson?\"">)
			(<EQUAL? ,DEMON-COUNT 2>
			 <SETG DEMON-VICTIM
			       <FIRST-IN-PARTY ,HURTH ,ESHER ,MINAR ,BERGON>>
			 <TELL
"\"Praxix will not do,\" the demon spat, \"I would not like
to be accused of destroying one so defenseless. No, I believe the
honor should go to " D ,DEMON-VICTIM ".\"">)
			(<EQUAL? ,DEMON-COUNT 3>
			 <TELL
"\"" D ,DEMON-VICTIM ", rise!\" the demon ordered, and, face contorted
hideously, the demon's victim stood and approached the foul monster.">)
			(T
			 <PARTY-REMOVE ,DEMON-VICTIM>
			 <TELL
"And then, the demon stretched out his arm, hand open, at " D ,DEMON-VICTIM
" and, as he slowly closed his hand, it seemed that " D ,DEMON-VICTIM " was
being squeezed mercilessly; he screamed in agony as he demon's fist closed
ever tighter. Moments later, he was dead, crushed by this awful monster." CR CR>
			 <TELL
"\"The same fate, or worse, awaits all those who seek to defy the " ,BAD-GUY
". This is but a taste of what is to follow.\" Then, he swung his arm to his
side and opened his clenched fist; " D ,DEMON-VICTIM "'s body was flung from
the boat and into the ocean waters." CR CR>
			 <TELL
"Mounting the awful creature that had borne him here, he flew off into
the distant north.">
			 <COND (<NOT ,TAG-HOLDING-POUCH>
				<HINT ,HINT-POUCH>)>
			 <END-DEMON>)>>)>

<GLOBAL DEMON-VICTIM <>>

<ROUTINE DEMON-TELL ()
	 <GRAPHIC ,G-DEMON>
	 <QUEUE DEMON-DEMON -1>
	 <PUTP ,STORMY-SEAS ,P?CLOCK <>>
	 <REMOVE-TRAVEL-COMMAND ,HERE ,CLIMB-MAST-COMMAND>
	 <UPDATE-MOVE ,PRAXIX-OBJECT ,HERE>
	 <UPDATE-FSET ,STORMY-SEAS-BOAT ,DONT-EXAMINE>
	 <TELL
"We were drifting on the waves, moving ever closer to the Misty Isle,
when a dark shadow passed over the boat. Black as the darkest
caverns, it hovered, formless, in the sky above us. And then,
with a terrifying scream, it dove down upon us, landing on the prow
of the boat." CR CR>
	 <TELL ,DEMON-DESC>
	 <COND (<FSET? ,ZAN-TAVERN ,SEEN>
		<TELL
" And then, I remembered: this was the man we had seen at the tavern; the
one who had arranged for our deaths!">)>
	 <TELL CR CR
"\"At last I have found you,\" he said, scornfully. \"The invincible Five, who
have united the Six Stones! A ragtag gang of carpenters, cooks, and charlatans.
Oh, and a Dwarf, that most despicable of races! You are clever to have eluded my
associates in Zan. But, as you shall soon learn, my arm grows longer with each
passing hour and there are none alive who can escape my judgement.\"" CR CR>
	 <TELL
"Praxix, meanwhile, was hurriedly removing his pouch of magical essences
in the hopes of foiling this demon of darkness." CR CR>
	 <TELL
"\"Fool!\" the demon boomed, and from his fingertips shot a bolt of
red-hot flame that knocked Praxix to the ground, unconscious. \"I have no
time for parlor magicians,\" he said mockingly.">
	 <UPDATE-MOVE ,PRAXIX-POUCH ,HERE>
	 <MAKE-BUSY ,PRAXIX ,ILL-COMMAND>
	 <NEW-DEFAULT <PARTY-PCM ,TAG> 1>>

<OBJECT PRAXIX-OBJECT
	(SDESC "Praxix")
	(FLAGS DONT-TAKE)
	(EXBITS ESHERBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" went over to where Praxix lay and examined him thoroughly." CR CR>
		 <TELL
"\"He's not hurt badly,\" he said." CR CR>
		 <TELL
"\"How very thoughful you are, " ACT ",\" the demon boomed. \"But do not concern
yourself, for I shall not kill your Wizard friend - at least not yet. But now to
business.\"">)>)>

<ROUTINE END-DEMON ()
	 <TELL CR CR
"The Dread Lord was gone, and we had hardly noticed that we had drifted up to
the very shore of the Misty Isle." CR CR>
	 <CLEAR-BUSY>
	 <RESTORE-TAG-COMMANDS>
	 <REMOVE ,PRAXIX-OBJECT>
	 <UPDATE-REMOVE ,PRAXIX-POUCH> 
	 <REMOVE ,DEMON-DEMON>
	 <ISLAND-ENDING>>

