"FOG for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT CASTLE>

<ROOM FOG-CAMP
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (ENTER
       <EXECUTE () <FCLEAR ,PRAXIX ,LIT>>)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <TELL ACT
" tried to scout out the area, but the heavy mist made his task all
but impossible." CR CR>
	       <COND (<EQUAL? ,ACTOR ,HURTH>
		      <TELL
"\"I cannot say what lies ahead,\" he announced, \"though I have found
some heavy tracks in the mud which I fear to be orc footprints. We must be
careful, and move quietly!\"">)
		     (T
		      <TELL
"\"It's not good,\" he said, \"There are footprints in the mud just ahead,
and I doubt their owners are friendly.\"">)>)
	      (PROCEED
	       <TELL
"Early the next morning, we started again. The air was heavy with mist,
and it was difficult to see just a few paces before us. We had been moving
silently for an hour when " D ,LEADER " became alarmed." CR CR>
	       <TELL
"Gathering together, we soon learned that Praxix was missing from our
ranks. \"Praxix! Praxix!\" we called, but there was no reply, only the
sounds of the forest." CR CR>
	       <TELL
"\"Praxix! Praxix!\" The words fell only upon the deaf ears of the forest.">
	       <DIVIDER>  
	       <MAKE-SUBGROUP ,PRAXIX>
	       <MOVE-TO ,TREE-FORK>)>)>

<COMMAND ASK-TREE O-ASK-TREE ()
	 <TELL-TALE ,ACTION-OBJECT>
	 <RTRUE>>

<ROUTINE O-ASK-TREE ()
	 <FIND-OBJECTS ,ASK-TREE-OBJECTS>>

<OBJECT ASK-TREE-OBJECTS>

<OBJECT ASK-TREE-LOCATION
	(LOC ASK-TREE-OBJECTS)
	(SDESC "location")
	(KBD %<ASCII !\L>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"\"Where am I?\" Praxix asked, thinking it might help. It didn't." CR CR>
		  <TELL
"\"You're here with me,\" the tree replied." CR CR>
		  <TELL
"\"And where would that be?\" Praxix tried." CR CR>
		  <TELL
"\"In the forest?\" the tree replied uncertainly, trying his best to be
helpful." CR CR>
		  <TELL
"Praxix slumped to the ground, rubbing his head. This was shaping up to
be a miserable day, he thought. Best to leave this leaf-laden philosopher
and try to find the others.">>)> 

<OBJECT ASK-TREE-PATHS
	(LOC ASK-TREE-OBJECTS)
	(SDESC "paths")
	(KBD %<ASCII !\P>)
	(TEXT
	 <EXECUTE ()
		  <FSET ,ASK-TREE-PATHS ,SEEN>
		  <TRAVEL-COMMANDS ,HERE
				   ,MILKY-WAY-COMMAND
				   ,ROAD-TO-RUIN-COMMAND
				   ,GARDEN-PATH-COMMAND>
		  <UPDATE-REMOVE ,ACTION-OBJECT>
		  <TELL
"Hoping at least to get some useful information from this root-bound
nuisance, Praxix asked, \"Do you know where these paths lead?\"" CR CR>
		  <TELL
"\"Why, of course; on the left is the Milky Way, right in front of you is
the road to ruin, and here on the right is the garden path,\" the tree replied
matter-of-factly." CR CR>
		  <TELL
"\"I don't suppose you have a preference,\" Praxix asked with little
hope." CR CR>
		  <TELL
"\"No, I've never felt the need for one,\" the tree responded, \"I'm not
going much of anywhere.\" And with that, he shook a few branches to indicate
the limits of his movement.">>)>

<COMMAND (ROAD-TO-RUIN RUIN)>
<COMMAND MILKY-WAY>
<COMMAND (GARDEN-PATH GARDEN)>

<ROOM TREE-FORK
      (TRAVEL-COMMANDS LEFT-COMMAND CENTER-COMMAND RIGHT-COMMAND)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <QSET? ,HERE ,SEEN>>
		       <TELL
"\"Praxix! Praxix!\" the voice cried out. \"Wake up!\"" CR CR>
		       <GRAPHIC ,G-TALKING-TREE>
		       <TELL
"Praxix rose slowly and took stock of his situation. After separating
from the group, he had wandered aimlessly through the dense fog for the
better part of the morning before stopping to indulge in the tasty, red
berries that blanketed the ground beneath him. And then, he fell into
a deep, yet restless, sleep." CR CR>
		       <TELL
"Now, someone was calling him, but who? He swung around, but found himself
alone. His head ached, and he wished for nothing more than to be left in
peace until the pain subsided." CR CR>
		       <TELL
"\"Praxix! Don't you have anything better to do,\" the voice continued,
\"than to sleep the day away?\"" CR CR>
		       <TELL
"Praxix swung around again and faced a modest-sized oak tree as it was just
finishing the preceding question. \"You know my name?\" he asked, startled
more by the personal reference than the fact that he was being addressed in
whatever fashion by the local flora." CR CR>
		       <TELL
"\"Why, of course!\" the tree replied enthusiastically. \"All trees sing your
praises.\"" CR CR>
		       <TELL
"\"They do?\" Praxix responded coyly, for he was not above flattery." CR CR>
		       <TELL
"\"Oh, my, yes! We know how you helped old Tully when his house caught fire.
And then there was the poor Helspar widow, how you helped her...\"" CR CR>
		       <TELL
"\"Yes, yes, I see,\" Praxix interrupted, not wishing to pursue the matter
further. But he did not see, at least very clearly, and his head throbbed
in much the same way that he expected the Tremor spell would cause if cast
upon his cranium.">
		       <TRAVEL-COMMANDS ,PRAXIX
					,CAST-COMMAND
					,ASK-TREE-COMMAND
					,EXAMINE-COMMAND>)>>)
      (EXIT FIXUP-PRAXIX-COMMANDS)
      (ACTION
       <ACOND ()
	      (<OR <ACTION? LEFT> <ACTION? MILKY-WAY>>
	       <COND (<IN? ,TALKING-TREE ,HERE>
		      <LEAVE-TREE "left">)
		     (T
		      <TELL
"This time he took the leftmost path. ">)>
	       <TELL ,PATH-TO-MILL>
	       <MOVE-TO ,MILL>) 
	      (<OR <ACTION? CENTER> <ACTION? ROAD-TO-RUIN>>
	       <COND (<IN? ,TALKING-TREE ,HERE>
		      <LEAVE-TREE "center">)
		     (T
		      <TELL
"This time he took the center path. ">)>
	       <TELL
"Although the path twisted its way through the forest, it had been a more
important thoroughfare long ago, as evidenced by the crumbling stonework lying
by the wayside. ">
	       <TELL ,MOAT-DESC>
	       <MOVE-TO ,OUTSIDE-MOAT>)
	      (RIGHT:REMOVE
	       <GUARDED-PATH>)
	      (GARDEN-PATH:REMOVE
	       <GUARDED-PATH>)>)>

<CONSTANT PATH-TO-MILL
"The path snaked and wound its way toward the west, ending at the
side of a river, which Praxix assumed to be the very same that
we had followed from the underground caverns. The remains of an
old building stood here, crumbling; inside, a badly rusted
mechanism sat. Praxix imagined it would be used for the grinding
of grain.">

<CONSTANT MOAT-DESC
"Soon the forest
gave way to a clearing, in the middle of which stood the ruins of a moated
castle. What little remained of the bridge hung tentatively over the
water, making any crossing a speculative affair.">

<OBJECT MILL-MACHINERY
	(SDESC "mechanism")
	(8DESC "machine")
	(KBD %<ASCII !\M>)
	(LOC MILL)
	(EXBITS PRAXIXBIT)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <FSET ,MILL-MACHINERY ,EXAMINED>
		 <FSET ,HERE ,NEAR-DARK>
		 <TELL
"Badly rusted from many years of disuse, the mill machinery stood as it
had for countless years. Praxix attempted to turn the great water wheel,
but it had rusted to the point of inoperability. He did, however, notice
a small passageway leading down from the machinery into a darker area below.">
		 <ADD-TRAVEL-COMMAND ,HERE ,DOWN-COMMAND>)>)>

