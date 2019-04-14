"MINES for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT CAVERNS>

<COMMAND THIS-LEVEL>

<ROOM MINE-2-W
      (TRAVEL-COMMANDS THIS-LEVEL-COMMAND DOWN-COMMAND NUL-COMMAND)
      (GRAPHIC G-MID-STAIR)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (DOWN:REMOVE
	       <TELL
"Again, we started down these dismal stairs, but were soon met with
disappointment - the walls around the stairs had crumbled, completely
blocking our path." CR CR>
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"\"This bodes ill for us,\" said Hurth, \"if we are to reach the
lower regions.\"" CR CR>)>
	       <FSET ,HERE ,TRAPPED>
	       <TELL
"And so we trudged back up the stairs, finally reaching the landing
above.">) 
	      (THIS-LEVEL
	       <TELL
"We marched quickly down the path as it began a wide curve toward the right. 
Suddenly, ">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL "Hurth">)
		     (T
		      <TELL "Praxix">)>
	       <TELL ", who had taken the lead,
held us back. \"Orcs!\" he said in a harsh whisper, \"This is very bad.
They block the road that lies ahead, and there is no other path on this
level.\"">
	       <MOVE-TO ,MINE-1-W>)>)>

<ROOM MINE-1-W
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-VIEW)
      (FLAGS UNDERGROUND DANGEROUS)
      (ACTION
       <ACOND ()
	      (BACK:REMOVE
	       <TELL
"Bergon suggested that we retreat in search of a better route, but was
dissuaded by ">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL 
"Hurth. \"The principal route through this level heads to
the north up ahead; there is no point in turning back, lest we
foresake our purpose.\"">)
		     (T
		      <TELL
"Praxix. \"We have no choice, if we are to find the Stone, but to
find a path to the lower caverns.\"">)>)
	      (GET-ADVICE:REMOVE
	       <TELL
"Of the group, only Bergon felt strongly one way or the other. \"If we
go past the orcs, we may not have another chance to explore the area to
the north,\" he said.">)
	      (SCOUT:REMOVE
	       <TELL
"Thinking there might be an alternative way around the orcs, Bergon sent
Hurth to explore the area nearby. Soon, Hurth had found a small slit in
the rock and disappeared within it." CR CR>
	       <TELL
"Returning a short while later, he reported on the situation, drawing
a map in the dirt at our feet. \"We are here, on this east-west
path; the orcs are guarding the junction where a larger path, leading
north, crosses it. The slit I entered winds its way north and then
east, opening out on the northern path not far from the orcs' position.
There is at least a chance we could move that way without attracting their
attention.\"" CR CR>
	       <TELL
"Bergon stared at the crude map and was not convinced. \"There is also a
chance we may be seen crossing over to the slit itself,\" he added glumly.
\"But we must choose now: to head north, hoping to avoid the orcs altogether,
or to head east, somehow getting past the orcs that stand guard at the
junction.\"">
	       <ADD-TRAVEL-COMMAND ,HERE ,AROUND-ORCS-COMMAND>
	       <ADD-TRAVEL-COMMAND ,HERE ,PAST-ORCS-COMMAND>
	       <UPDATE-FSET ,HERE ,ADVISE>)
	      (PAST-ORCS
	       <TELL
"We decided to find a way through the orcs position, but were not quite
certain how that might be accomplished.">
	       <SCENE ,PRAXIX-DIVERSION>)
	      (AROUND-ORCS:REMOVE
	       <TELL
"One at a time, we ventured through the slit and thence out into
the northern passage. Creeping ever northward, we heaved a collective sigh
of relief as the path finally turned a corner, putting us out of sight of
the orcs. Not long afterward, the path forked to the left and the right. Down
the lefthand passage some muffled voices could be heard, and a dim glow
could be seen down the righthand passage.">
	       <FCLEAR ,HERE ,ADVISE>
	       <MOVE-TO ,NORTH-ORC-FORK>)>)>

