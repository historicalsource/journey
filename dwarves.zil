"DWARVES for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT DWARVES>

<GLOBAL DWM-HERE 4>
<GLOBAL DWM-LOC1 6>
<GLOBAL DWM-LOC2 1>
<GLOBAL DWM-FACING 1>

<ROOM DWARF-MEETING-LOC
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND STAND-COMMAND)
      (FLAGS UNDERGROUND DANGEROUS DONT-SCOUT)
      (ENTER
       <EXECUTE ()
		<TELL CR CR>
		<SCENE ,DWARF-MEETING>>)
      (TEMP 0)>

<ROOM CAVERN-1
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <UPDATE-MOVE ,STORY-TOWERS ,HURTH-STORIES>
	       <MOVE-TO ,STAIR-BOTTOM
"Hurth led us down the passage, and we soon came to a wide arch leading to an
impressive stone staircase. \"These stairs lead up to the High Gate and the
Tower of the Sunset,\" he said.">)>)> 

<OBJECT DWARF-MEETING
	(ACTION
	 <EXECUTE ("AUX" DF (BK <>))
		  <COND (<ACTION? BACK>
			 <SET BK T>
			 <SETG DWM-FACING <NOT ,DWM-FACING>>
			 <SETG ACTION ,PROCEED-COMMAND>
			 ;<NEW-DEFAULT>
			 <TELL
"We turned around and started slowly back in the opposite direction."
CR CR>)>
		  <COND (<ACTION? SCENE-START>
			 <TELL
"As we slowly made our way down the forbidding passageway, Bergon signalled
us to stop." CR CR>
			 <TELL
"\"Do you hear that?\" he asked, indicating some faint sound
from the gloom that lay before us.">
			 <COND (<AND <EQUAL? ,KIDNAPPED ,MINAR>
				     <IN-PARTY? ,ESHER>
				     <NOT ,2ND-PASS>>
				<TELL CR CR
"\"Yes, and it's a trap, no doubt set for us by our friend Minar!\" scowled
Esher.">)>
			 <RTRUE>)
			(<ACTION? STAND>
			 <SETG DWM-LOC1 <- ,DWM-LOC1 1>>
			 <SETG DWM-LOC2 <+ ,DWM-LOC2 1>>
			 <COND (<NOT <EQUAL? ,DWM-HERE ,DWM-LOC1 ,DWM-LOC2>>
				<COND (<NOT <GET-TEMP>>
				       <TELL
"As we stood our ground, it seemed that sounds could be heard behind
us as well as in front of us.">
				       <DWM-TRAPPED>)
				      (T
				       <SETG DWM-LOC1 ,DWM-HERE>
				       <DWM-HEAR>
				       ;<TELL
"We braced ourselves for attack as the sounds, now clearly footsteps,
became ever louder.">)>)
			       (T
				<DWM-HEAR>)>)
			(<ACTION? PROCEED>
			 <COND (<NOT .BK>
				<COND (<NOT <QSET? ,HERE ,TRAPPED>>
				       <TELL
"Increasingly apprehensive, we made our way slowly down the passage." CR CR>)
				      (T
				       <TELL
"Reaching toward our weapons, we moved forward at a snail's pace; the
sounds grew louder and seemed to come from all around us!" CR CR>)>)>
			 <COND (,DWM-FACING
				<SETG DWM-HERE <+ ,DWM-HERE 1>>
				<SETG DWM-LOC2 <+ ,DWM-LOC2 1>>)
			       (T
				<SETG DWM-HERE <- ,DWM-HERE 1>>
				<SETG DWM-LOC1 <- ,DWM-LOC1 1>>)>
			 <DWM-HEAR>)
			(<AND <ACTION? CAST>
			      <OBJECT? FAR-VISION-SPELL>>
			 <COND (<ZERO? ,DWM-FACING>
				<SET DF <DIFF ,DWM-LOC2 ,DWM-HERE>>)
			       (T
				<SET DF <DIFF ,DWM-LOC1 ,DWM-HERE>>)>
			 <CAST-FAR-VISION <>>
			 ;<SINGLE-MOVE-GRAPHIC ,G-DWARVES-FV>
			 <TELL CR CR
"\"There!\" said Bergon, as the fireball cast its eerie light on
a group of shadowy figures not ">
			 <COND (<EQUAL? .DF 2>
				<TELL "fifty">)
			       (<EQUAL? .DF 1>
				<TELL "twenty">)>
			 <TELL " paces away.">)
			(<ACTION? COMBAT>
			 <COND (,2ND-PASS
				<TELL
"Bergon, surprised by the aggressiveness of the Dwarves, drew
his sword, but we stayed his hand. \"Astrix said the Dwarves
were our allies,\" Praxix reminded him.">
				<REMOVE-PARTY-COMMAND ,COMBAT-COMMAND>
				<REMOVE-PARTY-COMMAND ,RETREAT-COMMAND>
				<RTRUE>)>
			 <TELL
"At Bergon's signal, we started to fight, but we were surrounded and
hopelessly outnumbered. We were at the Dwarves mercy, but their leader
spared our lives. Instead, he ordered us bound and blindfolded, and had
us marched us back to the gate at which we entered the cavern. The
heavy stone door closed behind us with a crash.">
			 <HINT ,HINT-DWARVES>
			 <FSET ,DWARF-MEETING ,TRIED>
			 <TRAVEL-COMMANDS ,CANYON-GATE ,PROCEED-COMMAND>
			 <DWM-END ,CANYON-GATE>)
			(<ACTION? RETREAT>
			 <REMOVE-PARTY-COMMAND ,RETREAT-COMMAND>
			 <TELL
"We thought of trying to escape, but were completely surrounded. We
would either have to fight these Dwarves or parley with them.">)
			(<ACTION? PARLEY>
			 <TELL
"Bergon sheathed his sword, and took a few small steps toward the Dwarf
leader.">
			 <OPTION ,BERGON ,TELL-TRUTH-COMMAND ,LIE-COMMAND>)
			(<ACTION? TELL-TRUTH>
			 <COND (,2ND-PASS
				<TELL
"\"We have journeyed here from the Sunrise Tower of Astrix, the Wizard.
He believes we may benefit in our struggle with the " ,BAD-GUY " by exploring
these caverns.">
				<COND (,KIDNAPPED
				       <TELL
" We have faced many dangers on our journey, and just now one
of our party has disappeared near the gate at Bern i-Lav.">)>
				<TELL "\"" CR CR>)
			       (T
				<TELL
"\"We journey eastward to the Tower of the Sunrise, in search of the Wizard
Astrix.\"" CR CR>
				<TELL
"\"You choose a most unusual route....\"" CR CR>
				<TELL
"\"We chose not this path. One of our party disappeared near the gate by
which we entered these caverns, and we have followed his trail to this
spot.\"" CR CR>)>
			 <COND (,KIDNAPPED
				<TELL
"There was a murmur in the ranks of the Dwarves, and their leader at
last held out a bloodied garment that belonged to ">
				<TELL D ,KIDNAPPED>
				<TELL
". \"We found this a short while ago. If your friend has been taken by Orcs, your
best hope is that he is dead!\" He paused for a long moment." CR CR>)>
			 <DWM-ESCORT-OPTION>)
			(<ACTION? LIE>
			 <TELL
"\"We travel east to meet our friends at the port of Zan.\"" CR CR>
			 <TELL
"\"If you have friends in Zan, the worse for you!\" the Dwarves' leader
spat. \"It is an evil place, a den of thieves and assassins.\" His voice
had taken on an alarmingly belligerent tone, but he quickly regained his
composure and now spoke in a quieter, more thoughtful voice. \"Yet,\"
he said, \"you are not of Orcish blood, and it is possible that you are
not enemies of the Dwarves." CR CR>
			 <TELL
"\"We do not kill in haste, as is now the fashion, but we cannot allow
you and your party to walk the halls of Reth a-Zar unescorted.\" His eyes
slowly passed over each of us, then he spoke as a judge passing sentence." CR CR>
			 <FSET ,DWARF-MEETING ,TRAPPED>
			 <DWM-ESCORT-OPTION T>)
			(<ACTION? GET-ADVICE>
			 <FCLEAR ,HERE ,ADVISE>
			 <COND (<FSET? ,DWARF-MEETING ,SEEN>
				<TELL
"We conferred briefly to consider Agrith's offer. ">
				<COND (<AND <IN-PARTY? ,ESHER>
					    <EQUAL? ,MINAR ,KIDNAPPED>
					    <NOT ,2ND-PASS>>
				       <TELL "With the exception of
Esher, who remained convinced that this was all a part of some sinister plan
concocted by Minar,">)
				      (T
				       <TELL "There was no dissention:">)>
				<TELL " the group was united
in favoring acceptance.">)
			       (<IN-PARTY? ,ESHER>
				<TELL
"Bergon asked the group for advice, but only Esher answered.
\"If anyone cared about my advice, we wouldn't be on this 'adventure' in
this first place.\" He was in fine form, clearly demonstrating why nobody
cared about his advice.">)>
			 <OPTION ,BERGON ,ACCEPT-COMMAND ,DECLINE-COMMAND>)
			(<OR <AND <ACTION? DECLINE> ,2ND-PASS>
			     <ACTION? ACCEPT>>
			 <COND (<ACTION? DECLINE>
				<TELL
"Bergon thought to decline, feeling some distrust toward this unknown
people. Yet, Astrix felt certain that we should come here, and Bergon
was loath to disappoint him." CR CR>)>
			 <TELL
"Bergon replied, \"You are most gracious, Agrith, and we would
be foolish indeed to decline your offer.\" Agrith bowed slightly, then
motioned to one of his men, who stepped forward. \"This is Hurth, one
of my sons. He shall be your guide through Reth a-Zar!\"" CR CR>
			 <TELL
"Agrith handed Hurth a flaming torch to help guide our way, and then the
two Dwarves embraced in their fashion. With a motion of his arm, Agrith
signalled the others to follow, and quietly he led them away into the
gloom of the cavern's depths."> 
			 <DWM-END ,CAVERN-1>
			 <PARTY-ADD ,HURTH>
			 <REMOVE ,TALE-DWARVES>
			 <RTRUE>)
			(<ACTION? DECLINE>
			 <TELL
"Bergon declined Agrith's offer, saying \"Our concerns and yours are not
yet joined. We shall make our way alone.\"" CR CR>
			 <TELL
"And with that, Agrith's men escorted us out of the caverns; we never saw
the Dwarves again.">
			 <TRAVEL-COMMANDS ,CANYON-GATE ,PROCEED-COMMAND>
			 <DWM-END ,CANYON-GATE>)>>)>

<ROUTINE DWM-ESCORT-OPTION ("OPT" (FOO <>))
	 <COND (<AND ,2ND-PASS <NOT .FOO>>
		<TELL
"\"I do not know what purpose Astrix has in mind, but I grant you
this option,\" Agrith said. \"Continue freely through these halls
with our chosen escort, or leave at once! Choose now!\"">)   
	       (T
		<TELL
"\"I, Agrith, speaking for the Dwarves, grant you this option: to continue
on your way with our chosen escort, or to leave these halls at once.
Choose now!\"">)>
	 <OPTION ,BERGON ,ACCEPT-COMMAND ,DECLINE-COMMAND ,GET-ADVICE-COMMAND>
	 <RTRUE>>

<ROUTINE DWM-END (RM)
	 <END-OPTION>
	 <SCENE <>>
	 <MOVE-TO .RM>>

<ROUTINE DIFF (N1 N2)
	 <COND (<G? .N1 .N2> <- .N1 .N2>)
	       (T <- .N2 .N1>)>>

<ROUTINE DWM-HEAR ("AUX" DL DIF DF1 DF2 (SURR <>))
	 <SET DF1 <DIFF ,DWM-LOC1 ,DWM-HERE>>
	 <SET DF2 <DIFF ,DWM-LOC2 ,DWM-HERE>>
	 <COND (<G? .DF2 .DF1>
		<SET DL ,DWM-LOC1>
		<SET DIF .DF1>)
	       (T
		<SET DL ,DWM-LOC2>
		<SET DIF .DF2>
		<SET SURR T>)>
	 <COND (<ZERO? .DIF>
		;"We've arrived at their location."
		<GRAPHIC ,G-DWARVES>
		<FSET ,DWARF-MEETING ,SEEN>
		<UPDATE-FSET ,DWARF-MEETING ,DONT-CAST>
		<TELL
"Our assailants had finally arrived; Dwarves they were, and heavily
armed. We joined in a tight circle, weapons drawn, and waited for the
onslaught. But they did not attack; rather, their leader, somewhat taller
and having about him an air of superiority, strode forward." CR CR>
		<TELL
"\"What business have you here in Reth a-Zar?\" he demanded. \"Come,
speak quickly, for we have no patience with strangers!\"">
		<COND (<NOT <FSET? ,TALE-RETH-A-ZAR ,EXAMINED>>
		       <TELL
" Under his breath, Praxix repeated the strange words - 'Reth a-Zar';
they held some great meaning for our Wizard-friend, but for us they spoke
only of hopelessness and despair.">)>
		<COND (<NOT <FSET? ,TALE-RETH-A-ZAR ,EXAMINED>>
		       <UPDATE-MOVE ,TALE-RETH-A-ZAR ,PRAXIX-TALES>)>
		<MODE ,FIGHT-MODE>
		<PRINT-CHARACTER-COMMANDS>
		;"Force update-flag to false..."
		<CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>
		<SETG OPPONENT ,DWARVES>
		<SETG COMBAT-ROUND -1>
		<RTRUE>)>
	 <COND (<OR <AND <G? .DL ,DWM-HERE> ,DWM-FACING>
		    <AND <L? .DL ,DWM-HERE> <NOT ,DWM-FACING>>>
		<TELL "Ahead of">)
	       (T
		<TELL "From somewhere behind">)>
	 <TELL " us, we could ">
	 <COND (<EQUAL? .DIF 2> <TELL "barely ">)>
	 <TELL "make out muffled noises which were coming nearer with each
passing moment.">
	 <COND (<AND .SURR <NOT <GET-TEMP>>>
		<DWM-TRAPPED>)>
	 <RTRUE>>

<ROUTINE DWM-TRAPPED ()
	  <SET-TEMP T>
	  <TELL CR CR
"\"They come from both sides. We are trapped!\" said Bergon, verbalizing
that which we had long since feared. Each of us reached for his weapon,
knowing battle to be near at hand.">>

<ROOM STAIR-BOTTOM
      (TRAVEL-COMMANDS PROCEED-COMMAND UP-COMMAND NUL-COMMAND)
      (GRAPHIC G-D-STAIR-BOTTOM)
      (ENTER FSET-SEEN)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (UP
	       <TELL
"We climbed for hours as we made our way up the gently winding stair, then
paused for refreshment. It seemed the stairs would go on forever">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL ", but
Hurth reassured us, saying, \"We are now at the half-way point to the
High Gate and the Tower of the Sunset!\"">)
		     (T
		      <TELL ".">)>
	       <TELL CR CR>
	       <COND (<FSET? ,HERE ,TRAPPED>
		      <REMOVE-TRAVEL-COMMAND ,STAIR-JUNCTION ,DOWN-COMMAND>)>
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"Hurth was right: a few hours later, we arrived at a junction of two
stairways. \"The stair to the left leads to the Tower of the Sunset;
the stair to the right leads to the High Gate,\" Hurth said. \"If
we intend to reach the Tower, we should start now. It is a much
longer climb.\"">)
		     (T
		      <TELL
"After climbing for a few hours more, we arrived at the junction
of two stairways; neither was marked.">)>
	       <MOVE-TO ,STAIR-JUNCTION>)
	      (PROCEED
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL "With Hurth">)
		     (T
		      <TELL "With " D ,LEADER>)>
	       <COND (<NOT ,STAIR-TO-PRISON?>
		      <SETG STAIR-TO-PRISON? T>)
		     (T
		      <FSET ,HERE ,TRAPPED>
		      <REMOVE-TRAVEL-COMMAND>)>
	       <COND (<NOT <FSET? ,OUTSIDE-PRISON ,SEEN>>
		      <TELL
" in the lead, we continued into the dark caverns. After
an hour's march, we came to a place in which a single word, in runes, was
carved into the stone.">)
		     (T
		      <TELL
" leading the way, we again marched to the spot at which runes were
carved into the stone.">)>
	       <MOVE-TO ,OUTSIDE-PRISON>)>)>
		 
<BEGIN-SEGMENT ORC-FIGHT>

<ROOM ORC-FORK
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-FORK)
      (FLAGS UNDERGROUND DANGEROUS)
      (ACTION
       <ACOND ()
	      (LEFT:REMOVE
	       <TELL
"As we moved down the left passage, we could hear sounds ahead. Hurth
waved for us to stop; then, he continued alone and reported that he
was certain that a gang of orcs were just beyond our sight." CR CR>
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>	       
	       <TELL
"\"The passage narrows ahead,\" he whispered. \"Perhaps one of us
could get through without being seen, but not more. Perhaps we should
explore the right-hand passage.\" We agreed, and silently returned to the fork.">)
	      (SCOUT:REMOVE
	       <REMOVE-TRAVEL-COMMAND ,HERE ,LEFT-COMMAND>
	       <TELL ACT " made his way down both corridors, then
returned. \"Both passages lead to the same place and the same group of
orcs,\" he said, \"but the right path is wider and will protect our
movements longer.\"">)
	      (RIGHT
	       <COND (<NOT <QSET? ,HERE ,BLACK-MIX>>
		      <TELL
"We moved silently down the passage, and found the meaning of the glowing
cavern wall. Not ten paces away, the cavern opened into a vestibule, in the
middle of which stood nine grotesque figures huddling around an open fire.
Bound and gagged on the floor nearby, unmoving, was ">
		      <COND (,KIDNAPPED <TELL D ,KIDNAPPED "!" CR CR>)
			    (T <TELL "a badly beaten Dwarf!" CR CR>)>
		      <TELL
"\"Cursed orcs!\" Hurth spat. \"Kirth en-Gilan!\"">)
		     (T
		      <TELL
"Again, we made our way to the edge of the orcs' cavern. This time, we
knew we had no alternative but to fight!">
		      <REMOVE-TRAVEL-COMMAND ,ORC-ANTE ,BACK-COMMAND>)>
	       <MOVE-TO ,ORC-ANTE>)>)>

<GLOBAL KIDNAPPED <>>

<ROOM ORC-VESTIBULE
      (TRAVEL-COMMANDS RETURN-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS ENCLOSED)
      (ACTION
       <ACOND ()
	      (RETURN
	       <REMOVE-TRAVEL-COMMAND ,OUTSIDE-PRISON ,ENTER-COMMAND>
	       <COND (,KIDNAPPED
		      <TELL D ,KIDNAPPED " was safe">)
		     (T
		      <TELL "We had saved the Dwarf">)>
	       <TELL
", but at what cost? I shuddered at our bad fortune and
dreaded the trials that were yet to come." CR CR>
	       <TELL
"Bergon approached, and laid his hand on my shoulder. \"We must
put this behind us, " TAG ". Agrith grieves for Hurth and also for
his besieged people; we must not let either down.\" And taking
me by the arm, we left the field of battle." CR CR>
	       <TELL
"As we passed the fork, Bergon noticed a device of some kind mounted on
the wall. \"Let's hope this opens the prison door,\" he said, and pressed it.
Moving quickly, we lowered ourselves back down into the prison, where, indeed,
the door stood open. And as we left, the door closed silently behind us.">
	       <MOVE-TO ,OUTSIDE-PRISON>)>)>

<ROOM ORC-ANTE
      (TRAVEL-COMMANDS FIGHT-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-ANTE)
      (FLAGS UNDERGROUND DANGEROUS ADVISE DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (CAST
	       <UPDATE-FSET ,HERE ,DONT-CAST>
	       <UNUSE-ESSENCES>
	       <TELL
"Praxix then got the screwy notion of casting some sort of spell, but Bergon
held him back." CR CR>
	       <TELL
"\"Wait just a moment, Praxix,\" he said. \"We may yet have need for magic
here, but we have not yet determined how best to handle these orcs. Any premature
magical display would only serve to lessen our chances of surprising them
later.\"">)	    
	      (GET-ADVICE:REMOVE
	       <TELL
"There was little discussion; we would have to fight these orcs if
we were to save their captive. Hurth felt the most strongly, and I
suppose this was only natural." CR CR>
	       <TELL
"\"We must fight, but we must be careful; the orcs are fierce fighters
and we are outnumbered,\" he said.">)
	      (FIGHT
	       <SETG OPPONENT ,ORCS>
	       <SCENE ,ORC-FIGHT ,FIGHT-MODE>
	       <NUL-PARTY-COMMAND ,PARLEY-COMMAND>
	       <TELL
"Determined to rescue ">
	       <COND (,KIDNAPPED <TELL D ,KIDNAPPED>)
		     (T <TELL "the Dwarf">)>
	       <TELL ", we huddled to formulate a strategy.">)
	      (BACK:REMOVE
	       <COND (<NOT <FSET? ,ORC-FORK ,DONT-SCOUT>>
		      <TELL
"Uncertain of whether to risk attacking the orcs just then, we retreated
back to the fork.">
		      <MOVE-TO ,ORC-FORK>)
		     (T
		      <TELL
"I suggested trying to save the orcs' captive by other means, but the others
resisted. \"I fear we must fight these orcs,\" Bergon said, reluctantly. \"There
is no other way.\"">)>)>)>

<GLOBAL ORC-FIGHT-SPELL <>>

<OBJECT ORCS
	(LOC ORC-ANTE)
	(FLAGS DONT-TAKE)
	(SDESC "orcs")
	(KBD %<ASCII !\O>)
	(ATTACK 170 80)
	(STATUS 100)
	(RETREAT 40)
	(SPECIAL-ACTION
	 <EXECUTE ()
		  <TELL CR
"The orcs, overwhelmed, now tried to withdraw, but we killed them all save
two who ran from the area, with Hurth in hot pursuit. We freed ">
		  <COND (,KIDNAPPED
			 <TELL D ,KIDNAPPED>
			 <PARTY-CHANGE ,HURTH ,KIDNAPPED>)
			(T
			 <PARTY-REMOVE ,HURTH>
			 <TELL "the Dwarf">)>
		  <TELL " from
his bonds, and he told us how he was caught at unawares by the orcs who,
having easily subdued him, brought him here." CR CR>
		  <TELL
"As we stood, tending to our wounds, a low, rumbling scream issued forth
from the passage used by the surviving orcs. We rushed down the passage
and found Hurth, slumped against the cold stone, bleeding from his
chest and head, surrounded by the bodies of the orcs who had waited
in ambush." CR CR>
		  <COND (<IN-PARTY? ,ESHER>
			 <TELL
"Esher rushed to help, but finding Hurth's wounds beyond his talents,
he turned away dejectedly. ">)>
		  <TELL
"From down the cavern, we heard the sounds of running feet; we had barely reached
for our weapons when Agrith and his party arrived." CR CR>
		  <GRAPHIC ,G-HURTH-DIES>
		  <TELL
"\"The story here speaks for itself,\" he said gravely, and knelt
beside the broken body of Hurth, raising that proud head into his
arms. And then, as impossible as it sounds, the two Dwarves seemed to
speak. For a long moment, Agrith was silent, then he rose from the ground
and motioned to his men, who carried the lifeless body away." CR CR>
		  <COND (<FSET? ,DWARF-MEETING ,TRAPPED>
			 ;"Lied..."
			 <HINT ,HINT-DWARF-LIE>
			 <TELL
"\"I believe you may be trusted,\" he said, \"but only so far. You are free to
walk these halls, but I must return to my people and prepare for the onslaught
that is to come.\"">)
			(T
			 <UPDATE-MOVE ,DWARF-STONE ,INVENTORY>
			 <TELL
"\"We have suffered enough in Azhur na-Brem. Tell Astrix this when
you see him, and show him this token. He will know what to do.\"
Agrith took a brown stone amulet from around his neck, and gave it
to Praxix. \"I must leave you now. May the earth give you speed.\"">)>
		  <TELL " He strode away, and we never saw him again.">
		  <REMOVE-TRAVEL-COMMAND ,OUTSIDE-PRISON ,ENTER-COMMAND>
		  <REMOVE ,PRISON-RUNES>
		  <MOVE-TO ,ORC-VESTIBULE>
		  <SCENE <>>
		  <RTRUE>>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" counted nine orcs, each carrying brutal weapons. We were clearly
outnumbered, though we had the element of surprise.">)>)>

<OBJECT ORC-FIGHT
	(ACTION
	 <ACOND ("AUX" ACT)
		(SCENE-START
		 <SETG COMBAT-ROUND -1>
		 <REMOVE-PARTY-COMMAND ,RETREAT-COMMAND>)
		(SCENE-END
		 <CLEAR-BUSY>
		 <COND (<NOT <IN-PARTY? ,HURTH>>
			<FSET ,OUTSIDE-PRISON ,TRAPPED>)>)
		(COMBAT-RESULT
		 <COND (<ZERO? ,COMBAT-ROUND>
			;<GRAPHIC ,G-ORC-FIGHT>
			<COND (<FSET? ,ORC-FIGHT ,SEEN>
			       <FSET ,HERE ,BLUE-MIX>)>
			<COND (<WINNING-OF?>
			       ;"Flank + casting of mud -> best case"
			       <TELL
"The orcs, badly confused, started to fight in both directions. One
fell to the ground, head severed by a fierce blow from Bergon's
sword.">)
			      (T
			       <ADD-PARTY-COMMAND ,RETREAT-COMMAND>
			       <CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>
			       <CHECK-ORC-FIGHT-SPELL>
			       <COND (<FSET? ,ORC-FIGHT ,DEAD> <TELL CR CR>)>
			       <TELL
"It was clear from the outset that our chances were not good; the orcs
were powerful fighters, and utterly fearless. Bergon was hit almost
at once by the side of a battle axe, but continued to fight in
spite of his wounds.">
			       <MAKE-BUSY ,BERGON ,ILL-COMMAND>
			       <COND (<OR <FSET? ,ORC-FIGHT ,DEAD>
					  <FSET? ,HERE ,BLUE-MIX>>
				      <TELL CR CR "No doubt, ">
				      <COND (<FSET? ,ORC-FIGHT ,DEAD>
					     ;"Praxix cast mud, though..."
					     <TELL "the mud had slowed down">)
					    (T
					     <TELL "our two-pronged attack confused">)>
				      <TELL " the orcs somewhat, or the result
would have been even worse than appeared likely.">
				      <COND (<FSET? ,HERE ,BLUE-MIX>
					     <TELL
" But the orcs, whose movements were quicker and more agile than we had expected,
recovered swiftly, and several of them now moved toward our flanking comrade.">)>)>
			       <RTRUE>)>)
		       (<EQUAL? ,COMBAT-ROUND 1>
			<COND (<WINNING-OF?>
			       <TELL
"Try as they might, the orcs could not recover from our two-pronged
attack, especially considering the sloppy impediment that Praxix had thrown in
their way.  Another two were down, and except for a few scratches, our party
was unscathed and greatly emboldened by our success.">)
			      (<AND <FSET? ,ORC-FIGHT ,SEEN>
				    <NOT <FSET? ,HERE ,BLUE-MIX>>>
			       ;"Now flanking, but didn't do it first..."
			       <MAKE-BUSY ,PRAXIX ,ILL-COMMAND>
			       <TELL
"Our change in tactics turned out only partially successful, for Praxix was
now slightly wounded, and it became more difficult to take proper advantage of
the confusion we had caused. One orc was down, slashed in the throat by
a deadly thrust from Hurth's sword, but the others fought with
undiminished zeal.">)
			      (T
			       <MAKE-BUSY ,PRAXIX ,ILL-COMMAND>
			       <TELL
"Our attempts to parry the orcs' blows were failing, and soon each
of us was at least slightly wounded, making the orcs' weapons ever more
punishing. In our exasperation, we were barely able to do any damage ourselves;
the fight would soon be lost!">)>)
		       (T
			<PUTP ,ORCS ,P?RETREAT 100>
			;"Force an end to the fight now."
			<TELL
"The victory would soon be ours; the remaining orcs were badly hurt and,
slowed down by the muck beneath their feet, their confidence was wavering.
Hurth struck down yet another with a mighty blow of his sword as those remaining
began to retreat toward the far side of the chamber.">)>
		 <RTRUE>)
		(CAST
		 <MAKE-BUSY ,PRAXIX>
		 <COND (<G? ,COMBAT-ROUND -1>
			;"We've started fighting..."
			<TELL
"Praxix, between blows, hoped to prepare a \"" AO "\" spell, but it didn't
appear he would get the chance to complete it.">)
		       (T
			<SETG ORC-FIGHT-SPELL ,ACTION-OBJECT>
			<COND (<FSET? ,ORC-FIGHT ,SEEN>
			       <TELL
"Now that the fight had begun, Praxix hastily grabbed for his pouch and
started to prepare some sort of spell. As he fumbled with his powders for an
excruciatingly long moment, I felt sure he would never complete it in time to
be of any usefulness.">
			       <CHECK-ORC-FIGHT-SPELL T>
			       <RTRUE>)			      
			      (T
			       <TELL
"With the thought of using magic in our fight with the orcs, Praxix started
removing some of his magical powders in the preparation of some sort of spell.">)>)>)
		(<OR <ACTION? RETREAT>
		     <AND <ACTION? COMBAT>
			  <EQUAL? ,COMBAT-ROUND 1>
			  <NOT <WINNING-OF?>>>>
		 <COND (,KIDNAPPED
			<HINT ,HINT-ORC-FIGHT>)>
		 <END-COMBAT <>>
		 <TELL
"We tried to continue the fight, but we were losing badly. Bergon,
fearing our complete destruction at the hands of the orcs, led us
into a retreat." CR CR>
		 <TELL
"As we passed the fork, Hurth noticed a device of some kind mounted on
the wall with some runes above it. \"Opens the prison door, but only
for a brief time,\" he said, and pressed it. Using
the rope to lower ourselves back down into the prison, we hurried
through the closing door." CR CR>
		 <TELL
"And as the door of cold stone slammed shut behind us, a terrifying scream
could be heard from inside the prison.">
		 <COND (,KIDNAPPED
			<TELL " I turned to Bergon and mouthed
the name \"" D ,KIDNAPPED "\"; we stood there in silence, but heard no more.">)
		       (T
			<TELL CR CR
"\"The orcs do not keep prisoners,\" Hurth said, \"Let us hurry.\"">)> 
		 <FSET ,OUTSIDE-PRISON ,TRAPPED>
		 <MOVE-TO ,OUTSIDE-PRISON>)
		(<AND <ACTION? FLANK>
		      <NOT <FSET? ,ORC-FIGHT ,SEEN>>>
		 <COND (<EQUAL? ,ACTOR ,BERGON>
			<SETG FLANK-ACTOR ,BERGON>
			<CHANGE-CIT ,HURTH 1 ,NUL-COMMAND>)
		       (T
			<SETG FLANK-ACTOR ,HURTH>
			<COND (<NOT <FSET? ,BERGON ,BUSY>>
			       <CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>)>)>
		 <SETG SMART-DEFAULT-FLAG T>
		 <MAKE-BUSY ,FLANK-ACTOR ,GONE-COMMAND>
		 <FSET ,ORC-FIGHT ,SEEN>
		 ;"He's flanked the orcs..."
		 <COND (<EQUAL? ,COMBAT-ROUND -1>
			<TELL
"Our best chance was to surprise the orcs, so " D ,FLANK-ACTOR " slipped away
to find a spot behind their lines. We waited a seeming eternity, and then,
with a heart-stopping scream, " D ,FLANK-ACTOR " charged at them; we held back
long enough to take the orcs entirely by surprise.">
			<CHECK-ORC-FIGHT-SPELL T>)
		       (<NOT <QSET? ,ORC-FIGHT ,BUSY>>
			<TELL
"The fight was not going well, and " D ,FLANK-ACTOR " decided to try to flank
the orcs. But in the meantime, we were now fighting outnumbered, outclassed,
and badly hurt!">)>)
		(<AND <ACTION? COMBAT>
		      <FSET? ,ORC-FIGHT ,BUSY>>
		 <FSET ,ORC-FIGHT ,BLUE-MIX>
		 <FCLEAR ,ORC-FIGHT ,BUSY>
		 <TELL
"With a heart-stopping scream, " D ,FLANK-ACTOR " charged the orcs from behind,
momentarily taking them by surprise.">)>)>

<ROUTINE WINNING-OF? ()
	 <COND (<AND <FSET? ,HERE ,BLUE-MIX>
		     <FSET? ,ORC-FIGHT ,DEAD>>
		<RTRUE>)>>

<ROUTINE CHECK-ORC-FIGHT-SPELL ("OPTIONAL" (CRF <>))
	 <COND (<FSET? ,HERE ,NEVER-DROP> <RFALSE>)
	       (<EQUAL? ,ORC-FIGHT-SPELL ,MUD-SPELL>
		<CHANGE-CIT ,PRAXIX 1 ,CAST-COMMAND>
		<FSET ,ORC-FIGHT ,DEAD>
		<COND (.CRF <TELL CR CR>)>
		<TELL
"Just then, Praxix finished preparing his mud spell, and cast it at the feet
of our enemy, leaving his hands covered with a ">
		<TELL-COLOR ,ESSENCE-WATER ,ESSENCE-EARTH>
		<TELL
" residue. As he did, pools of water rose from the rock-hard earth, mixing
with the overlying dirt and creating a large pool of soft and sticky mud.
Within moments, the orcs were stomping and trudging where just seconds before
they had been stomping and charging.">
		<COND (<FSET? ,ORC-FIGHT ,SEEN>
		       <TELL " The net effect was that the orcs were
only slowly able to recover from the shock of " D ,FLANK-ACTOR "'s surprise
attack.">)>)
	       (,ORC-FIGHT-SPELL
		<CHANGE-CIT ,PRAXIX 1 ,NUL-COMMAND>
		<UPDATE-FSET ,HERE ,NEVER-DROP>
		<COND (.CRF <TELL CR CR>)>
		<TELL "Just then, Praxix finished preparing his spell">
		<COND (<EQUAL? ,ORC-FIGHT-SPELL ,WIND-SPELL>
		       <TELL
" and a fierce wind blew through the caverns. But in these cramped caverns,
the wind's effect was decidedly mixed, wreaking havoc not only with the
orcs' fighting, but with our own as well. When the wind finally died down, it
can honestly be said that we had gained no advantage.">)
		      (<EQUAL? ,ORC-FIGHT-SPELL ,FAR-VISION-SPELL>
		       <TELL
", and the ball of flame raced toward the astonished orcs. But the fireball
faded quickly and the element of surprise was too short-lived to give us any
lasting advantage in our fight.">)
		      (<EQUAL? ,ORC-FIGHT-SPELL ,LIGHTNING-SPELL ,RAIN-SPELL>
		       <TELL
", but realized that this spell was entirely useless underground, having its
effect only in the open air.">)
		      (T
		       <TELL
". And then, he appeared to waver in his resolve. Afterward, he admitted that the
spell would have been entirely useless in fighting the orcs anyway.">)>)>>

<GLOBAL FLANK-ACTOR <>>