<ROUTINE MILL-TO-ASTRIX ()
	 <HINT ,HINT-CASTLE>
	 <COND (<AND <FSET? ,MILL ,SEEN>
		     <NOT <FSET? ,XFER-1 ,SOLVED>>>
		<HINT ,HINT-MILL>)>
	 ;"We're still in subgroup..."
	 <RESTORE-TAG-OBJECTS>
	 <TELL
"Knowing the Sunset Mountain to be generally north and east of his
position, Praxix slowly made his way to Astrix' tower." CR CR>
	 <TELL
"The rest of us, having lost hope of reuniting with Praxix, also made
our way back, arriving the next day. But while we were glad to have
seen Praxix alive, we had failed at our quest for the Stones.">
	 <PART-TWO-ENDING>>

<ROOM MILL
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-MILL)
      (ENTER FSET-SEEN)
      (CLOCK
       <EXECUTE ()
		<COND (<AND <FSET? ,PRAXIX ,LIT>
			    <FSET? ,MILL-MACHINERY ,EXAMINED>>
		       <FORCE-TRAVEL-COMMAND ,HERE ,DOWN-COMMAND>)>>)
      (ACTION
       <ACOND ("AUX" TMP)
	      (DOWN
	       <COND (<NOT <FSET? ,PRAXIX ,LIT>>
		      <REMOVE-TRAVEL-COMMAND>
		      <TELL
"It took only a few steps for Praxix to realize that the path leading inside
the mill mechanism was dark and potentially dangerous. Rather than risk injury,
he returned to the open air.">)
		     (T
		      <COND (<NOT ,SUBGROUP-MODE>
			     <TELL
"Praxix insisted in exploring the mechanism himself, and we soon wished that
he hadn't." CR CR>
			     <MAKE-SUBGROUP ,PRAXIX>)>
		      <TELL
"At first, it appeared that the passage was merely some maintenance path with
access to the internal working parts of the mill mechanism. However, the path
soon reached a set of stone steps that led down beneath ground level, ending
at the junction of two paths." CR CR>
		      <TELL
"But no sooner had Praxix started to think about where to proceed next, the
ground collapsed beneath the steps, and the resulting avalanche of stone
completely buried his only known route to the outside.">
		      <MOVE-TO ,XFER-JCN>
		      <SET TMP <+ <PARTY-PCM ,PRAXIX> 1>>
		      <SETG TAG-SWAP-CHR <GET ,PARTY .TMP>>
		      <PUT ,PARTY <PARTY-PCM ,TAG> ,TAG-SWAP-CHR>
		      <PUT ,PARTY .TMP ,TAG>
		      <FSET ,TAG ,SHADOW>
		      ;<SAVE-TAG-OBJECTS>
		      <SCENE ,MILL-SCENE>)>)
	      (PROCEED
	       <LEAVE-MILL-AREA>)>)>

<OBJECT MILL-SCENE
	(ACTION
	 <ACOND ()
		(INVENTORY
		 <TELL
"Praxix took stock of his possessions finding ">
		 <COND (<NOT <LIST-CONTENTS ,INVENTORY>>
			<TELL "only">)
		       (T
			<TELL " and">)>
		 <TELL " his magical paraphenalia - his staff and pouch of powders.">
		 <UPDATE-FSET ,HERE ,INVENTORIED>)
		(DROP
		 <COND (<EQUAL? ,HERE ,XFER-1-ANTE ,XFER-2-ANTE ,XFER-3-ANTE>
			<UPDATE-MOVE ,ACTION-OBJECT
				     <COND (<EQUAL? ,HERE ,XFER-1-ANTE>
					    ,XFER-1)
					   (<EQUAL? ,HERE ,XFER-2-ANTE>
					    ,XFER-2)
					   (T
					    ,XFER-3)>>
			<TELL
"Thinking it might be helpful, Praxix dropped the " AO " over the railing and
down to the bottom of the pit, where it landed ">
			<COND (<EQUAL? ,HERE ,XFER-1-ANTE>
			       <TELL "almost immediately.">)
			      (T
			       <TELL "more than a couple of seconds later.">
			       <TELL CR CR
"\"An awfully long way down,\" he said, gazing absently into the abyss.">)>)
		       (T
			<TELL
"Praxix thought to drop the " AO ", but felt it imprudent to do so.">)>)>)>

<GLOBAL TAG-SWAP-CHR <>>

<ROUTINE LEAVE-MILL-AREA ()
	 <COND (,REJOINED
		;"Have already rejoined with group..."
		<CLEAR-SUBGROUP>
		<COND (,A-B-FLAG
		       <CASTLE-MILL-TO-ASTRIX>)
		      (T
		       <CASTLE-MILL-TO-CAVERNS>)>)
	       (<FSET? ,CASTLE-BRIDGE ,SEEN>
		<MILL-TO-ASTRIX>)	       
	       (T
		<TELL
"Leaving the vicinity of the mill, Praxix re-entered the forest, taking a
more easterly course. ">
		<TELL ,MOAT-DESC>
		<MOVE-TO ,OUTSIDE-MOAT>)>>

<ROUTINE LEAVE-TREE (STR)
	 <TELL
"Happily ridding himself of this garrulous tree, Praxix strode off
upon the " .STR " path. What little fog remained had now cleared, and the same
could be said for the cottony feeling in his mouth and head." CR CR>>

<ROUTINE GUARDED-PATH ()
	 <COND (<IN? ,TALKING-TREE ,HERE>
		<GRAPHIC ,G-FOREST>
		<UPDATE-REMOVE ,TALKING-TREE>
		<APPLY <GETP ,HERE ,P?EXIT>>
		<LEAVE-TREE "right">)>
	 <TELL
"Before long, he approached a heavily guarded area, an armed compound of some
kind. It took only a moment to realize that this was orc territory, and that
he was in great danger. Carefully retracing his steps, he found his way
back to the fork; the talking tree was gone.">>

<OBJECT MOAT-BRIDGE
	(SDESC "bridge")
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Praxix' eye passed along the course of the bridge. Once supported by
huge stone pillars which rose high into the air, the roadway was now
barely suspended above the water, its wooden planking rotted nearly to
non-existence.">)>)>

<OBJECT MOAT-WATER
	(SDESC "water")
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Looking down at the moat itself was none too pleasant; the water had a
dark greenish cast, and strange red weeds covered much of the surface.
Every so often, large bubbles of air surfaced, from what source Praxix
could only imagine.">)>)>

<ROOM OUTSIDE-MOAT
      (TRAVEL-COMMANDS CROSS-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-MOAT)
      (ENTER
       <EXECUTE ()
	        <UPDATE-MOVE ,MOAT-BRIDGE ,HERE>
	        <UPDATE-MOVE ,MOAT-WATER ,HERE>>)
      (ACTION
       <ACOND ()
	      (CROSS
	       <TELL
"Praxix decided to explore the castle; gingerly, he made his way
across the bridge, the boards creaking and groaning with each step he
took. Halfway across, the board beneath his feet gave way, and he
was nearly over the side when his arm caught hold of a supporting brace.
Pulling himself to his feet, he realized that getting to the castle and
back again would be chancy at best.">
	       <MOVE-TO ,CASTLE-BRIDGE>)>)>

<ROOM CASTLE-BRIDGE
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (FLAGS DONT-CAST)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"Resolved to go on, Praxix took greater care in crossing the final
half of the bridge, arriving with no further incident to himself.
The bridge was another matter; having had just about enough from
the long ages, it crumbled and sank into the moat, leaving behind a
single large pier standing (or, rather, leaning) near the moat's midpoint." CR CR>
	       <TELL
"What remained of an ancient castle lay before him and he walked eagerly
into what would have been the courtyard. Of the four towers which had guarded
this fortress, only one stood, and that only barely; the others lay
in piles of broken stone and mortar.">
	       <MOVE-TO ,CASTLE-COURTYARD>)
	      (BACK
	       <TELL
"Not wishing to chance being trapped on the castle grounds, Praxix returned
to the safety of the near shore. ">
	       <COND (<FSET? ,MILL ,SEEN>
		      <MILL-TO-ASTRIX>) 
		     (T
		      <TELL
"Following the only path nearby, he re-entered the forest and was soon
at the edge of the river he presumed to be the same we had followed in
leaving the lower levels of the caverns. At the river's edge stood the
crumbling remains of an old mill building.">
		      <MOVE-TO ,MILL>)>)>)>

<COMMAND TOWER>

