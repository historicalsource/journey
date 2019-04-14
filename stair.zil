"STAIR for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT STAIR>

<GLOBAL STAIR-TO-PRISON? <>>

<ROOM STAIR-JUNCTION
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND DOWN-COMMAND)
      (GRAPHIC G-STAIR-JUNCTION)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (RIGHT
	       <TELL
"After another long climb, the stairs ended blindly. ">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"\"We have come to the Bern i-Zar,\" Hurth said, motioning to the
blank wall that stood before us." CR CR>
		      <TELL
"\"It figures,\" I blurted out; Hurth laughed gently, then spoke
the word of command that opened the gate.">)
		     (T
		      <TELL
"Praxix approached the blank wall that lay before us, and sure
enough, a gate appeared, then opened." CR CR>
		      <TELL
"\"I don't believe I ever will get used to these gates,\" I said,
and Praxix smiled.">)>  
	       <MOVE-TO ,BERN-I-DEN>)
	      (LEFT
	       <COND (<FSET? ,STAIR-CHASM ,SEEN>
		      <REMOVE-TRAVEL-COMMAND>
		      <TELL
"Again, we made the strenuous and dizzying climb to the crumbling
stairs." CR CR>
		      <TELL
"\"I am not inclined to do this again,\" Bergon said, panting. \"Let
us find some way across the chasm or explore elsewhere.\"">)
		     (T
		      <TELL
"The left stair rose in tighter and tighter spirals, the
air thinning as we went. Not long before we had hoped to
reach the top, the stairs had crumbled and an abyss, perhaps
ten paces wide, yawned before us. Beyond that, the stairs
continued their seemingly endless climb.">)>
	       <MOVE-TO ,STAIR-CHASM>)
	      (DOWN:REMOVE
	       <TELL
"Unsure of whether we had seen all there was to see in the lower parts
of the caverns, we determined to return to the bottom of the stairs and
continue our explorations."> 
	       <MOVE-TO ,STAIR-BOTTOM>)>)>

<ROOM BERN-I-DEN
      (TRAVEL-COMMANDS EXIT-COMMAND DOWN-COMMAND NUL-COMMAND)
      (GRAPHIC G-STAIR-GATE)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ENTER
       <EXECUTE ()
		<COND (<AND <NOT <TRAVEL-COMMAND? ,STAIR-JUNCTION ,DOWN-COMMAND>>
			    <NOT <TRAVEL-COMMAND? ,STAIR-JUNCTION ,LEFT-COMMAND>>>
		       <REMOVE-TRAVEL-COMMAND ,HERE ,DOWN-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (EXIT
	       <UPDATE-REMOVE ,TALE-BERN-I-ELAN>
	       <TELL
"We stepped out of the Bern i-Zar, the Mountain Gate, late in the
evening. It was a cold, windy night, filled with countless stars.">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL CR CR
"Hurth stood at the gate. \"I cannot go on, as much as I might
wish it; this is the command of Agrith. And yet, you are good
friends and shall always be welcome in these halls.\" He
embraced us all in the Dwarf-fashion, turned, and started back
into the gate. \"May the earth give you speed!\" he said as
the great door closed behind him.">)
		     (<IN-PARTY? ,MINAR>
		      <TELL CR CR
"Our camp had been long silent when Minar spoke. \"I grieve for
the Dwarf,\" he said, \"though I knew him not. He was a brave man,
and his reckless murder will not go unavenged.\"" CR CR>
		      <TELL
"\"The success of our journey will be our best revenge,\" replied
Bergon. \"And I hope it will bring Hurth peace.\"">)>
	       <TELL CR CR
"We spoke much of Hurth that evening, as we lay there beneath
the moonlit sky.">
	       <COND (<NOT <IN-PARTY? ,HURTH>>
		      <TELL
" Praxix said, \"The Dwarves believe that after death, their souls
rise up into the heavens as shooting stars.\"" CR CR>
		      <TELL
"I laid awake for hours that night, eyes fixed on that twinkling
firmament, but I saw no shooting stars and, happily, I drifted off into
sleep.">)
		     (T
		      <PARTY-REMOVE ,HURTH>)>
	       <COND (<NOT <FSET? ,OUTSIDE-PRISON ,SEEN>>
		      <HINT ,HINT-PRISON>)
		     (<NOT <FSET? ,PRISON ,SEEN>>
		      <HINT ,HINT-RUNES>)>
	       <COND (<AND <FSET? ,STAIR-CHASM ,SEEN>
			   <NOT <FSET? ,FAR-CHASM ,SEEN>>>
		      <HINT ,HINT-CHASM>)>
	       <COND (<AND <NOT <LOC ,HINT-PRISON>>
			   <NOT <FSET? ,DARK-EVIL-CAVERN ,SOLVED>>>
		      <HINT ,HINT-EVIL-CAVERN>)>
	       <NEXT-DAY>
	       <COND (<AND ,2ND-PASS
			   <FSET? ,HIGH-PLAIN ,SEEN>>
		      <COND (<AND <NOT <FSET? ,BITE-FOREST ,SEEN>>
				  <OR <IN-PARTY? ,MINAR> <IN-PARTY? ,ESHER>>>
			     <TELL
"The next morning, we retraced our earlier steps, skirting the edge of the lake,
and descending back into the forest for our return to Astrix. It was soon midday,
and we decided to stop in a nearby clearing for some lunch.">
			     <MOVE-TO ,BITE-FOREST>
			     <RTRUE>)
			    (T
			     <TELL CR CR>
			     <N-DAY-TREK 4>
			     <RTRUE>)>)>
	       <TELL CR CR>
	       <GATE-TO-HIGH-PLAIN>)
	      (DOWN:REMOVE
	       <TELL
"Uncertain of whether we had explored enough of these caverns, we decended
to the junction of the two stairs.">
	       <MOVE-TO ,STAIR-JUNCTION>)>)>

<GLOBAL FLOATER <>>

<GLOBAL CHASM-STRAGGLER <>>

<COMMAND USE-MAGIC>
<COMMAND (LEAVE-BERGON LEAVE-BRG)>
<COMMAND (LEAVE-PRAXIX LEAVE-PRX)>
<COMMAND (LEAVE-HURTH LEAVE-HUR)>
<COMMAND (LEAVE-ESHER LEAVE-ESH)>
<COMMAND (LEAVE-MINAR LEAVE-MNR)>

<ROUTINE FIND-CHASM-STRAGGLER ("AUX" (A ,NUL-COMMAND))
	 <COND (<AND <IN-PARTY? ,ESHER>
		     <NOT <EQUAL? ,FLOATER <GETP ,ESHER ,P?ROBJ>>>>
		<SET A ,LEAVE-ESHER-COMMAND>)
	       (<AND <IN-PARTY? ,MINAR>
		     <NOT <EQUAL? ,FLOATER <GETP ,MINAR ,P?ROBJ>>>>
		<SET A ,LEAVE-MINAR-COMMAND>)
	       (<AND <IN-PARTY? ,HURTH>
		     <NOT <EQUAL? ,FLOATER <GETP ,HURTH ,P?ROBJ>>>>
		<SET A ,LEAVE-HURTH-COMMAND>)>
	 <COND (<NOT <EQUAL? ,FLOATER <GETP ,BERGON ,P?ROBJ>>>
		<OPTION ,BERGON
			,USE-MAGIC-COMMAND
			,LEAVE-BERGON-COMMAND
			.A>)
	       (T
		<OPTION ,BERGON
			,USE-MAGIC-COMMAND
			,LEAVE-PRAXIX-COMMAND
			.A>)>>

<ROOM STAIR-CHASM
      (TRAVEL-COMMANDS CROSS-COMMAND DOWN-COMMAND NUL-COMMAND)
      (GRAPHIC G-STAIR-CHASM)
      (CAST-LIMIT 3)
      (FLAGS UNDERGROUND ADVISE)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (USE-MAGIC
	       <TELL
"Preferring to bring along our entire party, we decided to use Praxix' magic
to get ourselves across the chasm on the way down. With that matter settled it
was only a short time until we made our way across the abyss.">
	       <MOVE-TO ,FAR-CHASM>)
	      (<OR <ACTION? LEAVE-BERGON>
		   <ACTION? LEAVE-PRAXIX>
		   <ACTION? LEAVE-HURTH>
		   <ACTION? LEAVE-MINAR>
		   <ACTION? LEAVE-ESHER>>
	       <COND (<ACTION? LEAVE-BERGON>
		      <SETG CHASM-STRAGGLER ,BERGON>)
		     (<ACTION? LEAVE-MINAR>
		      <SETG CHASM-STRAGGLER ,MINAR>)
		     (<ACTION? LEAVE-HURTH>
		      <SETG CHASM-STRAGGLER ,HURTH>)
		     (<ACTION? LEAVE-ESHER>
		      <SETG CHASM-STRAGGLER ,ESHER>)
		     (T
		      <SETG CHASM-STRAGGLER ,PRAXIX>)>
	       <TELL
"Preferring to preserve Praxix' supply of magical essences, we decided to leave "
D ,CHASM-STRAGGLER " behind while we explored the far side of the chasm. It was
just a matter of moments until ">
	       <COND (<L? ,PARTY-MAX 4>
		      <TELL "I">)
		     (T
		      <TELL "the rest of us">)>
	       <TELL " made the crossing.">
	       <PARTY-REMOVE ,CHASM-STRAGGLER>
	       <MOVE-TO ,FAR-CHASM>)
	      (<AND <ACTION? CAST>
		    <OBJECT? WIND-SPELL>>
	       <COND (<FSET? ,HERE ,ENCHANTED>
		      <FCLEAR ,HERE ,ENCHANTED>
		      ;<GRAPHIC <> ,G-CROSS-STAIR-CHASM ,TOP-LEFT>
		      <COND (<EQUAL? ,FLOATER <GETP ,ESHER ,P?ROBJ>>
			     <TELL
"As Esher turned slowly above us, screaming monosyllables at our
Wizard-friend, Praxix was busily wiping the ">
			     <TELL-COLOR ,ESSENCE-AIR ,ESSENCE-EARTH>
			     <TELL
" residue from his hands and measuring out some additional air
essence. \"Have no fear! You'll be down in a moment!\" he said.
Then, pausing for a second, he smiled broadly and added some more.
With a sharp flick of the wrist, Praxix cast the potent dust
at our floating comrade, who quite literally flew across the
abyss in a gale-force wind." CR CR>
			     <TELL
"\"What did I say?\" shouted Praxix at the Esher-heap that
scowlingly stumbled to his feet on the other side. Bergon,
unwilling to see this conversation progress, tossed Esher">)
			    (T
			     <TELL
"\"Do not be alarmed, " D ,FLOATER "!\" Praxix said, as he wiped the ">
			     <TELL-COLOR ,ESSENCE-AIR ,ESSENCE-EARTH>
			     <TELL
" residue from his hands, and measured out some additional
air essence. \"It will just be a moment.\" And then, casting the
powder at our floating friend, a great wind came up and carried
him across the abyss. We tossed " D ,FLOATER>)>
		      <TELL
" our rope, and we were soon ready to cross to the far side of the chasm.
There was only one problem: since we could find no good anchor for our rope
on either side of the abyss, we had to consider how we were to return once we
got across. "> 
		      <COND (<NOT <CHECK-ESSENCES ,WIND-SPELL>>
			     <COND (<NOT <EQUAL? ,FLOATER <GETP ,BERGON ,P?ROBJ>>>
				    <SETG CHASM-STRAGGLER ,BERGON>)
				   (T
				    <SETG CHASM-STRAGGLER ,PRAXIX>)>
			     <TELL
"Our options were limited by the fact that Praxix had no remaining air
essence with which to blow somebody back, which left no choice but to have "
D ,CHASM-STRAGGLER " remain behind. And so it was that " D ,CHASM-STRAGGLER " did not
follow us across the chasm.">
			     <PARTY-REMOVE ,CHASM-STRAGGLER>)
			    (T
			     <TELL
"Since Praxix had some air essence in his pouch, it would be possible to use
his wind spell to fling one of our party across the chasm on the way down. On
the other hand, we could just as easily leave one of our party behind, and
avoid using magic altogether.">
			     <FIND-CHASM-STRAGGLER>
			     <RTRUE>)>	      
		      <MOVE-TO ,FAR-CHASM>)
		     (<NOT <QSET? ,HERE ,SCOUTED>>
		      <FSET ,HERE ,DEAD>
		      <TELL
"I don't know what Praxix was thinking when he removed some
air essence from his pouch and tossed it at Bergon. A fierce
wind came up and blew Bergon to the edge of the abyss; it
was only quick thinking ">
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL "by Esher ">)>
		      <FSET ,HERE ,GRAY-MIX>
		      <TELL "that saved him from plunging
down into that bottomless void. Bergon was quite displeased,
though his temper was restrained. \"Let us be a little more
careful with our magic,\" he said.">)
		     (T
		      <UNUSE-ESSENCES>
		      <TELL
"Praxix gave Bergon a look saying \"How about trying the
wind spell again?\" Bergon shot back a look saying, in effect, \"I
will murder you if you do.\"">)>)
	      (<AND <FSET? ,HERE ,ENCHANTED>
		    <FLOATER-TO-EARTH>>
	       <RTRUE>)
	      (GET-ADVICE:REMOVE
	       <TELL
"Bergon asked for our advice; he himself thought of trying to jump
across, but got a negative reaction. Praxix suggested that he might
have some magic that would help, and this was greeted with some
measure of skepticism. Overall, no consensus was achieved.">)
	      (CROSS:REMOVE
	       <FSET ,HERE ,DEAD>
	       <TELL
"Bergon, being the most powerful member of the group, thought he might try
jumping across the gap, then use the rope to bring the rest of
us along." CR CR>
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL
"For once, Esher's pessimism was hard to fault. \"You can't get
a running start; the footing's no good; and the stairs at the
other end appear to turn a corner. Otherwise, you've got a fine
idea.\" Bergon reluctantly agreed.">)
		     (T
		      <TELL
"It didn't take long, however, to convince him that this would be
far too dangerous to attempt.">)>)
	      (SCOUT:REMOVE
	       <TELL ACT
" suggested trying to scout out an alternative way up the stairs,
but this was felt to be fruitless.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <FSET ,HERE ,DEAD>
	       <SAVE-SPELL>
	       <SETG FLOATER ,ACTION-PRSI>
	       <COND (<FSET? ,HERE ,BLUE-MIX>
		      <TELL
"Praxix again levitated " D ,FLOATER " with his elevation spell." CR CR>
		      <TELL
"\"Not again!\" " D ,FLOATER " protested, but there was little he could do
suspended there, ten feet above our heads.">)
		     (T
		      <TELL "Praxix, ">
		      <COND (<FSET? ,HERE ,GRAY-MIX>
			     <TELL "though chastened">)
			    (T
			     <TELL "on his own">)>
		      <TELL
", decided to try a little magic to get us across.
Pulling some earth and air essences from his concealed pouch, Praxix mixed
them, then cast the mixture onto " D ,FLOATER "." CR CR>
		      <TELL
"\"Hey, wait a minute!\" he said as he rose ten feet into the air
before us.">)>
	       <FSET ,HERE ,ENCHANTED>
	       <FSET ,HERE ,BLUE-MIX>)
	      (CAST
	       <PRAXIX-NO-CAST>)
	      (DOWN
	       <COND (<FSET? ,HERE ,DEAD>
		      <TELL
"Having tried our best to cross the chasm, we admitted defeat; slowly,">)
		     (T
		      <TELL
"It was pointless to attempt the crossing; slowly,">)>
	       <TELL " we made our way
back down to the junction of the stairs.">
	       <MOVE-TO ,STAIR-JUNCTION>)>)>

<ROOM FAR-CHASM
      (TRAVEL-COMMANDS UP-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (UP
	       <TELL
"We continued climbing up the narrow stairs, and finally climbed through
the heavy oak door which led into the Sunset Tower." CR CR>
	       <GRAPHIC ,G-SUNSET-TOWER>
	       <TELL
"The view was magnificent! The sun was just setting, and the western sky
was ablaze with colors reflected by the high wispy clouds at the
horizon. To the east, far-off and shrouded in cloud, stood this mighty
tower's twin: the Sunrise Tower">
	       <COND (,2ND-PASS
		      <TELL ", home of Astrix.">)
		     (T
		      <TELL" where, it was said, we would find
a mighty ally in the Wizard Astrix. To the north, beyond a desert-like
plain, the sky was strangely dark and seemingly choked by a heavy,
black cloud.">)>
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL CR CR
"\"Our fathers would come to this place to meditate at day's end and
pray for the day when we should leave this world,\" Hurth said. \"Only
Agrith comes here now, and far less often than in the past. Now that
the stair is broken, he may never come again. The world is changing; even
this strong tower will not survive what is to come!\"">)>
	       <MOVE-TO ,SUNSET-TOWER>)>)>

<OBJECT SUNRISE-MOUNTAIN
	(LOC SUNSET-TOWER)
	(SDESC "Sunrise Mt.")
	(8DESC "S'rise Mtn")
	(KBD %<ASCII !\S>)
	(FLAGS DONT-TAKE)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" looked more closely at the Sunrise Mountain, and the route we would
eventually follow to reach the Tower which stood atop the highest crag.
It appeared as though numerous paths wound their way up from the shore of the
great river, but there was no indication of which would be the best to take.">)>)> 

<OBJECT SUNRISE-TOWER-OBJECT
	(LOC SUNSET-TOWER)
	(SDESC "Sunrise Tower")
	(12DESC "Sunrise Twr.")
	(8DESC "S'rise Twr")
	(KBD %<ASCII !\S>)
	(FLAGS DONT-TAKE)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" took a long look at the Sunrise Tower, and motioned for us to do
likewise. \"What do you make of that?\" he said, pointing at a dark
shadow which appeared to circle the hooded tower." CR CR>
		 <COND (<IN-PARTY? ,HURTH>
			<TELL "Hurth, whose vision">)
		       (<IN-PARTY? ,BERGON>
			<TELL "Bergon, whose vision">)
		       (T
			<TELL
"I peered at the shadow, but could discern nothing more than had Praxix. \"It
is too bad that we don't have Bergon here with us,\" I said. \"His vision is
quite a bit better than mine,\" I said.">
			<RTRUE>)>y
		 <TELL
" was the most acute in our party, peered at
the darkening Tower and said, \"If it weren't so far away, I would
say it was a bird. But at this distance...\" He paused, shaking his
head, then gazed at the shadow yet again. \"It cannot be!\"">
		 <COND (<IN-PARTY? ,PRAXIX>
			<TELL CR CR
"Praxix did not agree. \"There are many creatures that cannot be,
and yet are. We have seen them ourselves; we have ">
			<COND (<NOT <IN-PARTY? ,HURTH>>
			       <TELL "had ">)>
			<TELL
"one among us! Doubt not your judgement.\"">)>
		 <RTRUE>)>)>  

<ROOM SUNSET-TOWER
      (TRAVEL-COMMANDS DOWN-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-SUNSET-TOWER)
      (CAST-LIMIT 2)
      (FLAGS UNDERGROUND PROVISIONER DONT-DROP)
      (ENTER
       <EXECUTE ()
		<SAVE-PROVISION-COMMANDS ,TAG>
		<SAVE-PROVISION-COMMANDS ,PRAXIX>
		<PROVISION-COMMANDS ,TAG
				    ,PICK-UP-COMMAND
				    ,DROP-COMMAND
				    ,INVENTORY-COMMAND>
		<PROVISION-COMMANDS ,PRAXIX
				    ,CAST-COMMAND
				    ,EXAMINE-COMMAND>
		<COND (,2ND-PASS
		       <REMOVE ,SUNRISE-MOUNTAIN>
		       <UPDATE-REMOVE ,SUNRISE-TOWER-OBJECT>)>>)
      (EXIT
       <EXECUTE ()
		<RESTORE-PROVISION-COMMANDS ,TAG>
		<RESTORE-PROVISION-COMMANDS ,PRAXIX>>)
      (ACTION
       <ACOND ()
	      (LOOK-AROUND:REMOVE
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>
	       <TELL ACT
" searched the tower, finding what appeared to be a spyglass of some
kind. It was old and delicately crafted, but many of its lenses were broken,
making it more a thing of beauty than an object to be used.">
	       <COND (<IN-PARTY? ,PRAXIX>
		      <TELL CR CR
"\"It is a work of art,\" Praxix said, \"far more valuable than it
would appear. Such handiworks are rare these days; it is a shame that
we cannot put it to good use.\"">)
		     (T
		      <TELL CR CR
"\"It is crafted beautifully,\" Bergon said. \"What a shame it cannot
be put to good use.\"">)>
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL CR CR
"\"And just how would we put a broken spyglass to use?\" " ACT " asked,
placing it down on a dusty shelf nearby.">)
		     (<EQUAL? ,ACTOR ,MINAR>
		      <TELL CR CR
"\"A shame indeed,\" replied Minar, and placed the spyglass down on a
nearby shelf.">)>
	       <FSET ,SUNSET-TOWER ,SOLVED>
	       <UPDATE-MOVE ,SPYGLASS ,HERE>)
	      (<AND <ACTION? CAST>
		    <NOT ,CHASM-STRAGGLER>
		    <NOT <CHECK-ESSENCES ,WIND-SPELL>>>
	       ;"If everyone came across, we need air essence for wind..."
	       <TELL
"Praxix then had the notion of casting his \"" AO "\" spell, but he
quickly realized that he would be using the air essence we needed for
crossing the chasm.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>
		    <NOT <QSET? ,FAR-VISION-SPELL ,INCAPACITATED>>>
	       <UPDATE-FSET ,HERE ,DONT-CAST>
	       <ASTRIX-RESPONDS-TO-FLARE>) 
	      (DOWN
	       <NEXT-DAY>
	       <TRAVEL-COMMANDS ,STAIR-JUNCTION
				,RIGHT-COMMAND
				,DOWN-COMMAND>
	       <TELL
"It was getting late, so we started down the stairs, coming quickly to the
chasm">
	       <COND (,CHASM-STRAGGLER
		      <PARTY-ADD ,CHASM-STRAGGLER>
		      <TELL
", where " D ,CHASM-STRAGGLER " was waiting impatiently.">
		      <SETG CHASM-STRAGGLER <>>)
		     (T
		      <USE-ESSENCES ,WIND-SPELL>
		      <TELL
". Using Praxix' wind spell, Bergon was blown over the edge and onto the far
side of the chasm, from which he was able to help the rest of us across.">)>
	       <TELL CR CR
"We were all very tired now from our arduous climb, so we decided to spend the
night there on the landing, and in fact did not arise until the next afternoon.
It was nearly time for dinner when we started down the stairs.">
	       <MOVE-TO ,STAIR-JUNCTION>)>)>

<ROUTINE ASTRIX-RESPONDS-TO-FLARE ()
	 <REMOVE ,HYE-TOWER>
	 <TELL
"Praxix thought to signal Astrix using his flare enchantment and
so he sent a ball of flame screaming toward
the Sunrise Mountain. And then a second ball of flame shot out of the Sunrise
Tower! When they met, perhaps three-fourths of the way across, the resulting
explosion lit the darkening sky with its blue-white flame and caused the mountains
to shudder." CR CR>
	 <TELL
"\"It seems we are expected,\" Praxix said.">>

<ROUTINE FLOATER-TO-EARTH ()
	 <FCLEAR ,HERE ,ENCHANTED>
	 <RESTORE-SPELLS>
	 <TELL
"Slowly, " D ,FLOATER " descended back to the stairs. \"Don't ever do
that again!\" he shouted. Praxix shrugged, unconcerned in
the least." CR CR>
	 ;"Must return false"
	 <RFALSE>>




