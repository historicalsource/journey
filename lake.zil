"LAKE for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT LAKE>

<ROUTINE GATE-TO-HIGH-PLAIN ()
	 <TELL
"We awoke with the sun, and could see now where we had come. We were
on a ridge above a high plain in the mountains, just a few hundred
feet above a large, blue-green lake. Not long after starting, we had
descended into the plain. The sky was starting to darken in the north, and
this could only mean an approaching storm.">
	 <MOVE-TO ,HIGH-PLAIN>>

<OBJECT GOLD-STREAM-OBJ
	(SDESC "stream")
	(KBD %<ASCII !\S>)
	(LOC GOLD-STREAM)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <CLEAR-EXBIT>
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL
"Praxix gazed absently at the stream, then picked up a small stone, and skimmed
it over the rippling surface." CR CR>
			<TELL
"\"A storm is brewing,\" he said as the stone disappeared from sight. \"We should
move quickly, lest we be caught in it!\"">)
		       (T
			<CLEAR-EXBIT ,GOLD-STREAM-OBJ ,PRAXIX>
			<ADD-TRAVEL-COMMAND ,HERE ,FIND-GOLD-COMMAND>
			<FSET ,HERE ,ADVISE>
			<TELL ACT
" bent down and ran his fingers through the icy mountain waters. He was
just about to stand when his eye caught a glimpse of a shiny golden object
sitting in the stream bed. Rolling up his sleeve, he reached down for it, but
failed to come up with anything." CR CR>
			<TELL
"\"I would swear it was gold,\" " ACT " said, as he stared intently into the
waters. \"Now that would be something of value!\"">
			<COND (<IN-PARTY? ,BERGON>
			       <TELL CR CR
"\"It is possible,\" Bergon replied, thoughtfully, \"that there is gold in these
mountain waters, but I should think not.\"">)>)>
	         <TELL CR CR
"The dark clouds lowered as they rolled in from the north. The winds
started to howl; it would not be long before the rains came.">)>)>

<COMMAND FIND-GOLD>

<GLOBAL TORRENT-LOSER <>>

<ROOM GOLD-STREAM
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-GOLD-STREAM)
      (FLAGS DONT-SCOUT DANGEROUS)
      (TEMP 0)
      (ACTION
       <ACOND ("AUX" TMP)
	      (GET-ADVICE
	       <COND (<ZERO? <GET-TEMP>>
		      <TELL
"Unsure of whether to press on or to search for more gold, Bergon
gathered us together. \"I fear the storm that is to come,\" he said,
then asked the rest of us for our opinions." CR CR>
		      <TELL
"It is true that we had not travelled here in search of gold, but gold is
a rare and valuable commodity. And thus, it was difficult to know whether
it would hurt to search just a little longer.">
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL " Esher put it best. \"A little
rain won't hurt, and neither would a little gold,\" he said.">)>
		      <UPDATE-FCLEAR ,HERE ,ADVISE>)
		     (<EQUAL? <GET-TEMP> 1>
		      <TELL
"Bergon was becoming increasingly concerned. But, as earlier, the
group was less inclined to leave this opportunity behind.">
		      <UPDATE-FCLEAR ,HERE ,ADVISE>)>)
	      (FIND-GOLD
	       <SET-TEMP <SET TMP <+ <GET-TEMP> 1>>>
	       <COND (<EQUAL? .TMP 1>
		      <UPDATE-FSET ,HERE ,ADVISE>
		      <TELL
"We each scanned the stream for gold, with little luck. The clouds,
dark and heavy, began to rain down upon us. \"Look!\" said Bergon,
pointing at the chain lightning off to the north. Seconds later, the
earth shook with the roar of thunder. \"It is not far now,\" he
added, as his eyes drifted to the blackening sky.">)
		     (T
		      <TELL
"Runoff from the nearby hills was forming into numerous streams,
each coursing into the main channel in which we searched in vain
for gold. Crash! A tree nearby cracked in two by a stroke of
lightning. Rain was falling now in buckets, and Bergon screamed
for us to take cover. As I turned upstream, a great torrent of water
was heading right at me!">
		      <QUEUE I-TORRENT-HITS 1>
		      <REMOVE-TRAVEL-COMMAND>)>)
	      (<AND <ACTION? INVENTORY>
		    <FSET? ,HERE ,DEAD>
		    <NOT <QSET? ,HERE ,BLUE-MIX>>>
	       <TELL
"Frantically, I searched my pack. ">
	       <COND (,TORRENT-LOSER
		      <TELL "Over and over I looked, but it was
no use. The " D ,TORRENT-LOSER " was gone!" CR CR>
		      <TELL
"Praxix looked grim. \"This is an evil omen,\" he said. \"We shall
not be able to replace it!\"">)
		     (T
		      <TELL "Fortunately, we had lost nothing
to the storm.">)>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>
		    <G? <GET-TEMP> 0>>
	       <COND (<PRSI? TAG-OBJECT>
		      <TELL
"Fortunately, Praxix had the presence of mind to cast his levitate spell upon me,
so that the torrent that approached washed harmlessly beneath me, preventing an
almost certain loss of our possessions, no less my life. The others fared less well,
having been knocked quite a ways downstream before they regained their footing. ">
		      <FIND-STREAM-ESSENCE>
		      <TELL	       
" Having had the good fortune to have found some magical essence, we continued alongside
the stream until we came to the shore of the lake.">
		      <MOVE-TO ,LAKE-SHORE-1>)
		     (T
		      <TELL
"Praxix, taking out his air and earth essences, cast his elevation spell on "
D ,ACTION-PRSI ", who rose slowly into the air before us. Still, the onrushing
waters approached, and I tried desparately to get away. ">
		      <TORRENT-HITS>
		      <RTRUE>)>)
	      (PROCEED
	       <COND (<L? <SET TMP <GET-TEMP>> 1>
		      <TELL
"We made our way along the stream down to the shore of the lake, as
a great downpour was loosed from the sky. The stream rose steadily,
and lightning filled the northern sky. Soon, the stream became a
wild torrent, nearly washing us aside as we rushed to take cover.
And then, as quickly as it came, the storm passed, and a wide
rainbow filled the brightening sky." CR CR>
		      <TELL
"\"That was awfully close!\" I said, checking that the contents
of my pack were secure." CR CR>
		      <MOVE-TO ,LAKE-SHORE-1
"\"It could have been far worse for us,\" Bergon said darkly. \"Let us continue.\"
A short time later, we had taken the few hundred paces to the near shore of the
lake.">)
		     (<FSET? ,HERE ,DEAD>
		      <MOVE-TO ,LAKE-SHORE-1
"Having barely survived our adventure at the stream, we walked the last few hundred
paces to the near shore of the lake.">)
		     (T
		      <TORRENT-HITS>
		      <RTRUE>)>)>)>

<OBJECT I-TORRENT-HITS
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<AND <NOT <FSET? ,HERE ,DEAD>>
			      <EQUAL? ,HERE ,GOLD-STREAM>>
			 ;"Only once now..."
			 <TELL CR CR>
			 <TORRENT-HITS>)>>)>

<ROUTINE TORRENT-HITS ()
	 <FSET ,HERE ,DEAD>
	 <TELL
"Too late! We watched as a torrent flowed down the hillside,
knocking us down and washing my pack downstream. I did my
best to salvage its contents, then scrambled with the others to a
rock-sheltered spot nearby, where we waited for the storm to abate.">
	 <COND (<IN? ,DWARF-STONE ,INVENTORY>
		<SETG TORRENT-LOSER ,DWARF-STONE>)
	       (<IN? ,WEBBA-MAP ,INVENTORY>
		<SETG TORRENT-LOSER ,WEBBA-MAP>)>
	 <COND (,TORRENT-LOSER
		<HINT ,HINT-GOLD>
		<UPDATE-MOVE ,TORRENT-LOSER>)>
	 <UPDATE-FCLEAR ,HERE ,ADVISE>
	 <UPDATE-FCLEAR ,HERE ,INVENTORIED>
	 <REMOVE-PARTY-COMMAND ,FIND-GOLD-COMMAND>
	 <FIND-STREAM-ESSENCE>>

<ROUTINE FIND-STREAM-ESSENCE ()
	 <TELL CR CR
"Strangely, Praxix returned to the swollen stream, and pulled up a few peculiar
golden stones." CR CR>
	 <TELL
"\"After all that, you of all people are looking for gold!\" Bergon huffed." CR CR>
	 <TELL
"\"Not gold, Bergon,\" he said, rubbing the golden veneer off of the stone. \"Water
essence, though not altogether much, I'm afraid. I suspect that's what caught our
eye in the first place.\" Soon, Praxix had finished isolating the water essence from
its golden facade, and had placed it safely away in his pouch.">
	 <FIND-ESSENCE ,ESSENCE-WATER 3>>

<GLOBAL LAKE-VICTIM <>>

<ROOM LAKE-SHORE-1
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS ADVISE DANGEROUS)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <QSET? ,HERE ,SEEN>>
		       <COND (<EQUAL? ,PARTY-MAX 2>
			      <TELL
"After a brief lunch at the lake, we continued around to the far shore.">
			      <REMOVE-TRAVEL-COMMAND ,LAKE-SHORE-3 ,BACK-COMMAND>
			      <MOVE-TO ,LAKE-SHORE-3>
			      <RTRUE>)>
		       <TELL CR CR
"The sun was high in the sky; no sign, not even the rainbow,
remained as testament to the deluge we had just witnessed.
It had been a while since our last meal, and talk soon turned to lunch.
Bergon strode to the shore of the glistening lake and eyed it
hungrily." CR CR>
		       <GRAPHIC ,G-LAKE-SHORE>
		       <TELL
"\"Have I ever told you about my fishing days at Lendros?\" he
said. Nobody responded to this informal banter, but Bergon
persisted." CR CR>
		       <TELL
"\"How would everyone feel about some fresh lake trout?\" he asked." CR CR>
		       <TELL
"\"Oh, my, yes; that would hit the spot!\" he replied, playfully." CR CR>
		       <TELL
"Then, taking the slightest murmur from the group as a mandate, he dove
into the icy clear waters." CR CR>
		       <TELL
"He surfaced soon thereafter; though out of breath, he gasped
something about our upcoming feast">
		       <COND (<AND <NOT ,2ND-PASS>
				   <NOT <FSET? ,DWARF-MEETING ,SEEN>>>
			      <SETG LAKE-VICTIM
				    <FIRST-IN-PARTY ,MINAR ,ESHER>>
			      <COND (,LAKE-VICTIM
				     <TELL ". Seeing how weakened Bergon
had become, " D ,LAKE-VICTIM " pulled him from the lake and dove in to
catch our lunch himself. But he did not surface, and, after a few agonizingly
long minutes, our concern turned to alarm.">
				     <PARTY-REMOVE ,LAKE-VICTIM>)
				    (T
				     ;"Can't do the nymph scene in this condition..."
				     <TELL ". But Praxix convinced Bergon that,
having already lost some of our party, he should not attempt such a dive in
his breathless condition.">
				     <UPDATE-FCLEAR ,HERE ,ADVISE>
				     <RTRUE>)>)
			     (T
			      <TELL ", laughed, then dove again into the
lake. Only this time, he did not return.">
			      <SETG LAKE-VICTIM ,BERGON>
			      <PARTY-REMOVE ,BERGON>)>
		       <FSET ,LAKE-VICTIM ,INCAPACITATED>
		       <SETG UPDATE-FLAG T>
		       <ADD-PARTY-COMMAND ,ENTER-LAKE-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL "Frant">)
		     (T
		      <TELL "Method">)>
	       <TELL