<OBJECT CASTLE-COURTYARD-RUINS
	(SDESC "ruins")
	(LOC CASTLE-COURTYARD)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Praxix made a complete circle gazing at the remains of this castle.
Besides the fragments of three towers and the ghostly spectre of the
fourth, little remained to tell the tale of the castle's past.">)>)>

<ROOM CASTLE-COURTYARD
      (TRAVEL-COMMANDS TOWER-COMMAND MOAT-COMMAND NUL-COMMAND)
      (CAST-LIMIT 3)
      (GRAPHIC G-COURTYARD)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<AND <OR <FSET? ,CASTLE-TOWER ,SEEN>
				,PRAXIX-SIGNAL>
			    <OR <FSET? ,CASTLE-TROVE ,SEEN>
				<AND <NOT <IN-PARTY? ,UMBER>>
				     <FSET? ,CASTLE-DUNGEON ,SEEN>>>>
		       <COND (,PRAXIX-SIGNAL
			      <TELL CR CR>
			      <PRAXIX-WAITS-FOR-PARTY>)
			     (T
			      <REMOVE-TRAVEL-COMMAND ,HERE
						     ,TOWER-COMMAND>
			      <COND (<EQUAL? <GET <GETPT ,HERE
							 ,P?TRAVEL-COMMANDS>
						  0>
					     ,NUL-COMMAND>
				     <TELL CR CR
"And so it was that Praxix became stranded on this man-made island,
with no means of escape and no help in sight.">
				     <COND (<AND
					     <NOT <CHECK-ESSENCES ,FAR-VISION-SPELL>>
					     <NOT <CHECK-ESSENCES ,LIGHTNING-SPELL>>
					     <NOT <CHECK-ESSENCES ,RAIN-SPELL>>>
					    <HINT ,HINT-SIGNAL>
					    <DIVIDER>
					    <TELL
"The rest of us, having lost hope of reuniting with Praxix, slowly made
our way back to Astrix. Sadly, we never saw Praxix again.">
					    <PART-TWO-ENDING>)>)>)>)>>)
      (ACTION
       <ACOND ()
	      (<SENDING-SIGNAL?>
	       <PRAXIX-SENDS-SIGNAL>)
	      (TOWER
	       <TELL
"Walking into the base of the tower, he saw two staircases, one rising
to the battlements above, the other descending beneath the ground into
darkness.">
	       <MOVE-TO ,CASTLE-BASE>)
	      (MOAT
	       <TELL
"Heading back toward the moat, Praxix surveyed the damage. Hardly a piece
of the collapsed bridge remained above the surface; there would be no
crossing here. And as for the water, it looked no more appetizing than when
he first cast his eyes upon it.">
	       <TRAVEL-COMMANDS ,HERE ,TOWER-COMMAND>
	       <UPDATE-MOVE ,MOAT-WATER ,INSIDE-MOAT>
	       <MOVE-TO ,INSIDE-MOAT>)>)>

