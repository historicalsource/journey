"PRISON for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT DWARVES>

;"What is a fantasy game without a maze, anyway?"

<ROOM OUTSIDE-PRISON
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-PRISON-RUNES)
      (ENTER FSET-SEEN)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (BACK
	       <MOVE-TO ,STAIR-BOTTOM
"It was a short walk back to the stairs, and we prepared to make the
long ascent.">)
	      (PROCEED
	       <TELL
"We continued our march through the long passage. ">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"\"We have come nearly to the eastern extent of the Reth a-Zar, where the
Bern i-Fen leads to the Old Forest,\" Hurth said." CR CR>)
		     (T
		      <TELL
"\"My sense is that we are nearing the Forest Gate,\" Praxix said." CR CR>)>
	       <MOVE-TO ,DARK-EVIL-CAVERN
"\"That sounds fine to me,\" I exclaimed, \"What I wouldn't give to see the
sunshine again!\"">)
	      (ENTER
	       <COND (<FSET? ,HERE ,TRAPPED>
		      <REMOVE-TRAVEL-COMMAND>
		      <TELL
"I suggested returning to the prison, but we decided against it.
\"">
		      <COND (,KIDNAPPED <TELL D ,KIDNAPPED>)
			    (T <TELL "My kinsman">)>
		      <TELL
" is dead,\" Hurth said, gently. \"The orcs do not keep
prisoners, except for the sport of torture. In any event, they
will expect our return, and lie in wait for us. Let us continue,
that his death will not have been in vain.\"">)
		     (T
		      <MOVE-TO ,PRISON>)>)>)>

<GLOBAL DARK-EVIL-LOC 0>