<ROOM NORTH-ORC-FORK
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND BACK-COMMAND)
      (FLAGS UNDERGROUND DANGEROUS)
      (GRAPHIC G-ORC-FORK)
      (ACTION
       <ACOND ()
	      (LEFT:REMOVE
	       <TELL
"It didn't take long to learn that another, larger party of orcs was camped
down the lefthand path.">
	       <TELL CR CR
"\"We cannot face so many of these monsters,\" Bergon said, disappointed that
our narrow escape from the last party of orcs should lead instead to another
one.">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL CR CR
"\"It is all too clear that orcs now control this level of the caverns,\"
Hurth replied, glumly.">)>
	       <RTRUE>)
	      (RIGHT:REMOVE
	       <TELL
"The righthand path led to a gate fashioned with formidable iron bars. There
was no visible locking mechanism, and yet the door would not yield. Praxix was
the first to notice the series of dimly glowing runes that were carved into the
lintel.">
	       <MOVE-TO ,STRANGE-GATE>)
	      (BACK
	       <TELL
"Deeming discretion to be the better part of valor, we retraced our steps,
eventually finding the slit through which we had entered this northern passage.
It took some time, but we eluded the orcs yet again, and we safely arrived
back at our earlier position no better off than we had been before." CR CR>
	       <TELL
"\"If we are to get any farther in these caverns,\" Bergon said, \"then we
must find a way to get past those orcs.\"">
	       <MOVE-TO ,MINE-1-W>)>)>	      

<ROOM STRANGE-GATE
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (GRAPHIC G-STRANGE-GATE)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<FSET? ,GATE-RUNES ,SEEN>
		       <PRAXIX-SPEAK-COMMANDS>)>>)
      (EXIT FIXUP-PRAXIX-COMMANDS)
      (ACTION
       <ACOND ()
	      (BACK
	       <TELL
"With little hope of getting past the gate, we returned to the fork nearby.">
	       <MOVE-TO ,NORTH-ORC-FORK>)>)>

<OBJECT GATE-RUNES
	(SDESC "runes")
	(LOC STRANGE-GATE)
	(KBD %<ASCII !\R>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,HURTHBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <CLEAR-EXBIT>
		 <COND (<EQUAL? ,ACTOR ,HURTH>
			<TELL
"Hurth squinted at the runes, but they apparently did not register. \"They are
not Dwarvish,\" he said with finality.">)
		       (T
			<CLEAR-EXBIT ,GATE-RUNES ,HURTH>
			<COND (<NOT <QSET? ,GATE-RUNES ,SEEN>>
			       <TELL
"Praxix scratched his head with his staff and began staring dreamily at the
runes. \"I believe I know these runes,\" he began, \"though I cannot imagine how
they got here." CR CR>
			       <TELL
"Long ago, I came across a priceless copy of the only written dictionary of the
ancient Wizards' runic language. Naturally, I memorized it as best I could,
yet I never believed it would be of any value.\" He then read the words aloud
\"Lorem ara sequil hevant drai nons trivi azan-lam,\" he intoned." CR CR>
			       <TELL
"\"The words mean 'Please only say gate open to enter storage-room', or something near
to that. The runes for 'gate', 'door', and 'entrance' are very similar, and I can
never remember which is which - 'hevant', 'levant', or 'eivant'. The verb 'open' also
causes me some concern, because it might be 'drai' or 'adrei', depending on a
slight nuance of meaning. The word for 'enter' - it might be more general -
'access' or even 'entrance'. And 'storage room' is a literal translation, though
it might mean 'closet' or 'trove', I suppose. It doesn't matter, really, since the
meaning of the runes is quite clear.\"" CR CR>
			       <TELL
"Bergon shuddered at this litany of linguistical subterfuge. \"Are you quite
finished with your lecture?\" he asked. \"And, if so, would you mind very much
opening the gate?\"">
			       <ADD-TRAVEL-COMMAND ,HERE
						   ,REREAD-RUNES-COMMAND>
			       <PRAXIX-SPEAK-COMMANDS>)>)>)>)> 

