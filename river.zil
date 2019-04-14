"RIVER for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT RIVER>

<OBJECT RAFT
	(SDESC "raft")
	(KBD %<ASCII !\R>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,ESHERBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <CLEAR-EXBIT>
		 <TELL ACT>
		 <COND (<ZERO? <GETP ,ACTION-OBJECT ,P?EXBITS>>
			<TELL ", on the other hand,">)>
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL
" felt the raft was sturdy enough for an uneventful trip, though it would
probably not fare so well in heavy or rocky waters. Nonetheless, as
our only way of crossing the river, it would have to serve.">)
		       (T
			<TELL
" was doubtful that we would live to see the far side of the river since, in
his words, the raft \"probably would not survive a good minute in a
bathtub.\"">)>)>)>

<ROUTINE RIVER-N-ENTER ("OPTIONAL" (GFX? T))
	 <COND (.GFX? <GRAPHIC ,G-RIVER>)>
	 <COND (<AND <FSET? ,RAFT ,SEEN>
		     <NOT <EQUAL? ,HERE ,RIVER-FALLS>>>
		<MOVE ,RAFT ,HERE>
		<CHANGE-PARTY-COMMAND ,BUILD-RAFT-COMMAND
				      ,LAUNCH-RAFT-COMMAND>)>
	 <MOVE ,RIVER ,HERE>
	 <COND (<EQUAL? ,HERE ,RIVER-FALLS>
		<FSET ,FALLS ,SEEN>
		<MOVE ,FALLS ,HERE>)>>