<ROOM DARK-EVIL-CAVERN
      (TRAVEL-COMMANDS BACK-COMMAND PROCEED-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DANGEROUS ADVISE)
      (CAST-LIMIT INF)
      (GRAPHIC G-DARK-CAVERN)
      (ENTER
       <EXECUTE ()
		<FSET ,DARK-EVIL-CAVERN ,SEEN>
		<TELL CR CR
"Bergon laughed, as did Praxix, but there was another sound also, cold and
rumbling, like distant thunder; and it came from before us.">
		<COND (<IN-PARTY? ,HURTH>
		       <TELL CR CR
"\"I know not what lies before us,\" Hurth said, \"yet I know
that many evils, having long inhabited the deepest places of the earth,
now boldly tread even on the Dwarves' hallowed halls.\"">)>>)
      (TEMP 0)
      (ACTION
       <ACOND ("AUX" TMP)
	      (GET-ADVICE:REMOVE
	       <TELL
"Bergon sought the group's advice, and the consensus was clearly to turn back.
Praxix, however, was uncertain, torn between his desire for further exploration
and the danger he felt certain was ahead.">)
	      (<OR <ACTION? PROCEED> <ACTION? BACK>>
	       <SET-TEMP <SET TMP <+ <GET-TEMP> 1>>>
	       <COND (<ACTION? PROCEED>
		      <SETG DARK-EVIL-LOC <+ ,DARK-EVIL-LOC 1>>)
		     (T
		      <SETG DARK-EVIL-LOC <- ,DARK-EVIL-LOC 1>>)>
	       <COND (<EQUAL? .TMP 1>
		      <TELL
"A cold wind chilled us to the bone as we inched our way ">
		      <COND (<ACTION? BACK>
			     <TELL "back ">)>
		      <TELL "through the cavern.">
		      <COND (<FSET? ,PRAXIX ,LIT>
			     <TELL CR CR
"\"Praxix! Look!\" I cried, pointing at the Wizard's staff. The staff
still glowed a pale red, but the light it cast was different; duller, perhaps,
or less potent.">)>
		      <RTRUE>)
		     (<EQUAL? .TMP 2>
		      <COND (<ACTION? BACK>
			     <TELL "Back">)
			    (T
			     <TELL "On">)>
		      <TELL
" we went, as the now frigid air grew colder still with each tentative
step.">
		      <COND (<FSET? ,PRAXIX ,LIT>
			     <TELL
" Praxix' staff was now glowing a dim, dull red, and its light was barely
enough to see by.">)>
		      <TELL CR CR
"\"Something's here,\" I whispered, as the air grew stale, then acrid. I
stumbled backward, tripped, and fell against the ground.">
		      <REMOVE-PARTY-COMMAND ,PROCEED-COMMAND>
		      <COND (<IN-PARTY? ,HURTH>
			     <TELL CR CR
"\"This is an evil day,\" said Hurth. \"I hope there is time yet for us to
make our escape.\"">)>
		      <RTRUE>)
		     (T
		      <REMOVE-PARTY-COMMAND ,BACK-COMMAND>
		      <TELL
"As we moved ever more slowly through the blackness, the evil presence drew
closer still. But Praxix stood his ground, saying, \"We must not allow
this evil to endanger the other Dwarves. Run now, while I teach this
thing a lesson!\" It was sheer bravado, but Praxix was insistent.
\"Fly,\" he shouted. \"I shall join you soon!\"" CR CR>
		      <TELL
"Bergon agreed that there was nothing we could do but get ourselves
into more trouble, so we retreated to the stairs to await Praxix'
return.">
		      <SCENE ,PRAXIX-VS-EVIL>)>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LIGHT-SPELL>
		    <PRSI? STAFF>>
	       <TELL
"Praxix applied some fire and earth essences to the end of his staff, but the
light grew dimmer, not brighter. \"Most peculiar,\" he said.">)
	      (<AND <ACTION? CAST> <OBJECT? TREMOR-SPELL>>
	       <UNUSE-ESSENCES>
	       <TELL
"The thought crossed Praxix' mind to cast a tremor spell, isolating
this dark presence. But the tremor spell was always unpredictable,
and the entire party might be placed in jeopardy.">)
	      (<AND <ACTION? CAST> <OBJECT? FAR-VISION-SPELL>>
	       <CAST-FAR-VISION <>>
	       <TELL
" But the ball of flame, rather than expelling the darkness before it, was wholly
enveloped by it. \"I fear to think what evil can consume the very light,\" Praxix
said.">)>)>

<OBJECT PRAXIX-VS-EVIL
	(TEMP 0)
	(GRAPHIC G-MINER-PASSAGE)
	(ACTION
	 <ACOND ("AUX" TMP)
		(SCENE-START
		 <FSET ,PRAXIX-VS-EVIL ,SEEN>
		 <TRAVEL-COMMANDS ,PRAXIX ,CAST-COMMAND ,EXAMINE-COMMAND>
		 <MAKE-SUBGROUP ,PRAXIX>
		 <NEW-DEFAULT <PARTY-PCM ,PRAXIX> 1>)
		(SCENE-END
		 <TRAVEL-COMMANDS ,PRAXIX
				  ,CAST-COMMAND
				  <COND (<NOT ,PART-TWO>
					 ,TELL-LEGEND-COMMAND)
					(,MIX-DONE
					 ,USE-MIX-COMMAND)
					(<NOT <FSET? ,REAGENT ,SOLVED>>
					 ,NUL-COMMAND)
					(T
					 ,MIX-COMMAND)>
				  ,EXAMINE-COMMAND>
		 <CLEAR-SUBGROUP>)
		(CAST
		 <PUTP ,PRAXIX-VS-EVIL
		       ,P?TEMP
		       <SET TMP <+ <GETP ,PRAXIX-VS-EVIL ,P?TEMP> 1>>>
		 <COND (<OR <EQUAL? .TMP 3>
			    <AND <OBJECT? TREMOR-SPELL>
				 <NOT <EQUAL? .TMP 1>>>>
			<TELL "Finally, ">)
		       (<EQUAL? .TMP 1>
			<COND (<NOT <OBJECT? TREMOR-SPELL>>
			       <TELL "First, ">)>)
		       (T
			<TELL "Then, ">)>
		 <COND (<EQUAL? ,ACTION-OBJECT
				,FIRE-SPELL
				,LIGHT-SPELL
				,FAR-VISION-SPELL>
			<TELL
"Praxix pulled out some magic essences and prepared to cast
his enchantment. But it was no use! The dark presence negated the
spell even as it was cast.">)
		       (<EQUAL? ,ACTION-OBJECT
				,RAIN-SPELL
				,LIGHTNING-SPELL>
			<UNDERGROUND-CHECK>)
		       (<OBJECT? WIND-SPELL>
			<TELL
"pulling out some air essence, he cast that spell toward the
unseen evil, but this barely slowed its inexorable approach.">)
		       (<OR <OBJECT? LEVITATE-SPELL>
			    <OBJECT? MUD-SPELL>>
			<PRAXIX-NO-CAST>)
		       (<OBJECT? TREMOR-SPELL>
			<TELL
"Praxix removed some earth essence and
cast it upon the stone before his feet. At once,
the earth began to shake, and Praxix slowly backed away. An instant
later, the roof of the cavern collapsed before him, knocking him off
his feet. ">
			<COND (<EQUAL? ,DARK-EVIL-LOC 1>
			       ;"Did two steps forward, one step back..."
			       <FIND-ESSENCE ,ESSENCE-WATER 2>
			       <FSET ,ESSENCE-WATER ,SCOUTED>
			       <FSET ,DARK-EVIL-CAVERN ,SOLVED>
			       <TELL
"Exhausted, he started to return when he noticed a strange rock-like substance
coursing through the cavern walls. \"Well, well,\" he said, pleased at his discovery,
\"Water essence!\" The cavern continued to shake, and he carefully removed as much of
the magical rock as he could before it became to dangerous to delay any further. ">)>
			<TELL "Carefully, he retreated to the ">
			<COND (<NOT ,PART-TWO>
			       <TELL "bottom of the ">)>
			<TELL "stairs, where we
were anxiously awaiting his return.">
			<COND (<NOT ,PART-TWO>
			       <TELL CR CR
"\"I believe we are safe, at least for the moment. ">
			       <COND (<FSET? ,MINAR ,DONT-DROP>
				      <TELL "Minar was right;
we are beset by dangers. ">)>
			       <TELL
"And now, I must rest.\" And with that, Praxix
lowered himself to the floor, and fell into a deep sleep.">)>
			<COND (<AND <IN-PARTY? ,ESHER> <NOT ,PART-TWO>>
			       <TELL CR CR
"\"He is a fine Wizard,\" Esher admitted, \"though he knows more than
he speaks.\"">)>
			<COND (<NOT ,PART-TWO>
			       <TELL CR CR
"It was now late, and we were all hungry and tired. I took out some
provisions and we ate a small meal before retiring for the night. We
woke early the next morning, well rested for another day in the
caverns.">
			       <NEXT-DAY>)>  
			<SCENE <>>
			<FSET ,HERE ,ENCHANTED>
			<COND (,PART-TWO
			       <TRAVEL-COMMANDS ,MINE-STAIR ,DOWN-COMMAND>
			       <MOVE-TO ,MINE-STAIR>)
			      (T
			       <TRAVEL-COMMANDS ,OUTSIDE-PRISON
						,BACK-COMMAND
						<COND (<AND <FSET? ,PRISON-RUNES
							      ,EXAMINED>
							    <NOT <FSET? ,PRISON ,SEEN>>>
						       ,ENTER-COMMAND)
						      (T
						       ,NUL-COMMAND)>>
			       <MOVE-TO ,STAIR-BOTTOM>)>
			<FSET ,HERE ,DANGEROUS>
			<RTRUE>)>
		 <COND (<EQUAL? .TMP 3>
			<TELL CR CR
"The core of the evil itself was upon Praxix, and it took all of
his strength to escape it. He fled back to the stairs, where he joined
with the rest of the party." CR CR>
			<TELL
"\"I cannot stop this thing,\" he said, breathlessly. \"We must flee
these halls!\"" CR CR>
			<SCENE <>>
			<COND (<IN-PARTY? ,HURTH>
			       <TELL "Hurth">)
			      (T
			       <TELL "Bergon">)>
			<TELL " shepherded us ">
			<COND (,PART-TWO
			       <TELL 
"down the stairs. \"It may be safer below, though
I fear we there is no safety in these halls anymore.\"" CR CR>
			       <MOVE-TO-2-W>)
			      (T
			       <TELL "up the stairs">
			       <COND (<IN-PARTY? ,HURTH>
				      <TELL ". \"I did not say so before, but
there is Dwarvish door here.\" And then, speaking a word of command,
an unseen door sealed off the stairs. \"We have long dreaded this day,
but we are not unprepared. The lower chambers are now sealed; I fear that
we shall never see them again.\" He held back tears as he guided us up
the stairs to a nearby landing.">)
				     (T
				      <HINT ,HINT-DARK-PRESENCE>
				      <TELL
" and to a nearby landing." CR CR>
				      <TELL
"\"We will not be safe at the lower levels,\" he said. \"Our best hope is
to leave these caverns through the High Gate. I pray the Dwarves are safe
from whatever it is that pursues us!\"">)>
			       <TELL CR CR
"From the landing, it was another four or five hours to the junction
of two stairs">
			       <COND (<NOT <FSET? ,STAIR-JUNCTION ,SEEN>>
				      <COND (<IN-PARTY? ,HURTH>
					     <TELL
". \"The stair to the left leads to the Tower of the Sunset;
the stair to the right leads to the High Gate,\" Hurth said. \"If
we intend to reach the Tower, we should start now. It is a much
longer climb.\"">)
					    (T
					     <TELL "; neither was marked.">)>)>
			       <REMOVE-TRAVEL-COMMAND ,STAIR-JUNCTION
						      ,DOWN-COMMAND>
			       <MOVE-TO ,STAIR-JUNCTION>)>)>
		 <RTRUE>)>)>
		 
<OBJECT PRISON-RUNES
	(SDESC "runes")
	(KBD %<ASCII !\R>)
	(LOC OUTSIDE-PRISON)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,PRAXIXBIT ,HURTHBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <CLEAR-EXBIT>
		 <FSET ,ACTION-OBJECT ,EXAMINED>
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL ACT
" examined the runes, but found he had no memory of such symbols.">)
		       (T
			<UPDATE-REMOVE ,PRISON-RUNES>
			<ADD-TRAVEL-COMMAND ,HERE ,ENTER-COMMAND>
			<TELL ACT
" glanced at the runes and said, \"The runes say 'prison'. And
now that I look more closely, I can see a door here as well.\" We tried
to find the door, but Hurth interrupted. \"It is a Dwarvish door;
you will not find it.\"">)>)>)>

<ROOM PRISON
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND NUL-COMMAND)
      (GRAPHIC G-PRISON)
      (CAST-LIMIT INF)
      (FLAGS UNDERGROUND ADVISE DANGEROUS)
      (TEMP 0)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<TELL
"Hurth approached the door and spoke a Dwarvish command of opening.
The massive door obliged without a sound, and we entered a large
vestibule; the door closed behind us, becoming invisible." CR CR>
		<TELL
"\"These Dwarvish doors take some getting used to!\" I said,
thinking of the gate through which we entered these caverns." CR CR>
		<TELL
"\"Do not be alarmed,\" said Hurth. \"Watch!\" Hurth called out a
command, but no door appeared. He laughed nervously, then called
out a few dozen more foreign words the last few of which sounded rather
more like expletives than commands." CR CR>
		<COND (<IN-PARTY? ,ESHER>
		       <TELL
"\"Well?\" Esher prompted, but Hurth was deep in thought. ">)>
		<TELL "Bergon,
trying his best to control his temper, paced to the center of the
vestibule, and looked down the dark corridors which led off to our
left and right.">>)
      (ACTION
       <ACOND ("AUX" TMP F)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>>
	       <CAST-FAR-VISION <>>
	       <PRISON-SOLVED>	       
	       <FSET ,HERE ,BLACK-MIX>
	       <GRAPHIC ,G-PRISON-FV>
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL CR CR
"\"Well, that was useful!\" Esher said, in his most sarcastic voice.
I was sure that Praxix would respond with some clever retort">)
		     (T
		      <TELL CR CR
"The ball of flame was soon out of sight, and nothing had been learned.
Praxix was about to make another suggestion">)>
	       <TELL ", when his
face became contorted with fear. \"Down!\" he shouted, pushing us to
the ground.">
	       <TELL CR CR
"\"What the...?\" started Bergon, catching sight of the ball of flame
that raced toward us. As it continued down the far corridor, we pulled
ourselves to our feet. \"It would seem,\" Praxix said blankly, wiping
the ">
	       <TELL-COLOR ,ESSENCE-FIRE ,ESSENCE-AIR>
	       <TELL
" residue from his fingers, \"that following these corridors will be a
tiring proposition!\"" CR CR>
	       <TELL
"Then, casting his gaze upward, he saw, in the dim afterglow of the
fireball, a narrow ledge not two dozen feet above us. \"I suggest we march
that way!\", he said, and raised his crooked forefinger toward the darkening
image.">)
	      (<AND <ACTION? SCOUT>
		    <NOT <FSET? ,HERE ,SOLVED>>>
	       <TELL ACT
" walked down the passage, turning a corner. A few minutes later, he
returned, reporting only that the passage did quite a lot of twisting
and turning. \"As to where it leads,\" he said, \"your guess is as good
as mine.\"">
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>)
	      (GET-ADVICE:REMOVE
	       <COND (<L? <GET-TEMP> 2>
		      <TELL
"We huddled among ourselves and agreed that it would be best to ">
		      <COND (<ZERO? .TMP> <TELL "explore">)
			    (T
			     <TELL "continue exploring">)>
		      <TELL " the caverns.">)
		     (<NOT <QSET? ,HERE ,EXAMINED>>
		      <TELL
"\"I don't think we're making much progress.\" I said, looking
at our familiar surroundings.">)>)
	      (<AND <ACTION? DROP>
		    <NOT <FSET? ,HERE ,SOLVED>>>
	       <UPDATE-MOVE ,ACTION-OBJECT ,HERE>
	       <FSET ,HERE ,DONT-DROP>
	       <TELL
"The caverns looked suspiciously like a maze of some kind to me,
so I surreptitiously dropped the " AO " on the ground to help
mark our location.">)
	      (PICK-UP
	       <TELL
"Reconsidering my decision to leave the " AO " on the ground, I bent
down and picked it up again, putting it back in my pack for safekeeping.">
	       <FCLEAR ,HERE ,DONT-DROP>
	       <UPDATE-MOVE ,ACTION-OBJECT ,INVENTORY>)
	      (UP:REMOVE
	       <TELL
"We looked up into the darkness, but could discern nothing. 'Up'
may have been our only alternative, as Praxix said, but getting there
would be another matter.">
	       <COND (<NOT <CHECK-ESSENCES ,LEVITATE-SPELL>>		      
		      <TELL
" Praxix pulled his pouch from inside of his cloak, and spoke dejectedly.
\"I haven't the essences to prepare an elevation spell. It would seem that we shall
be staying here indefinitely.">
		      <FORCE-PRISON-EXIT>)>
	       <RTRUE>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <COND (<NOT <FSET? ,HERE ,SOLVED>>
		      <TELL
"It may be that Praxix knew something we didn't, because he reached into
his cloak and started to put together one of his magical preparations.
Next thing I knew, ">
		      <TELL D ,ACTION-PRSI>
		      <TELL " was rising into the air! His ascent, exhilarating
as it was, was cut short as he bumped his head into the rock that lay
above us. A few moments later, he descended to the ground.">)
		     (<NOT <FSET? ,HERE ,BLACK-MIX>>
		      ;"Haven't used far vision yet..."
		      <TELL
"Praxix now drew some air and earth essences from his pouch and tried to levitate "
D ,ACTION-PRSI " to whatever lay above. But, sadly, we had no indication of where to
attempt this, and " D ,ACTION-PRSI " merely bumped his head into the prison's upper
regions and descended back to the ground. \"This will never work,\" Praxix said, \"I
haven't enough of my powders to map out the upper galleries this way.\"" CR CR>
		      <TELL
"\"And a good thing, too,\" " D ,ACTION-PRSI " said, rubbing the bruise on his head.">
		      <FORCE-PRISON-EXIT>)
		     (T
		      <TELL
"Praxix now drew some magical powder from his cloak, motioned " D ,ACTION-PRSI
" a few steps to his left, then cast the preparation onto him. He climbed into
the air, coming finally to a landing which he grabbed tightly onto
(for fear of going even higher!) Once the elevation spell had worn off, he released
his grip on the rock slab and pulled himself to his feet. Lowering the rope which
I had thrown up to him, ">
		      <COND (<IN? ,ROPE ,HERE>
			     <UPDATE-MOVE ,ROPE ,INVENTORY>)>
		      <TELL D ,ACTION-PRSI " brought the others up to the
landing where he stood." CR CR>
		      <MOVE-TO ,ORC-FORK
"At the landing was a passage, and this we followed until we came finally
to a fork; both left and right paths looked evil and foreboding. Perhaps it was
some illusion or trick of the eye, but the walls along the right-hand path seemed
to glow eerily.">)>)
	      (<OR <ACTION? PROCEED>
		   <ACTION? BACK>
		   <ACTION? LEFT>
		   <ACTION? RIGHT>>
	       <SET-TEMP <+ <SET TMP <GET-TEMP>> 1>>
	       <COND (<ZERO? .TMP>
		      <TELL
"It was pointless to remain here, so we started down the long and
winding corridor. I felt almost dizzy from the turning by the time
we arrived at another vestibule about five minutes later. It looked
much the same as the previous one; and the passage continued farther
into the darkness.">
		      <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND ,BACK-COMMAND>)
		     (<EQUAL? .TMP 1>
		      <TELL
"Again, we marched down the corridor, twisting and turning, turning
and twisting, and again coming to a vestibule, beyond which the
passage continued.">
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL
" \"Brother Hurth, do you think we are making any
progress?\" Esher asked. Hurth, embarrassed, did not respond.">)>)
		     (T
		      <TELL
"Once again, we marched through the passage, and once again we
arrived at a similar vestibule.">)>
	       <COND (<SET F <FIRST? ,HERE>>
		      ;"There is something on the ground here."
		      <TELL CR CR
"Just then, I noticed that the ">
		      <TELL D .F>
		      <TELL " I had dropped earlier was sitting on the
ground beside my feet! Excitedly, I replaced it in my pack and told the others
of my discovery.">
		      <UPDATE-MOVE .F ,INVENTORY>
		      <TELL CR CR
"Praxix shook his head slowly. \"As I had suspected - we are in a prison
after all.">
                      <COND (<CHECK-ESSENCES ,FAR-VISION-SPELL>
			     <TELL
" Perhaps this will shed more light on our predicament!\"" CR>
			     <PERFORM ,CAST-COMMAND ,FAR-VISION-SPELL>)
			    (T
			     <PRISON-SOLVED>
			     <TELL
" And it would appear that the only way to go is up!\"">)>)>
	       <RTRUE>)>)>

<ROUTINE FORCE-PRISON-EXIT ()
	 <TELL CR CR
"An hour or so later, hope of finding a way out fading, Hurth announced a rather
belated discovery. \"It is strange that I did not discover the runes earlier,\" he said,
\"but I believe I have found the exit mechanism. Stand back!\"" CR CR>
	 <TELL
"Indeed he had, and a moment later the invisible prison door winked open and we
hurried back outside.">
	 <UPDATE-REMOVE ,PRISON-RUNES>
	 <REMOVE-TRAVEL-COMMAND ,OUTSIDE-PRISON ,ENTER-COMMAND>
	 <FSET ,OUTSIDE-PRISON ,TRAPPED>
	 <MOVE-TO ,OUTSIDE-PRISON>>

<ROUTINE PRISON-SOLVED ()
	 <UPDATE-FCLEAR ,HERE ,ADVISE>
	 <FSET ,HERE ,SOLVED>
	 <TRAVEL-COMMANDS ,HERE ,UP-COMMAND>>