<COMMAND (REREAD-RUNES REREAD) <> ()
	 <COND (<NOT <QSET? ,GATE-RUNES ,TRAPPED>>
		<TELL
"At our request, Praxix again read the runes aloud: \"Lorem ara sequil
hevant drai nons trivi azan-lam.\" And again, he translated the words as 'Please
only say gate open to enter storage-room.'" CR CR>
		<TELL
"\"Remember, though, that I'm not certain of the runes 'hevant' and 'drai'. They
might well be 'levant' or even 'eivant' in the case of 'hevant', and 'adrei' in
the case of 'drai'.\"" CR CR>
		<TELL
"\"You are certain you know this language?\" Bergon asked." CR CR>
		<TELL
"\"Let us say that I am certain of the runes, with the exceptions noted,\" came
Praxix' reply.">)
	       (T
		<TELL
"Yet again, Praxix read the runes aloud: \"Lorem ara sequil hevant drai nons
trivi azan-lam.\" And again, he reiterated his uncertainty about the runes for
'hevant' and 'drai'.">)>>

<ROUTINE PRAXIX-SPEAK-COMMANDS ()
	 <TRAVEL-COMMANDS ,PRAXIX
			  ,CAST-COMMAND
			  <COND (,MIX-DONE ,USE-MIX-COMMAND)
				(T ,MIX-COMMAND)>
			  ,SPEAK-COMMAND>>

<COMMAND (AROUND-ORCS AROUND)>
<COMMAND (PAST-ORCS PAST)>

<GLOBAL WIZSPEAK 0>

<COMMAND SPEAK <> ("AUX" WDS W1)
	 <COND (<READ-ELVISH ,PRAXIX>
		<SET WDS <GETB ,E-LEXV 1>>
		<SET W1 <GET ,E-LEXV 1>>
		<TELL "\"">
		<PRINTT ,E-TEMP ,E-TEMP-LEN>
		<TELL ",\" Praxix said, trying to sound like a Wizard of old. ">
		;<TELL "[Debug: ">
		;<TELL N .WDS " words. W?LOREM = " N ,W?LOREM ", W1 = " N .W1 "]">
		<COND (<AND <EQUAL? .WDS 1>
			    <EQUAL? .W1 ,W?LOREM>>
		       <TELL
"And then, a thin wind came up from behind us, and the door simply blew open.
But even though Praxix had done the highly improbable in deciphering and correctly
using the magical door, he was nonetheless disappointed. \"I should have studied
the language further,\" he said, \"I never knew that the runic language read from
right to left!\"" CR CR>
		       <TELL
"Once inside, we found small pouches of the magical essences of water,
air, and earth, pleasing Praxix greatly. \"We can never have enough of these
essences,\" he said." CR CR>
		       <TELL
"Convinced there was nothing further to be found inside the storeroom, we
returned to the nearby fork.">
		       <FSET ,STRANGE-GATE ,SOLVED>
		       <FIND-ESSENCE ,ESSENCE-WATER 3>
		       <FIND-ESSENCE ,ESSENCE-AIR 3>
		       <FIND-ESSENCE ,ESSENCE-EARTH 2>
		       <MOVE-TO ,NORTH-ORC-FORK>)
		      (T
		       <TELL
"But nothing happened, not the slightest movement.">
		       <COND (<G? <SETG WIZSPEAK <+ ,WIZSPEAK 1>> 4>
			      <SETG WIZSPEAK 0>
			      <FIXUP-PRAXIX-COMMANDS>
			      <REMOVE-TRAVEL-COMMAND ,HERE ,REREAD-RUNES-COMMAND>
			      <TELL CR CR
"\"I give up,\" Praxix said petulantly. \"It is clear that I know less than
I suppose about the Wizards' language. There is no use in wasting any more time
here.\"">)>
		       <RTRUE>)>)
	       (T
		<TELL
"Strangely, Praxix opened his mouth and appeared to speak, but nothing came out.
We stared at our Wizard friend with growing concern.">)>>

<OBJECT PRAXIX-DIVERSION
	(GRAPHIC G-PRAXIX-DIVERSION)
	(ACTION
	 <ACOND ("AUX" TMP)
		(SCENE-START
		 <TELL CR CR
"\"I've got an idea,\" Praxix whispered; he then dashed across to
the narrow passage, and was gone.">
		 <MAKE-SUBGROUP ,PRAXIX>
		 <UPDATE-REMOVE ,LIGHT-SPELL>
		 <MOVE-TO ,PRAXIX-DIVERSION-ROOM>)
		(SCENE-END
		 <CLEAR-SUBGROUP>
		 <UPDATE-MOVE ,LIGHT-SPELL ,ALWAYS-SPELLS>
		 <COND (<FSET? ,REAGENT ,SOLVED>
			<FIXUP-PRAXIX-COMMANDS>)
		       (T
			<TRAVEL-COMMANDS ,PRAXIX
					 ,CAST-COMMAND
					 ,EXAMINE-COMMAND>)>
		 <COND (<FSET? ,HERE ,ENCHANTED>
			<MOVE-TO ,ORC-JUNCTION>)
		       (<FSET? ,PRAXIX ,TRAPPED>
			<TELL CR CR>
			<FCLEAR ,PRAXIX ,TRAPPED>
			<TELL
"From our point of view, whatever Praxix had done was working
brilliantly. The orcs had fled, and we now gingerly entered the road
junction, expecting to find Praxix nearby. But of orcs and Praxix
there was none, and so we stood there, unsure of what to do next." CR CR>
			<TELL
"But we didn't have to wait long to find out, for the orcs were
soon rampaging back in our direction. \"Quickly! This way!\" Bergon
shouted, shepherding us down the passage that lay to the east." CR CR>
			<COND (<IN-PARTY? ,ESHER> <SET TMP ,ESHER>)
			      (<IN-PARTY? ,MINAR> <SET TMP ,MINAR>)
			      (T
			       <SET TMP ,HURTH>)>
			<TELL
"\"Wait!\" shouted " D .TMP ", \"There's Praxix!\" " D .TMP " pointed at
the Wizard who had apparently managed to sneak back through the
slit and was in danger of being cut off by the orcs before
he could reach us. And then, " D .TMP " charged at the oncoming orcs, giving
Praxix enough time to reach our side.">
			<COND (<NOT <EQUAL? .TMP ,HURTH>>
			       <TELL " But it was too late for " D .TMP ";
he was cut to pieces, and left for dead on the ground.">
			       <HINT ,HINT-DIVERSION>
			       <KILLED-OFF .TMP>)
			      (T
			       <TELL " Hurth fought brilliantly, and
was nearly cut to ribbons before arriving back at our sides.">)>
			<TELL CR CR
"With no time to lose, we sped down the eastern path. But any relief we
may have felt">
			<MOVE-TO ,MINE-1-E ,SHORT-LIVED-RELIEF>)
		       (T
			<MOVE-TO ,MINE-1-W>)>)>)>

<CONSTANT SHORT-LIVED-RELIEF
" was short-lived, as the wide path soon narrowed to the
point that we could march only in single file. Two sounds could clearly
be heard: the sound of rushing water from somewhere nearby, and far more
ominously, the pounding footfalls of approaching orcs.">

<OBJECT P-D-R-ORCS
	(LOC PRAXIX-DIVERSION-ROOM)
	(SDESC "orcs")
	(FLAGS DONT-TAKE DONT-EXAMINE)>

<ROOM PRAXIX-DIVERSION-ROOM
      (TRAVEL-COMMANDS RETURN-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT INF)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<TELL
" Following the tunnel to the main road leading north, Praxix peered around
the corner, spying the orcs nearby. The path was dark, but not perfectly so,
as the light from the orcs' torches flickered dimly on the rocky walls. It would
be difficult enough to surprise these orcs, so Praxix laid down his
glowing staff in the blackness of the tunnel and stepped out into the darkness.">>)
      (ACTION
       <ACOND ()
	      (<AND <FSET? ,HERE ,SCOUTED>
		    <NOT <GAME-COMMAND?>>>
	       ;"The orcs have been alerted."
	       <TELL
"It was only moments before the orcs were racing down the road
in Praxix' direction, howling their war-cries.">
	       <COND (<AND <ACTION? CAST> <OBJECT? LEVITATE-SPELL>>
		      <GRAPHIC ,G-CHARGING-ORCS-FROM-ABOVE>
		      <TELL " But Praxix had prepared his elevation
spell beforehand, and he rose into the air in time to marvel at the sight
of a dozen or so rampaging orcs charging down the halls beneath him. Descending
back to earth, Praxix brushed himself off, retrieved his staff, and nonchalantly
walked back to the junction." CR CR>
		      <TELL
"\"Come along, come along!\" he said, prodding us with his staff.
\"I expect they'll be back soon enough.\"">
		      <COND (<IN-PARTY? ,HURTH>
			     <TELL CR CR
"\"I am impressed,\" said Hurth, and so were we all.">)>
		      <FSET ,HERE ,ENCHANTED>)
		     (<OR <ACTION? CAST> <ACTION? USE-MIX> <ACTION? MIX>>
		      <FSET ,PRAXIX ,TRAPPED>
		      ;<GRAPHIC ,G-CHARGING-ORCS>
		      <TELL " \"Oh, dear. I wasn't expecting this,\"
Praxix said to himself as he hurriedly tried to ">
		      <COND (<ACTION? MIX>
			     <TELL "mix his enchantment.">)
			    (T
			     <TELL "cast his enchantment at
the oncoming orcs. It can truly be said that the orcs were startled by
the show of thaumaturgical skills, but this was not going to hold them
for long!">)>)
		     (<ACTION? RETURN>
		      <FSET ,PRAXIX ,TRAPPED>
		      ;<GRAPHIC ,G-CHARGING-ORCS>
		      <TELL " Now, it had been Praxix' idea to quickly
retreat to the narrow passage and thereby rejoin the group. In practice,
however, he was seen by the oncoming orcs, and rather than lead them back
toward our party, he withdrew farther into the northern path. The orcs
approached with weapons drawn and a fire in their eyes.">)> 
	       <SCENE <>>
	       <RTRUE>)
	      (CAST
	       <COND (<OBJECT? LEVITATE-SPELL>
		      <SAVE-SPELL>
		      <REMOVE ,HYE-DIVERSION>
		      <TELL
"As an experiment, he cast the elevation spell on himself, and rose
into the darkness. A moment later, he located the top of the passageway with
his skull. \"Oomph!\" he blurted out in a muffled sort of way that came
dangerously close to attracting the attention of the orcs. Biting his
lower lip and rubbing his head, he soon settled to the ground. \"Should do
nicely,\" he said to himself, and he brushed some crumbled rock off of his
cloak.">)
		     (<OR <OBJECT? FAR-VISION-SPELL>
			  <OBJECT? WIND-SPELL>
			  <OBJECT? TREMOR-SPELL>>
		      <RESTORE-SPELLS>
		      <TELL
"Praxix' plan was this: to create a diversion which would draw the entire
contingent of orcs in his direction, thereby allowing the group to
pass unseen through the junction. And so, taking the ">
		      <COND (<OBJECT? FAR-VISION-SPELL>
			     <TELL "essences of fire and air">)
			    (<OBJECT? TREMOR-SPELL>
			     <TELL "essence of earth">)
			    (T
			     <TELL "essence of air">)>
		      <TELL " from his pouch, he cast the enchantment." CR CR>
		      <TRAVEL-COMMANDS ,HERE ,RETURN-COMMAND>
		      <COND (<OBJECT? FAR-VISION-SPELL>
			     <TELL
"The ball of flame flew from his fingertips, and shot forward toward
the unsuspecting orcs, who reacted predictably by grabbing their
weapons and shouting in their guttural tongue. It was a good thing
that the fireball blinded">)
			    (<OBJECT? TREMOR-SPELL>
			     <TELL
"A great roar erupted from the earth, and the ground started to split
before him. The unsuspecting orcs were startled and frightened, and
were soon grabbing their weapons. It was lucky, though, that their
confusion distracted">)
			    (T
			     <TELL
"A cold gust of wind blew toward the unsuspecting orcs, who were very
nearly swept off their feet. It was a safe bet that their attention had
been grabbed; next it would be their weapons. Fortunately, the blowing
dust and wind distracted">)>
		      <TELL
" them enough to momentarily protect Praxix from their view.">
		      <FSET ,HERE ,SCOUTED>)>)
	      (RETURN:REMOVE
	       <COND (<NOT <FSET? ,HERE ,SCOUTED>>
		      <NEW-DEFAULT <PARTY-PCM ,PRAXIX> 1>
		      <TELL
"Sadly, though predictably, Praxix had forgotten his idea and prepared
to return to the group. Fortunately, he thought again. \"A spell,\"
he said to himself with some assurance, \"Yes, that's it. I
was going to cast a spell. Now which spell was it?\"">
		      <COND (<NOT <FIRST? ,ESSENCES>>
			     ;"Something's got to happen, so..."
			     <TELL CR CR
"But it didn't much matter, as Praxix had already run out of magical
essences. And then he had another thought - if only he could get the orcs
attention, then he might cause enough of a diversion to allow the others to
get past. And, having no magic to use, he chose a more mundane method: whistling.
This certainly had some effect, for the orcs were soon grabbing for
their weapons and preparing to charge at their as yet unseen enemy.">
			     <FSET ,HERE ,SCOUTED>)>
		      <RTRUE>)>)>)>

<ROOM ORC-JUNCTION
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"It was with great relief that we headed away from the junction. But the relief">
	       <TELL ,SHORT-LIVED-RELIEF CR CR>
	       <TELL
"\"I fear the orcs are somewhat more clever than we anticipated,\" Praxix
said, trying not to appear disturbed. \"Let us hope there is some escape
for us farther along the way.\"">
	       <MOVE-TO ,MINE-1-E>)>)>

<COMMAND JUMP>

<ROOM MINE-1-E
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-NARROW-SLIT)
      (FLAGS UNDERGROUND DANGEROUS)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <FSET? ,STRANGE-GATE ,SEEN>>
		       <HINT ,HINT-STRANGE-GATE>)
		      (<NOT <FSET? ,STRANGE-GATE ,SOLVED>>
		       <HINT ,HINT-GATE-RUNES>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"Ahead, the passage opened up into a wider hall, and we moved quickly
in anticipation of escape. But the hall ended blindly. All around,
the sound of water was nearly deafening, and moment by moment, the
dull thump of orc footsteps moved ever closer; it appeared that tragedy
was close at hand.">
	       <MOVE-TO ,ABOVE-FLUME>)
	      (<OR <ACTION? BACK>
		   <AND <ACTION? SCOUT>
			<NOT <QSET? ,HERE ,SCOUTED>>>>
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>
	       <REMOVE-PARTY-COMMAND ,BACK-COMMAND>
	       <COND (<ACTION? BACK>
		      <SETG ACTOR <FIRST-IN-PARTY ,HURTH ,ESHER ,PRAXIX>>)>
	       <TELL
"Rather than attempt to retrace our steps and fall into the hands of
the orcs, we sent " ACT " to quickly and quietly check out our rear.
Moments later, he returned. \"They are not far behind, but they
move more slowly and there is hope in that.\"" CR CR>
	       <TELL
"\"I fear there is another explanation,\" Praxix replied gloomily, and we
soon found out what he meant.">)>)>

<END-SEGMENT>

<BEGIN-SEGMENT MINES>

<COMMAND (ENTER-CLEFT ENTER)>

<ROOM MINER-PASSAGE
      (TRAVEL-COMMANDS ENTER-CLEFT-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-MINER-PASSAGE)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (ENTER-CLEFT
	       <MOVE ,ACTIVE-MINE-WALLS ,ACTIVE-MINE>
	       <MOVE-TO ,ACTIVE-MINE>)
	      (BACK
	       <TELL
"Unable to determine the cause of the tapping, and finding only a
dead-end passage here, we returned to the ">
	       <COND (<FSET? ,OLD-MINE ,SOLVED>
		      <MOVE-TO ,MINE-LOWER-STAIR "bottom of the stairs.">)
		     (T
		      <MOVE-TO ,MINE-JUNCTION "mine junction.">)>)>)>

;"A miner, 49er..."

<COMMAND ASK-MINER O-ASK-MINER ()
	 <TELL-TALE ,ACTION-OBJECT>
	 <RTRUE>>
	 
<OBJECT ASK-MINER-OBJECTS>

<OBJECT ASK-MINER-ROCKS
	(LOC ASK-MINER-OBJECTS)
	(SDESC "mine")
	(KBD %<ASCII !\M>)
	(TEXT
	 <EXECUTE ()
		  <UPDATE-MOVE ,RED-ROCK ,HERE>
		  <TELL
"\"So what exactly is it you're mining here?\" asked " ACT ", who
was trying to get a better look at the miner's sack." CR CR>
		  <TELL
"\"Lots of things,\" he said. \"The stuff of the earth, if you know what I
mean.\" He reached into his sack and pulled out a few large rocks. \"Now this
here is mostly gold, but I reckon you've seen that before. And this,\" he said,
holding up a shiny black stone, \"is obsidian - fetch a good price for that in
Zan, I figure.\"" CR CR>
		  <TELL
"He rummaged through his sack, dropping some small red rocks on the ground,
and announced, \"That's about it, so far anyway. But I've found silver,
platinum, even a couple of diamonds once! You never know what you'll find in
these walls!\"">>)>

<OBJECT ASK-MINER-ORCS
	(LOC ASK-MINER-OBJECTS)
	(SDESC "orcs")
	(KBD %<ASCII !\O>)
	(TEXT
	 <EXECUTE ()
		  <TELL ACT
" was curious about how the miner had managed to elude the orcs.
\"Could be I'm just a lucky fella,\" he started, chuckling. \"Oh, sure, there's
orcs around, and worse things too. But these orcs aren't very clever,
if you know what I mean. And I've got some ways of protecting myself
as well. What I'd like to know is how you've eluded them!\" And with
that, he laughed again.">>)>

<ROUTINE O-ASK-MINER ()
	 <FIND-OBJECTS ,ASK-MINER-OBJECTS>>

<OBJECT MINER
	(SDESC "miner")
	(KBD %<ASCII !\M>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL ACT
" wasn't the only one looking over this strange man, for we were ">
		 <COND (<EQUAL? ,PARTY-MAX 2> <TELL "both">)
		       (T
			<TELL "all">)>
		 <TELL " filled
with curiosity. He was a short man of middle age, and badly in need of a
shave and a bath. His dark complexion was more in keeping with a man
from the plains or the desert than an inhabitant of these caverns, yet he
acted completely at ease in his surroundings.">)>)>

<OBJECT MINER-SACK
	(SDESC "miner's sack")
	(8DESC "sack")
	(KBD %<ASCII !\S>)
	(EXBITS <+ ,PRAXIXBIT ,HURTHBIT>)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <TELL
"\"Whoa there, son!\" the miner said, as I reached for his sack. \"You
can just leave that right there, if you don't mind.\"">
		 <FSET ,ACTION-OBJECT ,DONT-TAKE>
		 <SETG UPDATE-FLAG T>)
		(EXAMINE:CLEAR
		 <TELL ACT
" tried to get a better look at the miner's sack, but the miner was
protecting it with his body. We could tell, however, that it was a
very sturdy sack, made of burlap, and it was about half full with
rocks of some kind.">)>)>

<OBJECT ACTIVE-MINE-WALLS
	(LOC ACTIVE-MINE)
	(FLAGS DONT-TAKE)
	(SDESC "walls")
	(KBD %<ASCII !\W>)
	(EXBITS <+ ,HURTHBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <COND (<NOT <FSET? ,HERE ,EXAMINED>>
			<SET-TEMP ,ACTOR>
			<TELL ACT
", looking over our surroundings, made a strange discovery." CR CR>
			<TELL
"\"Look over here,\" he said, indicating an area of recent excavation
in the walls. \"">
			<COND (<EQUAL? ,ACTOR ,ESHER ,PRAXIX>
			       <TELL
"Looks like somebody's been doing some digging....\"">)
			      (T
			       <TELL
"These marks come from this pick-axe, or I am no Dwarf,\" he said.">)>)
		       (T
			<COND (<EQUAL? ,ACTOR <GET-TEMP>>
			       <TELL "Once again">)
			      (<NOT <GET-TEMP>>
			       <TELL "Confused">)
			      (T
			       <TELL "This time">)>
			<TELL ", " ACT
" examined the chamber's walls, and found some ">
			<COND (<GET-TEMP> <TELL "more loose">)
			      (T <TELL "recently broken">)>
			<TELL " rock both within
the walls and on the ground nearby.">
			<MINER-APPEARS>)>)>)>

<ROUTINE MINER-APPEARS ()
	 <TELL CR CR
"\"What's going on here?\" ">
	 <TELL D <FIRST-IN-PARTY ,BERGON ,PRAXIX>>
	 <TELL " demanded of the empty room, and it
replied with a soft giggling sound that echoed through the chamber." CR CR>
	 <FSET ,ACTIVE-MINE-WALLS ,DONT-EXAMINE>
	 <UPDATE-MOVE ,MINER-SACK ,HERE>
	 <UPDATE-MOVE ,MINER ,HERE>
	 <FSET ,HERE ,SOLVED>
	 <COND (<IN-PARTY? ,BERGON>
		<TRAVEL-COMMANDS ,BERGON
				 ,GET-ADVICE-COMMAND
				 ,ASK-MINER-COMMAND>)
	       (T
		<CHANGE-TRAVEL-COMMAND ,PRAXIX
				       ,CAST-COMMAND
				       ,ASK-MINER-COMMAND>)>
	 <TELL
"We each spun around, but we were as alone as before. Just then,
the giggling turned to laughter, and before our eyes a grizzled man
appeared, holding a large sack. Rubbing the tears from his eyes, he looked
us over, and howled with laughter." CR CR>
	 <GRAPHIC <> ,G-MINER ,TOP-LEFT>
	 <TELL
"\"You are the sorriest lot I've ever seen,\" he said, restraining
himself from another bout of laughter. \"Tell me, are you folks lost
or just plain stupid?\" He wiped his nose and eyes with his right sleeve,
sniffled, and then just stood there in amused bewilderment.">>

<ROOM ACTIVE-MINE
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-ACTIVE-MINE)
      (FLAGS UNDERGROUND DANGEROUS DONT-SCOUT ENCLOSED)
      (TEMP 0)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <QSET? ,HERE ,SEEN>>
		       <TELL
"As quietly as we could, we squeezed our way through the cleft and
soon came upon a wide, circular chamber with no exit other than the
one through which we had entered." CR CR>
		       <TELL
"\"I would swear the tapping came from here,\" ">
		       <COND (<IN-PARTY? ,BERGON> <TELL "Bergon">)
			     (T <TELL "Praxix">)>
		       <TELL " said." CR CR>
		       <TELL
"\"And so would I. You don't think the pick-axe was working here on its
own?\" I asked.">)
		      (<NOT <QSET? ,HERE ,EXAMINED>>
		       <TELL
"Once again, we made our way through the cleft and into the circular
chamber. Once again, there was nobody there." CR CR>
		       <TELL
"\"Doesn't make a bit of sense,\" ">
		       <TELL D ,PRAXIX " said.">)>>)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? USE-MIX>
		    <EQUAL? ,ACTION-OBJECT ,MINER>>
	       <TELL
"Praxix cast the mixture at the miner but the effect was mainly that of
infuriating him." CR CR>
	       <TELL
"\"Now listen here,\" he said, wagging an arthritic finger at Praxix,
\"I ain't got time for none of that magical business, so if you are
done nosing around here, I'd appreciate some peace and quiet.\"" CR CR>
	       <MIXTURE-CAST>
	       <COND (<IN-PARTY? ,BERGON>
		      <TRAVEL-COMMANDS ,BERGON ,GET-ADVICE-COMMAND>)
		     (T
		      <CHANGE-TRAVEL-COMMAND ,PRAXIX
					     ,ASK-MINER-COMMAND
					     ,CAST-COMMAND>)>
	       <LEAVE-ACTIVE-MINE>)
	      (<AND <ACTION? ASK-MINER>
		    <NOT <QSET? ,HERE ,BUSY>>>
	       <TELL ACT
" started to ask the miner a question, but the miner interrupted.
\"Before I answer your questions, I've got one of my own,\" he said.
\"What are you doing in my mine?\"" CR CR>
	       <TELL ACT
" replied with a condensed version of the truth, as the miner
listened in scornful disbelief." CR CR>
	       <TELL
"\"Just plain stupid,\" was his conclusion; he spat on the ground and
continued, \"Go on, ask your questions and get out. I've got lots more
work to do!\"">)
	      (BACK
	       <COND (<NOT <FSET? ,HERE ,EXAMINED>>
		      <TELL
"Baffled, we snaked our way through the narrow passage, but no sooner
did we arrive back that the tapping started again." CR CR>
		      <TELL
"\"Spirits?\" I suggested, instinctively turning back toward the
darkened slit.">
		      <MOVE-TO ,MINER-PASSAGE>)
		     (T
		      <COND (<IN-PARTY? ,BERGON>
			     <TRAVEL-COMMANDS ,BERGON ,GET-ADVICE-COMMAND>)
			    (T
			     <CHANGE-TRAVEL-COMMAND ,PRAXIX
						    ,ASK-MINER-COMMAND
						    ,CAST-COMMAND>)>
		      <LEAVE-ACTIVE-MINE>)>)>)>

<ROUTINE LEAVE-ACTIVE-MINE ()
	 <COND (<IN? ,MINER ,HERE>
		<TELL
"We were filled with curiosity about this strange miner, and had many
questions to ask him, but we had now overstayed our welcome in
his mine. And so we said our good-byes and">
		<COND (<FSET? ,OLD-MINE ,SOLVED>
		       <REMOVE-TRAVEL-COMMAND ,MINE-LOWER-STAIR
					      ,LEFT-COMMAND>
		       <TELL
			", leaving the mines, returned to the bottom of the stairs.">
		       <MOVE-TO ,MINE-LOWER-STAIR>)
		      (T
		       <TRAVEL-COMMANDS ,MINE-JUNCTION
					,OLD-MINE-COMMAND
					,BACK-COMMAND>
		       <MOVE-TO ,MINE-JUNCTION
				" returned to the mine junction.">)>
		<COND (<IN? ,RED-ROCK ,INVENTORY>
		       <TELL CR CR
"\"Excellent, " TAG ", to have taken those red rocks,\" Praxix said, \"I
believe they are far more valuable than they appear. Keep them safe! I
shall tell you more when we are more at leisure.\"">)>
		<RTRUE>)
	       (T
		<TELL
"We returned to the entrance of the mine, utterly confused about the
meaning of the tapping sounds." CR CR>
		<TELL
		 "\"Do you believe in spirits?\" I asked Praxix." CR CR>
		<TELL
"\"Spirits, yes, but not spirits that go about rock mining in caverns.
There is another explanation, I am sure of that!\" he replied.">
		<REMOVE-TRAVEL-COMMAND ,MINE-JUNCTION
				       ,NEW-MINE-COMMAND>
		<MOVE-TO ,MINE-JUNCTION>)>>