<OBJECT FALLS
	(SDESC "falls")
	(KBD %<ASCII !\F>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL ACT
" motioned " <ME/US 2> " to the edge of the falls. They were both beautiful and
terrible; a raging, boiling fury
the like of which we had not experienced before. At the bottom, the
troubled river was crowned with a misty rainbow; from there, the
water tumbled over jagged rocks as it flowed out of sight into a narrow,
winding gorge.">)>)>

<OBJECT RIVER
	(SDESC "river")
	(KBD %<ASCII !\R>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(<AND <ACTION? EXAMINE>
		      <NOT <FSET? ,RIVER ,EXAMINED>>>
		 <UPDATE-FSET ,RIVER ,DONT-EXAMINE>
		 <TELL ACT
" ripped a small branch from a nearby tree and cast it into the river.
Within moments, it had been carried out of sight. \"It is as I feared.
The river flows with great speed.">
		 <COND (<FSET? ,FALLS ,SEEN>
			<TELL " How shall we cross without being
carried over the falls?\" He got no answer.">)
		       (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL " We shall not cross before we have
been taken far downstream.\"">)
		       (<EQUAL? ,ACTOR ,ESHER>
			<TELL " We will not survive the crossing!\"">)>
		 <RTRUE>)>)>

<GLOBAL SHORE-ROOMS <LTABLE RIVER-1 RIVER-2 RIVER-3 RIVER-3>> 

<ROOM RIVER-1
      (TRAVEL-COMMANDS BUILD-RAFT-COMMAND DOWNSTREAM-COMMAND UPSTREAM-COMMAND)
      (ENTER RIVER-N-ENTER)
      (FLAGS DONT-SCOUT)
      (TEMP 1)
      (ACTION
       <ACOND ()
	      (CAST
	       <SHORE-CAST>)
	      (DOWNSTREAM
	       <SHORE-MOVE ,RIVER-2>)
	      (UPSTREAM:REMOVE
	       <RIVER-N-ENTER>
	       <TELL
"Exploring the shore upstream of our position, we quickly found it too rocky
for use as any sort of raft launching site, and it was decided to go no
further.">)>)>

<ROOM RIVER-2
      (TRAVEL-COMMANDS BUILD-RAFT-COMMAND DOWNSTREAM-COMMAND UPSTREAM-COMMAND)
      (ENTER RIVER-N-ENTER)
      (TEMP 2)
      (ACTION
       <ACOND ()
	      (CAST
	       <SHORE-CAST>)
	      (DOWNSTREAM
	       <SHORE-MOVE ,RIVER-3>)
	      (UPSTREAM
	       <SHORE-MOVE ,RIVER-1>)
	      (SCOUT:REMOVE
	       <SHORE-SCOUT>)>)>	      

<ROUTINE SHORE-SCOUT ()
	 <FSET ,RIVER-2 ,DONT-SCOUT>
	 <FSET ,RIVER-3 ,DONT-SCOUT>
	 <COND (<NOT <FSET? ,RIVER-FALLS ,SEEN>>
		<COND (<EQUAL? ,ACTOR ,ESHER>
		       <TELL ACT
" made his way downstream along the shore, finally leaving our
sight as followed the river's edge around a corner.  He returned
a few minutes later, out of breath. \"A falls!\" he said. \"Not
far downstream!\"">)
		      (T
		       <TELL ACT
" nimbly followed the river's edge out of sight. A minute later, he
returned, reporting a large waterfall just downstream from where we stood.">)>)>>
		
<ROOM RIVER-3
      (TRAVEL-COMMANDS BUILD-RAFT-COMMAND DOWNSTREAM-COMMAND UPSTREAM-COMMAND)
      (ENTER RIVER-N-ENTER)
      (TEMP 3)
      (ACTION
       <ACOND ()
	      (CAST
	       <SHORE-CAST>)
	      (DOWNSTREAM
	       <SHORE-MOVE ,RIVER-FALLS>)
	      (UPSTREAM
	       <SHORE-MOVE ,RIVER-2>)
	      (SCOUT:REMOVE
	       <SHORE-SCOUT>)>)>

<ROOM RIVER-FALLS
      (TRAVEL-COMMANDS UPSTREAM-COMMAND NUL-COMMAND NUL-COMMAND)
      (ENTER <EXECUTE () <RIVER-N-ENTER <>>>)
      (FLAGS DANGEROUS DONT-SCOUT)
      (GRAPHIC G-FALLS)
      (TEMP 5)
      (ACTION
       <ACOND ()
	      (UPSTREAM
	       <SHORE-MOVE ,RIVER-3>)>)>

<ROUTINE SHORE-CAST ()
	 <COND (<AND <OR <OBJECT? WIND-SPELL> <OBJECT? LEVITATE-SPELL>>
		     <NOT <QSET? ,RIVER-1 ,TRIED>>>
		<TELL "\"Perhaps,\" ">
		<COND (<IN-PARTY? ,BERGON>
		       <TELL "Bergon">)
		      (T
		       <TELL "I">)>
		<TELL " suggested, turning to Praxix, \"there is some magic that
could propel us across the river.\"" CR CR>
		<TELL
"\"I have already considered this,\" Praxix replied. \"But the river is far
too wide to attempt sending even one of us across.\"">)>>		

<GLOBAL LAST-SHORE-MOVE 0>

<ROUTINE SHORE-MOVE (RM "AUX" TMP)
	 <COND (<ZERO? ,LAST-SHORE-MOVE>
		<TELL "Not knowing which way was best, we headed ">)
	       (<EQUAL? ,LAST-SHORE-MOVE ,ACTION>
		<TELL "We continued ">)
	       (T
		<TELL "Then, we turned around and walked ">)>
	 <SETG LAST-SHORE-MOVE ,ACTION>
	 <COND (<ACTION? UPSTREAM>
		<TELL "up">)
	       (T
		<TELL "down">)>
	 <TELL "stream along the shore">
	 <COND (<AND <IN? ,RAFT ,HERE>
		     <NOT <EQUAL? .RM ,RIVER-FALLS>>>
		<TELL ", dragging the raft along with us,">)>
	 <COND (<EQUAL? .RM ,RIVER-2>
		<TELL
" and finally arrived back at our starting point along the shore.">)
	       (<EQUAL? ,HERE ,RIVER-FALLS>
		<TELL
", clambering down the rocks and back to the river's edge.">)
	       (<EQUAL? .RM ,RIVER-1>
		<COND (<NOT <FSET? .RM ,SEEN>>
		       <TELL " to">)
		      (T
		       <TELL " and were soon back at">)>
		<TELL " the furthest point easily accessible on foot.
From here, the river appeared quieter than at the place we had
started.">)
	       (<EQUAL? .RM ,RIVER-FALLS>
		<TELL
", as we followed the curve of the river to the right. The river's
edge grew more rugged, and we needed to clamber up some rocks before
we reached an outcropping high above a towering falls.">
		<COND (<IN-PARTY? ,ESHER>
		       <FSET ,FALLS ,EXAMINED>
		       <TELL CR CR
"\"It's wonderful!\" I said. \"No, not wonderful.\" Esher replied,
frowning. \"Dangerous... deadly...\" He had turned pale, almost
ashen, as he spoke, his eyes tranfixed on the torrent that
roared beneath us.">)>
		<COND (<AND <IN? ,RAFT ,RIVER-3>
			    <IN-PARTY? ,BERGON>
			    <NOT <FSET? .RM ,SEEN>>>
		       <TELL CR CR
"\"We had best cross the river quickly.\" Bergon said. \"I would not like
to think of the alternative.\"">)>)
	       (<NOT <FSET? .RM ,SEEN>>
		<TELL
". The river moved more swiftly here, and the sound of
rushing water became ever louder as we progressed. Just ahead,
the river curved to the right and out of sight.">)
	       (T
		<TELL
" to the point at which the river started its curve to the right.">)> 
	 <FSET .RM ,SEEN>
	 <MOVE-TO .RM>>

<ROOM IN-RIVER
      (TRAVEL-COMMANDS DOWNSTREAM-COMMAND UPSTREAM-COMMAND CROSS-COMMAND RETURN-COMMAND)
      (ENTER
       <EXECUTE ()
		<COND (<EQUAL? <MOD <GET-TEMP> 5> 4>
		       <MOVE ,FALLS ,HERE>)>>)
      (TEMP 0)
      (FLAGS DANGEROUS DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (<FSET? ,HERE ,ENCHANTED>
	       <FCLEAR ,HERE ,ENCHANTED>
	       <COND (<AND <ACTION? CAST> <OBJECT? WIND-SPELL>>
		      ;"Double whammy..."
		      <USE-ESSENCES ,WIND-SPELL>
		      <COND (<G? <GET-TEMP> 13>
			     <TELL
"Using more air essence than he would have liked, Praxix cast a wind spell at
the levitated raft, blowing it (and us) across to the far shore of the river,
where we tumbled onto the ground.">
			     <CROSSED-RIVER>)
			    (T
			     <TELL
"It was far too risky to try blowing us across the entire expanse of river, but
there was enough air essence in Praxix' pouch to propel us back to the near shore,
where we landed in a twisted heap, destroying the raft entirely.">
			     <FCLEAR ,RAFT ,SEEN>
			     <MOVE-TO ,RIVER-2>)>)
		     (T
		      <TELL
"It wasn't long before we found out. We watched, helplessly as our raft sank
down into the churning waters and started drifting downstream. ">
		      <SETG ACTION ,UPSTREAM-COMMAND>
		      <RIVER-MOVE 1>)>)
	      (CROSS
	       <RIVER-MOVE 6>)
	      (DOWNSTREAM
	       <RIVER-MOVE 1>)
	      (UPSTREAM
	       <RIVER-MOVE 1>)
	      (RETURN
	       <RIVER-MOVE -4>)
	      (<AND <ACTION? CAST>
		    <OBJECT? RAIN-SPELL>>
	       <SAVE-SPELL>
	       <REMOVE ,HYE-RIVER>
	       <TELL
"It wasn't particularly funny when Praxix cast his rain spell and the
level of the river grew even higher." CR CR>
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL
"\"Will somebody take that child's toys away from him?\" Esher snarled.">)
		     (T
		      <TELL
"\"I think we've had enough magic for the present,\" Bergon said, trying
his best to conceal his anger.">)>) 
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>
		    <FSET? ,HERE ,TRAPPED>
		    <NOT <QSET? ,HERE ,ENCHANTED>>>
	       <TELL
"Praxix hurriedly attempted to cast an elevation spell to forestall
our encounter with the falls, and this he accomplished not a moment before
we were to plunge over the falls.">
	       <COND (<IN-PARTY? ,BERGON>
		      <TELL CR CR
"\"Out of curiosity,\" Bergon asked, turning to Praxix, \"what happens when
the enchantment wears off?\"">)>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <SAVE-SPELL>
	       <UNUSE-ESSENCES>
	       <TELL
"Praxix thought to cast his elevation spell on the raft, but the situation
was not yet serious enough to take such a risk.">)>)>

<GLOBAL 2ND-PASS <>>

<ROOM BEACHED-NEAR
      (TRAVEL-COMMANDS UP-COMMAND COMB-AREA-COMMAND NUL-COMMAND)
      (ENTER
       <EXECUTE ()
		<COND (<QSET? ,HERE ,SEEN>
		       <TELL
" But this was to be our last attempt at crossing: the river had beaten us.">
		       <DIVIDER>
		       <GIVE-UP-ENDING>
		       <RTRUE>)>
		<UPDATE-REMOVE ,RAFT>
		<FCLEAR ,RAFT ,SEEN>
		<COND (<NOT ,FALLS-VICTIM>
		       <REMOVE-PARTY-COMMAND ,COMB-AREA-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <FALLS-SCOUT>)
	      (COMB-AREA
	       <FALLS-COMB>)
	      (UP
	       <SETG FALLS-VICTIM <>>
	       <NEXT-DAY>
	       <FCLEAR ,RAFT ,SEEN>
	       <MOVE-TO ,RIVER-FALLS
"Scrambling up the rocks, we came to the top of the falls. Exhausted
and hurt, we quickly fell asleep and did not rise until late the
next morning.">)>)>

<ROUTINE FALLS-COMB ()
	 <REMOVE-PARTY-COMMAND ,COMB-AREA-COMMAND>
	 <TELL
"Stumbling through the rocky shore, we spread out in search of ">
	 <TELL D ,FALLS-VICTIM>
	 <TELL "; after an hour with no results, we regrouped." CR CR>
	 <TELL
"\"I fear we have lost our friend, but we must go on without him.\"
Bergon said. \"He would wish it so.\"">
	 <COND (<AND <EQUAL? ,FALLS-VICTIM ,ESHER>
		     <FSET? ,FALLS ,EXAMINED>>
		<TELL CR CR
"I thought back to what Esher had said earlier - could he have known
what fate was in store for him?">)>
	 <RTRUE>>   

<ROOM BEACHED-FAR
      (TRAVEL-COMMANDS UP-COMMAND COMB-AREA-COMMAND NUL-COMMAND)
      (ENTER
       <EXECUTE ()
		<COND (<NOT ,FALLS-VICTIM>
		       <REMOVE-PARTY-COMMAND ,COMB-AREA-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <FALLS-SCOUT>)
	      (COMB-AREA
	       <FALLS-COMB>)
	      (UP
	       <NEXT-DAY>
	       <TELL
"Scrambling up the rocks, we came to the top of the falls. Exhausted
and hurt, we quickly fell asleep and did not rise until late the
next morning." CR CR>
	       <GO-TO-ASTRIX-MAZE>)>)> 


<ROUTINE GO-TO-ASTRIX-MAZE ()
	 <TELL
"The next day, we started toward the mountains upon a well-travelled path. By
mid-morning, having climbed well into the foothills of the Sunrise
Mountain, we came to the first of what was destined to be many forks.">
	 <MOVE-TO ,ASTRIX-MAZE>>

<ROUTINE FALLS-SCOUT ()
	 <TELL ACT
" went ahead, scouting out the area, while the rest of us tended
to our wounds. \"The shore goes only a short ways before the
river enters a deep gorge.\" he said, upon returning.">
	 <COND (,FALLS-VICTIM
		<TELL " \"I found no sign of " D ,FALLS-VICTIM ".\"">
		<TELL CR CR>
		<TELL
"I walked to the river's edge, and gazed up at the deadly falls.
\"I hope it is we who are the lucky ones!\" I said, thinking of
the dangers to come.">)>
	 <RTRUE>>

<GLOBAL FALLS-VICTIM 0>

<GLOBAL PADDLE-FLAG 0>

<ROUTINE FIRST-IN-PARTY (CHR1 CHR2 "OPTIONAL" (CHR3 <>) (CHR4 <>))
	 <COND (<IN-PARTY? .CHR1> .CHR1)
	       (<IN-PARTY? .CHR2> .CHR2)
	       (<AND .CHR3 <IN-PARTY? .CHR3>> .CHR3)
	       (<AND .CHR4 <IN-PARTY? .CHR4>> .CHR4)>>

<ROUTINE CROSSED-RIVER ()
	 <TELL CR CR
"\"That was enough excitement for a lifetime,\" I gasped,
stumbling off the raft and onto the swaying earth.">
	 <COND (<IN-PARTY? ,BERGON>
		<TELL CR CR
"Bergon laughed. \"I don't know about a lifetime,\" he said, \"but I suppose
it will do for today!\"">)>
	 <TELL
" It was, in fact, late in the day, so we camped for the night alongside the
river, expecting this to be our last night before meeting the Wizard Astrix." CR CR>
	 <GO-TO-ASTRIX-MAZE>>

<ROUTINE RIVER-MOVE (NUM "AUX" (OLD <GET-TEMP>) NEW MD DV VICTIM)
	 <SET NEW <+ .OLD .NUM>>
	 <SET MD <MOD .NEW 5>>
	 <SET DV <DIV .NEW 5>>
	 <SET-TEMP .NEW>
	 <COND (<ZERO? .MD>
		<TELL
"The roar of the falls filled our ears. We frantically paddled ">)
	       (<ZERO? ,PADDLE-FLAG>
		<TELL
"Now that we were on the water, we started paddling ">)
	       (<NOT <EQUAL? ,PADDLE-FLAG ,ACTION>>
		<COND (<ACTION? RETURN>
		       <TELL
"It was clear that we weren't going to make it across, so we changed direction and">)
		      (T
		       <TELL "Next, we">)>
		<TELL " started paddling ">)
	       (T
		<TELL <PICK-ONE ,PADDLE-TBL>>)>
	 <SETG PADDLE-FLAG ,ACTION>
	 <COND (<ACTION? RETURN>
		<TELL "back toward shore">)
	       (<ACTION? DOWNSTREAM>
		<TELL "downstream">)
	       (<ACTION? UPSTREAM>
		<REMOVE-PARTY-COMMAND ,UPSTREAM-COMMAND>
		<TELL "upstream">)
	       (T
		<TELL "across the river">)>
	 <COND (<OR <EQUAL? .NEW 10 15 20>
		    <AND <EQUAL? .NEW 5>
			 <EQUAL? .NUM 1>>>
		;"Go over falls if near shore and don't return...."
		<GRAPHIC ,G-FALLS ;,G-OVER-FALLS>
		<TELL
", but it was no use! Down we went, tumbling end over end, lungs so filled
with water that we could not even scream! I must have blacked out, for
I have no memory of reaching the shore." CR CR>
		<TELL
"Bruised, but otherwise uninjured, I stumbled along the shore and came upon ">
		<COND (<EQUAL? ,PARTY-MAX 2>
		       <TELL "Praxix">)
		      (T
		       <TELL "the others">)>
		<HINT ,HINT-RIVER>
		<COND (<SET VICTIM <SPARE-VICTIM>>
		       <SETG FALLS-VICTIM .VICTIM>
		       <PARTY-REMOVE .VICTIM>		       
		       <COND (<G? ,PARTY-MAX 2>
			      <TELL "; all, that is, but " D .VICTIM ", who">)
			     (T
			      <TELL "; " D .VICTIM>)>
		       <TELL " was nowhere to be seen">)>		
		<TELL "." CR CR>
		<COND (<EQUAL? .NEW 5 10 15>
		       <COND (<IN-PARTY? ,PRAXIX>
			      <TELL
"\"And for all our trouble, we're not even across the river!\" said Praxix.
And this was true">)
			     (T
			      <TELL
"We had not even made it across the river">)>
		       <TELL "; at best, we could climb back up the
rocks to the top of the falls and be back near our starting point.">
		       <MOVE-TO ,BEACHED-NEAR>)
		      (T
		       <COND (<IN-PARTY? ,PRAXIX>
			      <TELL
"\"If nothing else, we have made it across the river,\" said Praxix.
And this was true">)
			     (T
			      <TELL
"We were across the river, however">)>
		       <TELL
"; the riverfront was rough and rocky here, but it
would be a simple matter to climb to our destination at the top
of the falls.">
		       <MOVE-TO ,BEACHED-FAR>)>
		<RTRUE>)
	       (<EQUAL? .NEW 5 25 0>
		<TELL
", and it seemed we must go over the falls. I closed my eyes, and
a moment later the raft lurched forward as it struck some
rocks not twenty paces from the falls. ">
		<TELL D <FIRST-IN-PARTY ,BERGON ,MINAR ,ESHER ,PRAXIX>>
		<TELL " swung himself
off the raft, and pulled " <ME/US 2> " ashore.">
		<COND (<EQUAL? .NEW 5 0>
		       <MOVE-TO ,RIVER-FALLS>
		       <RTRUE>)
		      (T
		       <CROSSED-RIVER>
		       <RTRUE>)>)
	       (<ACTION? UPSTREAM>
		<TELL
", but we were no contest for the fierce current, which pulled our raft
further downstream.">)
	       (<ACTION? DOWNSTREAM>
		<TELL
", but the strong current needed little of our help.">)
	       (T
		<TELL " and were soon ">
		<COND (<EQUAL? .DV 1>
		       <TELL "a third">)
		      (<EQUAL? .DV 2>
		       <TELL "about half">)
		      (<EQUAL? .DV 3>
		       <TELL "two thirds">)>
		<COND (<NOT <ZERO? .DV>>
		       <TELL " of the way ">)>
		<COND (<ACTION? CROSS>
		       <TELL "to the far shore.">)
		      (T
		       <TELL "back to shore.">
		       <COND (<L? .NEW 0>
			      <MOVE-TO <GET ,SHORE-ROOMS
					    <+ .NEW 5>>>
			      <RTRUE>)>)>)>
	 ;"Where are we now?"
	 <COND (<EQUAL? .MD 2>
		<TELL " The river was picking up speed, that was clear,
and I was filled with foreboding about what lay beyond the curve ahead.">)
	       (<EQUAL? .MD 3>
		<TELL " We were rushing downstream now, and a loud,
roaring noise could be heard from around the curve ahead.">
		<COND (<IN-PARTY? ,BERGON>
		       <TELL CR CR
"\"Paddle harder!\" Bergon implored, sensing the danger ahead.">)>)
	       (T
		<TELL " As our raft turned the corner to the right, we
could see ">
		<COND (<FSET? ,FALLS ,SEEN>
		       <TELL
"the falls looming before us!">)
		      (T
		       <TELL
"the reason for the quickening river: a large falls, and directly
ahead of us!">)>
		<TELL " We had just moments to act!">
		<REMOVE-TRAVEL-COMMAND ,HERE ,DOWNSTREAM-COMMAND>
		<RESTORE-SPELLS>
		<FSET ,HERE ,TRAPPED>)>
	 <RTRUE>>
		
<GLOBAL PADDLE-TBL
	<LTABLE 0
		"We continued to paddle "
		"Without pausing a moment to rest, we continued paddling ">>
	       