<ROUTINE SENDING-SIGNAL? ()
	 <COND (<AND <ACTION? CAST>
		     <OR <OBJECT? FAR-VISION-SPELL>
			 <OBJECT? LIGHTNING-SPELL>
			 <OBJECT? RAIN-SPELL>>
		     <NOT ,PRAXIX-SIGNAL>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<COMMAND MOAT>

<ROOM INSIDE-MOAT
      (TRAVEL-COMMANDS COURTYARD-COMMAND SWIM-COMMAND NUL-COMMAND)
      (CAST-LIMIT 3)
      (GRAPHIC G-COURTYARD)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? CAST>
		    <OR <OBJECT? WIND-SPELL>
			<OBJECT? LEVITATE-SPELL>>
		    <NOT <QSET? ,HERE ,ENCHANTED>>>
	       <UNUSE-ESSENCES>
	       <TELL
"Praxix considered using some combination of elevation and wind to get him
across the moat, but first he did some figuring. And the figuring told him
that he was an odds-on favorite to land inside of the moat rather than beyond
it. Praxix was not by nature a betting man, and it occurred to him that
this would be a poor time to start." CR CR>
	       <TELL
"\"I could use a good length of rope,\" he said to a bird which had
just perched nearby. \"If the others were here, I wouldn't have this
problem, would I?\"">)
	      (<SENDING-SIGNAL?>
	       <PRAXIX-SENDS-SIGNAL>)
	      (COURTYARD
	       <TELL
"There was little for Praxix to do here than wonder how he had gotten
himself into this predicament, so he returned to the courtyard.">
	       <MOVE-TO ,CASTLE-COURTYARD>)
	      (SWIM:REMOVE
	       <TELL
"It occurred to Praxix to swim across the moat, but he decided to test the
waters first. So, removing his shoe, he dipped an unwilling toe into the
moat. The first sensation he felt was warmth; then, an odd tingling
feeling gripped him. The water's surface rippled disturbingly, and Praxix
swore he felt something pincer-like grab at his toe just as he pulled
it from the water. Needless to say, Praxix gave up any thought of
subjecting other body parts to the moat."> )>)> 

<COMMAND COURTYARD>

<ROOM CASTLE-BASE
      (TRAVEL-COMMANDS UP-COMMAND DOWN-COMMAND COURTYARD-COMMAND)
      (ENTER
       <EXECUTE ()
		<COND (<OR <NOT <FSET? ,CASTLE-TOWER ,SEEN>>
			   <NOT <FSET? ,CASTLE-DUNGEON ,SEEN>>>
		       <REMOVE-PARTY-COMMAND ,COURTYARD-COMMAND>)>>)
      (GRAPHIC G-COURTYARD)
      (ACTION
       <ACOND ()
	      (UP
	       <COND (<FSET? ,CASTLE-TOWER ,SEEN>
		      <REMOVE-TRAVEL-COMMAND>)>
	       <TELL "Praxix">
	       <COND (<IN-PARTY? ,UMBER>
		      <TELL ", with Umber in tow,">)>
	       <TELL
" climbed the crumbling stairs and was soon atop the tower.">
	       <MOVE-TO ,CASTLE-TOWER>)
	      (DOWN
	       <CASTLE-DUNGEON-MOVE>)
	      (COURTYARD
	       <TELL
"From there, it was a short walk back to the courtyard.">
	       <MOVE-TO ,CASTLE-COURTYARD>)>)>

<ROUTINE CASTLE-DUNGEON-MOVE ()
	 <TELL
"Climbing down the darkened stairway, Praxix">
	 <COND (<IN-PARTY? ,UMBER> <TELL " and Umber">)>
	 <TELL " soon reached the level
below, a dungeon of crumbling prison cells. The oppressive
moisture and the passage of time had taken a heavy toll on the
wooden prison doors, which stood open in ghostly silence.">
	 <MOVE-TO ,CASTLE-DUNGEON>>

; <GLOBAL UMBER-ARRIVED-FLAG <>>

<ROOM CASTLE-TOWER
      (TRAVEL-COMMANDS DOWN-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT 3)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <QSET? ,HERE ,SEEN>>
		       <GRAPHIC ,G-UMBER>
		       <TELL 
" Much to his surprise, he was not alone, for a man was already there,
leaning over a battlement and staring toward the distant horizon. As
Praxix approached, the man turned and greeted him with unrestrained
enthusiasm, as though he were a dear friend long absent and presumed
dead." CR CR>
		       <TELL
"\"Ah, Praxix, my friend! We meet again!\" he said." CR CR>
		       <TELL
"Praxix approached this too cheerful young man of whom he had no particular
recollection. \"Does this mean we have met before?\" he asked." CR CR>
		       <TELL
"\"Yes we have, though you were somewhat - what's the word -
confused?\" he replied, and leaned forward towards Praxix' mouth,
sniffing." CR CR>
		       <TELL
"\"Indeed?\" said Praxix, eyebrows raised." CR CR>
		       <TELL
"\"No. I think I meant to say 'incoherent.' ">
		       <COND (,ASK-TREE-PATHS
			      <TELL
"First, you told all sorts of odd stories about yourself, and then you asked
some questions. Told you about these ruins, as a matter of fact.">)
			     (T
			      <TELL
"You told me all sorts of stories about yourself, then ran off.">)>
		       <TELL
" I don't mean to be getting personal, seeing as how we've
just barely met, but I'd be staying away from those berries if I were
you. At least early in the day.\"" CR CR>
		       <TELL
"\"Ah, yes. I do remember,\" Praxix admitted, turning the faintest shade
of red. There was no talking tree, he realized; only a vivid
hallucination brought upon, apparently, by the berries he had indulged
in earlier in the day." CR CR>
		       <TELL
"\"I don't know about you, but I could use a little company. May I join
you?\" the man asked.">
		       <OPTION ,PRAXIX ,ACCEPT-COMMAND ,DECLINE-COMMAND>)
		      (T
		       <GRAPHIC ,G-UMBER> ;"Sigh")>>)
      (ACTION
       <ACOND ("AUX" (CNT 0) CHR)
	      (DOWN
	       <COND (<OR <FSET? ,CASTLE-TROVE ,SEEN>
			  <AND <FSET? ,CASTLE-DUNGEON ,SEEN>
			       <NOT <IN-PARTY? ,UMBER>>>> 
		      <MOVE-TO ,CASTLE-BASE
"Finding nothing more of interest there, Praxix again descended the
stairs, coming to the base of the tower.">)
		     (T
		      <CASTLE-DUNGEON-MOVE>)>)
	      (ACCEPT
	       <TELL
"There was no apparent harm in this, so Praxix assented." CR CR>
	       <PARTY-CHANGE ,TAG ,UMBER>
	       <FSET ,UMBER ,SUBGROUP>
	       <SETG UPDATE-FLAG T>
	       <TELL
"\"Name's Umber,\" the man said by way of belated introduction, \"and
I'm pleased to meet you.\" He put out his hand, and smiled broadly, reminding
Praxix of the used merchandise sellers whom he despised so deeply." CR CR>
	       <TELL
"\"What have I done?\" Praxix asked the heavens with upraised hands.
\"Trapped up here with... with...\" He paused, choosing his words with care.
\"With my party out there,\" he said, moving his hands across the broad
expanse of forest that lay before him." CR CR>
	       <TELL
"\"Don't they know you're here?\" Umber asked, once again smiling." CR CR>
	       <TELL
"A brilliant thought crossed Praxix' mind, then left as quickly as it had
entered. \"No, we were separated in the fog this morning.\"" CR CR>
	       <TELL
"\"Ah. Did I hear you say 'trapped'?\" Umber asked, smile waning." CR CR>
	       <TELL
"\"Yes, trapped. The bridge collapsed as I crossed it. So unless you're
up for a swim in the moat...,\" was Praxix' reply, and it left Umber at
a loss for words and smiles.">
	       <END-OPTION>)
	      (DECLINE
	       <HINT ,HINT-UMBER>
	       <TELL
"\"I'm sorry, but I think not,\" Praxix replied as graciously as
possible." CR CR>
	       <TELL
"\"Well, then. Perhaps we shall meet again!\" the young man replied,
and walked out of sight." CR CR>
	       <TELL
"\"And perhaps not,\" Praxix said, with a wave of his hand. He heaved
a sigh of relief, and pondered what he should do next.">
	       <END-OPTION>)
	      (<SENDING-SIGNAL?>
	       <PRAXIX-SENDS-SIGNAL>)>)>

<ROUTINE PRAXIX-SENDS-SIGNAL ("AUX" CHR CNT)
	 <TELL "And there, standing ">
	 <COND (<EQUAL? ,HERE ,CASTLE-COURTYARD>
		<TELL "in the middle of the courtyard">)
	       (<EQUAL? ,HERE ,INSIDE-MOAT>
		<TELL "at the edge of the moat">)
	       (T
		<TELL "on top of that high tower">)>
	 <TELL ", Praxix removed his pouch
of magical essences and cast the \"" AO "\" spell." CR CR>
	 <COND (<OBJECT? FAR-VISION-SPELL>
		<TELL
		 "The ball of flame shot out toward the horizon.">)
	       (<OBJECT? LIGHTNING-SPELL>
		<FSET ,LIGHTNING-SPELL ,SEEN>
		<TELL
"Dark clouds gathered round the castle, and soon bolts of lightning were
hitting the darkened earth.">)
	       (T
		<TELL
"Clouds gathered from nowhere, heavily laden with moisture. And then, the
rain started to fall, a heavy, soaking rain.">)>
	 <TELL " Praxix ">
	 <COND (<EQUAL? ,HERE ,CASTLE-COURTYARD ,INSIDE-MOAT>
		<TELL "watched, impassively">)
	       (T
		<TELL
"leaned over the edge of the turret, and stared off into the forest">)>
	 <TELL ", wondering whether there was anyone there to notice.">
	 <SETG PRAXIX-SIGNAL ,ACTION-OBJECT>
	 <SETG PRAXIX-SIGNAL-ROOM ,HERE>
	 ;"Make subgroup of the rest..."
	 <SETG SUBGROUP-MODE T>
	 <SETG UPDATE-FLAG T>
	 <RESTORE-TAG-OBJECTS>
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> ,PARTY-MAX>
			<RETURN>)
		       (<EQUAL? <SET CHR <GET ,PARTY .CNT>> ,PRAXIX>
			<FCLEAR .CHR ,SUBGROUP>)
		       (T
			<FSET .CHR ,SUBGROUP>)>>
	 <MOVE-TO ,GROUP-FOREST>>

<GLOBAL PRAXIX-SIGNAL <>>

<GLOBAL PRAXIX-SIGNAL-ROOM <>>

<ROOM CASTLE-TROVE
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-TROVE)
      (ENTER FSET-SEEN)
      (CAST-LIMIT 2)
      (ACTION
       <ACOND ()
	      (BACK
	       <TRAVEL-COMMANDS ,CASTLE-BASE ,UP-COMMAND ,COURTYARD-COMMAND>
	       <COND (<NOT <IN? ,SIXTH-STONE ,PRAXIX>>
		      <TELL
"Declining the offer to take some of the stones, ">)>
	       <TELL "Praxix suggested he had
seen enough; the two then ascended the stairs, arriving back at the
base of the turret.">
	       <COND (,PRAXIX-SIGNAL
		      <TELL
" They then took the few short steps back to the courtyard.">
		      <MOVE-TO ,CASTLE-COURTYARD>)
		     (T
		      <MOVE-TO ,CASTLE-BASE>)>)
	      (<AND <ACTION? USE-MIX>
		    <EQUAL? ,MIXTURE ,SPECIAL-VISION-SPELL>
		    <OBJECT? STONE-PILE>>
	       <MOVE ,SIXTH-STONE ,PRAXIX>
	       <UPDATE-REMOVE ,STONE-PILE>
	       <GRAPHIC <> ,G-TROVE-STONE ,TOP-RIGHT>
	       <TELL
"Praxix cast his mixture at the pile of stones, and for
an instant, it appeared that nothing would happen. And then, slowly, from
the middle of the pile, a dim glow appeared, strengthening with each
passing moment. Praxix scrambled onto the pile, shovelling stones away with
his bare hands until the source of light was revealed. It was a small black
stone, perfectly round, and glowing with a powerful dark light." CR CR>
	       <TELL
"\"The Earth Stone,\" he said, under his breath, taking the black stone
and placing it inside his cloak." CR CR>
	       <TELL
"\"Pardon me,\" Umber said, \"but did you just say 'Erstin'? I once knew
a man with that name, but I wouldn't think he'd be an acquaintance of
yours.\"" CR CR>
	       <TELL
"\"Yes, of course,\" Praxix mumbled, without knowing why. But it had the desirable
effect of ending the conversation, as Umber could find nothing beyond a befuddled
\"Ah\" to reply.">
	       <MIXTURE-CAST>)>)>	

<OBJECT STONE-PILE
	(LOC CASTLE-TROVE)
	(SDESC "stones")
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"There were thousands upon thousands of stones in the chest, of all
colors, shapes, and sizes. A profitable business for Umber, to be
sure." CR CR>
		 <TELL
"\"Not too valuable, I would say,\" Umber said, picking up a few more
of the stones. \"But don't let the townsfolk know it!\"">)>)>	 

<OBJECT CASTLE-DUNGEON-CELLS
	(LOC CASTLE-DUNGEON)
	(FLAGS DONT-TAKE)
	(SDESC "cells")
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Praxix went through each of the cells in the dungeon, finding only rusted
chains and manacles. Perhaps there had been prisoners here in days long past,
but their remains would long since have turned to dust.">)>)>	

