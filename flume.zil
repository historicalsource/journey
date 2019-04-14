"FLUME for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT CAVERNS>

<OBJECT MINE-ORC-BODIES
	(FLAGS DONT-TAKE)
	(SDESC "dead orcs")
	(KBD %<ASCII !\D>)
	(EXBITS <+ ,ESHERBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" took a moment to look over the carnage; over two dozen orcs were
piled on the ground, most of them dispatched single-handedly by Hurth.">
		 <COND (<OR <AND <IN-PARTY? ,ESHER>
				 <FSET? ,ESHER ,BUSY>>
			    <FSET? ,BERGON ,BUSY>>
			<TELL
" But there was no joy in our victory - we had paid a heavy price!">)>
		 <RTRUE>)>)> 

<OBJECT MINE-ORCS
	(FLAGS DONT-TAKE DONT-EXAMINE)
	(SDESC "orcs")
	(KBD %<ASCII !\O>)
	(ATTACK 250 250)
	(STATUS 100)
	(RETREAT 0)>

<OBJECT MINE-FIGHT
	(TEMP 0)
	(ACTION
	 <ACOND ("AUX" TMP)
		(SCENE-START
		 <MOVE ,MINE-ORCS ,HERE>
		 <SETG OPPONENT ,MINE-ORCS>
		 <PRINT-CHARACTER-COMMANDS>
		 <SETG UPDATE-FLAG <>>
		 <CHANGE-CIT ,BERGON 1 ,NUL-COMMAND <>>
		 <CHANGE-CIT ,HURTH 1 ,NUL-COMMAND>
		 <COND (,MIX-DONE
			<CHANGE-CIT ,PRAXIX 2 ,USE-MIX-COMMAND>)>
		 <NUL-PARTY-COMMAND ,RETREAT-COMMAND>
		 <NUL-PARTY-COMMAND ,PARLEY-COMMAND>
		 <SETG COMBAT-ROUND -1>)
		(SCENE-END
		 <COND (<NOT <FSET? ,HERE ,SOLVED>>
			<UPDATE-MOVE ,MINE-ORC-BODIES ,HERE>
			<UPDATE-REMOVE ,MINE-ORCS>
			<UPDATE-FCLEAR ,PRAXIX ,BUSY>
			<TELL CR CR
"The fight was over; Bergon was slumped on the ground, rapidly losing his
battle for life.">
			<COND (<IN-PARTY? ,ESHER>
			       <TELL
" Esher fared worse still, and died in Praxix' arms before
the Wizard could begin to help.">
			       <KILLED-OFF ,ESHER>)>
			<COND (,COMBAT-SPELL
			       <TELL
" Praxix, no longer concerned with the spell he was preparing, tossed the
mixed powders to the ground and rushed to Bergon's side.">)>
			<UPDATE-MOVE ,BERGON-OBJECT ,HERE>
			<FCLEAR ,BERGON-OBJECT ,DONT-EXAMINE>
			<SET-TEMP ,MOVE-NUMBER>)>)
		(COMBAT-RESULT
		 <COND (<ZERO? ,COMBAT-ROUND>
			;<GRAPHIC <> ,G-DEAD-END-ORCS ,BOTTOM-LEFT>
			<TELL
"The first orcs started to come through the hole, and we had an easy
time dispatching them as they came. After four were killed, they stopped
coming for a time. All was quiet, and yet we felt certain that we had
not seen the last of these orcs." CR CR>
			<TELL
"At once, the quiet was broken as the orcs started a guttural chant,
and their harsh footsteps could again be heard just outside of the
chamber!" CR CR>
			<TELL
"\"It seems we are trapped,\" Bergon said, gloomily, \"and the orcs
come yet again.\"">
			<COND (<EQUAL? ,COMBAT-SPELL ,TREMOR-SPELL>
			       <TELL CR CR
"\"It seems we are trapped, yes,\" Praxix repeated, \"but things are not
always what they seem!\"">)>
			<RTRUE>)
		       (<EQUAL? ,COMBAT-ROUND 1>
			<TELL
"The orcs, sensing the folly in entering our midst singly, now changed their
strategy, and pushed over themselves into the chamber. They paid dearly
for the effort, and their bodies soon piled up near the entry. But
they were successful, and a few orcs now arrived among us. Hurth
was exceedingly strong, and killed a few more orcs with his broadsword.
Bergon, too, fought well, but he was soon hit by the side of an orc's axe,
and stumbled backward on the ground.">
			<UPDATE-MOVE ,BERGON-OBJECT ,HERE>
			<MAKE-BUSY ,BERGON ,ILL-COMMAND>)
		       (<EQUAL? ,COMBAT-ROUND 2>
			<TELL
"On and on they came, slowed somewhat by the carnage at the chamber's
entrance. I killed two orcs that were threatening Bergon, but he was hit
yet again, and soon lay unconscious on the ground. Hurth again bore the
brunt of our offense, and soon claimed a dozen orcs with only a few minor
wounds.">
			<COND (<EQUAL? ,COMBAT-SPELL ,TREMOR-SPELL>
			       <TELL CR CR
"\"If we are not trapped,\" I said, remarking on Praxix' obtuse
comment of a few moments ago, \"this would be a good time to show us.\"">)>
			<MAKE-BUSY ,BERGON ,ILL-COMMAND>)
		       (T
			<TELL
"The last few orcs in the raiding party were now here, but we were strong
enough to defeat them.">
			<COND (<IN-PARTY? ,ESHER>
			       <MAKE-BUSY ,ESHER ,ILL-COMMAND>
			       <TELL
" As the last of them went down, he slashed Esher in the chest. Bleeding
badly, Esher slumped to the floor, as Hurth killed the last of the living
attackers.">)>
			<HINT ,HINT-TREMOR>
			<TRAVEL-COMMANDS ,HERE ,BACK-COMMAND>
			<END-COMBAT <>>
			<MAKE-BUSY ,BERGON ,ILL-COMMAND>
			<RTRUE>)>
		 <COND (<AND ,COMBAT-SPELL
			     <G? <- ,COMBAT-ROUND ,COMBAT-SPELL-ROUND> 1>>
			<COND (<EQUAL? ,COMBAT-SPELL ,TREMOR-SPELL>
			       <TELL CR CR
"At last, Praxix was ready to cast his spell. \"Back! This way!\" he
shouted, leading us to the farthest spot from the entrance. But I would
not leave Bergon behind, and I managed to avoid injury as I dragged him out
of harm's way. And then, with our party a safe distance from the orcs,
the spell was cast, and the ground shook mightily." CR CR>
			       <FSET ,HERE ,SOLVED>
			       <SCENE <> ,TRAVEL-MODE>
			       <FLUME-TREMOR T>)
			      (T
			       <CHANGE-CIT ,PRAXIX 1 ,NUL-COMMAND>
			       <SETG COMBAT-SPELL <>>
			       <TELL CR CR
"Praxix' spell was now prepared, but he reluctantly concluded that it would
do no good in the midst of this pandemonium.">)>)>
		 <RTRUE>)
		(<AND <ACTION? USE-MIX>
		      <EQUAL? ,MIXTURE ,ANIMATE-SPELL>
		      <OBJECT? BERGON-OBJECT>>
		 <TELL
"Praxix tried to reach Bergon with his mixture, but there were orcs between
their positions, and would have faced certain death in the attempt.">
		 <CHANGE-CIT ,PRAXIX 2 ,NUL-COMMAND>
		 <SETG MIX-DONE <>>
		 <RTRUE>)
		(<AND <ACTION? USE-MIX>
		      <EQUAL? ,MIXTURE ,ANIMATE-SPELL>
		      <OBJECT? MINE-ORCS>>
		 <TELL
"Praxix cast his mixture on the orcs, but the only effect was that of making
the orcs somewhat stronger than they had been previously.">
		 <CHANGE-CIT ,PRAXIX 2 ,NUL-COMMAND>
		 <SETG MIX-DONE <>>
		 <RTRUE>)
		(<AND <ACTION? CAST>
		      <NOT ,COMBAT-SPELL>>
		 <SETG COMBAT-SPELL ,ACTION-OBJECT>
		 <SETG COMBAT-SPELL-ROUND ,COMBAT-ROUND>
		 <MAKE-BUSY ,PRAXIX>
		 <TELL
"Praxix, meanwhile, was attempting to cast his " D ,COMBAT-SPELL " spell.
But these things take time, and we weren't counting on any quick
results.">)>)>

<GLOBAL COMBAT-SPELL <>>
<GLOBAL COMBAT-SPELL-ROUND <>>

<ROOM ABOVE-FLUME
      (TRAVEL-COMMANDS FIGHT-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-DEAD-END)
      (FLAGS UNDERGROUND DANGEROUS DONT-SCOUT)
      (CAST-LIMIT INF)
      (TEMP 0)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <QSET? ,MINE-FIGHT ,SEEN>>
		       ;"No flanking from here on!"
		       <PUT <GETPT ,BERGON ,P?FIGHT-COMMANDS> 0 ,NUL-COMMAND>
		       <PUT <GETPT ,HURTH ,P?FIGHT-COMMANDS> 0 ,NUL-COMMAND> 
		       <TELL CR CR
"Drawing our weapons, we prepared for battle. It was clear that we had
one obvious advantage and one obvious disadvantage. What's more, they were
one and the same - the narrow entry into our chamber." CR CR>
		       <TELL
"On the one hand, it would be a simple matter to dispatch the orcs one at
a time as they stumbled into our midst. On the other hand, they might not
oblige us, in which case we were trapped.">
		       <SCENE ,MINE-FIGHT ,FIGHT-MODE>)>>)
      (ACTION
       <ACOND ()
	      (<AND <FSET? ,BERGON ,BUSY>
		    <EQUAL? ,PARTY-MODE ,TRAVEL-MODE>
		    <G? ,MOVE-NUMBER <+ <GET-TEMP> 2>>>
	       <TELL
"It mattered little what we chose to do next. Bergon was dead, and our mission a
failure! We retreated as we had come, fortunate indeed to have escaped another group
of orcs that had been approaching, and appeared finally before Astrix. His face was
grim and determined." CR CR>
	       <HINT ,HINT-WOUNDS>
	       <PART-ONE-BAD-ENDING>)
	      (<AND <ACTION? EXAMINE>
		    <OBJECT? BERGON-OBJECT>>
	       <UPDATE-FSET ,BERGON-OBJECT ,DONT-EXAMINE>
	       <TELL AO " was badly hurt, as " ACT " was quick to recognize. He
would die soon unless we acted; but what could we do?">)  
	      (<AND <FSET? ,BERGON ,BUSY>
		    <ACTION? USE-MIX>
		    <EQUAL? ,MIXTURE ,ANIMATE-SPELL>
		    <OBJECT? BERGON-OBJECT>>
	       <UPDATE-MOVE ,BERGON-OBJECT ,RANDOM-OBJECTS>
	       <TELL
"Praxix cast his mixture at Bergon; for a moment, it
appeared that nothing would happen. But then, as we watched, his
wounds began to heal and in a matter of minutes he was as strong
as on the day we had embarked on our journey.">
	       <TELL CR CR
"\"A powerful enchantment!\" said Praxix">
	       <COND (<FSET? ,HERMIT-POWDER ,SEEN>
		      <TELL ", \"I wonder if old Garlimon
knew the power his gift possessed!\"">)
		     (T
		      <TELL ".">)>	       
	       <MIXTURE-CAST>
	       <SETG UPDATE-FLAG T>
	       <TRAVEL-COMMANDS ,HERE ,BACK-COMMAND>
	       <FSET ,HERE ,BLUE-MIX>
	       <CLEAR-BUSY>)
	      (BACK:REMOVE
	       ;"This means that the battle is over..."
	       <COND (<FSET? ,BERGON ,BUSY>
		      <REMOVE-PARTY-COMMAND ,BACK-COMMAND>
		      <TELL
"Nearly panicked, I started to run from the chamber, but was held back by
Praxix. \"We must not leave our friend while he lays alive,\" he said.">)
		     (<FSET? ,HERE ,BLUE-MIX>
		      <TELL
"We were trapped now, or nearly so; more orcs were nearby, perhaps alerted
by the ones we had just narrowly defeated. We retreated as we
had come, fortunate indeed to have escaped another group of orcs that
had been approaching, and appeared finally before Astrix. His face was grim
and determined." CR CR>
		      <PART-ONE-BAD-ENDING>)
		     (T
		      <TELL
"We started back toward the junction, but more orcs could be heard
there as well. It appeared we were trapped!">)>)
	      (<AND <NOT <EQUAL? ,SCENE-OBJECT ,MINE-FIGHT>>
		    <ACTION? CAST>
		    <OBJECT? TREMOR-SPELL>>
	       <FLUME-TREMOR>)>)>

<ROUTINE FLUME-TREMOR ("OPTIONAL" (FIGHT? <>) "AUX" (BI <>))
	 ;<GRAPHIC ,G-FLUME>
	 <COND (<FSET? ,BERGON ,BUSY>
		<SET BI T>)>
	 <COND (<NOT .FIGHT?>
		<TELL
"Praxix now began to concentrate on the fact that we were trapped. On a hunch,
he took some earth essence from his pouch and cast it upon the ground beneath
our feet." CR CR>)>
	 <TELL
"\"What do you think...,\" was as far as ">
	 <COND (.BI <TELL "Hurth">)
	       (T <TELL "Bergon">)>
	 <TELL " got before the rock beneath our feet gave way, sending us plunging
into a frigid river some dozen feet below." CR CR>
	 <TELL
"The water ran swiftly through this underground flume, and we were
tossed and buffeted mercilessly as we tumbled our way down the tortuous
gorge. Finally, we were thrown over a ten-foot waterfall and landed in
a deep, wide pool, from which it was a short swim to the water's
edge." CR CR>
	 <TELL
"\"What do you think you're doing?\" yelled ">
	 <COND (.BI <TELL "Hurth">)
	       (T <TELL "Bergon">)>
	 <TELL ", finally finishing his previous thought." CR CR>
	 <TELL
"\"As I recall, we were all curious about the source of the water sounds.
Also, it seems we were in need of some means of escape. I believe
I have found both,\" Praxix said proudly.">
	 <COND (.BI
		<TELL " \"Now help me here with Bergon.\" And Bergon
was clearly in need of help; bleeding profusely, he would not survive
long!">)>
	 <COND (.FIGHT?
		<TELL CR CR
"\"At least we seem to be rid of those orcs,\" I offered, \"I suppose
they are afraid of water.\"" CR CR>
		<TELL
"\"More likely they suppose us to have died in the fall,\" Praxix replied.">)>
	 <COND (.BI
		<UPDATE-MOVE ,BERGON-OBJECT ,FLUME-POOL>
		<FCLEAR ,BERGON-OBJECT ,DONT-EXAMINE>)>
	 <MOVE-TO ,FLUME-POOL>
	 <COND (.BI
		<MAKE-BUSY ,BERGON ,ILL-COMMAND>)>
	 <RTRUE>>

<END-SEGMENT>

<BEGIN-SEGMENT MINES>

<ROOM FLUME-POOL
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT 2)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (GRAPHIC G-FLUME-POOL)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <QSET? ,HERE ,SEEN>> T)
		      (T
		       ;"Second time; Bergon's hurt"
		       <FSET ,HERE ,TRAPPED>
		       <PARTY-ADD ,BERGON>
		       <MAKE-BUSY ,BERGON ,ILL-COMMAND>
		       <TELL CR CR
"Bergon was here, slumped against a wall; he was dying, that was
certain.">)>>)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? EXAMINE>
		    <OBJECT? BERGON-OBJECT>>
	       <UPDATE-FSET ,BERGON-OBJECT ,DONT-EXAMINE>
	       <COND (<FSET? ,HERE ,TRAPPED>
		      <TELL ACT
" went over to look at Bergon; his pulse was slow, his breathing
irregular. Shaking his head sadly, he returned to the group.">)
		     (T
		      <TELL ACT
" examined Bergon briefly. \"He's got a punctured lung, and a good deal of
other internal damage from his wounds,\" he reported. \"He's also lost a
great deal of blood. Unless we do something quickly, I'm afraid he's
going to die.\" He then did what he could to stop Bergon's bleeding,
but his actions were merely palliative.">)>)
	      (<AND <ACTION? USE-MIX>
		    <OBJECT? BERGON-OBJECT>
		    <EQUAL? ,MIXTURE ,ANIMATE-SPELL>
		    <FSET? ,BERGON ,BUSY>>
	       <MIXTURE-CAST>
	       <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND>
	       <TELL
"Praxix cast this strange enchantment at " AO "; for a moment, it
appeared that nothing would happen. But then, as we watched, his
wounds began to heal and in a matter of minutes he was as strong as
on the day we had embarked on our journey." CR CR>
	       <TELL
"\"A powerful enchantment!\" said Praxix">
	       <COND (<FSET? ,HERMIT-POWDER ,SEEN>
		      <TELL ", \"I wonder if old Garlimon
knew the power his gift possessed!\"">)
		     (T
		      <TELL ".">)>
	       <SETG LEADER ,BERGON>
	       <SETG UPDATE-FLAG T>
	       <UPDATE-MOVE ,BERGON-OBJECT ,RANDOM-OBJECTS>
	       <CLEAR-BUSY>
	       <COND (<FSET? ,MINE-LOWER-STAIR ,SEEN>
		      <TELL CR CR>
		      <END-PART-TWO-A>)>
	       <RTRUE>)
	      (<AND <ACTION? PROCEED>
		    <NOT <FSET? ,HERE ,TRAPPED>>>
	       <COND (<FSET? ,BERGON ,BUSY>
		      <PARTY-REMOVE ,BERGON>
		      <TELL
"It was undesirable to leave Bergon here, unattended, but we agreed
there was no alternative. And so, making him as comfortable as we
could, we left his side." CR CR>)>
	       <TELL
"A wide path followed the raging river upstream, and we followed it
until we came to a tunnel leading back into what we supposed were the
main chambers at this level.">
	       <MOVE-TO ,ALONG-FLUME>)
	      (<AND <FSET? ,HERE ,TRAPPED>
		    <NOT <ACTION? USE-MIX>>
		    <NOT <ACTION? MIX>>
		    <NOT <GAME-COMMAND?>>>
	       <TELL
"Just then, Bergon's body heaved and his eyes opened. Praxix and I
moved closer to him, and ">
	       <COND (<IN? ,SPIRIT-STONE ,INVENTORY>
		      <TELL
"Praxix held up the white stone to his view." CR CR>
		      <TELL "Bergon smiled faintly. \"It is very beautiful,">)
		     (T
		      <TELL
"tried our best to comfort him." CR CR>
		      <TELL "Bergon winced in pain. \"The Stone... You
have found it?">)>
	       <TELL "\" he whispered, and taking one last raspy breath,
he expired in our arms." CR CR>
	       <TELL
"We were silent a long while. What could we say about this brave man who
had led us through so many dangers? We knew it would be impossible to bury
him here and so, after a short ritual, we wrapped him in his cloak and cast
him into the waters, watching him as he was carried out of sight into the
very depths of the earth." CR CR> 
	       <HINT ,HINT-WOUNDS>
	       <FCLEAR ,BERGON ,BUSY>
	       <KILLED-OFF ,BERGON>
	       <END-PART-TWO-A>
	       <RTRUE>)>)>

<ROUTINE END-PART-TWO-A ("AUX" TMP)
	 <TELL
"We returned to the side of the river">
	 <COND (<NOT <FSET? ,GATE-JUNCTION ,SEEN>>
		<TELL ", and decided to continue our explorations in these
lower regions of the caverns. This time, we took the right-hand path from the
bottom of the stairs, and soon came to a wide vestibule with paths leading
both left and right; but while the right path was wide and ornate, the one
to the left was crudely constructed.">
		<MOVE-TO ,GATE-JUNCTION>
		<RTRUE>)
	       (<AND <NOT <FSET? ,TOMB ,SEEN>>
		     <FSET? ,TOMB-ANTE ,SEEN>>
		<HINT ,HINT-DOOR>)
	       (<AND <FSET? ,TOMB ,SEEN>
		     <NOT <IN? ,TOMB-COFFIN ,TOMB>>>
		<HINT ,HINT-VAULT>)>
	 <COND (<IN? ,SPIRIT-STONE ,INVENTORY>
		<TELL " with our goal accomplished">)
	       (T
		<TELL " in low spirits. We had explored
these regions as best we could, but had not found the Stone that
Astrix had said could be found here">)>
	 <COND (<G? <SET TMP <GET ,KILLED-TBL 0>> 0>
		<TELL ". Sadly, we had lost our friend">
		<COND (<G? .TMP 1> <TELL "s">)>
		<TELL-WITH-COMMAS ,KILLED-TBL>)>
	 <TELL
". The path here continued to run along the river's edge, and we followed it
for many hours, as it wound its way upward, finally rising out of the caverns
and into the open air." CR CR>
	 <COND (<NOT ,A-B-FLAG>
		;"Already seen IIb"
		<TELL
"\"We are not far below the falls,\" I said, \"It should be a simple
matter to find Astrix again from here.\"" CR CR>
		<TELL
"It was, in fact, only a few miles to the falls, and by the end of the day
we had reached Astrix' tower on the Sunrise Mountain.">
		<PART-TWO-ENDING>)
	       (<L? ,PARTY-MAX 3>
		<PART-TWO-TOO-FEW>)
	       (T
		<TELL
"We had emerged from the caverns only a few miles south of the falls we had
just barely escaped earlier in our journey. Before us lay a forest that
was quite a bit older and darker than the one in which the Elves lived.">
		<SCENE ,TANGLESCENE>
		<MOVE-TO ,TANGLEWOOD-1>)>>

<COMMAND (ENTER-TUNNEL ENTER)>
<COMMAND (FOLLOW-RIVER FOL\'W-RIV\'R)>

<ROOM ALONG-FLUME
      (TRAVEL-COMMANDS ENTER-TUNNEL-COMMAND FOLLOW-RIVER-COMMAND NUL-COMMAND)
      (GRAPHIC G-ALONG-FLUME)
      (FLAGS UNDERGROUND)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <TELL ACT
", moving out ahead of us, brought back the report that the path
ahead climbed as it followed the underground river.">
	       <COND (<EQUAL? ,ACTOR ,HURTH>
		      <TELL CR CR
"\"If these caverns are laid out as I surmise, we can follow it to reach
the forest above,\" he remarked.">)>
	       <RTRUE>)
	      (FOLLOW-RIVER:REMOVE
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>
	       <TELL
"We started ahead, climbing along the side of the raging river; a dim
light from up ahead grew brighter as we continued; this path would
surely lead out of the caverns. Not wishing to forego the exploration
of the lower regions, we retraced our steps, returning to the entrance
to the tunnel.">)
	      (ENTER-TUNNEL
	       <TELL
"The tunnel ran straight for a few hundred paces, ending finally
at the bottom of a wide stair. To our right, another path led
through a tall archway and to our left, a crudely made hole
entered the rock." CR CR>
	       <TELL
"\"Praxix, you have done well,\" said Hurth, smiling broadly. \"This
would be the bottom of the stairs that start up high at the Bern i-Fen.
I had nearly lost hope of arriving here.\"">
	       <COND (<OR <NOT <IN-PARTY? ,ESHER>>
			  <NOT <IN-PARTY? ,BERGON>>>
		      <TELL CR CR
"\"Indeed, though I regret we are not all here to see it,\"
Praxix replied quietly. \"There is great evil within the earth; let
us hope there is great good also.\"">)>
	       <TELL CR CR
"\"Am I the only one that hears something peculiar?\" I asked." CR CR>
	       <TELL
"\"I was about to say the same thing,\" answered Hurth. \"It sounds
to me like someone chipping away at rock somewhere down the passage
to the left.\"">
	       <MOVE-TO ,MINE-LOWER-STAIR>)>)>

<COMMAND MINES>

<ROOM MINE-LOWER-STAIR
      (TRAVEL-COMMANDS UP-COMMAND LEFT-COMMAND RIGHT-COMMAND BACK-COMMAND)
      (GRAPHIC G-D-STAIR-BOTTOM)
      (FLAGS UNDERGROUND)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? SCOUT>
		    <NOT <QSET? ,HERE ,SCOUTED>>
		    <NOT <FSET? ,MINER-PASSAGE ,SEEN>>>
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>
	       <TELL
"We sent " ACT " off to find the source of the tapping sound. Indeed,
it was coming from the path on the left, inside some sort of mine.">)
	      (UP:REMOVE
	       <TELL
"It took only a short walk up the stairs to ">
	       <COND (<FSET? ,MINE-2-W ,TRAPPED>
		      <TELL "confirm what we already knew:">)
		     (T
		      <TELL "discover that">)>
	       <TELL
" the stairs were almost utterly destroyed, by what tremendous
force, we would never know.">
	       <COND (<NOT <IN? ,SPIRIT-STONE ,INVENTORY>>
		      <TELL CR CR
"\"Someone, or something, preferred that this region be sealed off,
and did quite a fine job of it,\" Praxix commented. \"It would seem
likely, then, that the Stone which we seek lies close at hand. But in
which direction?\"">)>
	       <RTRUE>)
	      (BACK
	       <COND (<FSET? ,BERGON ,BUSY>
		      <TELL
"In a short time, we were back at the side of the underground river,
and we rushed back to the shore of the pool hoping that Bergon was
still alive.">
		      <MOVE-TO ,FLUME-POOL>)
		     (T
		      <END-PART-TWO-A>
		      <RTRUE>)>)
	      (RIGHT
	       <COND (<FSET? ,GATE-JUNCTION ,SEEN>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,RIGHT-COMMAND>
		      <TELL
"Again, we tried the right-hand path, finding ourselves back in the
vestibule that we had explored earlier.">)
		     (T
		      <TELL
"The right-hand path led to a wide vestibule with paths leading both left
and right, but while the right path was wide and ornate, the one to the
left was crudely constructed.">)>
	       <MOVE-TO ,GATE-JUNCTION>)
	      (LEFT
	       <CHANGE-TRAVEL-COMMAND ,HERE ,LEFT-COMMAND ,MINES-COMMAND>
	       <TELL
"The passage twisted and wound its way through the rock until we
came to a small, open chamber from which two passages led.
One, supported by old wooden beams, appeared to be an abandoned mine
of some sort. The other appeared to be a more recent excavation, and
the tapping sound was coming from that direction." CR CR>
	       <TELL
"\"It would appear we have company,\" Praxix said, motioning to the
newer mine.">  
	       <MOVE-TO ,MINE-JUNCTION>)
	      (MINES
	       <COND (<QSET? ,HERE ,BLACK-MIX>
		      <REMOVE-TRAVEL-COMMAND>)>
	       <TELL
"Once again, our party followed the twisting passage that led to the
entrance of the two mines. As it had before, a tapping sound issued from the
newer of them">
	       <COND (<FSET? ,ACTIVE-MINE ,SOLVED>
		      <TELL "; the miner was a tireless worker indeed">)>
	       <TELL ".">
	       <MOVE-TO ,MINE-JUNCTION>)>)>

<COMMAND OLD-MINE>
<COMMAND NEW-MINE>

<ROOM MINE-JUNCTION
      (TRAVEL-COMMANDS OLD-MINE-COMMAND NEW-MINE-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<GRAPHIC ,G-MINE-JUNCTION>
		<COND (<AND <NOT <FSET? ,OLD-MINE ,SEEN>>
			    <NOT <FSET? ,MINER-PASSAGE ,SEEN>>
			    <NOT <QSET? ,HERE ,BLACK-MIX>>>
		       <ADD-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>)>
		<COND (<FSET? ,OLD-MINE ,GRAY-MIX>
		       <GRAPHIC <> ,G-MINE-JUNCTION-2 ,BOTTOM-LEFT>)>
		<FSET ,HERE ,SEEN>
		<COND (<OR <FSET? ,OLD-MINE ,SEEN>
			   <FSET? ,MINER-PASSAGE ,SEEN>>
		       <UPDATE-FSET ,HERE ,DONT-SCOUT>)>>) 
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <TELL ACT
" went off into both mines to check them out. \"The older mine is in
bad shape,\" he reported, \"I fear it is nearly ready to collapse.\"">)
	      (BACK
	       <TELL
"Having done all the exploring we could in the mines, we returned to the
bottom of the stairs.">
	       <REMOVE-TRAVEL-COMMAND ,MINE-LOWER-STAIR ,LEFT-COMMAND>
	       <MOVE-TO ,MINE-LOWER-STAIR>)
	      (NEW-MINE
	       <TELL
"We made our way through the passage until we came to a small round
chamber. At the far end, a cleft in the rock opened up a narrow
passage">
	       <COND (<NOT <QSET? ,MINER-PASSAGE ,SEEN>>
		      <TELL
" through which a loud, tapping noise could be heard." CR CR>
		      <TELL
"Praxix motioned toward the cleft. \"Shall we see who it is?\" he asked">)>
	       <MOVE-TO ,MINER-PASSAGE ".">)
	      (OLD-MINE
	       <COND (<FSET? ,OLD-MINE ,SEEN>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,OLD-MINE-COMMAND>
		      <TELL
"Again, I expressed my reservations about entering the old mine, but I
was assured by ">
		      <TELL D <FIRST-IN-PARTY ,BERGON ,PRAXIX>>
		      <TELL
" that we would not enter the mine again after having
one last look. Reluctantly, I agreed. The wall boards groaned and creaked
with our every step, and it appeared that a loud sneeze could bring the whole
mine down on top of us.">)
		     (T
		      <TELL
"I was not very comfortable about the decision to enter this old mine. The
ancient wooden beams which were intended to hold up the walls and roof
appeared barely able to help even themselves. As we moved, small pieces
of rock fell from above, and a disturbing sound, like a sick groan, came
from all around us.">)>
	       <MOVE-TO ,OLD-MINE>)>)>

<OBJECT OLD-MINE-WALLS
	(SDESC "walls")
	(LOC OLD-MINE)
	(KBD %<ASCII !\W>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,HURTHBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <CLEAR-EXBIT>
		 <COND (<EQUAL? ,ACTOR ,HURTH>
			<TELL
"Hurth surveyed the walls of the old mine, and reported only that the
excavations here were not of recent origin. He also expressed doubts as
to our safety.">)
		       (T
			<UPDATE-REMOVE ,OLD-MINE-WALLS>
			<COND (<NOT <GETP ,OLD-MINE-WALLS ,P?EXBITS>>
			       <TELL "Unlike Hurth, Praxix">)
			      (T
			       <TELL "Praxix, carefully examining the excavations,">)>
			<TELL
" found something quite remarkable in the walls: a vein of blue-green rock
coursing through the granite and marble. Excited by his discovery, he chipped
away a small piece with his staff. The rock crumbled easily in his fingers, and
its taste was indeed bitter. ">
			<COND (<FSET? ,REAGENT ,SOLVED>
			       <TELL
"\"This is the same reagent we were given by Garlimon,\" he said. \"I
would suggest taking some more, as we may need it later.\"">)
			      (T
			       <TELL
"\"This is the reagent Astrix told us about,\" he said. \"Let us
take some while we have the chance!\"">)>
			<COND (<AND <FSET? ,REAGENT ,SOLVED>
				    <IN-PARTY? ,HURTH>>
			       <TELL CR CR
"Hurth, who had been carefully surveying the mine structure, was
concerned. \"We already have some of this magical rock, or whatever you call
it. The roof seems near to collapse, and I fear to disturb the mine
even a little,\" he said urgently. \"Let us leave while it is still
possible!\"">)>
			<FSET ,HERE ,ADVISE>
			<TRAVEL-COMMANDS ,HERE ,MINE-ROCK-COMMAND ,BACK-COMMAND>)>)>)>

<ROOM OLD-MINE
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DONT-SCOUT DANGEROUS)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<GRAPHIC ,G-ACTIVE-MINE ,G-OLD-MINE ,TOP-LEFT>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"\"Well, what do you think?\" " ACT " asked the assembled group." CR CR>
	       <COND (<IN? ,REAGENT ,INVENTORY> ;"?? Is this right?"
		      <TELL
"\"I am certain this is a magical reagent,\" Praxix replied, \"It may
be powerful and an aid in time of crisis. I vote for mining the rock.\"">)
		     (T
		      <TELL
"The consensus was that it would be too dangerous to do so, yet Praxix,
understanding the value of things magical, appeared to favor gaining
some more.">)>) 
	      (MINE-ROCK:REMOVE
	       <FSET ,HERE ,DANGEROUS>
	       <TELL
"Using our primitive tools, we hammered at the rock until we
had taken enough of the magical reagent. And although we
were pleased at our discovery, we were also aware that the groaning
noises we had heard earlier were now louder and more ominous." CR CR>
	       <FSET ,HERE ,SOLVED>
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <COND (<NOT <QSET? ,REAGENT ,SOLVED>>
		      <FIXUP-PRAXIX-COMMANDS>)>
	       <COND (<NOT <IN? ,REAGENT ,REAGENTS>>
		      <MOVE ,REAGENT ,REAGENTS>)
		     (T
		      <PUT ,ESSENCE-TBL
			   ,BLUEOFF
			   <+ <GET ,ESSENCE-TBL ,BLUEOFF> 5>>)>
	       <TELL
"\"Let's get out of here!\" I shouted. \"The mine's about to collapse!\"">) 
	      (BACK
	       <COND (<FSET? ,HERE ,SOLVED>
		      <REMOVE-TRAVEL-COMMAND ,MINE-JUNCTION ,OLD-MINE-COMMAND>
		      <FSET ,OLD-MINE ,GRAY-MIX>		      		      
		      <COND (<IN-PARTY? ,HURTH>
			     <KILLED-OFF ,HURTH>
			     <HINT ,HINT-OLD-MINE>
			     <TELL
"The mine trembled violently as we made our way out, and large
pieces of roofing were starting to come down upon us. One hit
poor Hurth in the head, knocking him unconscious. We tried to
go back, but more of the mine collapsed. Incredibly, the rest
of us made it to safety, but Hurth was lost to us!">)
			    (T
			     <TELL
"The mine trembled violently as we made our escape, as walls and
roofing collapsed at our heels. We were all safe, but this had
been a narrow escape, and the old mine was now completely inaccessible.">)>
		      )
		     (T
		      <TELL
"We returned to the junction of the two mines. The tapping noise
was again coming from the newer mine.">
		      <COND (<FSET? ,ACTIVE-MINE ,SOLVED>
			     <TELL CR CR
"\"Hard at work again,\" said Praxix, nodding toward the newer mine.
\"Quite a character!\"">)>)>
	       <MOVE-TO ,MINE-JUNCTION>)>)>

<COMMAND (ORNATE-PATH ORNATE)>

<COMMAND (CRUDE-PATH CRUDE)>

<ROOM GATE-JUNCTION
      (TRAVEL-COMMANDS ORNATE-PATH-COMMAND CRUDE-PATH-COMMAND BACK-COMMAND)
      (GRAPHIC G-GATE-JUNCTION)
      (FLAGS UNDERGROUND)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>
	       <COND (<AND <NOT <FSET? ,TOMB-ANTE ,SEEN>>
			   <NOT <FSET? ,MINE-HOLE ,SEEN>>>
		      <COND (<EQUAL? ,ACTOR ,HURTH>
			     <TELL
"\"Both paths are fascinating,\" Hurth said, having quickly explored our two
alternatives. \"Come, have a look.\"">)
			   (T
			    <TELL ACT
" checked out both paths. \"You'll have to see this for yourself,\" he
said, bewildered. \"Each path is more bizarre than the other!\"">)>)
		     (<EQUAL? ,ACTOR ,HURTH>
		      <TELL ACT
" was excited by what he discovered upon scouting out the path we had not
yet taken. \"Let me show you,\" he said.">)
		     (T
		      <TELL ACT
" took the path we had not yet taken, and reported that we had better take a
look for ourselves.">)>) 
	      (BACK
	       <TELL
"Retracing our steps, we returned to the bottom of the stairs.">
	       <MOVE-TO ,MINE-LOWER-STAIR>)
	      (CRUDE-PATH
	       <COND (<FSET? ,TOMB-ANTE ,SEEN>
		      <FSET ,HERE ,DONT-SCOUT>)>
	       <COND (<FSET? ,MINE-HOLE ,SEEN>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,CRUDE-PATH-COMMAND>
		      <FSET ,HERE ,TRAPPED>
		      <TELL
"For the second and last time, we entered the crudely formed chamber
with the crack in the center.">
		      <COND (,HOLE-VICTIM
			     <TELL CR CR
"We had left our friend " D ,HOLE-VICTIM " for dead not long before, and
still there was no response when we called down to him.">)>) 
		     (T
		      <TELL
"We followed the winding path to a dead-end chamber, in the middle of which
a crack in the earth led into darkness.">)>
	       <MOVE-TO ,MINE-HOLE>)
	      (ORNATE-PATH
	       <COND (<FSET? ,MINE-HOLE ,SEEN>
		      <FSET ,HERE ,DONT-SCOUT>)>
	       <TELL
"Our chosen path led through a richly carved vestibule, at the end of
which sat a formidable wooden door. ">
	       <COND (<IN-PARTY? ,BERGON>
		      <TELL "\"I hope it is open,\" Bergon
said wistfully, \"for I fear even an army would be hard put to break
through this!\"">)
		     (T
		      <TELL "\"It had better be open,\" Praxix offered,
\"for I have not the magic to open this formidable a door.\"">)>
	       <MOVE-TO ,TOMB-ANTE>)>)>

<GLOBAL HOLE-VICTIM <>>

<OBJECT TOMB-ANTE-DOOR
	(SDESC "door")
	(KBD %<ASCII !\D>)
	(LOC TOMB-ANTE)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"It was " ACT " who finally approached the door, and attempted to open
it. \"I am sorry, ">
		 <COND (<IN-PARTY? ,BERGON>
			<TELL
"Bergon,\" he started, \"but we shall be needing your army after all!">)
		       (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL
"but we shall need a miracle to get through this door.">)
		       (T
			<TELL
"Praxix,\" he started, \"but it is magic that we need!\"">)>
		 <TELL "\"" CR CR
"\"Or the key,\" I added, pointing to the keyhole that lay in the
door's center.">
		 <COND (<IN? ,IRON-KEY ,INVENTORY>
			<TELL
" Fumbling through my pack, I pulled out the key we had found at
the bottom of the nearby hole and held it out to " ACT ". \"The key,\"
I said, and bowed as gracefully as I could.">)>
		 <RTRUE>)>)>

<COMMAND OPEN-DOOR>

<ROOM TOMB-ANTE
      (TRAVEL-COMMANDS OPEN-DOOR-COMMAND BACK-COMMAND NUL-COMMAND)
      (CAST-LIMIT 2)
      (GRAPHIC G-MASSIVE-DOOR)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<IN? ,IRON-KEY ,INVENTORY>
		       <FORCE-TRAVEL-COMMAND ,HERE ,OPEN-DOOR-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <COND (<NOT <FSET? ,MINE-HOLE ,SEEN>>
		      <TELL
"\"Why don't we see what's down the crude path?\" I suggested,
and this was met with a murmur of agreement.">)
		     (T
		      <TELL
"\"There's no use standing here by the door,\" Praxix said. \"I
don't believe it will open merely from force of will. Let us look
elsewhere for the solution.\"">)>)
	      (OPEN-DOOR
	       <COND (<IN? ,IRON-KEY ,INVENTORY>
		      <FCLEAR ,HERE ,ADVISE>
		      <UPDATE-FSET ,IRON-KEY ,DONT-EXAMINE>
		      <TELL
"The iron key was a perfect fit for the lock.  We were soon
inside a tall, rounded chamber.  A beam of light from high
above illuminated a metallic vault inset into the floor of the
chamber. Inscribed in the stone around the vault were runes which
looked to be Dwarvish.">
		      <UPDATE-FCLEAR ,IRON-KEY ,DONT-DROP>
		      <MOVE-TO ,TOMB>)
		     (T
		      <REMOVE-TRAVEL-COMMAND>
		      <TELL
"Trying to force the door open would be fruitless; another way would
have to be found if we were to get inside.">
		      <REMOVE-PARTY-COMMAND ,ENTER-COMMAND>
		      <UPDATE-FSET ,HERE ,ADVISE>)>)
	      (BACK
	       ;<COND (<IN? ,IRON-KEY ,INVENTORY>)>
	       <COND (<FSET? ,GATE-JUNCTION ,TRAPPED>
		      <TELL
"We had failed in our attempts to pass through the door, and decided
to return to the bottom of the stairs and consider whether there were
any other options left open to us in these caverns.">
		      <REMOVE-TRAVEL-COMMAND ,MINE-LOWER-STAIR ,RIGHT-COMMAND>
		      <MOVE-TO ,MINE-LOWER-STAIR>)
		     (T
		      <MOVE-TO ,GATE-JUNCTION
"Unable to enter the door, we returned to the junction.">)>)>)>
