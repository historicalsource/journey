"TRAP for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT CASTLE>

<GLOBAL TRAP-VICTIM <>>

<ROOM GROUP-FOREST
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT)
      (GRAPHIC G-FOREST)
      (ENTER
       <EXECUTE ()
		<COND (<IN-PARTY? ,UMBER>
		       <PARTY-CHANGE ,UMBER ,TAG>
		       <FSET ,TAG ,SUBGROUP>)>
		<COND (,A-B-FLAG
		       <SETG TRAP-VICTIM
			     <FIRST-IN-PARTY ,BERGON ,ESHER ,MINAR>>)
		      (T
		       <SETG TRAP-VICTIM
			     <FIRST-IN-PARTY ,ESHER ,MINAR>>)>
		<DIVIDER>
		<TELL
"\"There!\" " CHR ,TRAP-VICTIM " cried, pointing to the ">
		<COND (<EQUAL? ,PRAXIX-SIGNAL ,FAR-VISION-SPELL>
		       <TELL "ball of flame speeding away from an
unseen spot">)
		      (<EQUAL? ,PRAXIX-SIGNAL ,LIGHTNING-SPELL>
		       <TELL "bolts of lightning striking the ground
somewhere">)
		      (T
		       <TELL "sheets of rain falling on a small piece
of ground somewhere">)>
		<TELL
" to the north. \"It's Praxix, sending us a signal!\"" CR CR>
		<TELL
"It had been six hours or more since we had separated from Praxix, and
we were losing hope of finding him again. The sighting of this magical
manifestation raised our spirits, and we prepared to make our way in his
direction.">
		<NEW-DEFAULT>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"It wasn't long before we were on our way toward what we presumed to be
Praxix' location. The forest had thinned out somewhat, and we walked
with ease through the leaf-covered ground. " CHR ,LEADER " was in the
lead, and our spirits were high." CR CR>
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"But this was not to be a pleasant afternoon. Just a minute after entering
this forest, Hurth began complaining of difficult breathing. As his breathing
became increasingly labored, he soon found it too strenuous to walk, and finally
he collapsed beneath a tree, wheezing loudly.">
		      <MOVE-TO ,ALLERGY-SITE>
		      <RTRUE>)>
	       <TELL
"But all this changed in a moment, as " CHR ,TRAP-VICTIM " tripped an
invisible cord, setting off a trap. A noose, hidden under the mat of fallen
leaves, grabbed his ankle and lifted him high into the air. Before " <I/WE 2> "
had time to react, the guttural voices of orcs could be heard nearby, moving
in " <MY/OUR 2> " direction.">		
	       <PARTY-REMOVE ,TRAP-VICTIM>
	       <MOVE-TO ,TRAP-SITE>)>)>

<ROOM ALLERGY-SITE
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DANGEROUS DONT-SCOUT)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <IN-PARTY? ,ESHER>>
		       <FSET ,HINT-ALLERGY ,BLUE-MIX>)>
		<MAKE-BUSY ,HURTH ,ILL-COMMAND>
		<UPDATE-MOVE ,HURTH-OBJECT ,HERE>
		<UPDATE-FCLEAR ,HURTH-OBJECT ,DONT-EXAMINE>>)
      (CLOCK
       <EXECUTE ()
		<COND (<AND <QSET? ,HERE ,BLACK-MIX>
			    <IN-PARTY? ,HURTH>
			    <FSET? ,HURTH ,BUSY>>
		       <TELL CR CR
"A moment later, it was over. Hurth, unable to breathe, died there, under the
tree. We buried him in silence under the shade of the tree." CR CR>
		       <COND (<IN-PARTY? ,ESHER>
			      <TELL
"Esher was full of self-recriminations, feeling that he did not move quickly
enough to help our friend. But there was little time for such thoughts, and much to
be done if we were to accomplish our task.">)
			     (T
			      <TELL
"In truth, there was nothing to be done, having neither Esher nor Praxix here
to help us. It had happened so suddenly, it is entirely possible that they could
not have done better.">)>
		       <FCLEAR ,HURTH ,BUSY>
		       <UPDATE-REMOVE ,HURTH-OBJECT>
		       <HINT ,HINT-ALLERGY>
		       <KILLED-OFF ,HURTH>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <COND (<FSET? ,HURTH ,BUSY>
		      <TELL
"Hurth's condition was deteriorating with such severity, there was not even
time to continue ahead in search of aid.">
		      <RTRUE>)
		     (<NOT <IN-PARTY? ,HURTH>>
		      ;"He's died..."
		      <TELL
"Sobered, we started again">)
		     (T
		      <TELL
"Gladdened by our success in reviving our stricken friend, we continued">)>
	       <TELL
" in the direction of Praxix, but yet another tragedy befell us, as "
CHR ,TRAP-VICTIM " tripped an invisible cord, setting off a trap. A net,
hidden under the mat of fallen leaves, rose up from the ground, entangling him and
lifting him high into the air. Before " <I/WE 2> " had time to react, the guttural
voices of orcs could be heard nearby, moving in " <MY/OUR 2> " direction.">		
	       <PARTY-REMOVE ,TRAP-VICTIM>
	       <MOVE-TO ,TRAP-SITE>)
	      (<AND <ACTION? EXAMINE>
		    <OBJECT? HURTH-OBJECT>>
	       <FSET ,HURTH-OBJECT ,BLACK-MIX>
	       <TELL
"Esher now rushed over to Hurth and began to examine him, quickly coming to
the conclusion that our Dwarvish friend was suffering from a severe allergic
reaction, a life-threatening one at that." CR CR>
	       <UPDATE-REMOVE ,HURTH-OBJECT>
	       <COND (<FSET? ,WARREN-WALLS ,SOLVED>
		      <TELL
"Fortunately, Esher had found some hawkbane earlier in our journey, and he
forced our stricken friend to swallow the bitter root, which he did with
great difficulty. But the hawkbane worked within seconds, and Hurth was soon
back on his feet, though surprised by the suddenness of the attack." CR CR>
		      <TELL
"\"Have you ever been outside of your caverns?\" Esher asked." CR CR>
		      <TELL
"\"Never,\" Hurth replied. \"It is generally forbidden.\"" CR CR>
		      <TELL
"\"Then that is the explanation,\" Esher responded. \"Your body is entirely
unused to the spores and pollens in the air. It is a good thing I've got an
ample supply of the remedy.\"">
		      <MAKE-UNBUSY ,HURTH>)
		     (T
		      <TELL
"Tragically, Esher had neither potion, herb, nor root that could mitigate the
severity of the attack. We tried to comfort Hurth as best we could, but he
succumbed within minutes." CR CR>
		      <TELL
"\"I should have known,\" Esher said, despondently. \"He has never before
walked on the earth, and his body is entirely unfamiliar with the common spores
and pollens that we take for granted. I hate to admit it, but I wish Praxix
had been here - perhaps he could have used his magic to save Hurth.\"" CR CR>
		      <COND (<IN-PARTY? ,BERGON>
			     <TELL
"\"Do not be so hard on yourself, Esher,\" Bergon said. \"There is nothing
that could have been done. Let us bury our friend here, and move on.\"">)
			    (T
			     <TELL
"There was little more to be done here than to bury our friend and hope to
continue in search of Praxix.">)>
		      <HINT ,HINT-ALLERGY>
		      <FCLEAR ,HURTH ,BUSY>
		      <KILLED-OFF ,HURTH>)>)>)>	

<COMMAND FREE-HIM>

<COMMAND TO-PRAXIX>

<COMMAND (FOLLOW-ORCS FOL\'W-ORCS)>

<ROOM TRAP-SITE
      (TRAVEL-COMMANDS FREE-HIM-COMMAND HIDE-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-TRAP)
      (FLAGS DONT-SCOUT DANGEROUS)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"In discussing our course of action, we were inclined to pursue the faint
hope of rescuing " D ,TRAP-VICTIM " from his captors.">
	       <TELL CR CR
"\"I'm afraid " D ,TRAP-VICTIM " may not survive the orcs long enough for us
to find Praxix and return here,\" I said.">)
	      (TO-PRAXIX
	       <LEAVE-VICTIM-WITH-ORCS>)
	      (FOLLOW-ORCS
	       <TELL
"Subtlety of movement not being among their strengths, it was a
simple matter to find the orcs' camp, not far from where the
trap had been set. As " <I/WE> " approached, a noisome odor permeated the air,
in itself a sign that orcs were near. When " <I/WE> " arrived, " <I/WE>
" found that dozens
of orcs were here, perhaps hundreds, living in abject squalor, either out in
the open or in makeshift tents of rotten cloth. There was no sign
of " D ,TRAP-VICTIM ".">
	       <MOVE-TO ,OUTSIDE-ORC-CAMP>)
	      (<OR <ACTION? FREE-HIM> <ACTION? HIDE>>
	       <UPDATE-FSET ,HERE ,ADVISE>
	       <COND (<ACTION? FREE-HIM>
		      <TELL
"\"Quickly!\" " D ,TRAP-VICTIM " said, \"The orcs are almost here!\"" CR CR>
		      <TELL
"Hurrying to cut the heavily intertwined layers of rope, " <I-WAS/WE-WERE 2>
" swiftly running out of time. The orcs were nearly upon " <ME/US 2> ", and "
<I/WE 2> " would be badly outnumbered. Having little choice">)
		     (T
		      <TELL
"With little chance of helping " D ,TRAP-VICTIM " before the orcs
arrived">)>
	       <TELL
", " <I/WE 2> " hid in the brush nearby, waiting for a better opportunity to
help. It was a matter of moments before a half-dozen orcs arrived, armed to
the teeth." CR CR>
	       <TELL
"Laughing and taunting, the hideous creatures poked and prodded
our friend while " <I/WE 2> " could do nothing more than watch in horror.
Finally, they took him down and bound him, then led him off into the forest.">
	       <TRAVEL-COMMANDS ,HERE
				,TO-PRAXIX-COMMAND
				,FOLLOW-ORCS-COMMAND>)>)>

<COMMAND TO-CAMP>

<COMMAND USE O-USE ()
	 <TELL
"There was little of the red rock left, and this did not appear to
be a good time to use it.">>

<ROUTINE O-USE ()
	 <FIND-OBJECT ,RED-ROCK>>

<ROOM OUTSIDE-ORC-CAMP
      (TRAVEL-COMMANDS TO-CAMP-COMMAND TO-PRAXIX-COMMAND NUL-COMMAND)
      (GRAPHIC G-OUTSIDE-ORC-CAMP)
      (FLAGS DANGEROUS ADVISE)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL ACT
" asked for advice, and between us we thought up a few suggestions, all bad.
We would certainly be massacred if we attempted storming the orc camp, and even
then we could not know where " D ,TRAP-VICTIM " was being held.">
	       <COND (<AND <FSET? ,ACTIVE-MINE ,SOLVED>
			   <NOT <FSET? ,RED-ROCK ,DEAD>>>
		      <TELL CR CR
"\"I wish I knew how the miner did it,\" I said, wistfully thinking back to
his magical disappearances.">)>
	       <RTRUE>) 
	      (<AND <ACTION? INVENTORY>
		    <NOT <QSET? ,HERE ,EXAMINED>>>
	       <TELL
"The situation appeared grim, and I wondered if there might be anything
in my pack which would help.">
	       <COND (<IN? ,RED-ROCK ,INVENTORY>
		      <FSET ,RED-ROCK ,DEAD>
		      <TELL
" To my astonishment, I came up literally empty-handed, for as I pulled my
hand from the pack, I found it to be entirely transparent. And then I
put two pieces together: the disappearing miner and the pieces of red rock
that had inadvertantly fallen from his sack." CR CR>
		      <TELL
"Reaching back into the pack, I noticed that some powder had been scraped
off one of the red rocks. \"A magical reagent!\" I said to myself, proud to have
made such an important discovery. \"Praxix will be pleased - if we find him,
that is.\"">
		      <TRAVEL-COMMANDS ,TAG
				       ,PICK-UP-COMMAND
				       ,USE-COMMAND
				       ,INVENTORY-COMMAND>)
		     (T
		      <TELL
" It appeared there was not; ">
		      <COND (<FSET? ,ACTIVE-MINE ,SOLVED>
			     <TELL
"how I wished we had found the secret to the miner's disappearing trick.
It would certainly come in handy just about now!">)
			    (T
			     <TELL
"I sighed deeply, certain that " D ,TRAP-VICTIM " was beyond help.">)>)>)
	      (USE
	       <SETG RED-ROCK-COUNT <- ,RED-ROCK-COUNT 1>>
	       <RESTORE-TAG-COMMANDS>
	       <TELL
"Determined to save " D ,TRAP-VICTIM ", I took one of the red rocks
from my pack and pummelled it into a fine powder which I then spread across
my body. In a matter of moments, I was completely invisible! Not
knowing how long the powder would work, I moved quickly into the heart of
the orcs' camp." CR CR>
	       <TELL
"It took quite a while, but I finally found " D ,TRAP-VICTIM ", bound and
gagged inside a tent alongside the cooking area." CR CR>
	       <TELL
"\"Psst! " D ,TRAP-VICTIM "!\" I whispered from just beside his right ear.
He nearly jumped out of his bonds at the sound of my voice." CR CR>
	       <TELL
"\"Mmgmm rumggm,\" he said frantically through his gag." CR CR>
	       <TELL
"\"Calm down,\" I said, \"I'm just invisible.\" It didn't take long to
free him, but we now faced a difficult decision.">  
	       <PARTY-ADD ,TRAP-VICTIM>
	       <MAKE-SUBGROUP ,TAG ,TRAP-VICTIM>
	       <MOVE-TO ,ORCS-CAMP>)
	      (SCOUT:REMOVE
	       <TELL ACT
" went off to scout out the orcs camp. A few minutes later, he
returned." CR CR>
	       <TELL
"\"Lots of orcs,\" he said, panting, \"but no sign of " D ,TRAP-VICTIM
". He's probably being held in one of the tents.\"">)
	      (TO-CAMP:REMOVE
	       <TELL
"One thought was to enter the orcs' camp, and attempt to find our
captured friend. But the odds of success were staggeringly small;
after all, " <I-WAS/WE-WERE 2> " not invisible! No, that would not work, but "
<I/WE 2> " felt that there must be some strategy that would.">)
	      (TO-PRAXIX
	       <LEAVE-VICTIM-WITH-ORCS>)>)>

<ROUTINE LEAVE-VICTIM-WITH-ORCS ()
	 <HINT ,HINT-ORC-TRAP>
	 <TELL D ,TRAP-VICTIM
" was finished; the orcs did not keep prisoners, except for
the amusement of their torture. It was a difficult decision, but
there was no alternative - ">
	 <TELL <I/WE 2>>
	 <REJOIN-AT-CASTLE
" marched in the direction of Praxix' signal">>

<COMMAND (USE-RED-ROCK USE-ROCK)>
<COMMAND RUN-FOR-IT>

<ROOM ORCS-CAMP
      (TRAVEL-COMMANDS USE-RED-ROCK-COMMAND RUN-FOR-IT-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-TENT)
      (FLAGS DANGEROUS ADVISE)
      (ENTER
       <EXECUTE ()
		<CIT ,TAG ,GET-ADVICE-COMMAND>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"First, I looked out from the tent and, indeed, the coast was clear. But
how long would that last? It would be safest to use the red rock, but there
was only one left, and I feared wasting what little we had of this potent
magic. After all, what would Praxix say?" CR CR>
	       <TELL
"\"Your instincts have served you well thus far,\" " D ,TRAP-VICTIM " said.
\"I would advise you to use them again.\"">)
	      (USE-RED-ROCK
	       <SETG RED-ROCK-COUNT <- ,RED-ROCK-COUNT 1>>
	       <UPDATE-REMOVE ,RED-ROCK>
	       <TELL
"Taking the last of the red rocks from my pack, I crushed it into a
powder and spread it over " D ,TRAP-VICTIM ", who obligingly disappeared.
Leaving the orcs' camp had been as simple as entering, and we were soon out
of danger. Not long afterward, we reappeared.">  
	       <TRAP-VICTIM-SAVED>)
	      (RUN-FOR-IT
	       <TELL
"Hoping to save as much reagent as possible, we waited for an opportune
moment, then dashed into the safety of the nearby trees. Certain we had
not been seen, we put some more distance between ourselves and the orcs."> 
	       <TRAP-VICTIM-SAVED>)>)>

<ROUTINE TRAP-VICTIM-SAVED ()
	 <TELL CR CR
"\"Thank you, " TAG ",\" " D ,TRAP-VICTIM " said, placing his arm around
my shoulder. \"I hope the orcs are not too disappointed; it seems I was
expected for dinner!\" We laughed, but then " D ,TRAP-VICTIM "'s face turned
grim." CR CR>
	 <TELL
"\"I am afraid the orcs have seen Praxix' signal as well,\" he said.
\"We had best move quickly; I would hate to have them arrive first!\"" CR CR>
	 <REJOIN-AT-CASTLE
"Retracing my steps from the orcs' camp, we found our way back to our
starting point. Moving as quickly and quietly as possible in the direction
of Praxix' signal">>

<GLOBAL REJOINED <>>

<ROUTINE REJOIN-AT-CASTLE (STR)
	 <SETG REJOINED T>
	 <TELL .STR
", " <I/WE 2> " came within
the hour to the edge of a large clearing, inside of which stood the ruins of
an ancient castle.">
	 <COND (<IN-PARTY? ,BERGON>
		<TELL CR CR
"\"Praxix is here,\" Bergon said, \"I can feel it.\"">)>
	 <DIVIDER>
	 <COND (<FSET? ,UMBER ,SUBGROUP>
		<PARTY-CHANGE ,TAG ,UMBER>
		<MAKE-SUBGROUP ,PRAXIX ,UMBER>)
	       (T
		<MAKE-SUBGROUP ,PRAXIX>)>
	 <TELL
"Praxix laughed to himself. What were the odds, he thought, of the signal
being seen by the others? It little mattered, for there was little else
for him to do.">
	 <COND (<IN? ,SIXTH-STONE ,PRAXIX>
		<UPDATE-FSET ,SIXTH-STONE ,DONT-EXAMINE>
		<TELL CR CR>
		<PRAXIX-WAITS-FOR-PARTY>) 
	       (T
		<MOVE-TO ,PRAXIX-SIGNAL-ROOM>)>>

<ROUTINE PRAXIX-WAITS-FOR-PARTY ()
	 <COND (<IN? ,SIXTH-STONE ,PRAXIX>
		<UPDATE-MOVE ,SIXTH-STONE ,INVENTORY>
		<TELL
"In truth, he had already done extremely well; the Stone was his. ">)>
	 <TELL "All that
was left was to wait and hope. Sitting down at the side of the moat, he ">
	 <COND (<IN-PARTY? ,UMBER>
		<TELL "and Umber ">)>
	 <TELL "rested">
	 <COND (<IN-PARTY? ,UMBER>
		<TELL "; hoping to avoid any further conversation with Umber,
Praxix feigned sleep">)>
	 <TELL ".">
	 <DIVIDER>
	 <GRAPHIC ,G-PARTY-RESCUES-PRAXIX>
	 <COND (<AND <IN-PARTY? ,UMBER>
		     <NOT <FSET? ,CASTLE-TROVE ,SEEN>>>
		<HINT ,HINT-DUNGEON>)
	       (<AND <IN-PARTY? ,UMBER>
		     <NOT <IN? ,SIXTH-STONE ,INVENTORY>>>	     
		<HINT ,HINT-STONES>)>
	 <COND (<IN-PARTY? ,UMBER>
		<TELL "They were both">)
	       (T
		<TELL "He was">)>
	 <TELL
" awakened by the sound of my voice. \"Praxix! Wake up!\" I shouted from across
the moat. ">
	 <COND (<IN-PARTY? ,UMBER>
		<PARTY-CHANGE ,UMBER ,TAG>
		<TELL
"I tossed my rope across to Umber, who held it firmly as Praxix slowly pulled
himself across the moat. With Praxix safe, it was time for Umber to attempt the
crossing. Strangely, he preferred to stay on the castle grounds, perhaps to stock
up on more jewels from the chest in the dungeon." CR CR>
		<TELL
"\"Until we meet again!\" he shouted across to Praxix, and with a wave of his hand
he retreated toward the castle." CR CR>
		<TELL
"\"Interesting fellow,\" Praxix said, \"though I believe I preferred
him as a tree.\"" CR CR>)
	       (T
		<TELL
"It wasn't easy, yet " <I/WE 2> " managed to rescue him from the castle by using
the rope to make up for the broken sections of the bridge; and, thus, we were
reunited." CR CR>)>
	 <CLEAR-SUBGROUP>
	 <COND (,A-B-FLAG
		<TELL
"Praxix listened with great interest as " <I/WE 2> " told of "
<MY/OUR 2> " adventures.">
		<COND (<FSET? ,RED-ROCK ,SOLVED>
		       <TELL CR CR
"\"Tell me, " TAG ",\" Praxix said, \"Do you still have those red rocks we
found in the mines?\"" CR CR>
		       <COND (<IN? ,RED-ROCK ,INVENTORY>
			      <TELL
"I said that I did, and, rummaging through my pack, retrieved what
remained, giving them to Praxix." CR CR>)
			     (T
			      <TELL
"I admitted that I did not, having used them both in saving " D ,TRAP-VICTIM
" from almost certin death at the hands of the orcs." CR CR>
			      <TELL
"\"Then you have used them well,\" Praxix replied reassuringly, \"I
would happily take " D ,TRAP-VICTIM " over any number of magical
spells.\" And yet, I sensed Praxix' disappointment over not having
this powerful magic at his disposal.">)>
		       <UPDATE-REMOVE ,RED-ROCK>
		       <COND (<EQUAL? ,RED-ROCK-COUNT 3>
			      <TELL
"\"As you may have guessed, the miner used these rocks to make himself
invisible,\" Praxix continued, putting the rocks in his cloak, \"An
invisibility spell may well come in useful!\"">
			      <COND (<FSET? ,OUTSIDE-ORC-CAMP ,SEEN>
				     <TELL CR CR
"\"It might have saved " D ,TRAP-VICTIM ",\" I said, frustrated at
having ">
				     <COND (<FSET? ,RED-ROCK ,DEAD>
					    <TELL "not used them.">)
					   (T
					    <TELL
"having forgotten that I had been carrying them. \"If only I had
understood!\"">)>
				     <TELL CR CR
"\"Do not be so hard on yourself, " TAG ",\" Praxix replied, \"Only
a Wizard could have known the secret of the red rock.\"">)>)
			     (T
			      ;"You must have at least one left..."
			      <TELL
"\"As you have discovered, these rocks are the key to the miner's
'disappearances,'\" Praxix continued, putting the red rocks in his cloak,
\"An invisibility spell may be useful again some day!\"">)>
		       <TELL CR CR>)
		      (T
		       <TELL " ">)>
		<COND (<FSET? ,MILL ,SEEN>
		       ;"Have been to mill, now return to Astrix."
		       <CASTLE-MILL-TO-ASTRIX>)
		      (T
		       <TELL
"We then left the grounds of the castle, following a nearby path. ">
		       <TELL ,PATH-TO-MILL>
		       ;"Now move to mill, thence to Astrix..."
		       <MOVE-TO ,MILL>)>)
	       (T
		<TELL
"\"It is good we have found you, Praxix,\" Bergon said, \"for we
have still not found the Dwarvish gate that Astrix has sent us to
find.\"" CR CR>
		<TELL
"\"My sense is that is due west of here,\" Praxix responded, and
there were none to dispute his instinct." CR CR>
		<COND (<FSET? ,MILL ,SEEN>
		       <CASTLE-MILL-TO-CAVERNS>)
		      (T
		       <TELL
"And so we headed west upon the nearest path. ">
		       <TELL ,PATH-TO-MILL>
		       <MOVE-TO ,MILL>)>)>> 

<ROUTINE CASTLE-MILL-TO-CAVERNS ()
	 <COND (<NOT <FSET? ,XFER-1 ,SOLVED>>
		<HINT ,HINT-MILL>)>
	 <COND (<NOT <IN-PARTY? ,BERGON>>
		<TELL
"Praxix now appeared troubled. \"Without Bergon, I fear we should return to
Astrix and receive his counsel.\" We started marching north, and two days
later arrived at Astrix' Sunrise Tower.">
		<PART-TWO-ENDING>)
	       (T
		<TELL
"Following Praxix' advice, we now marched west, coming to a path which
led directly to the place Astrix had described, the Bern i-Fen. And
here, under a cloudy sky, we camped for the night.">
		<NEXT-DAY>
		<MOVE-TO ,FOREST-GATE>)>>

<ROUTINE CASTLE-MILL-TO-ASTRIX ()
	 <COND (<NOT <FSET? ,XFER-1 ,SOLVED>>
		<HINT ,HINT-MILL>)>
	 <TELL
"And then, we started back to Astrix in his Sunrise Tower.">
	 <PART-TWO-ENDING>>