<ROOM CASTLE-DUNGEON
      (TRAVEL-COMMANDS UP-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-DUNGEON)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<AND <IN-PARTY? ,UMBER>
			    <NOT <QSET? ,HERE ,SCOUTED>>>
		       <TELL CR CR
"The dungeons were dark and damp, but Umber was as cheerful as ever.
\"There are many secrets in these dungeons,\" he said. \"If you
give me your word you will tell no one, I will show you my favorite.\"" CR CR>
		       <TELL
"Praxix agreed, and Umber led him to the farthest of the dungeon cells.
Then, he removed one of the blocks in the cell wall, and reached for an
unseen lever that was hidden behind. As he did so, the entire wall slid
aside, revealing a large chamber." CR CR>
		       <TELL
"The chamber was bare, save the rusted manacles hanging from the walls,
but in the center sat a large chest, brimming with precious stones." CR CR>
		       <TELL
"\"I see you have been here before,\" Praxix said, with the slightest
hint of sarcasm." CR CR>
		       <TELL
"\"Many times,\" Umber responded, \"I make my living selling
these stones. I figure it's safer to leave the bulk of them here so
that folks back in town don't get too suspicious. Every week or so, I
come here and pick up a few dozen.\"">
		       <MOVE-TO ,CASTLE-TROVE>)>>)
      (ACTION
       <ACOND ()
	      (UP
	       <TELL
"Disappointed at having found nothing of interest, Praxix climbed the
crumbling stairs and was soon ">
	       <COND (<NOT <FSET? ,CASTLE-TOWER ,SEEN>>
		      <TELL "atop the tower.">
		      <MOVE-TO ,CASTLE-TOWER>)
		     (T
		      <TELL "back at ground level.">
		      <MOVE-TO ,CASTLE-BASE>)>)>)>

<OBJECT TALKING-TREE
	(LOC TREE-FORK)
	(SDESC "talking tree")
	(8DESC "tree")
	(KBD %<ASCII !\T>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" examined the talking tree skeptically, walking around it as an art expert
would a hideous piece of sculpture, but finally arrived at the
inescapable conclusion that this was indeed a talking tree, about seven
feet in height, neatly trimmed, and covered in wide, oddly shaped leaves.">)>)>

<END-SEGMENT>

<BEGIN-SEGMENT MILL>

;"New mill puzzle..."

<COMMAND (CONTROL-ROOM CONTROLS)>

<ROOM XFER-JCN
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND BACK-COMMAND)
      (FLAGS UNDERGROUND)
      (GRAPHIC G-XFER-JCN)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (BACK:REMOVE
	       <TELL
"It was no use; no matter how Praxix tried, he could not move enough debris to
make his escape possible.">)
	      (LEFT
	       <FIRST-XFER-ANTE>
	       <MOVE-TO ,XFER-1-ANTE>)
	      (<OR <ACTION? RIGHT>
		   <ACTION? CONTROL-ROOM>>
	       <TELL
"A narrow doorway led Praxix into a small, closetlike chamber. On one wall, a
large glass window overlooked a shallow pit. Otherwise, the room was bare
except for a strange device mounted against another of the walls.">
	       <MOVE-TO ,XFER-MASTER>
	       <CHANGE-TRAVEL-COMMAND ,XFER-JCN
				      ,RIGHT-COMMAND
				      ,CONTROL-ROOM-COMMAND>
	       <RTRUE>)>)>

<ROUTINE FIRST-XFER-ANTE ()
	 <TELL
"The passage led onward and around a corner until it reached a protective railing,
over or under which a shallow pit could be entered. Looking back, he could see ">
	 <COND (<FSET? ,XFER-MASTER ,SEEN>
		<TELL "the window of the control room.">)
	       (T
		<TELL "a large plate window behind which it was impossible to see.">)>
	 <TELL