"ically, " ACT " scouted the area along the shore looking for any sign
of " D ,LAKE-VICTIM ". He returned frustrated, having found no sign of our
missing friend.">
	       <COND (<EQUAL? ,ACTOR ,MINAR>
		      <TELL
" He did, however, find something of interest, and not far
from where we stood." CR CR>
		      <TELL
"\"There's a cave,\" he said, \"just a little farther along the
shore.\"">)>
	       <RTRUE>)
	      (GET-ADVICE:REMOVE
	       <TELL D ,LEADER>
	       <COND (<EQUAL? ,LAKE-VICTIM ,BERGON>
		      <TELL ", taking charge and attempting at the same time
not to sound overly pessimistic,">)>
	       <TELL
" said, \"Perhaps " D ,LAKE-VICTIM " has been caught in a current, and
carried further along the shore.\"">
	       <TELL CR CR>
	       <COND (<EQUAL? ,LEADER ,PRAXIX>
		      <TELL "Praxix continued. \"">)
		     (T
		      <TELL
"Praxix concurred. \"" D ,LEADER " is right,\" he
started, \"">
		      <COND (<EQUAL? ,LEADER ,ESHER>
			     <TELL "though I am loath to admit it. T">)
			    (T
			     <TELL "t">)>)>
	       <TELL
"here is no sign of " D ,LAKE-VICTIM ", and that is very disturbing indeed!
Perhaps we shall learn more as we progress along the lake shore.\"">
	       <RTRUE>)
	      (PROCEED
	       <COND (,LAKE-VICTIM
		      <MOVE-TO ,LAKE-SHORE-2
"Having little alternative, we packed our things and moved along the
shore, coming to a narrow cave through which a warm spring emptied
into the lake.">)
		     (T
		      <TELL
"After a restful night at the shore of the lake, we marched around the
shore until the path ended, continuing instead steeply upward into the
surrounding hills." CR CR>
		      <APPLY <GETP ,LAKE-SHORE-3 ,P?ACTION>>
		      <RTRUE>)>)  
	      (ENTER-LAKE
	       <TELL
"With a sense of urgency, I jumped into the cold waters and dove
vertically down along a vast rock wall which stretched out of sight
beneath me. But whereas the wall bounded my movements on one side,
the vastness of the lake stretched out before me on the other - clear
and still - and there was no sign of " D ,LAKE-VICTIM "!">
	       <MOVE-TO ,UNDERSHORE-1>)>)>

<COMMAND (ENTER-CAVE ENTER)>

<ROOM LAKE-SHORE-2
      (TRAVEL-COMMANDS PROCEED-COMMAND ENTER-CAVE-COMMAND NUL-COMMAND)
      (GRAPHIC G-LAKE-SHORE-CAVE)
      (FLAGS NEAR-DARK)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <TELL ACT " went ahead, ">
	       <COND (<NOT <FSET? ,PRAXIX ,LIT>>
		      <TELL
"but returned before long, telling us that the cave was too
dark to explore without additional light.">)
		     (T
		      <TELL
"taking Praxix' staff with him for light. When he returned, he
related that the cave continued until it ended at the site of a deep, warm pool.">)>)
	      (ENTER-CAVE
	       <FSET ,HERE ,DONT-SCOUT>
	       <COND (<FSET? ,LAKE-CAVE ,SEEN>
		      <REMOVE-TRAVEL-COMMAND>
		      <REMOVE-TRAVEL-COMMAND ,LAKE-SHORE-3 ,BACK-COMMAND>
		      <TELL
"Determined not to give up hope, we again entered the cave">
		      <COND (<FSET? ,LAKE-POOL ,SEEN>
			     <TELL
", continuing down the narrow path until we reached the edge of the warm pool">
			     <MOVE-TO ,LAKE-POOL>)
			    (T
			     <MOVE-TO ,LAKE-CAVE>)>
		      <TELL ".">)
		     (T
		      <TELL
"Following the side of the warm spring into the cave, we passed through
caverns whose water-polished walls gave testimony to the torrents that
had flowed through these chambers many long years ago.">
		      <MOVE-TO ,LAKE-CAVE>)>
	       <COND (<AND <EQUAL? ,HERE ,LAKE-CAVE>
			   <NOT <FSET? ,PRAXIX ,LIT>>>
		      <TELL
" We were now far enough into the cave that the available light was fading
quickly. It would be far too dangerous to proceed any further.">)>
	       <RTRUE>) 
	      (PROCEED
	       <TELL
"The path along the shore soon ended, continuing instead steeply
upward into the surrounding hills. Further progress along the shore
would be impossible.">
	       <COND (<AND <NOT <IN-PARTY? ,LAKE-VICTIM>>
			   <NOT <QSET? ,HERE ,BLUE-MIX>>>
		      <TELL
" If we continued now, it was almost certain we'd never see " D ,LAKE-VICTIM
" again.">)>
	       <MOVE-TO ,LAKE-SHORE-3>)>)>

<ROOM LAKE-SHORE-3
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT)
      (GRAPHIC G-LAKE-SHORE-3)
      (ENTER
       <EXECUTE ()
		<COND (<IN-PARTY? ,LAKE-VICTIM>
		       <REMOVE-PARTY-COMMAND ,BACK-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <COND (<AND ,LAKE-VICTIM <NOT <IN-PARTY? ,LAKE-VICTIM>>>
		      <HINT ,HINT-LAKE>
		      <TELL
"\"I am afraid we have no alternative,\" " D ,LEADER " said, \"but
to go on without " D ,LAKE-VICTIM ".\"" CR CR>)
		     (<AND ,LAKE-VICTIM <NOT <IN? ,NYMPH-STONE ,INVENTORY>>>
		      <HINT ,HINT-NYMPH-STONE>)>
	       <COND (,2ND-PASS
		      <COND (<AND <NOT <FSET? ,BITE-FOREST ,SEEN>>
				  <OR <IN-PARTY? ,MINAR> <IN-PARTY? ,ESHER>>>
			     <TELL
"The next morning, we retraced our earlier steps, skirting the edge of the lake,
and descending back into the forest for our return to Astrix. It was soon midday,
and we decided to stop in a nearby clearing for some lunch.">
			     <MOVE-TO ,BITE-FOREST>
			     <RTRUE>)
			    (T
			     <N-DAY-TREK 3>
			     <RTRUE>)>)>
	       <TELL
"We left the lake, climbing out of the valley and into the northeastern
hills. Following a narrow path, we marched until, late in the afternoon,
the path climbed steeply up a high ridge. We arrived as dusk approached
and stood in awe of the world that surrounded us." CR CR>
	       <MOVE-TO-FOREST-RIDGE>)
	      (BACK:REMOVE
	       <TELL
"Unwilling to leave the lake without making another attempt at finding "
D ,LAKE-VICTIM ", we retraced our steps and soon arrived back at the mouth of
the cave.">
	       <MOVE-TO ,LAKE-SHORE-2>)>)>

<ROOM LAKE-CAVE
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT NEAR-DARK)
      (ENTER FSET-SEEN)
      (GRAPHIC G-NARROW-SLIT)
      (CLOCK
       <EXECUTE ()
		<COND (<FSET? ,PRAXIX ,LIT>
		       <FORCE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <COND (<NOT <FSET? ,PRAXIX ,LIT>>
		      <TELL
"Despite the darkness, we continued down the narrow path until it became clearly
futile to do so." CR CR>
		      <TELL
"\"It is bad enough that we have lost " D ,LAKE-VICTIM ",\" Praxix said.
\"It would be folly to risk other lives.\"">
		      <REMOVE-TRAVEL-COMMAND>)
		     (T
		      <MOVE-TO ,LAKE-POOL
"A narrow path now led beside the gently flowing spring, and this we
followed until we came upon a deep, warm pool whose crystal clarity was a
revelation to behold.">)>) 
	      (BACK
	       <TELL "It appeared ">
	       <COND (<FSET? ,PRAXIX ,LIT>
		      <TELL "the cave would lead nowhere">)
		     (T
		      <TELL " we would not learn where the cave led">)>
	       <MOVE-TO ,LAKE-SHORE-2
"; and so, with hope fading for our lost friend, we returned to the mouth of
the cave.">)>)>

<ROOM LAKE-POOL
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND ENTER-POOL-COMMAND)
      (GRAPHIC G-LAKE-POOL)
      (ENTER FSET-SEEN)
      (FLAGS UNDERGROUND ADVISE)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <COND (<OR <FSET? ,UNDERPOOL-2 ,SEEN>
			  <NOT <IN-PARTY? ,ESHER>>>
		      <TELL
"We huddled among ourselves, but few words were spoken. And yet I could see
in Praxix' eyes the desire that I">
		      <COND (<FSET? ,UNDERPOOL-2 ,SEEN>
			     <TELL " once again">)>
		      <TELL " attempt the descent.">)
		     (<FSET? ,UNDERPOOL-2 ,SEEN>
		      <TELL
"Esher felt it would be dangerous to explore the pool further, but
Praxix was more optimistic. \"This pool appears natural, yet it is clearly
the handiwork of great artisans; the search for knowledge is always
dangerous, Esher, and yet is it not the purpose of our Journey?\" he said.">)
		     (T
		      <TELL D ,LEADER
" stood a long while in thought, then asked for advice.">
		      <COND (<G? ,PARTY-MAX 2>
			     <TELL
" When none spoke, I made a rare suggestion of my own.">)>
		      <TELL " \"I
am happy to have a look underwater, if you think it would help,\" I
said.">
		      <COND (<NOT <EQUAL? ,LEADER ,PRAXIX>>
			     <TELL CR CR
"Praxix said nothing; he turned toward the pool and stared.">)>
		      <RTRUE>)>)
	      (<OR <ACTION? SCOUT>
		   <ACTION? PROCEED>>
	       <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>
	       <COND (<ACTION? SCOUT>
		      <TELL ACT>)
		     (T
		      <TELL "Praxix, going on ahead,">)>
	       <TELL
" tried to find another path through the cave, but failed. \"This is
as far as it goes,\" he said.">)
	      (BACK
	       <COND (<FSET? ,UNDERPOOL-2 ,SEEN>
		      <TELL "W">)
		     (T
		      <TELL
"It appeared the cave would lead nowhere; and so, w">)>
	       <TELL
"ith hope fading for our lost friend, we returned to the mouth of the cave.">
	       <MOVE-TO ,LAKE-SHORE-2>)
	      (ENTER-POOL
	       <FSET ,HERE ,ADVISE>
	       <COND (<NOT ,SUBGROUP-MODE>
		      <MAKE-TAG-SUBGROUP T>)>
	       <COND (<FSET? ,UNDERPOOL-2 ,SEEN>
		      <TELL
"With Praxix' encouragement, I descended again through the warm
waters, coming finally to the lip of the tube. I had only seconds to
make a decision.">)
		     (T
		      <TELL
"It was the consensus that we search the depths of the pool in search of
whatever lay below. I volunteered, giving my pack to Praxix for safe keeping.
Then, taking a deep breath, I plunged into the warming waters." CR CR>
		      <TELL
"I descended along the rock formations which bounded the pool, admiring
the flowing forms that the water had created through the long ages.
And then, a knot formed in my stomach. For the walls surrounding
me were now smooth, like polished glass. I shuddered, thinking of
what might lie beyond." CR CR>
		      <TELL
"I had just about reached the limit of my descent, when I
came to the end of the tube as it opened out into what I could only
imagine was the greater part of the lake. I had to think fast: no
matter which choice I made, I would have to surface at once!">)>	       
	       <MOVE-TO ,UNDERPOOL-2>)
	      (<AND <ACTION? CAST> <OBJECT? FAR-VISION-SPELL>>
	       <TELL
"Praxix was intrigued by this pool, and decided to see just how deep
it was. And so he pulled out some fire and air essence, and shot a ball of
flame into the water; it fizzled out even as it penetrated the surface.">
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL " Esher raised an eyebrow;">)>
	       <TELL " I stifled a laugh." CR CR>
	       <TELL
"Praxix straightened up and, trying his best to sound sincere, said,
\"As I suspected!\"">)>)>

<ROUTINE POOL-MOVE (STR)
	 <CLEAR-SUBGROUP>
	 <RESTORE-TAG-COMMANDS>
	 <RESTORE-TAG-OBJECTS>
	 <MOVE-TO ,LAKE-POOL .STR>>

<COMMAND (LEAVE-TUBE LV-TUBE)>
<COMMAND (ENTER-LAKE ENTER)>

<OBJECT UNDERPOOL-2-TUBE
	(LOC UNDERPOOL-2)
	(SDESC "tube")
	(KBD %<ASCII !\T>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Having little time, I nonetheless examined the tube. It was smooth to
the touch, and of a material completely foreign to me. Here, at the
bottom, it was only four feet across, making it difficult to maneuver.">)>)>

<ROOM UNDERPOOL-2
      (TRAVEL-COMMANDS RETURN-COMMAND LEAVE-TUBE-COMMAND NUL-COMMAND)
      (GRAPHIC G-UNDERPOOL-TUBE)
      (FLAGS UNDERWATER)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (LEAVE-TUBE
	       <TELL
"Now I am not a cowardly person, yet I was sorely tempted to rise back
to the surface. But some inner reserve of strength guided my actions;
I pulled myself through the lip of the tube, then rose steadily
toward the unknown." >
	       <UL-1-MOVE>) 
	      (RETURN
	       <COND (<NOT <QSET? ,HERE ,TRIED>>
		      <TELL
"Now I am not a cowardly person, though by returning to the surface
it may appear otherwise. And yet, how could I know what I might
find when I rose to the surface outside of the tube? For that matter,
I could not even be sure there was a surface to reach!">)
		     (T
		      <REMOVE-TRAVEL-COMMAND ,LAKE-POOL ,ENTER-POOL-COMMAND>
		      <TELL
"Once again, however, I found myself unable to leave the tube and
venture forth into the unknown.">)>
	       <TELL CR CR>
	       <POOL-MOVE
"And thus I returned to the safety of the pool, fully aware that my
decision might forever doom our missing friend.">)>)>

<OBJECT WARM-POOL
	(SDESC "pool")
	(KBD %<ASCII !\P>)
	(LOC LAKE-POOL)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Each of us was mesmerized by this lovely pool, whose depth appeared
infinite. " ACT " picked up a rock lying nearby and tossed
it into the water; we watched it as it fell and when it finally
disappeared from sight, we were watching still.">)>)>
 
<COMMAND (ENTER-POOL ENTER)>

<ROOM UNDERSHORE-1
      (TRAVEL-COMMANDS DIVE-COMMAND SURFACE-COMMAND NUL-COMMAND)
      (FLAGS UNDERWATER)
      (ENTER
       <EXECUTE () <MAKE-SUBGROUP ,TAG> <TRAVEL-COMMANDS ,TAG ,NUL-COMMAND>>)
      (EXIT
       <EXECUTE ()
		<CLEAR-SUBGROUP>
		<RESTORE-TAG-COMMANDS>>)
      (ACTION
       <ACOND ()
	      (DIVE
	       <TELL
"Mustering my remaining strength, I dove farther along the rock
wall. Almost out of air, I caught sight of the wall's bottom some fifty
or more feet below me. \"He could not have gone this way,\" I said to
myself. \"There is not a person alive strong enough!\" And yet, gazing
into the expanse of lake before me, I could hardly imagine where else he
could have gone without leaving the slightest trace." CR CR>
	       <MOVE-TO ,LAKE-SHORE-1
"The water here, thirty feet or so below the surface, was strangely warm
and comforting, but some inner alarm awakened me to my danger. It would be
madness to go further, so I ascended to the surface.">)   
	      (SURFACE
	       <TRAVEL-COMMANDS ,LAKE-SHORE-1
				,PROCEED-COMMAND
				;,DIVE-COMMAND>
	       <TELL
"With no sign of " D ,LAKE-VICTIM ", I returned to the surface and reported
back to the group.">
	       <MOVE-TO ,LAKE-SHORE-1>)>)>

<END-SEGMENT>

<BEGIN-SEGMENT NYMPHS>

<ROUTINE UL-1-MOVE ()
	 <PICINF ,G-NYMPH-CHAMBER ,PICINF-TBL>	;"Force disk flip"
	 <COND (<NOT ,SUBGROUP-MODE>
		<MAKE-TAG-SUBGROUP T>)>
	 <TELL CR CR>
	 <TELL
"Within moments, I had arrived at the surface, pulling myself out
of another, larger pool and onto a sandy area. Exhausted, yet
exhilarated, I rose to my feet and found myself standing in a wide chamber
cut from the surrounding rock; a finely carved archway led into a dimly
glowing passage. On the archway were runes quite unlike any I had ever seen
before.">
	 <TELL CR CR
"Still somewhat lightheaded from my time underwater, I walked into
the passage, which soon widened into a grander chamber adorned with colorful
banners. This would be the land of the Nymphs, if ">
	 <COND (,2ND-PASS <TELL "Astrix">)
	       (T <TELL "my book of legends">)>
	 <TELL " was to be believed. And there, to my surprise, was " D ,LAKE-VICTIM
", lying on a bed of straw and covered in a heavy woolen blanket." CR CR>
	 <TRAVEL-COMMANDS ,TAG ,PICK-UP-COMMAND ,DROP-COMMAND ,EXAMINE-COMMAND> 
	 <MOVE-TO ,UL-2
"And as I approached my sleeping friend, I could hear someone approach
from another corridor nearby.">>

<OBJECT UL-2-MINAR
	(SDESC "Minar")
	(KBD %<ASCII !\M>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <EXAMINE-LAKE-VICTIM>)>)>

<OBJECT UL-2-ESHER
	(SDESC "Esher")
	(KBD %<ASCII !\E>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <EXAMINE-LAKE-VICTIM>)>)>

<OBJECT UL-2-BERGON
	(SDESC "Bergon")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <EXAMINE-LAKE-VICTIM>)>)>

<ROUTINE EXAMINE-LAKE-VICTIM ()
	 <COND (<FSET? ,LAKE-VICTIM ,INCAPACITATED>
		<FSET ,LAKE-VICTIM ,TRIED>
		;"Set flag to say we've seen him..."
		<TELL
"At first, " D ,LAKE-VICTIM " appeared unnaturally still, perhaps dead. But
the blanket which covered him heaved slowly with his breath, and for this,
I was greatly relieved.">
		<COND (<FSET? ,HERE ,EXAMINED>
		       <TELL CR CR
"But as I knelt beside him, my foot inadvertantly caught the end of the
blanket, and pulled it to the floor. " D ,LAKE-VICTIM " was not only unconscious,
but his feet and hands had been tightly bound!">)>
		<TELL
" Fortunately, it was a simple matter to remove his bonds. Bringing him back
to consciousness would be another thing entirely, and it was likely that the
creature that bound him would return before long." CR CR>
		<TELL
"But this problem was soon solved of itself, for " D ,LAKE-VICTIM " slowly
started to wake. He was too weak to be moved, so I calmed him the best I could
by urging him to rest.">
		<FCLEAR ,LAKE-VICTIM ,INCAPACITATED>)
	       (T
		<TELL D ,LAKE-VICTIM
" was already quite a bit stronger and appeared fit enough to return with me
to the cave where our party stood waiting.">)>>

<COMMAND TO-CAVE>

<COMMAND (RETURN-ALONE RETURN)>

<OBJECT I-LAKE-VICTIM-COMES-TO
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<FSET? ,LAKE-VICTIM ,INCAPACITATED>
			 <FCLEAR ,LAKE-VICTIM ,INCAPACITATED>
			 <CHANGE-TRAVEL-COMMAND ,UL-2
						,RETURN-ALONE-COMMAND
						,TO-CAVE-COMMAND>
			 <COND (<EQUAL? ,HERE ,UL-2>
				<TELL CR CR
"Just then, " D ,LAKE-VICTIM " stirred and I moved to his side. Within a few minutes,
he had regained consciousness, but I advised him to remain quiet and calm">
				<COND (<FSET? ,LAKE-VICTIM ,TRIED>
				       ;"We know about his capture..."
				       <TELL
" until we were ready to make our escape.">)
				      (T
				       <TELL
". Although short of breath, he told of his underwater capture by the Nymphs. He
did not know their purpose, nor could he guess, yet he was certain of their evil
designs." CR CR>
				       <TELL
"\"We must leave here at once,\" he said, \"for surely they will return before
long.\"">)>)>)>
		  <REMOVE ,I-LAKE-VICTIM-COMES-TO>>)>

<ROOM UL-2
      (TRAVEL-COMMANDS TO-CAVE-COMMAND WIDE-PATH-COMMAND NARROW-PATH-COMMAND
                       NUL-COMMAND)
      (GRAPHIC G-NYMPH-CHAMBER)
      (FLAGS UNDERGROUND TORCHBIT LIT)
      (ENTER
       <EXECUTE ()
		<TORCH-CHECK ,HERE>
		<COND (<NOT <QSET? ,HERE ,SEEN>>
		       <QUEUE I-LAKE-VICTIM-COMES-TO 8>
		       <COND (<EQUAL? ,LAKE-VICTIM ,MINAR>
			      <UPDATE-MOVE ,UL-2-MINAR ,HERE>)
			     (<EQUAL? ,LAKE-VICTIM ,ESHER>
			      <UPDATE-MOVE ,UL-2-ESHER ,HERE>)
			     (T
			      <UPDATE-MOVE ,UL-2-BERGON ,HERE>)>
		       <OPTION ,TAG ,STAND-COMMAND ,HIDE-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (TO-CAVE
	       <COND (<FSET? ,LAKE-VICTIM ,INCAPACITATED>
		      <TELL
"It was clear that we were in great danger, and my immediate reaction was to
return to the pool with " D ,LAKE-VICTIM ". But it was painfully obvious that
he was in no condition to be moved, no less withstand the dive. No, I could
return, but it would not be with " D ,LAKE-VICTIM ".">
		      <CHANGE-TRAVEL-COMMAND ,HERE
					     ,TO-CAVE-COMMAND
					     ,RETURN-ALONE-COMMAND>)
		     (T
		      <TELL
"Now conscious and regaining his strength, I managed to help " D ,LAKE-VICTIM " back
to the pool">
		      <COND (<IN? ,TORCH ,INVENTORY>
			     <TELL ". As much as I would have preferred to take
the torch along, I simply could not handle both it and " D ,LAKE-VICTIM ". Holding
my friend firmly, we dove">)
			    (T
		             <TELL " and then down">)>
		      <TELL
" into the warm waters, finally reaching the tube which led back to">
		      <END-NYMPH-STORY T>)>)
	      (RETURN-ALONE
	       <TELL
"There was no way that I could help poor " D ,LAKE-VICTIM ". In a few moments,
his captors would no doubt arrive, and then both of us might well be doomed.
Heavy of heart, I dove back into the pool, and from there back into the tube
which led back to">
	       <END-NYMPH-STORY>)
	      (WIDE-PATH
	       <COND (<UL-MOVE-CHECK ,UL-JCN>
		      <TELL 
"With a good deal of apprehension, I ventured through the doorway and into
a hallway which came to a large, empty chamber, with an ornate doorway
to the right and a simpler one to the left, from which a nasty smell
emanated. Ahead, another passage led into the distance.">
		      <UL-MOVE ,UL-JCN>)>)
	      (NARROW-PATH
	       <COND (<UL-MOVE-CHECK ,UL-2-PIT>
		      <TELL
"The narrow path snaked through the rock until it ended blindly at a very small,
rounded chamber, in the middle of which lay a ">
		      <COND (<FSET? ,UL-2-PIT ,SCOUTED>
			     <TELL "perfectly round pool of water.">)
			    (T
			     <TELL "large stone cover.">)>
		      <UL-MOVE ,UL-2-PIT>)>)
	      (HIDE
	       <SINGLE-MOVE-GRAPHIC ,G-LIURA>
	       <FSET ,HERE ,TRIED>
	       <QUEUE I-NYMPHS-ARRIVE 40>
	       <TELL
"With some hesitation, I decided to wait outside of the chamber until I could
see who was coming. And then it came, whatever creature it was that inhabited these
halls. It moved slowly, but gracefully, to " D ,LAKE-VICTIM "'s side, as if
checking on his health. Relieved, I was about to greet this unknown being,
when I noticed the ropes which bound together " D ,LAKE-VICTIM "'s hands and
feet! A moment later, the being glided out of the room, and I again reentered.">
	       <END-OPTION>)
	      (WAIT
	       <TELL
"I did as the creature asked, but this was a tragic mistake. Within minutes"
,ARMED-CREATURES>
	       <END-NYMPH-STORY>)
	      (STAND
	       <SINGLE-MOVE-GRAPHIC ,G-LIURA>
	       <QUEUE I-NYMPHS-ARRIVE 24>
	       <TELL
"I stood there as a strange creature entered the chamber, and I cannot honestly say
which of us was the more surprised. But a moment later, it spoke with an utterly
foreign accent and a hint of what I could only call nervousness." CR CR
"\"Your friend is quite ill,\" it said. \"It would be best for you to wait
by his side until I return. Do not touch or examine him! He clings perilously to
life!\" And with that, the creature left the chamber.">
	       <ADD-TRAVEL-COMMAND ,HERE ,WAIT-COMMAND>
	       <FSET ,HERE ,EXAMINED>
	       <END-OPTION>)>)>

<OBJECT I-NYMPHS-ARRIVE
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <SETG NYMPHS-COMING? T>>)>

<GLOBAL NYMPHS-COMING? <>>

<COMMAND (WIDE-PATH WIDE)>
<COMMAND (NARROW-PATH NARROW)>

<OBJECT TORCH
	(SDESC "torch")
	(FLAGS DONT-EXAMINE DONT-DROP)
	(KBD %<ASCII !\T>)
	(TEMP 0)
	(ACTION
	 <ACOND ("AUX" TMP)
		(PICK-UP
		 <COND (<EQUAL? ,HERE ,UL-PIT>
			<FCLEAR ,HERE ,TORCHBIT>
			<FORCE-TRAVEL-COMMAND ,HERE ,DIVE-COMMAND>
			<UPDATE-MOVE ,TORCH ,INVENTORY>
			<COND (<NOT <GETP ,TORCH ,P?TEMP>>
			       <TELL
"Not knowing which chambers might be unlighted, I thought it best to take one
of the torches.">)
			      (T
			       <TELL
"Again, I attempted to take one of the torches, but this time I succeeded.">)>
			<TELL
" It's light was bright but cold, and its flame gave off little heat.">)
		       (T
			<UPDATE-FSET ,TORCH ,DONT-TAKE>
			<PUTP ,TORCH
			      ,P?TEMP
			      <SET TMP <+ <GETP ,TORCH ,P?TEMP> 1>>>
			<COND (<G? .TMP 1>
			       <TELL "Again, ">)>
			<TELL
"I tried to take one of the torches, but failed. They were too firmly attached to
the wall.">)>)
		(DROP
		 <TELL
"I considered putting down the torch but decided against it, believing that it
might well come in useful later.">)>)>

<ROUTINE TORCH-CHECK (RM)
	 <COND (<AND <FSET? .RM ,TORCHBIT>
		     <NOT <IN? ,TORCH ,INVENTORY>>>
		<UPDATE-MOVE ,TORCH .RM>
		<UPDATE-FCLEAR ,TORCH ,DONT-TAKE>)>>

<ROUTINE UL-MOVE-CHECK (RM)
	 <COND (<AND <NOT <IN? ,TORCH ,INVENTORY>>
		     <NOT <FSET? .RM ,TORCHBIT>>>
		<FCLEAR .RM ,LIT>
		<TELL
"I slowly entered the chamber, but it was pitch black inside and, rather than
risk injury (or worse), I decided to retrace my steps.">
		<RFALSE>)
	       (T
		<RTRUE>)>>

<ROUTINE UL-MOVE (RM)
	 <TORCH-CHECK .RM>
	 <FSET .RM ,LIT>
	 <COND (<AND <EQUAL? ,HERE .RM>
		     <OR <FSET? .RM ,TORCHBIT>
			 <EQUAL? .RM ,UL-PIT>>>
		<COND (<NOT <FSET? ,HERE ,TORCHBIT>>
		       <TELL " A single torch, mounted alongside">)
		      (T
		       <TELL " Torches, mounted on either side of">)>
		<TELL
" the entrance, cast cold, flickering shadows on the stone walls.">)>
	 <MOVE-TO .RM>>

<ROUTINE END-NYMPH-STORY ("OPTIONAL" (PA <>))
	 <REMOVE ,I-NYMPHS-ARRIVE>
	 <TELL " ">
	 <COND (<EQUAL? ,PARTY-MAX 3> <TELL "Praxix">)
	       (T
		<TELL "our party">)>
	 <TELL
". After retelling the story of my adventures, we left the cave, returning to the
shore of the lake.">
	 <CLEAR-SUBGROUP>
	 <RESTORE-TAG-OBJECTS>
	 <RESTORE-TAG-COMMANDS>
	 <UPDATE-MOVE ,TALE-NYMPHS ,PRAXIX-TALES>
	 <COND (.PA <PARTY-ADD ,LAKE-VICTIM>)>
	 <COND (,2ND-PASS
		<COND (<NOT <IN-PARTY? ,LAKE-VICTIM>>
		       <HINT ,HINT-LAKE>)>
		<COND (<AND <NOT <FSET? ,BITE-FOREST ,SEEN>>
			    <OR <IN-PARTY? ,MINAR> <IN-PARTY? ,ESHER>>>
		       <TELL
"The next morning, we retraced our earlier steps, skirting the edge of the lake,
and descending back into the forest for our return to Astrix. It was soon midday,
and we decided to stop in a nearby clearing for some lunch.">
		       <MOVE-TO ,BITE-FOREST>)
		      (T
		       <TELL CR CR>
		       <N-DAY-TREK 3>
		       <RTRUE>)>)
	       (T
		<REMOVE-TRAVEL-COMMAND ,LAKE-SHORE-3 ,BACK-COMMAND>
		<MOVE-TO ,LAKE-SHORE-3>)>> 

<OBJECT TALE-NYMPHS
	(SDESC "Nymphs")
	(KBD %<ASCII !\N>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"Praxix, now in a garrulous mood, told the tale of the Nymphs.
\"Long ago, at the beginning of things, it is said that the Nymphs took to
the waters, becoming, well, fish-like: able to remain submerged for extended
periods, swimming silent and deep, hunting for their meals in the great
lakes and oceans of the world. That any remain today is indeed a surprise, though
perhaps not a happy one. It would appear that they are less than friendly now,
but who is to be the judge in these difficult times?">>)>

<CONSTANT ARMED-CREATURES
", a group of armed creatures turned the corner and, catching sight of
me, let out a horrific scream and raced in my direction. Having no other choice,
I sprinted back to the pool and dove in, eventually making my way back to">

<ROOM UL-JCN
	(TRAVEL-COMMANDS BACK-COMMAND LEFT-COMMAND RIGHT-COMMAND PROCEED-COMMAND)
	(FLAGS UNDERGROUND TORCHBIT)
	(ENTER
	 <EXECUTE ()
		  <COND (,NYMPHS-COMING?
			 <TELL CR CR "Just then" ,ARMED-CREATURES>
			 <END-NYMPH-STORY>)
			(T
			 <GRAPHIC ,G-UNDERLAND-JCN>)>>)  
	(ACTION
	 <ACOND ()
		(BACK
		 <COND (<UL-MOVE-CHECK ,UL-2>
			<TELL
"Thinking it best to check on my wounded friend, I returned to " D ,LAKE-VICTIM
"'s side. Thankfully, he was now conscious, though confused.">
			<FCLEAR ,LAKE-VICTIM ,INCAPACITATED>
			<COND (<IN? ,NYMPH-STONE ,INVENTORY>
			       <TRAVEL-COMMANDS ,UL-2 ,TO-CAVE-COMMAND>)>
			<UL-MOVE ,UL-2>)>)
		(<OR <ACTION? LEFT> <ACTION? SMELLY-POOL>>
		 <COND (<UL-MOVE-CHECK ,UL-PIT>
			<COND (<ACTION? LEFT>
			       <TELL
"The lefthand path led to a good-sized chamber in the middle of which sat a
large pool. A frightful smell emanated from the pool's depths, though I could not
see just what it was that caused it.">)
			      (T
			       <TELL
"Holding my nose to avoid becoming sick, I moved gingerly toward the smelly pit
and was soon staring into its murky depths.">)>
			<CHANGE-TRAVEL-COMMAND ,HERE
					       ,LEFT-COMMAND
					       ,SMELLY-POOL-COMMAND>
			<UL-MOVE ,UL-PIT>)>)
		(<OR <ACTION? RIGHT> <ACTION? TREASURY>>
		 <COND (<UL-MOVE-CHECK ,UL-TREASURY>
			<COND (<NOT <FSET? ,UL-TREASURY ,SEEN>>
			       <TELL
"The ornate path led to a beautifully appointed chamber in which hundreds of jewels
and other age-old relics were kept. One, however, stood out from among the others.
It was a simple amulet with a large blue stone which shone with a light of
another world. I stood transfixed before it, not knowing whether I dare take it for
my own.">)
			      (T
			       <TELL
"Again, I entered the treasury ">
			       <COND (<IN? ,NYMPH-STONE ,UL-TREASURY>
				      <TELL
" and found myself facing the blue amulet.">)
				     (T
				      <TELL
" and stared at the empty pedestal from which I had taken the blue amulet.">)>)>
			<CHANGE-TRAVEL-COMMAND ,HERE
					       ,RIGHT-COMMAND
					       ,TREASURY-COMMAND>
			<UL-MOVE ,UL-TREASURY>)>)
		(PROCEED:REMOVE
		 <TELL
"I continued away from the chamber and soon caught sight of a group of creatures
conversing. Rather than reveal myself, I returned to the junction.">)>)>

<COMMAND (SMELLY-POOL SMELLY)>
<COMMAND TREASURY>

<OBJECT UL-2-PIT-GRATE
	(SDESC "cover")
	(LOC UL-2-PIT)
	(KBD %<ASCII !\C>)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <UPDATE-REMOVE ,ACTION-OBJECT>
		 <FSET ,HERE ,SCOUTED>
		 <TELL
"The cover was quite heavy, but I did manage to move it aside, revealing a
dark pool of water, about three feet across.">
		 <SETG CURRENT-GRAPHIC <>>
		 <GRAPHIC ,G-UNDERLAND-GRATE ,G-UNDERLAND-PIT ,BOTTOM-RIGHT>
		 <ADD-TRAVEL-COMMAND ,HERE ,DIVE-COMMAND>
		 <RTRUE>)
		(EXAMINE:CLEAR
		 <TELL
"The cover itself was made of stone, and appeared quite heavy.">)>)>

<ROOM UL-2-PIT
	(TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
	(FLAGS UNDERGROUND TORCHBIT)
	(ENTER
	 <EXECUTE ()
		  <COND (<IN? ,UL-2-PIT-GRATE ,HERE>
			 <GRAPHIC ,G-UNDERLAND-GRATE>)
			(T
			 <GRAPHIC ,G-UNDERLAND-GRATE
				  ,G-UNDERLAND-PIT
				  ,BOTTOM-RIGHT>)>>) 
	(ACTION
	 <ACOND ()
		(BACK
		 <COND (<QSET? ,HERE ,SEEN>
			<REMOVE-TRAVEL-COMMAND ,UL-2 ,NARROW-PATH-COMMAND>)>
		 <COND (<UL-MOVE-CHECK ,UL-2>
			<TELL
"I could discern no purpose to this place, so I returned to the chamber outside.">
			<UL-MOVE ,UL-2>)>)
		(DROP
		 <UL-PIT-DROP>)
		(DIVE:REMOVE
		 <TELL ,NARROW-POOL>)>)>

<GLOBAL UL-DROPPED 0>

<ROUTINE UL-PIT-DROP ()
	 <COND (<FSET? ,HERE ,SCOUTED>
		<SETG UL-DROPPED <+ ,UL-DROPPED 1>>
		<UPDATE-MOVE ,ACTION-OBJECT ,UL-PIT-BOTTOM>
		<ADD-TRAVEL-COMMAND ,UL-2 ,NARROW-PATH-COMMAND>
		<TELL
"I dropped the " AO " into the pool, where it sank slowly into the dark waters
and out of sight.">)>>

<OBJECT UL-TREASURY-PIT-GRATE
	(SDESC "cover")
	(LOC UL-TREASURY-PIT)
	(KBD %<ASCII !\C>)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <UPDATE-REMOVE ,ACTION-OBJECT>
		 <FSET ,HERE ,SCOUTED>
		 <TELL
"The cover was indeed heavy, but I did manage to move it aside, revealing a
dark pool of water, about three feet across. I held my torch up to its surface,
but nothing was revealed.">
		 <SETG CURRENT-GRAPHIC <>>
		 <GRAPHIC ,G-UNDERLAND-GRATE ,G-UNDERLAND-PIT ,BOTTOM-RIGHT>
		 <ADD-TRAVEL-COMMAND ,HERE ,DIVE-COMMAND>
		 <RTRUE>)
		(EXAMINE:CLEAR
		 <TELL
"The cover itself was made of stone, and appeared quite heavy.">)>)>

<COMMAND JUNCTION>

<ROOM UL-TREASURY-PIT
	(TRAVEL-COMMANDS BACK-COMMAND JUNCTION-COMMAND NUL-COMMAND)
	(FLAGS UNDERGROUND)
	(ENTER
	 <EXECUTE ()
		  <COND (<IN? ,UL-TREASURY-PIT-GRATE ,HERE>
			 <GRAPHIC ,G-UNDERLAND-GRATE>)
			(T
			 <GRAPHIC ,G-UNDERLAND-GRATE ,G-UNDERLAND-PIT ,BOTTOM-RIGHT>)>>)
	(ACTION
	 <ACOND ()
		(BACK
		 <COND (<UL-MOVE-CHECK ,UL-TREASURY>
			<TELL
"There was little point of staying here longer, so I returned to the treasury.">
			<UL-MOVE ,UL-TREASURY>)>)
		(JUNCTION
		 <COND (<IN? ,NYMPH-STONE ,INVENTORY>
			<TRY-TO-LEAVE-TREASURY>)
		       (T
			<TELL
"Having nothing further to do here, I passed through the treasury and back out
into the hallway beyond.">
			<UL-MOVE ,UL-JCN>)>)
		(<AND <ACTION? DROP>
		      <NOT <IN? ,UL-TREASURY-PIT-GRATE ,HERE>>
		      <OBJECT? NYMPH-STONE>>		      
		 <COND (<FSET? ,UL-TREASURY ,TRAPPED>
			<TELL
"There was no great likelihood of removing the amulet through the usual means,
so I thought there would be no harm of dropping it into the pool. Sure enough, no
magic prevented it from making a rapid descent into the dark waters.">)
		       (T
			<TELL
"On a hunch, I dropped the amulet into the pool and watched it sink rapidly into
the dark waters.">)>
		 <UPDATE-MOVE ,NYMPH-STONE ,UL-PIT-BOTTOM>) 
		(DIVE:REMOVE
		 <TELL ,NARROW-POOL>)>)>

<CONSTANT NARROW-POOL
"I dove into the pool, and carefully started to descend. This was no ordinary pool,
however; it was a tube, and a narrow one at that. After a short while, the tube
curved and narrowed, so much so that it was soon difficult to proceed. Discouraged,
I returned to the surface.">

<OBJECT I-PIT-SURFACE
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<EQUAL? ,HERE ,UL-PIT-BOTTOM>
			 <TELL CR CR
"Having spent as much time underwater as was possible, I swam back to the surface
to catch my breath.">
			 <MOVE-TO ,UL-PIT>)>>)>

<ROOM UL-PIT-BOTTOM
      (TRAVEL-COMMANDS SURFACE-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<QUEUE I-PIT-SURFACE 3>
		<COND (<IN? ,NYMPH-STONE ,HERE>
		       ;"Check stamp location??"
		       <GRAPHIC ,G-UNDERLAND-PIT-BOTTOM
				,G-UNDERLAND-PIT-BOTTOM-STONE
				,BOTTOM-LEFT>)
		      (T
		       <GRAPHIC ,G-UNDERLAND-PIT-BOTTOM>)>>)
      (ACTION
       <ACOND ()
	      (SURFACE
	       <COND (<IN? ,NYMPH-STONE ,INVENTORY>
		      <TELL
"In just a few moments, I had returned to the surface.">)
		     (T
		      <TELL
"With nothing to show for my diving exploration, I returned to the surface.">)>
	       <MOVE-TO ,UL-PIT>)
	      (PICK-UP
	       <TELL
"Reaching down through the muck, I grabbed onto the " AO " and held it firmly
in my hand.">
	       <SETG CURRENT-GRAPHIC <>>
	       <GRAPHIC ,G-UNDERLAND-PIT-BOTTOM>
	       <UPDATE-MOVE ,ACTION-OBJECT ,INVENTORY>)>)>

<ROOM UL-PIT
	(TRAVEL-COMMANDS BACK-COMMAND DIVE-COMMAND NUL-COMMAND)
	(FLAGS UNDERGROUND TORCHBIT)
	(ENTER
	 <EXECUTE ()
		  <GRAPHIC ,G-UNDERLAND-GRATE ,G-UNDERLAND-PIT ,BOTTOM-RIGHT>
		  <COND (<IN? ,TORCH ,INVENTORY>
			 <FSET ,HERE ,DEAD>
			 <FORCE-TRAVEL-COMMAND ,HERE ,DIVE-COMMAND>)>>)
	(ACTION
	 <ACOND ("AUX" RM)
		(BACK
		 <COND (<IN? ,NYMPH-STONE ,INVENTORY>
			<SET RM ,UL-2>)
		       (T
			<SET RM ,UL-JCN>)>
		 <COND (<UL-MOVE-CHECK .RM>
			<COND (<IN? ,NYMPH-STONE ,INVENTORY>
			       <TRAVEL-COMMANDS .RM ,TO-CAVE-COMMAND>
			       <TELL
"With the amulet in hand, I made a hasty return to the chamber in which I had left "
D ,LAKE-VICTIM ". Thankfully, he was conscious.">)
			      (T
			       <COND (<AND <IN? ,TORCH ,INVENTORY>
					   <NOT <FSET? ,HERE ,DEAD>>>
				      <TELL
"With the torch now in my possession">)
				     (T
				      <TELL
"Having nothing to show from this excursion">)>
			       <TELL ", I returned to the chamber outside.">)>
			<UL-MOVE .RM>)>)
		(DIVE
		 <COND (<IN? ,TORCH ,INVENTORY>
			<COND (<NOT <QSET? ,HERE ,BLUE-MIX>>
			       <TELL
"As I dove into the water, I was filled with amazement that the torch I was carrying
had not been extinguished. If anything, it appeared to glow more brightly, and the flame
became warmer. Soon, I had reached the bottom of the pool, which was covered with
every sort of putrifying debris you can imagine, and some that you probably couldn't.
Decaying debris lowered the visibility considerably, making it difficult to gauge
anything much about the pool itself.">)
			      (T
			       <TELL
"Again, I took the torch down into the miserable pit and descended to the bottom,
peering with difficulty through the cloudy waters">
			       <COND (<NOT <FIRST? ,UL-PIT-BOTTOM>>
				      <TELL ", yet finding nothing of import">)>
			       <TELL ".">)>
			<COND (<IN? ,NYMPH-STONE ,UL-PIT-BOTTOM>
			       <TELL
" But then, at the bottom of the pool, in the midst of the unspeakable filth,
I caught a glimpse of the the amulet I had taken from the treasury">
			       <COND (<G? ,UL-DROPPED 0>
				      <TELL ", but nothing else">)>
			       <TELL ".">)
			      (<FIRST? ,UL-PIT-BOTTOM>
			       <TELL
" Imagine my surprise when there, at the bottom, lay ">
			       <LIST-CONTENTS ,UL-PIT-BOTTOM <>>
			       <TELL " I had dropped into the
pit earlier.">)>
			<MOVE-TO ,UL-PIT-BOTTOM>)
		       (T
			<REMOVE-TRAVEL-COMMAND>
			<TELL
"I dove down into the foul-smelling pool and swam into its dismal depths. By
the time I reached the bottom, it was too dark to see anything at all. Unable
to learn anything new, I returned to the surface.">)>)>)>

<ROUTINE TREASURY-GRAPHIC ()
	 <SETG CURRENT-GRAPHIC <>>
	 <COND (<IN? ,NYMPH-STONE ,HERE>
		;"Check location of stamp??"
		<GRAPHIC ,G-UNDERLAND-TREASURY-NO-STONE
			 ,G-UNDERLAND-TREASURY
			 ,BOTTOM-RIGHT>)
	       (T
		<GRAPHIC ,G-UNDERLAND-TREASURY-NO-STONE>)>>

<ROOM UL-TREASURY
	(TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
	(FLAGS UNDERGROUND TORCHBIT)
	(ENTER
	 <EXECUTE ()
		  <FSET ,HERE ,SEEN>
		  <TREASURY-GRAPHIC>
		  <FORCE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>
		  <COND (<AND <FSET? ,HERE ,TRAPPED>
			      <NOT <IN? ,NYMPH-STONE ,INVENTORY>>>
			 <FCLEAR ,HERE ,TRAPPED>)>>)
	(ACTION
	 <ACOND ()
		(PROCEED
		 <COND (<UL-MOVE-CHECK ,UL-TREASURY-PIT>
			<TELL
"At the far end of the treasury, a narrow path led a short way, ending at a simple,
rounded chamber, in the middle of which lay a ">
			<COND (<FSET? ,UL-TREASURY-PIT ,SCOUTED>
			       <TELL "perfectly round pool of water">)
			      (T
			       <TELL "large stone cover">)>
			<TELL
". It was odd that such a nondescript chamber would be placed adjacent to the
rather opulent treasury, and I could only guess at its purpose.">
			<UL-MOVE ,UL-TREASURY-PIT>)>)
		(<AND <ACTION? DROP>
		      <OBJECT? NYMPH-STONE>>
		 <COND (<FSET? ,HERE ,TRAPPED>
			<TELL
"It was clear that I wasn't leaving this treasury with the amulet, so I replaced it
on its pedestal and pondered my next move.">
			<FCLEAR ,HERE ,TRAPPED>
			<ADD-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>)
		       (T
			<TELL
"Thinking it was perhaps ill-advised to take the amulet, I gingerly returned it to its
pedestal.">)>
		 <UPDATE-MOVE ,NYMPH-STONE ,HERE>
		 <TREASURY-GRAPHIC>
		 <RTRUE>) 
		(BACK
		 <TRY-TO-LEAVE-TREASURY>)>)>

<ROUTINE TRY-TO-LEAVE-TREASURY ()
	 <COND (<IN? ,NYMPH-STONE ,INVENTORY>
		<COND (<NOT <QSET? ,UL-TREASURY ,SCOUTED>>
		       <TELL
"With the amulet firmly in hand, I started out of the treasury. But I didn't get
very far. At first, I thought I had become paralyzed below my waist, but that was
clearly not so. No, something unnatural was holding me inside the treasury. And
I was reasonably certain it was the amulet.">)
		      (T
		       <TELL
"Again, some unknown and unseen force prevented me from leaving the treasury while
I held the blue amulet.">)>
		<COND (<NOT <EQUAL? ,HERE ,UL-TREASURY>>
		       <UL-MOVE ,UL-TREASURY>)>
		<REMOVE-TRAVEL-COMMAND ,UL-TREASURY ,BACK-COMMAND>
		<FSET ,UL-TREASURY ,TRAPPED>)
	       (T
		<COND (<UL-MOVE-CHECK ,UL-JCN>
		       <TELL
"There was nothing more I could think to do inside the treasury, so I returned to the
chamber just outside.">
		       <UL-MOVE ,UL-JCN>)>)>>