" Before him, the passage continued out of sight into the darkness.">
	 <COND (<NOT <QSET? ,XFER-1-ANTE ,SEEN>>
		<TELL
" Everything here was drab and nondescript; the walls and floor of the passage
were covered in countless layers of dust and grime. It had clearly been ages since
these halls had been visited.">)>>

<COMMAND (BACK-TO-PITS BACK-PITS)>

<ROOM XFER-MASTER
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (REFRESH COMPLETE-DIAL-GRAPHICS)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<NOT <FSET? ,XFER-CONTROLS ,SEEN>>
		       <GRAPHIC ,G-XFER-MASTER>)
		      (T
		       ;"This sequence should show the dial with settings..."
		       <COMPLETE-DIAL-GRAPHICS>)>>)
		
      (ACTION
       <ACOND ()
	      (<OR <ACTION? BACK>
		   <ACTION? BACK-TO-PITS>>
	       <COND (<NOT <QSET? ,HERE ,BLACK-MIX>>
		      <TELL
"Praxix then left this control room, or whatever it was, and reached the base
of the crumbled stairs. Seeing no way of getting through in that direction, he
started down the other path." CR CR>
		      <CHANGE-TRAVEL-COMMAND ,HERE
					     ,BACK-COMMAND
					     ,BACK-TO-PITS-COMMAND
					     T>
		      <FIRST-XFER-ANTE>)
		     (T
		      <TELL
"It took only a few moments for Praxix to pass the rubble of the stairs and continue
onward to the railing above the shallow pit.">)>
	       <MOVE-TO ,XFER-1-ANTE>)>)>

<ROUTINE COMPLETE-DIAL-GRAPHICS ()
	 <SETG CURRENT-GRAPHIC <>>
	 <GRAPHIC ,G-XFER-CONTROLS>
	 <DIAL-GRAPHICS>>

<ROUTINE DIAL-GRAPHICS ()
	 <GRAPHIC <>
		  <GETP <GET ,RUNE-TBL ,LEFT-DIAL> ,P?GRAPHIC>
		  ,TOP-LEFT>
	 <GRAPHIC <>
		  <GETP <GET ,RUNE-TBL ,RIGHT-DIAL> ,P?GRAPHIC>
		  ,TOP-RIGHT>>

<GLOBAL LEFT-DIAL 4>
<GLOBAL RIGHT-DIAL 5>
<GLOBAL BUTTON-PUSHED <>>

<GLOBAL XFER-TBL
	<LTABLE XFER-1 XFER-2 XFER-3 NXFER-1 NXFER-2 NXFER-3>>

<CONSTANT PRAXIX-NO-DIAL
"Slowly, Praxix twisted the dial on the right, but ended up leaving it
pointing to the ">

<COMMAND RIGHT-DIAL O-DIAL ()
	 <COND (<EQUAL? ,RIGHT-DIAL <GETP ,ACTION-OBJECT ,P?TEMP>>
		<TELL ,PRAXIX-NO-DIAL>
		<TELL AO " rune.">)
	       (T
		<SETG RIGHT-DIAL <GETP ,ACTION-OBJECT ,P?TEMP>>
		<TELL-DIAL "right">)>>

<COMMAND LEFT-DIAL O-DIAL ()
	 <COND (<EQUAL? ,LEFT-DIAL <GETP ,ACTION-OBJECT ,P?TEMP>>
		<TELL ,PRAXIX-NO-DIAL>
		<TELL AO " rune.">)
	       (T
		<SETG LEFT-DIAL <GETP ,ACTION-OBJECT ,P?TEMP>>
		<TELL-DIAL "left">)>>

<ROUTINE TELL-DIAL (STR)
	 <SETG FIDDLED-WITH-DEVICE T>
	 <TELL
"Slowly, Praxix twisted the dial on the " .STR " until its pointer was aimed
directly at the ">
	 <TELL D ,ACTION-OBJECT " rune.">
	 ;"Redraw the pictures..."
	 <COMPLETE-DIAL-GRAPHICS>
	 <RTRUE>>

<COMMAND WAIT <> ()
	 <TELL
"As Praxix waited, the droning noise grew ever louder.">
	 <SETG I-BUTTON-PUSH-FLAG 100>
	 <RTRUE>>

<GLOBAL FIDDLED-WITH-DEVICE <>>

<COMMAND (PUSH-BUTTON PUSH-BUT'N) <> ()
	 <CHANGE-TRAVEL-COMMAND ,HERE
				,PUSH-BUTTON-COMMAND
				,WAIT-COMMAND>
	 <SETG BUTTON-PUSHED T>
	 <SETG FIDDLED-WITH-DEVICE T>
	 <QUEUE I-BUTTON-PUSH -1>
	 <TELL
"Praxix pushed the button, and it appeared that nothing was happening. A dull
droning noise, however, could soon be discerned, and it grew stronger as the
moments passed.">
	 <RTRUE>>

<GLOBAL I-BUTTON-PUSH-FLAG -1>

<OBJECT I-BUTTON-PUSH
	(TIME 0)
	(ACTION
	 <EXECUTE ("AUX" FROM TO)
		  <SETG I-BUTTON-PUSH-FLAG <+ ,I-BUTTON-PUSH-FLAG 1>>
		  <COND (<EQUAL? ,I-BUTTON-PUSH-FLAG 1>
			 <TELL CR CR
"The droning was now quite loud and echoed throughout the chamber.">)
			(<G? ,I-BUTTON-PUSH-FLAG 1>
			 <SETG BUTTON-PUSHED <>>
			 <SETG I-BUTTON-PUSH-FLAG -1>
			 <REMOVE ,I-BUTTON-PUSH>
			 <CHANGE-TRAVEL-COMMAND ,XFER-MASTER
						,WAIT-COMMAND
						,PUSH-BUTTON-COMMAND>
			 <TELL CR CR
"The droning noise had grown to an overwhelming intensity when it suddenly
stopped. The silence in these dark halls was now nearly as deafening.">
			 <SET FROM <GET ,XFER-TBL ,LEFT-DIAL>>
			 <SET TO <GET ,XFER-TBL ,RIGHT-DIAL>>
			 <COND (<EQUAL? .TO .FROM> T)
			       (<AND <EQUAL? ,HERE ,XFER-MASTER>
				     <FIRST? .FROM>
				     <EQUAL? .TO ,XFER-1>>
				<TELL CR CR
"But something peculiar caught Praxix' eye as he looked through the glass and
down into the pit below. Something was down there, but he couldn't tell what.">)
			       (<EQUAL? ,HERE .FROM>
				<MOVE-TO .TO>
				<TELL CR CR>
				<COND (<NOT <QSET? ,XFER-MASTER ,TRAPPED>>
				       <TELL
"You can well imagine Praxix' surprise when he">)
				      (T
				       <TELL
"Suddenly, though unsurprisingly, Praxix">)>
				<TELL
" found himself standing at the bottom of a ">
				<COND (<EQUAL? .TO ,XFER-1>
				       <TELL "shallow">)
				      (T
				       <TELL "seemingly bottomless">)>
				<TELL " pit.">
				<XFER-OBJECTS-CHECK .TO>
				<COND (<FIRST? .FROM>
				       <TELL " Not only that, but everything
that had been on the ground before was now here as well.">)>
				<COND (<EQUAL? .TO ,XFER-3>
				       <TELL
" Fortunately, a shaft of light piercing the darkness indicated an exit
nearby.">)
				      (T
				       <SETG XFER-TRAP T>)>)
			       (<AND <EQUAL? ,HERE .TO>
				     <FIRST? .FROM>>
				<TELL CR CR>
				<COND (<NOT <QSET? ,XFER-MASTER ,DEAD>>
				       <TELL
"You can well imagine Praxix' surprise when ">)
				      (T
				       <TELL
"Praxix was merely startled this time, as ">)>
				<LIST-CONTENTS .FROM>
				<TELL " suddenly appeared on the ground beside him.">)>
			 <SETG UPDATE-FLAG T>
			 <MOVE-ALL .FROM .TO>)>>)>
			
<GLOBAL XFER-TRAP <>>

<CONSTANT DIAL-O-TABLE <LTABLE TOP-RUNE UPPER-LEFT-RUNE LOWER-LEFT-RUNE
			       UPPER-RIGHT-RUNE LOWER-RIGHT-RUNE BOTTOM-RUNE>>

<ROUTINE O-DIAL ()
	 <COPYT ,DIAL-O-TABLE ,O-TABLE 14>>

<GLOBAL INITIAL-RUNE-TBL <LTABLE 0 TOP-RUNE UPPER-LEFT-RUNE LOWER-LEFT-RUNE
				 UPPER-RIGHT-RUNE LOWER-RIGHT-RUNE BOTTOM-RUNE>>

<GLOBAL RUNES-SET <>>

<ROUTINE INIT-RUNES ("AUX" (CNT 0) RUNE)
	 <COND (,RUNES-SET <RTRUE>)>
	 <SETG RUNES-SET T>
	 <SETG LEFT-DIAL <RANDOM 6>>
	 <SETG RIGHT-DIAL <RANDOM 6>>
	 <REPEAT ()
	    <COND (<G? <SET CNT <+ .CNT 1>> 6>
		   <RETURN>)
		  (T
		   <SET RUNE <PICK-ONE ,INITIAL-RUNE-TBL>>
		   <PUTP .RUNE ,P?TEMP .CNT>
		   <PUT ,RUNE-TBL .CNT .RUNE>)>>>

<GLOBAL RUNE-TBL <LTABLE 0 0 0 0 0 0>>

<OBJECT TOP-RUNE
	(SDESC "top")
	(KBD %<ASCII !\T>)
	(TEMP 0)
	(GRAPHIC G-RUNE-TOP)>

<OBJECT UPPER-LEFT-RUNE
	(SDESC "upper left")
	(8DESC "up left")
	(KBD %<ASCII !\U>)
	(TEMP 0)
	(GRAPHIC G-RUNE-UL)>

<OBJECT LOWER-LEFT-RUNE
	(SDESC "lower left")
	(8DESC "low left")
	(KBD %<ASCII !\L>)
	(TEMP 0)
	(GRAPHIC G-RUNE-LL)>

<OBJECT UPPER-RIGHT-RUNE
	(SDESC "upper right")
	(8DESC "up right")
	(KBD %<ASCII !\U>)
	(TEMP 0)
	(GRAPHIC G-RUNE-UR)>

<OBJECT LOWER-RIGHT-RUNE
	(SDESC "lower right")
	(8DESC "low right")
	(KBD %<ASCII !\L>)
	(TEMP 0)
	(GRAPHIC G-RUNE-LR)>

<OBJECT BOTTOM-RUNE
	(SDESC "bottom")
	(KBD %<ASCII !\B>)
	(TEMP 0)
	(GRAPHIC G-RUNE-BOT)>

<OBJECT XFER-CONTROLS
	(LOC XFER-MASTER)
	(SDESC "device")
	(KBD %<ASCII !\D>)
	(FLAGS DONT-TAKE DONT-CAST)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <COND (<NOT <QSET? ,XFER-CONTROLS ,EXAMINED>>
			<FSET ,XFER-CONTROLS ,SEEN>
			<COMPLETE-DIAL-GRAPHICS>
			<TELL
"Two devices that resembled dials of some sort were imbedded in the wall of the
chamber. Around each of the dials were the same six peculiar runes, in a language
that he could not recognize. Below and between the two dials sat a short, stubby,
black button.">
			<PUTP ,ACTION-OBJECT ,P?SDESC "dials">
			<SETG UPDATE-FLAG T>
			<TRAVEL-COMMANDS ,HERE
					 ,BACK-COMMAND
					 ,LEFT-DIAL-COMMAND
					 ,RIGHT-DIAL-COMMAND
					 ,PUSH-BUTTON-COMMAND>)>)>)>

<ROOM NXFER-1
      (TRAVEL-COMMANDS UP-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (GRAPHIC G-DARK-CAVERN)
      (ACTION NXFER)>

<ROOM NXFER-2
      (TRAVEL-COMMANDS UP-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (GRAPHIC G-DARK-CAVERN)
      (ACTION NXFER)>

<ROOM NXFER-3
      (TRAVEL-COMMANDS UP-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (GRAPHIC G-DARK-CAVERN)
      (ACTION NXFER)>

<ROUTINE NXFER ()
	 <COND (<AND <ACTION? CAST>
		     <OBJECT? LEVITATE-SPELL>>
		<COND (<OR <EQUAL? ,HERE ,NXFER-1 ,NXFER-2 ,NXFER-3>
			   <NOT <CHECK-ESSENCES ,LEVITATE-SPELL 3>>>
		       <TELL
"With few options indeed, Praxix used all of his remaining powders to elevate
himself out of the pit. Sadly, he rose upward and upward without ever finding
a way out." CR CR>
		       <SETG ACTION ,UP-COMMAND>
		       <AGAIN>)
		      (T
		       ;"Run up a bunch of use..."
		       <USE-ESSENCES ,LEVITATE-SPELL>
		       <USE-ESSENCES ,LEVITATE-SPELL>
		       <TELL
"It took quite a lot of powders, perhaps three times what he might have
ordinarily used, but Praxix finally managed to elevate himself out of the
pit and back behind the railing. He could see that he was at the middle of
the three pits, but was grateful indeed to be anywhere at all.">
		       <MOVE-TO ,XFER-2-ANTE>)>)		       
	       (<ACTION? UP>
		<TELL
"Praxix tried in vain to extricate himself from that deep hole, but there
simply wasn't any way he could think of. He died in that pit, cold and alone,
after eight days." CR CR>
		<TELL
"It is odd, certainly, that we should have know this story at all, but Astrix,
when next we met him, knew it as though he had been with Praxix himself, which
would not entirely surprise me. Much is not known to us, especially the ways
of those like Astrix." CR CR>
		<TELL
"There is not much more to tell. Astrix became disconsolate at our failure, and
sat long and silently before he next spoke." CR CR>
		<HINT ,HINT-MILL-TRAPPED>
		<PART-ONE-BAD-ENDING>)>>

<ROUTINE TELL-ANTE-RUNE (CNT)
         <TELL
" Alongside the opening to the chamber below was ">
	 <COND (<FSET? ,XFER-CONTROLS ,SEEN>
		<TELL "the " D <GET ,RUNE-TBL .CNT>>
		<TELL " rune from the dials in the control room.">)
	       (T
		<TELL "an unfamiliar rune.">)>>

<ROOM XFER-1-ANTE
      (TRAVEL-COMMANDS PROCEED-COMMAND DOWN-COMMAND BACK-COMMAND)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<SETG CURRENT-GRAPHIC <>>
		<GRAPHIC ,G-XFER-ANTE>
		<COND (<FSET? ,XFER-MASTER ,SEEN>
		       <REMOVE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>
		       <FORCE-TRAVEL-COMMAND ,HERE ,CONTROL-ROOM-COMMAND>)>
		<COND (<FSET? ,XFER-MASTER ,SOLVED>
		       <TELL-ANTE-RUNE 1>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"Continuing down the passageway, Praxix came to another railing separating him
from a rather more precipitous drop than at the previous pit. In fact, he could
not discern a bottom anywhere.">
	       <MOVE-TO ,XFER-2-ANTE>)
	      (DOWN
	       <COND (<NOT <FSET? ,XFER-1 ,SOLVED>>
		      <TELL
"With an agility that belied his advancing years, Praxix flung himself over
the railing and down into the pit below. To his amazement, long strips of
fire and earth essences coursed through the rock. It would be quite a haul,
indeed, if he could mine any of the precious material.">)
		     (T
		      <TELL
"Praxix again flung himself over the railing and down into the pit below.">)>
	       <XFER-OBJECTS-CHECK ,XFER-1>
	       <MOVE-TO ,XFER-1>)
	      (<OR <ACTION? BACK>
		   <ACTION? CONTROL-ROOM>>
	       <COND (<NOT <FSET? ,XFER-MASTER ,SEEN>>
		      <TELL
"Praxix now retraced his steps to the base of the fallen stairs. Having little
choice, he entered the narrow doorway into a small, closetlike chamber. On one wall, a
large glass window overlooked a shallow pit. Otherwise, the room was bare
except for a strange device mounted against another of the walls.">)
		     (T
		      <TELL
"Then, Praxix quickly retraced his steps back to the control room.">)>
	       <MOVE-TO ,XFER-MASTER>)
	      (<AND <ACTION? CAST>
		    <OBJECT? WIND-SPELL>
		    <NOT <FSET? ,XFER-MASTER ,ENCHANTED>>>
	       <DO-XFER-WIND>)>)>

<ROUTINE XFER-OBJECTS-CHECK (RM)
	 <COND (<FIRST? .RM>
		<TELL " There beside him at the bottom of the pit was ">
		<LIST-CONTENTS .RM>
		<TELL ".">)>>

<ROUTINE DO-XFER-WIND ()
	 <FSET ,XFER-MASTER ,SOLVED>
	 <TELL
"Thinking that some wind would remove the thick layers of dirt and dust that had
accumulated everywhere, Praxix cast his wind spell. Within seconds, a gale arose,
choking the air with a dense plume of dust, and making both breathing and seeing
nearly impossible. Fortunately, it subsided before long, and Praxix was able to
again see clearly. What he found was a previously hidden rune chiselled into the
wall beside the opening to the chamber below: it ">
	 <COND (<NOT <FSET? ,XFER-CONTROLS ,SEEN>>
		<TELL "looked entirely unfamiliar.">
		<RTRUE>)
	       (<EQUAL? ,HERE ,XFER-1-ANTE>
		<TELL "looked exactly like the " D <GET ,RUNE-TBL 1>>)
	       (<EQUAL? ,HERE ,XFER-2-ANTE>
		<TELL "looked exactly like the " D <GET ,RUNE-TBL 2>>)
	       (T
		<TELL "was too worn to be read.">
		<RTRUE>)>
	 <TELL " rune he had seen on the strange dials back in the control room.">>

<COMMAND MINE-ROCK>

<ROUTINE FORCE-MINE-ROCK ()
	 <COND (<AND <EQUAL? <LOC ,PICK-AXE> ,HERE ,INVENTORY>
		     <NOT <FSET? ,XFER-1 ,SOLVED>>>
		<FORCE-TRAVEL-COMMAND ,HERE ,MINE-ROCK-COMMAND>)>>

<ROOM XFER-1
      (TRAVEL-COMMANDS MINE-ROCK-COMMAND UP-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (GRAPHIC G-DARK-CAVERN)
      (ENTER <EXECUTE () <FSET ,HERE ,SEEN> <FORCE-MINE-ROCK>>)
      (CLOCK FORCE-MINE-ROCK)
      (ACTION
       <ACOND ()
	      (MINE-ROCK:REMOVE
	       <COND (<EQUAL? <LOC ,PICK-AXE> ,HERE ,INVENTORY>
		      <FIND-ESSENCE ,ESSENCE-FIRE 5 ;4>
		      <FIND-ESSENCE ,ESSENCE-EARTH 5 ;4>
		      <FSET ,XFER-1 ,SOLVED>
		      <TELL
"Having the perfect tool at hand, Praxix gathered as much of the rock
containing the earth and fire essences as was practical, considering the great
deal of time necessary to crush the rocks down into powder. Rather than spend
the rest of the day at it, he settled for taking a moderate amount of each." CR CR>
		      <TELL
"\"Not bad for a day's work,\" he said aloud, as he climbed out of the pit
and stood again alongside the railing. \"Now, my only problem is getting
out of this place alive.\"">
		      <MOVE-TO ,XFER-1-ANTE>)
		     (T
		      <TELL
"The only problem for Praxix was that the rock in which the essences were
embedded was harder than any other he had come across. There was no chance
he would be able to mine the rocks without the proper tools.">)>)
	      (<AND <ACTION? CAST>
		    <OBJECT? TREMOR-SPELL>>
	       <TELL
"Thinking that his tremor spell might shake some of the rocks loose, Praxix
carefully measured out a small amount of earth essence and cast it at the
ground. The ensuing tremor nearly caused an avalanche of its own, without
so much as budging the rocks in which he had such a keen interest.">) 
	      (UP
	       <TELL
"Finished with his examination of the pit, Praxix clambered up the side walls and
was soon back on the other side of the railing.">
	       <MOVE-TO ,XFER-1-ANTE>)>)>

<ROOM XFER-2-ANTE
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND DOWN-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<SETG CURRENT-GRAPHIC <>>
		<GRAPHIC ,G-XFER-ANTE>
		<COND (<FSET? ,XFER-MASTER ,SEEN>
		       <FORCE-TRAVEL-COMMAND ,HERE ,CONTROL-ROOM-COMMAND>)>
		<COND (<FSET? ,XFER-MASTER ,SOLVED>
		       <TELL-ANTE-RUNE 2>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"The passageway ended abruptly before him at the site of yet another railing
and associated pit. From the looks of things, an avalanche had permanently
sealed the way to what could only be presumed to be another set of pits. As
he leaned on the railing, ">
	       <COND (<NOT <FSET? ,XFER-MASTER ,SOLVED>>
		      <TELL
"resting his elbows into an inch or so of accumulated dust, ">)>
	       <TELL
"he peered down into the depths of the pit and discerned a narrow shaft
of sunlight piercing the darkness.">
	       <MOVE-TO ,XFER-3-ANTE>)
	      (CONTROL-ROOM
	       <TELL
"In a matter of moments, Praxix had retraced his steps back to the control room.">
	       <MOVE-TO ,XFER-MASTER>)
	      (BACK
	       <TELL
"In just a few moments, Praxix was back at the first of the pits.">
	       <MOVE-TO ,XFER-1-ANTE>)
	      (DOWN:REMOVE
	       <TELL
"Getting down into the pit would pose something of a dilemma for Praxix. It was
painfully obvious that falling or jumping into the pit would mean certain
death.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <XFER-DESCEND ,XFER-2>)
	      (<AND <ACTION? CAST>
		    <OBJECT? WIND-SPELL>
		    <NOT <FSET? ,XFER-MASTER ,ENCHANTED>>>
	       <DO-XFER-WIND>)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>>
	       <DO-XFER-FLARE ,XFER-2>)>)>

<ROUTINE XFER-DESCEND (RM)
	 <USE-ESSENCES ,LEVITATE-SPELL>
	 <USE-ESSENCES ,LEVITATE-SPELL>
	 ;"We'll check both of these manually..."
	 <FCLEAR ,ESSENCE-AIR ,USED-UP>
	 <FCLEAR ,ESSENCE-EARTH ,USED-UP>
	 <TELL
"Knowing full well the futility of descending into the pit by conventional means,
Praxix decided to try his levitation spell in reverse by casting small amounts
of his mixture on himself as he fell feet first into the pit." CR CR>
	 <TELL
"This rather unorthodox procedure worked, but at the expense of a great deal of
magical powders, so much so that he was now ">
	 <COND (<AND <NOT <IN? ,ESSENCE-AIR ,ESSENCES>>
		     <NOT <IN? ,ESSENCE-EARTH ,ESSENCES>>>
		<TELL "out of both earth and air essences">)
	       (<NOT <IN? ,ESSENCE-AIR ,ESSENCES>>
		<TELL "out of air essence">)
	       (<NOT <IN? ,ESSENCE-EARTH ,ESSENCES>>
		<TELL "out of earth essence">)
	       (T
		<TELL "getting fairly low on both air and earth essences">)>
	 <FSET ,XFER-3 ,SCOUTED>
	 <TELL ".">
	 <XFER-OBJECTS-CHECK .RM>
	 <COND (<FSET? ,XFER-1 ,SOLVED>
		<TELL CR CR
"\"There must be a better way,\" Praxix said, brushing himself off. \"Whoever
used this place would hardly be dropping into pits this way!\"">)>
	 <MOVE-TO .RM>>

<ROUTINE DO-XFER-FLARE (RM)
	 <TELL
"Praxix now cast his flare spell into the pit, lighting its walls with
a brilliant red-orange glow. The pit was deep - very deep, ">
	 <COND (<NOT <EQUAL? .RM ,XFER-3>>
		<TELL "with no sign of exits.">)
	       (T
		<TELL "with a single shaft of light giving evidence that some
exit might be found at the bottom.">)>
	 <COND (<FIRST? .RM>
		<TELL
" As the fireball hit the bottom, its light glanced off of something lying
on the ground. Its identity, however, was a mystery, for it was too far away
to discern clearly.">)>
	 <RTRUE>>

<ROOM XFER-2
      (TRAVEL-COMMANDS UP-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (GRAPHIC G-DARK-CAVERN)
      (ACTION NXFER)>

<OBJECT PICK-AXE
	(LOC XFER-2)
	(SDESC "pick-axe")
	(KBD %<ASCII !\P>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"At this point, Praxix examined the axe more carefully. It was nearly new, though,
like everything else, it was covered in dust.">)
		(PICK-UP
		 <COND (<NOT <QSET? ,PICK-AXE ,USED-UP>>
			<TELL
"\"This should come in rather useful,\" Praxix said, as he picked up the pick
axe and slung it over his shoulder.">)
		       (T
			<TELL
"Praxix then picked up the pick-axe and slung it over his shoulder, as he had
done before.">)>
		 <UPDATE-MOVE ,PICK-AXE ,INVENTORY>)
		(DROP
		 <UPDATE-REMOVE ,PICK-AXE>
		 <TELL
"Rather than carry the pick-axe any longer, Praxix rested it against a nearby
wall.">)>)>	

<ROOM XFER-3-ANTE
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND DOWN-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<SETG CURRENT-GRAPHIC <>>
		<GRAPHIC ,G-XFER-ANTE ,G-XFER-ANTE-LIGHT ,BOTTOM-RIGHT>		
		<COND (<FSET? ,XFER-MASTER ,SEEN>
		       <FORCE-TRAVEL-COMMAND ,HERE ,CONTROL-ROOM-COMMAND>)>
		<COND (<FSET? ,XFER-MASTER ,SOLVED>
		       <TELL
" Alongside the opening to the chamber below was a rune that had been obliterated by
the passage of the long years.">)>>)
      (ACTION
       <ACOND ()
	      (PROCEED:REMOVE
	       <TELL
"It didn't take more than two looks at the debris before him for Praxix to realize
that he wasn't going any further in this direction.">)
	      (BACK
	       <TELL
"Quickly, Praxix retreated to the middle of the three pits.">
	       <MOVE-TO ,XFER-2-ANTE>)
	      (CONTROL-ROOM
	       <TELL
"Quickly, Praxix passed by the two other pits as he made his way back to the
control room.">
	       <MOVE-TO ,XFER-MASTER>)
	      (DOWN:REMOVE
	       <TELL
"Getting down into the pit would pose something of a dilemma for Praxix. It was
painfully obvious that falling or jumping into the pit would mean certain
death.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <XFER-DESCEND ,XFER-3>)
	      (<AND <ACTION? CAST>
		    <OBJECT? WIND-SPELL>
		    <NOT <FSET? ,XFER-MASTER ,ENCHANTED>>>
	       <DO-XFER-WIND>)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>>
	       <DO-XFER-FLARE ,XFER-3>)>)>

<COMMAND (FOLLOW-LIGHT FIND-LIGHT)>

<ROOM XFER-3
      (TRAVEL-COMMANDS FOLLOW-LIGHT-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DONT-CAST)
      (GRAPHIC G-MINER-PASSAGE)
      (ACTION
       <EXECUTE ("AUX" TMP)
		<COND (<ACTION? FOLLOW-LIGHT>
		       <COND (<IN? ,PICK-AXE ,INVENTORY>
			      <REMOVE ,PICK-AXE>
			      <TELL
"Having no further need for the pick-axe, Praxix dropped it on the ground. He
then started following the stream of light, following a dirt path. ">)>
		       <TELL
"The path wound its way up a crumbling set of stairs, but these soon were nearly
unrecognizable. Clambering the rest of the way back to ground level, he finally
extricated himself from the ground about one hundred paces away from the mill
itself. And as he looked back toward the large grinding wheel, he realized that
he had been dead wrong from the outset." CR CR>
		       <TELL
"\"The mill is not for grains at all,\" he said aloud, \"but for milling
the stones of magical essences! To think I've been exploring a magic mine!\"" CR CR>
		       <COND (,REJOINED
			      <TELL
"You can imagine our relief at seeing our Wizard friend again, for it had been
quite some time since he had disappeared into the mill's mechanism, triggering the
avalanche that prevented us from following him." CR CR>
			      <TELL
"\"Come, come, don't stand there gawking,\" he said, wagging his finger at us.
\"We still have much to do.\"" CR CR>)> 
		       ;<RESTORE-TAG-OBJECTS>
		       <FCLEAR ,TAG ,SHADOW>
		       <SET TMP <+ <PARTY-PCM ,PRAXIX> 1>>
		       <PUT ,PARTY <PARTY-PCM ,TAG-SWAP-CHR> ,TAG>
		       <PUT ,PARTY .TMP ,TAG-SWAP-CHR>
		       <SCENE <>>
		       <LEAVE-MILL-AREA>)
		      (T
		       <NXFER>)>>)>

