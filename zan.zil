"ZAN for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT ZAN>

;"Start of Part III"

;"Assume at least Bergon, Praxix, Tag, and one other in party."

<GLOBAL ZAN-VICTIM 0>

<GLOBAL DEMON-SEARCHING? T>

<ROOM THREE-CONNECTOR
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT DANGEROUS)
      (ENTER
       <EXECUTE ()
		<REMOVE-ALL ,HURTH-STORIES>
		<REMOVE ,SPIRIT-STONE>
		<UPDATE-REMOVE ,SIXTH-STONE>
		<SETG SUBGROUP-MODE T>
		<COND (<G? ,RED-ROCK-COUNT 0>
		       <MOVE ,INVISIBLE-SPELL ,ALWAYS-SPELLS>)>
		<GRAPHIC ,G-ASTRIX>
		<TELL
"Astrix took the Two stones in his hand, and it seemed that they became
one, occupying the same space, and suffused with a brilliant white glow.
Peering into the glow, Astrix went into a trance. \"The Anvil,\" he said
in a breathless whisper, and collapsed to the ground, the Two separating
as they fell from his grasp; the glow dimmed, then went out. Soon, Astrix'
breath returned and he regained his composure." CR CR>
		<TELL
"\"I have seen it, felt it,\" he said, closing his eyes tightly and
drawing a deep breath. \"The Anvil shall be found near the place of its
creation at the dawning of our Age; on the Misty Isle, far to the south. This is
where your efforts lead - the end of your Journey, for good or ill.\"" CR CR>
		<TELL
"\"I have not heard of such an island,\" Praxix said, \"though I am not
unfamiliar with lore and legend.\"" CR CR>
		<TELL
"\"The legends of your lands, perhaps,\" Astrix replied. \"The Misty
Isle lies in the deep ocean, south of Zan, beyond the Twin Isles of
Estril and Lethor. The sailors of Zan know it well, or rather they know of
it. For it is shrouded in mist, and it is told that none who has
entered that mist has returned alive. But that is where the Anvil is to
be found, if indeed it can be found at all; it has a great power within it,
and that is our last hope against the scourge from the North.\"" CR CR>
		<TELL
"\"Rest here this night, and start fresh in the morning. The road to
Zan lies here,\" he continued, taking out a crude map, \"It should be no more
than a two-day march.\" He paused, as if unsure of how to say what
was to follow." CR CR>
		<TELL
"\"Word of your quest is in the air,\" he said darkly, \"Even the " ,BAD-GUY "
himself cannot be unaware of the uniting of the Six Stones. And this he has
long feared, for the Legend tells that Five, having gained the Six Stones, shall
find the Anvil, and claim it for their own. As long as your party of five are abroad
in the land, you cause the " ,BAD-GUY " great alarm. Take care - for the " ,BAD-GUY
" has eyes and ears everywhere, and it is said that Zan itself is in his thrall. Do not
tarry there; the sooner you reach the open seas, the better!\"">>)
      (EXIT
       <EXECUTE ()
		<SETG SUBGROUP-MODE <>>>) 
      (ACTION
       <ACOND ()
	      (PROCEED
	       <MOVE-TO ,ZAN-OUTSKIRTS>)>)>

<OBJECT DEMON-SHADOW
	(LOC ZAN-OUTSKIRTS)
	(SDESC "shadow")
	(FLAGS DONT-TAKE)
	(KBD %<ASCII !\S>)
	(EXBITS HURTHBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Of our party, Hurth's vision was the most acute, and Praxix asked him
to examine the shadow carefully." CR CR>
		 <TELL
"\"It is a great, black bird,\" Hurth said, twisting his head to follow
the rapidly moving form, \"and on its back a dark rider!\"" CR CR>
		 <TELL
"\"It searches for us,\" Praxix said glumly, \"and we are scarcely
protected from its view! I must think....\"">
		 <ADD-TRAVEL-COMMAND ,HERE ,HIDE-COMMAND>)>)> 

<ROUTINE ATTENTION-GETTER? ()
	 <OR <EQUAL? ,ACTION-OBJECT ,RAIN-SPELL ,LIGHTNING-SPELL>
	     <EQUAL? ,ACTION-OBJECT ,FAR-VISION-SPELL ,FIRE-SPELL>>>

<ROOM ZAN-OUTSKIRTS
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT DANGEROUS)
      (CAST-LIMIT 2)
      (ENTER
       <EXECUTE ()
		<TELL
"It was a simple matter to locate the southern route that led to Zan,
and by the afternoon of the second day we could see from afar the
port of Zan at the shore of the great ocean." CR CR>
		<GRAPHIC ,G-ZAN-DEMON>
		<TELL
"As we descended through the open plains that led to the sea, it seemed
that a cloud had passed before the sun, and the land was cast in shadow.
But this was no cloud, but rather the form of some large
creature that came from the north, spinning and diving through the sky
like some bird of prey looking for its next meal." CR CR>
		<TELL
"\"The great white bird,\" I said, thinking back to the graceful form
we had seen as we descended from the high plain to the mountain lake.
\"The one sent by Astrix to follow our progress!\"" CR CR>
		<TELL
"But Praxix was concerned. \"You may be right,\" he said, \"but there
are other creatures that roam the skies, and not all are friends of
ours.\"">>)
      (ACTION
       <ACOND ("AUX" SP)
	      (HIDE:REMOVE
	       <TELL
"A hiding place was nowhere to be found in this open plain, and all eyes
turned to Praxix. A seeming eternity passed before he spoke." CR CR>
	       <TELL
"\"None of my spells will protect us, but...\" He paused again, tapping his
head with his staff as if trying to unjam some piece of mental machinery.
\"Now that I think of it, I can recall that one combination of essences
produces a kind of fog or mist. All I need do is figure out which two...\""
CR CR>
	       <COND (<G? <COUNT ,ESSENCES> 1>
		      ;"Have at least two essences..."
		      <TELL
"The dark shadow lengthened as we breathlessly awaited the results of
Praxix' magic.">
		      <FSET ,HERE ,SEEN>
		      <OPTION ,PRAXIX ,MIX-COMMAND>)
		     (T
		      <TELL
"Praxix now removed his pouch, but discovered that he didn't have enough
essences to make any mixture whatever.">)>)
	      (<AND <ACTION? CAST>
		    <NOT <FSET? ,HERE ,SEEN>>
		    <NOT <QSET? ,HERE ,TRIED>>
		    <ATTENTION-GETTER?>>
	       <TELL
"Praxix, flustered by the approach of this demon of darkness, tried
casting his \"" AO "\" spell, but this had the disastrous effect of
bringing attention to our party and its location." CR CR>
	       <DEMON-KILLS-AT-OUTSKIRTS>)
	      (<AND <ACTION? CAST>
		    <OBJECT? INVISIBLE-SPELL>>
	       <TELL
"\"Why not use the red rocks for invisibility,\" I said, thinking I had
come up with a solution to our predicament." CR CR>
	       <TELL
"\"We have barely enough to make one person invisible,\" Praxix replied,
\"and that would scarcely protect the rest of us. No, I must think of
something else.\"">) 
	      (PROCEED
	       <COND (,DEMON-VICTIM
		      <TELL
"With heavy hearts, we pressed onward">)
		     (<NOT <FSET? ,HERE ,TRAPPED>>
		      <FSET ,HERE ,SEEN>
		      <TELL
"Ignoring the shadow that grew ever closer, we continued down the path
leading to the sea. But after only a few short moments, the sky again
darkened and we watched in horror as the shadow dove at our party." CR CR>
		      <DEMON-KILLS-AT-OUTSKIRTS>
		      <HINT ,HINT-DKAO>
		      <RTRUE>)
		     (T
		      <TELL
"The fog had now completely cleared, and we could see no trace of the dark
shadow. We pressed onward">)>
	       <TELL
", all the time aware that dark and ominous clouds had been building above
us all afternoon. Rain threatened at any moment, and then
it came, heralded by the booming of thunder and the pungent smell of
a nearby lightning strike. Soon, we were in the midst of a downpour, and we
hustled for cover into a nearby shallow cave." CR CR>
	       <GRAPHIC ,G-ZAN-CAVE>
	       <TELL
"\"We should be safe enough here,\" Bergon said, removing his flooded
boots." CR CR>
	       <TELL
"\"Yes, well, safe enough, I suppose,\" a voice that was not one of our
own replied. \"What I mean is, we're safer than out there, but as to whether
or not we are truly safe....\" He paused in his monologue, interrupted by some
passing thought, and then attempted to finish his sentence. \"Now what was
I saying?\" he said." CR CR>
	       <TELL
"From within our ranks came an unmistakable groan, and this
brought a cry of recognition from the stranger." CR CR>
	       <TELL
"\"Ah, Praxix,\" he said, pulling back his cloak and moving toward us from
the dark recesses of the cave. \"Imagine that! We meet yet again!\"" CR CR>
	       <TELL
"It was Umber, and he was at his most cheerful, happily telling of his
exploits since we had last met. About an hour into his story, the storm
abated and the sky brightened, but Umber did not seem to notice, or in
any event, gave no indication of a desire to leave the cave.">
		<MOVE-TO ,ZAN-CAVE>)
	      (<AND <ACTION? MIX>
		    ,DEMON-SEARCHING?
		    <FSET? ,HERE ,SEEN>
		    <NOT <QSET? ,HERE ,TRAPPED>>>
	       <TELL
"Praxix came to a quick decision, mixing equal parts of " AO " and "
D ,ACTION-PRSI "; then he cast the mixture into the sky." CR CR>
	       <SET SP <GET <GETPT ,ACTION-OBJECT ,P?MIX-SPELL>
			    <GETP ,ACTION-PRSI ,P?TEMP>>>
	       <USE-ESSENCES .SP>
	       <COND (<EQUAL? .SP ,FOG-SPELL>
		      <GRAPHIC ,G-FOG-CLEARS>
		      ;<MOVE ,FOG-SPELL ,ALWAYS-SPELLS>
		      <TELL
"From nowhere, a dense fog formed, engulfing our party and the
surrounding terrain in a heavy shroud of moisture. Yet even then
we could sense the shadow as it passed above us, circled overhead,
and departed to the south.">)
		     (T
		      <GRAPHIC ,G-DEMON>
		      <HINT ,HINT-FOG>
		      <SETG DEMON-SEARCHING? <>>
		      <TELL
"But Praxix mixed the wrong powders, producing ">
		      <COND (<EQUAL? .SP ,MUD-SPELL>
			     <TELL "what appeared to be the most useless
of all possible spells - Mud">)
			    (T
			     <TELL "the \"" D .SP "\" spell instead of fog">)>
		      <TELL
". Discouraged, we attempted to hide from the shadow as best we
could, but to no avail." CR CR>
		      <DEMON-KILLS-AT-OUTSKIRTS>)>
	       <FSET ,HERE ,DONT-CAST>
	       <UPDATE-FCLEAR ,HERE ,DANGEROUS>
	       <END-OPTION>)>)>

<CONSTANT DEMON-DESC
"It was a huge black bird, hideous and foul, and reeking with a
noisome stench. On its back rode a man who, in form at least,
appeared to be a Wizard, though his face was masked completely by
his flowing black hood. Around his neck hung a large, silver locket,
suspended on a silver chain.">

<ROUTINE DEMON-KILLS-AT-OUTSKIRTS ()
	 <SETG DEMON-SEARCHING? <>>
	 <REMOVE-TRAVEL-COMMAND ,HERE ,HIDE-COMMAND>
	 <SETG DEMON-VICTIM
	       <FIRST-IN-PARTY ,HURTH ,ESHER>>
	 <TELL
"Black as the darkest caverns, it hovered, formless, in the sky above
us. And then, with a terrifying scream, it dove down upon us, landing on the
ground before us." CR CR>
	 <TELL ,DEMON-DESC CR CR>
	 <TELL
"Praxix, whose pouch of magical essences was already at hand, was attempting
to prepare some spell that would foil this demon, but it was now too
late." CR CR>
	 <TELL
"\"Fool!\" the demon boomed, and from his fingertips shot a bolt of
red-hot flame that knocked Praxix to the ground, unconscious. \"I have no
time for parlor magicians,\" he said mockingly." CR CR>
	 <TELL
"\"We know who you are, and we know what you are,\" the demon continued,
\"but you will be needing a lesson in manners. Now who shall receive this
lesson?\"" CR CR>
	 <TELL
"\"Praxix will not do,\" the demon spat, \"I would not waste my energies
on one so defenseless. No, I believe the honor should go to " D ,DEMON-VICTIM
".\"" CR CR>
	 <TELL
"And then, the demon stretched out his arm, hand open, at " D ,DEMON-VICTIM
" and, as he slowly closed his hand, it seemed that " D ,DEMON-VICTIM " was
being squeezed mercilessly; he screamed in agony as the demon's fist closed
ever tighter. Moments later, he was dead, crushed by this awful monster
from Hell." CR CR>
	 <TELL
"\"The same fate, or worse, awaits all those who seek to defy the " ,BAD-GUY
". This is but a taste of what is to follow.\" Then, he swung his arm to his
side and opened his clenched fist; " D ,DEMON-VICTIM "'s body was flung into
the sky and out of sight." CR CR>
	 <TELL
"And then, mounting the awful creature that had borne him here, he flew off
into the distant north. Praxix now rose, albeit unsteadily, and Bergon took
upon himself the unpleasant task of relating what had happened.">
	 ;<GRAPHIC ,G-DEMON ,G-DEMON-KILLS-SOMEONE ,TOP-LEFT>
	 <PARTY-REMOVE ,DEMON-VICTIM>>

;"New scene - storm, worms, Umber, dark reagent..."

<COMMAND LEAVE>

<COMMAND (ASK-UMBER ASK+UMBER) O-ASK-UMBER>

<ROUTINE O-ASK-UMBER ()
	 <FIND-OBJECTS ,ASK-UMBER-OBJECTS>>
       
<OBJECT ASK-UMBER-OBJECTS>

<OBJECT ASK-UMBER-MUDWARGS
	(SDESC "mudwargs")
	(LOC ASK-UMBER-OBJECTS)
	(KBD %<ASCII !\M>)
	(ACTION
	 <EXECUTE ()
		  <TELL
"\"Mudwargs?\" Bergon asked." CR CR>
		  <TELL
"\"Ah, I see your point,\" Umber replied. \"You're not from here, so you and
the mudwargs are not well acquainted. Well, to be honest, I don't know much
about them myself, except that they live underground and feed during the
day when the ground is flooded. You'll never see one at night, which is
just fine with me, but during the daytime they can be quite trying.\"">
		  <FSET ,ASK-UMBER-MUDWARGS ,SEEN>
		  <UPDATE-REMOVE ,ASK-UMBER-MUDWARGS>>)> 

<OBJECT UMBER-SACK
	(SDESC "Umber's sack")
	(8DESC "sack")
	(KBD %<ASCII !\S>)
	(KBD2 %<ASCII !\U>)
	(FLAGS DONT-TAKE)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <COND (<IN? ,REAGENT ,REAGENTS>
			<MOVE ,BLUE-REAGENT ,REAGENTS>
			<PUT ,ESSENCE-OBJECT-TBL ,BLUEOFF ,BLUE-REAGENT>
			<REMOVE ,REAGENT>)>
		 <MOVE ,BLACK-REAGENT ,REAGENTS> 
		 <FSET ,BLACK-REAGENT ,SEEN>
		 <TELL
"Umber was now snoring loudly and Praxix decided to find out what Umber
was carrying in his sack. It turned out that it contained only a few
stones, presumably from the trove in the castle's dungeons, as well
as a single, large, multifaceted black stone that crumbled to the same
consistency as that of Praxix' magical reagents. Carefully, Praxix broke
off a piece of the stone, crushed it into a powder, and placed it among his own.">)>)>

<ROOM ZAN-CAVE
      (TRAVEL-COMMANDS LEAVE-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT ADVISE DANGEROUS)
      (CAST-LIMIT INF)
      (ENTER
       <EXECUTE ()
		<OPTION ,LEADER ,LEAVE-COMMAND ,STAY-COMMAND>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"\"What do you propose that we do?\" Bergon asked Umber, who was
now preparing some crude bedding on the ground." CR CR>
	       <TELL
"\"Sit tight, that's my advice,\" he replied all too cheerfully. \"They'll
be gone by nighttime. Don't much like the dark, you know.\"" CR CR>
	       <TELL
"\"We haven't the luxury of that option,\" Bergon said. \"We must reach
Zan this evening.\"" CR CR>
	       <TELL
"\"Ah,\" he replied, \"That will pose something of a problem.\" And with that,
he curled up into a ball and fell into a deep sleep.">
	       <TRAVEL-COMMANDS ,BERGON ,GET-ADVICE-COMMAND>
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <UPDATE-MOVE ,UMBER-SACK ,HERE>)
	      (<AND <ACTION? CAST>
		    <OBJECT? INVISIBLE-SPELL>>
	       <SAVE-SPELL>
	       <TELL
"Then, Praxix suggested using some of the red rock to make an invisibility
spell. But even if this could have helped, he hadn't nearly enough to use on
our entire party." CR CR>
	       <TELL
"\"No, I must think of something else,\" Praxix said.">)
	      (LEAVE
	       <COND (<NOT <QSET? ,HERE ,BLUE-MIX>>
		      <TELL
"Trying to be as polite as possible, we told Umber of our eagerness to
reach Zan by this evening, and excused ourselves. The air was warm, and
the sky mostly clear, but large puddles of water covered our path." CR CR>
		      <TELL
"We had not taken a dozen steps when I stepped into a puddle and
felt something squirming beneath my feet. As it wrapped itself around
my ankles, I let out a terrified scream and ran back toward the cave with
the rest of our party at my heels." CR CR>
		      <TELL
"\"Ah, now I remember,\" Umber said as we hurried into the cave,">
		      <MUDWARG-TELL>
		      <END-OPTION>)
		     (T
		      <TRAVEL-COMMANDS ,BERGON ,GET-ADVICE-COMMAND>
		      <COND (,DARKNESS-CAST?
			     <TELL
"Using Praxix' staff as a cloak of darkness, we marched down the soggy path.
The earth was unnaturally still as we trudged through the mudwarg infested
pools.">
			     <COND (<FSET? ,ASK-UMBER-MUDWARGS ,SEEN>
				    <TELL
" But Umber had been right, or so it seemed - the mudwargs had no
taste for those that travelled in darkness.">)>
			     <TELL CR CR
"Praxix now spoke, and his voice was filled with dread. \"I have
been thinking about our friend, Umber,\" he began, \"and I cannot
fathom how it is that he slept through our experiment">
			     <COND (<G? ,BLACK-COUNT 1> <TELL "s">)>
			     <TELL " with the black
powder.\"" CR CR>
			     <TELL
"\"He's a good sleeper?\" I tried, thinking it was just barely
possible." CR CR>
			     <TELL
"\"Perhaps,\" Praxix replied. \"But I wonder how it is that Umber possessed
the black reagent, and how conveniently it was placed at our disposal.\"
A deathly chill ran through me as Praxix went on. \"Umber is not what he
would appear, and I can only guess at his purpose.\"">)
			    (T
			     <SETG ZAN-VICTIM
				   <FIRST-IN-PARTY ,MINAR ,HURTH ,ESHER>>
			     <TELL
"Seeing no alternative, we attempted to make our way through the mudwarg
infested pools that lay along our path. It appeared we would come through
our ordeal unscathed, when " D ,ZAN-VICTIM " let out a horrific scream.
Two mudwargs had grabbed onto his ankles, pulling him to the ground.
Another was there instantly, wrapping itself around his torso and neck.
Before we could react, the three slithered into the earth, dragging
our friend along with them." CR CR>
			     <PARTY-REMOVE ,ZAN-VICTIM>
			     <SETG DEMON-SEARCHING? <>>
			     <HINT ,HINT-MUDWARGS>
			     <TELL
"\"There is nothing we can do here,\" Praxix said, urging us onward. It
sounded callous, but it was not - this was no time to mourn, and we simply
had no choice but to continue down the road, which we did without further
incident.">)>
		      <TELL CR CR
"It was nearly twilight when we reached the outskirts of Zan. Many homes were
scattered in the hillsides that surrounded this busy port, but the main thoroughfare
was nearly deserted. As we approached the center of town, two shops loomed before
us: a curio shop and the local emporium.">
		      <SETG ZAN-VICTIM <FIRST-IN-PARTY ,MINAR ,HURTH ,ESHER>>
		      <MOVE-TO ,ZAN-1>)>)
	      (STAY
	       <TELL
"\"Ah, now I remember,\" Umber said, finishing his earlier, misplaced
thought.">
	       <FSET ,HERE ,BLUE-MIX>
	       <MUDWARG-TELL>
	       <END-OPTION>)
	      (<AND <ACTION? USE-MIX>
		    <EQUAL? ,MIX-REAGENT ,BLACK-REAGENT>>
	       <COND (<EQUAL? ,MIXTURE ,DARKNESS-SPELL>
		      <SETG DARKNESS-CAST? T>
		      <FCLEAR ,PRAXIX ,LIT>
		      <TELL
"Praxix carefully applied a small bit of the mixture to the staff, and we
watched in amazement as it began to glow (if that's the word) black. And
then the blackness spread until we were are bathed in an eerie darkness
that emanated from within the enchanted staff.">)
		     (<EQUAL? ,MIXTURE ,COLD-SPELL>
		      <SETG DARKNESS-CAST? <>>
		      <FCLEAR ,DARKNESS-SPELL ,SEEN>
		      <TELL
"As Praxix cast the mixture upon the staff, the air became still and the
cave became cold. A chill came over us all, and Praxix excitedly pointed
at the tip of the staff itself - it was frosted over with a deep blue
ice.">) 
		     (<EQUAL? ,MIXTURE ,ILLNESS-SPELL>
		      <TELL
"Praxix placed a small measure of his mixture upon the staff, but there
was no obvious effect. A moment later, I felt somewhat faint and kneeled
on the ground, barely able to stand." CR CR>
		      <TELL
"\"You, too,\" said Bergon, who was clutching the rock walls of the
cave.">)
		     (T
		      <TELL
"No sooner did Praxix place the mixture on his staff than a wave of
despair, greater than any I have ever known, came over me. Bergon
fell to his knees and began to weep; the others, too, were overcome
with the same dark feelings of hopelessness and doom. The feeling
soon passed, but the memory lingers to this day.">)>
	       <SETG BLACK-COUNT <+ ,BLACK-COUNT 1>> 
	       <COND (<EQUAL? ,BLACK-COUNT 1>
		      <TELL CR CR
"\"I have a bad feeling for the black powder,\" Bergon said, \"and
for the magic it contains.\" But Praxix was deep in thought, and said
nothing.">)
		     (<EQUAL? ,BLACK-COUNT 2>
		      <TELL CR CR
"\"Bergon is right about the black reagent,\" Praxix said sternly.
\"It is dangerous, and contains the essence of some evil thing of
which I know nothing.\"">)
		     (<EQUAL? ,BLACK-COUNT 3>
		      <TELL CR CR
"\"Each mixture produces yet another dismal effect,\" Praxix said,
\"I fear to know where this unnatural thing is from and by what means
it was brought into the world.\"">)>
	       <MIXTURE-CAST>)>)> 

<GLOBAL DARKNESS-CAST? <>>

<GLOBAL BLACK-COUNT 0>

<ROUTINE MUDWARG-TELL ()
	 <TELL
" \"I was about to tell you why it is safer in here.\" He motioned us to gather
around him, and then, in a conspiratorial voice, he whispered a single word,
'mudwargs,' and shook his head knowingly.">
	 <TRAVEL-COMMANDS ,BERGON ,GET-ADVICE-COMMAND ,ASK-UMBER-COMMAND>>

;"The town of Zan"

<OBJECT ZAN-1-CURIO-SHOP
	(LOC ZAN-1)
	(SDESC "curio shop")
	(8DESC "curios")
	(KBD %<ASCII !\C>)
	(FLAGS DONT-TAKE DONT-CAST)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"The curio shop's window was filled with a seemingly arbitrary assortment
of items; the light inside was still on, and the proprietor could still
be seen inside, straightening things up.">
		 <COND (<EQUAL? ,ACTOR ,PRAXIX ,ESHER>
			<TELL CR CR
"\"Reminds me of Webba's shop, back in Lavos,\" " ACT " remarked. I had
been thinking much the same thing." CR CR>
			<TELL
"\"Quite a nice fellow,\" I said, \"Webba, I mean.\"">)>
		 <RTRUE>)>)>

<OBJECT ZAN-1-GENERAL-STORE
	(LOC ZAN-1)
	(SDESC "emporium")
	(KBD %<ASCII !\E>)
	(FLAGS DONT-TAKE DONT-CAST)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"From all appearances, the emporium was closed for the night." CR CR>
		 <TELL
"\"An exciting place,\" commented " ACT>
		 <COND (<NOT <FSET? ,CURIO-SHOP ,SEEN>>
			<TELL ", \"Let's hope something around here is open.\"">)
		       (T
			<TELL ".">)>)>)>

<COMMAND (CURIO-SHOP CURIO+SHOP)>
<COMMAND EMPORIUM>

<ROOM ZAN-1
      (TRAVEL-COMMANDS PROCEED-COMMAND CURIO-SHOP-COMMAND
       		       EMPORIUM-COMMAND)
      (GRAPHIC G-ZAN)
      (ENTER GOOD-CAPTAIN-SETUP)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>>
	       <SAVE-SPELL>
	       <TELL
"Rather than make a public spectacle of ourselves, we convinced Praxix not to
use his flare spell right here in the middle of town.">)
	      (SCOUT:REMOVE
	       <TELL
"Moving swiftly ahead, " ACT " had gotten a feel for the layout of
town." CR CR>
	       <TELL
"\"There is the main street here,\" he said, \"and the wharf at the end of
the road. Otherwise, I can see only some scattered homes and shanties.\"">)
	      (PROCEED
	       <TELL
"Nighttime was approaching as we continued down the main thoroughfare
and into the more central part of town. A tavern and an inn lay on either
side of the road, and the wharf could now be seen a short distance
beyond.">
	       <MOVE-TO ,ZAN-2>)
	      (CURIO-SHOP:REMOVE
	       <TELL
"We entered the curio shop, just as the proprietor was preparing to
close up for the night. Squinting, he eyed each of us in turn, and
evidently did not like what he saw." CR CR>
	       <TELL
"\"I'm closing up now,\" he said in a decidedly unfriendly
tone, \"If you must, have yourselves a quick look around.\"">
	       <MOVE-TO ,CURIO-SHOP>)
	      (EMPORIUM:REMOVE
	       <TELL
"We approached the emporium, but it had already closed for the
evening." CR CR>
	       <TELL
"\"It is later than I had thought,\" Bergon said, \"Let us hope the
tavern doesn't keep the same hours.\"">)>)>

<OBJECT ZAN-2-TAVERN
	(LOC ZAN-2)
	(SDESC "tavern")
	(KBD %<ASCII !\T>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,ESHERBIT ,HURTHBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <COND (<EQUAL? ,ACTOR ,ESHER>
			<TELL
"\"A lovely name for a tavern!\" " ACT " said, pointing at the signpost
which colorfully depicted its name, \"Stormy Seas.\"">)
		       (T
			<TELL
"\"I have never been at a tavern,\" Hurth said, looking at the signpost
hanging above the entrance, \"but the name, Stormy Seas, is not very
appetizing.\"">)>
		 <TELL CR CR
"But name to the contrary, and excusing the loud voices and smoke which
emanated from the door, it still seemed a reasonable spot for dinner.">)>)>

<OBJECT ZAN-2-INN
	(LOC ZAN-2)
	(SDESC "inn")
	(KBD %<ASCII !\I>)
	(FLAGS DONT-TAKE)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(<AND <ACTION? CAST>
		      <OBJECT? FAR-VISION-SPELL>>
		 <SAVE-SPELL>
		 <TELL
"Rather than make a public spectacle of ourselves, we convinced Praxix not to
use his flare spell right here in the middle of town.">)
		(EXAMINE:REMOVE
		 <TELL
"Above the inn, a sign hung on a rusted chain. In the soft evening
breeze, it made a loud squealing sound as it swung to and fro. Painted
on the sign were the words, \"Rest Easy,\" nothing more." CR CR>
		 <TELL
"\"A pleasant enough thought,\" " ACT " said, watching the almost
hypnotic movement, \"and it is getting rather late.\"">)>)>

<CONSTANT COMFORTABLE-SPOT
" a comfortable spot ouside
of town to pitch our tents. The offshore breeze kept the air comfortably
cool, and we were fast asleep within minutes.">

<COMMAND TAVERN>
<COMMAND INN>
<COMMAND WHARF>

<ROOM ZAN-2
      (TRAVEL-COMMANDS TAVERN-COMMAND INN-COMMAND WHARF-COMMAND
       		       BACK-COMMAND)
      (GRAPHIC G-ZAN)
      (FLAGS DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"Although there were two choices of how to spend the night, we all looked forward
to a night of comfort at the inn.">
	       <COND (,INN-TALK
		      <TELL CR CR
"Bergon, however, urged caution. \"" TAG " heard the men at the tavern
talking about the inn and some task that they had to perform. I do
not believe these were chambermaids, and I am loath to spend the night
there and find out just what their task is." CR CR>
		      <TELL
"Praxix agreed. \"Perhaps it would be best for us to camp out this
night.\"">)>
	       <RTRUE>) 
	      (BACK
	       <CHANGE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND ,CAMP-OUT-COMMAND>
	       <TELL
"We started to backtrack to the shops, but this turned out not to be an alternative;
they were closed now, and their lights darkened. Only the tavern and inn remained open,
though there was some activity also before us, at the wharf.">)
	      (WHARF:REMOVE
	       <CHANGE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND ,CAMP-OUT-COMMAND>
	       <TELL
"Although it was dark, the wharf was brightly lit. There were over a
dozen piers in varying stages of decay, and a handful of boats were moored
at each. On some, the captain could be seen, giving orders to deckhands; others
were deserted." CR CR>
	       <TELL
"Bergon drew a deep breath of ocean spray and said, \"Did I ever finish
telling you about my fishing days at Lendros?\"" CR CR>
	       <TELL
"The group gave out a single groan, which persuaded Bergon to change the
subject. \"Let us check out the boats,\" he said.">   
	       <MOVE-TO ,WHARF>)
	      (TAVERN:REMOVE
	       <CHANGE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND ,CAMP-OUT-COMMAND>
	       <REMOVE ,ZAN-2-TAVERN>
	       <TELL
"It was time for dinner, and it had been a long time since we had sat down
to a meal." CR CR>
	       <TELL
"\"Shall we?\" I asked, bowing and motioning to the entrance." CR CR>
	       <TELL
"\"How can we refuse?\" said Bergon, smiling widely. \"I believe we've
earned ourselves a fine meal or two these past weeks.\"" CR CR>
	       <TELL
"The tavern was a large and noisy place, with a few dozen tables and a
large bar. Either the drinks were exceptionally good or the food
exceptionally bad, for the bar was filled with noisy sailors
and townsfolk while ">
	       <COND (,DEMON-SEARCHING?
		      <TELL
"only one table was occupied, and nobody there was eating.">)
		     (T
		      <TELL
"none of the tables in the dining area was occupied.">)>
	       <TELL CR CR
"Pleasantly surprised that our arrival had not attracted undue attention,
we sat ourselves down for dinner, with the expectation of checking out the wharf
later that evening.">
	       <MOVE-TO ,ZAN-TAVERN>) 
	      (INN
	       <CHANGE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND ,CAMP-OUT-COMMAND>
	       <COND (<OR <FSET? ,INN ,BLACK-MIX>
			  <NOT <FSET? ,WHARF ,SOLVED>>>
		      <FSET ,HERE ,BLACK-MIX>
		      <REMOVE-TRAVEL-COMMAND>)>
	       <COND (<FSET? ,INN ,SEEN>
		      <TELL
"Again, we entered the inn; the old man was still there, and he smiled
as we approached his desk." CR CR>
		      <TELL
"\"Not much happening this time of night, is there?\" he asked, and
smiled broadly enough to see that he had but three teeth left in
his mouth.">)
		     (T
		      <TELL
"We entered the inn through swinging doors. Inside, an old man, his long,
stringy hair hidden beneath a dark, felt cap, was standing behind the counter,
leaning on his elbow as if bored." CR CR>
		      <TELL
"\"Can I help you folks?\" he said, tapping his fingers on the counter.">)>
	       <MOVE-TO ,INN>)
	      (CAMP-OUT
	       <COND (<NOT ,CHOSEN-BOAT>
		      <REMOVE-PARTY-COMMAND ,CAMP-OUT-COMMAND>
		      <TELL ,HAVENT-CHOSEN-BOAT>)
		     (<AND ,DEMON-SEARCHING? <FSET? ,INN ,SCOUTED>>
		      ;<SETG DEMON-SEARCHING? <>>
		      ;"Took a room"
		      <COND (<FSET? ,ZAN-TAVERN ,SOLVED>
			     <TELL
"Concerned about the suspicious men at the tavern">)
			    (T
			     <TELL "For some reason">)>
		      <TELL ", we decided to avoid
the inn, finding instead" ,COMFORTABLE-SPOT CR CR> 
		      ;<GRAPHIC ,G-ZAN-FIRE>
		      <TELL
"Shortly before dawn, we were awakened by the sound of alarm bells
ringing in town. We rose and approached town cautiously, and found
the inn ablaze with fire." CR CR>
		      <TELL
"\"This is no coincidence,\" Bergon said, absently rubbing his room key
between his fingers, \"The fire was meant for us. It is well that we depart
this morning.\"" CR CR>
		      <TELL
"The eastern sky was now a dull orange, and we were soon expected at the
wharf. With little time to spare, we hastily packed our things and headed
back into town. But our arrival in town did not go unnoticed, and we
were soon surrounded by an angry crowd. Things could have gotten pretty ugly
in a hurry were it not for the presence of the local sheriff." CR CR>
		      <TELL
"\"Come with me, boys,\" he said, \"unless you'd like a taste of mob
justice.\"" CR CR>
		      <TELL
"Seeing little alternative, we were marched inside the small building that
housed the town's single jail cell. \"You boys make yourselves comfortable,\"
the sheriff said, \"You'll want to be resting up before your trial; you know,
arson is a pretty serious crime, and we don't go lightly on criminals -
especially strangers.\"" CR CR>
		      <COND (<FSET? ,GRAY-STONE ,INCAPACITATED>
			     <TELL
"Just then, we heard a familiar voice entering the sheriff's office.
\"Scoundrels and thieves!\" he cried as he made his way toward our crowded
jail cell." CR CR>
			     <TELL
"\"Oh, dear,\" Praxix said under his breath. The proprietor of the curio
shop now appeared, holding a bag of cold water to his head." CR CR>
			     <TELL
"\"That's them,\" he said, \"Stole a rare stone from my shop just last
night. Not surprised to find them in jail.\" And then, waving a finger
in Praxix' face, he proclaimed, \"This is the one that knocked me on
the head!\"" CR CR>
			     <UPDATE-REMOVE ,POUCH>
			     <TELL
"The sheriff called Praxix out of the cell and searched him thoroughly,
confiscating his bag of powders. \"No stone,\" he reported, \"but don't
you worry - we'll see that justice is done!\"" CR CR>
			     <TELL
"The proprietor harumphed and stormed out of the building as the sheriff
returned Praxix to the cell, throwing him to the floor like a common
criminal, which, in fact, was not far from the truth." CR CR>
			     <TRAVEL-COMMANDS ,PRAXIX ,EXAMINE-COMMAND>)>
		      <TELL
"And with that, he walked back to his front office and began snoring
loudly. Outside our window, the sky had turned a brilliant orange; we
had little time left before our boat would depart."> 
		      <REMOVE-ALL ,INVENTORY ,JAIL-STORAGE T>		      
		      <MOVE-TO ,JAIL>)
		     (,DEMON-SEARCHING?
		      <SETG DEMON-SEARCHING? <>>
		      <TELL
"It seemed wise to avoid the inn, so we found" ,COMFORTABLE-SPOT CR CR>
		      <GRAPHIC ,G-ASSASSINS>
		      <TELL
"Shortly before dawn, a band of marauders surprised us in our sleep,
attacking us viciously with swords and knives. " CHR ,ZAN-VICTIM ", who lay
closest to our campfire, awakening us with his scream, but was cut down before
he could rise to defend himself." CR CR>
		      <TELL
"The rest of us, as quietly as we could, took our weapons and crouched
in the pre-dawn gloom." CR CR>
		      <TELL
"\"The others are around here,\" said a gruff voice in the darkness." CR CR>
		      <TELL
"\"I think we've done 'em enough damage,\" said another, apparently more
anxious to depart." CR CR>
		      <TELL
"\"I'm with Pregar,\" said a third man, \"They'll be running back to
wherever it is they're from, that's for sure. Let's go.\"" CR CR>
		      <TELL
"The men departed, and we rushed to " D ,ZAN-VICTIM "'s side - as we feared,
he been killed instantly by a savage sword thrust." CR CR>
		       <TELL
"The eastern sky was now starting to brighten, and it would soon be
time to board the " D ,CHOSEN-BOAT " on our voyage to the Misty Isle. With
no time to waste, we quickly buried our fallen friend, and Praxix intoned the
words of our burial ritual." CR CR>
		       <TELL
"With heavy hearts, we made our way back to the wharf and boarded the "
D ,CHOSEN-BOAT ".">
		       <HINT ,HINT-CAMPGROUND>
		       <PARTY-REMOVE ,ZAN-VICTIM>
		       <MOVE-TO ,BOAT>)
		     (T
		      <TELL
"Opting to spend the night under the stars, our party found a comfortable
spot outside of town and camped there. We arose at dawn and hastily made
our way back through town and onto the " D ,CHOSEN-BOAT ".">
		      <MOVE-TO ,BOAT>)>)>)>

<OBJECT GRAY-STONE
	(SDESC "gray stone")
	(8DESC "gry stone")
	(KBD %<ASCII !\G>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"Praxix took the gray stone in his hand, and confirmed what he had seen
as I picked it up: that it was composed of a fine powder whose consistency
was immediately
suggestive of a magical reagent. It might be just an ordinary stone,
of course, but we could only tell by mixing it with Praxix' essences.">)>)>	

<COMMAND (STEAL-STONE STEAL-IT)>

<ROOM CURIO-SHOP
      (TRAVEL-COMMANDS EXIT-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS PROVISIONER DONT-CAST)
      (GRAPHIC G-CURIO-SHOP)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<SAVE-PROVISION-COMMANDS ,PRAXIX>
		<SAVE-PROVISION-COMMANDS ,TAG>
		<PROVISION-COMMANDS ,TAG ,BUY-COMMAND ,INVENTORY-COMMAND>>)
      (EXIT
       <EXECUTE ()
		<RESTORE-PROVISION-COMMANDS ,PRAXIX>
		<RESTORE-PROVISION-COMMANDS ,TAG>>)
      (ACTION
       <ACOND ("AUX" CNT CHR)
	      (<AND <ACTION? LOOK-AROUND>
		    <NOT <QSET? ,HERE ,SCOUTED>>>
	       <TELL
"The shop was large, and filled with a vast assortment of
artifacts; it would have taken hours to see everything (everything
in plain view, that is) so " ACT " went off
to explore on his own.">
	       <COND (<G? ,PARTY-MAX 3>
		      <TELL
" This sounded like a good enough idea to the rest of us and soon we had separated
to the far corners of the shop.">)>
	       <TELL " Only
Praxix remained alongside the counter, staring at the walls with
indifference." CR CR>
	       <TELL
"\"I don't suppose there's something in particular you're looking
for?\" asked the proprietor, sourly.">
	       <REPEAT ()
		       <COND (<G? <SET CNT <+ .CNT 1>> ,PARTY-MAX>
			      <RETURN>)
			     (<NOT <EQUAL? <SET CHR <GET ,PARTY .CNT>>
					   ,PRAXIX
					   ,TAG>>
			      <MAKE-BUSY .CHR ,GONE-COMMAND>)>>
	       <OPTION ,PRAXIX ,REPLY-COMMAND ,IGNORE-COMMAND>) 
	      (REPLY
	       <GRAPHIC <> ,G-GRAY-STONE ,BOTTOM-RIGHT>
	       <TELL
"\"I have always had a keen interest,\" Praxix replied casually, \"in rare
stones and jewels, though I don't suppose you would have any.\"" CR CR>
	       <TELL
"\"Rare stones and jewels,\" the proprietor echoed in an ornery tone, and
shrugging added, \"It's possible I've got something you'd like. You just
wait here.\" He then ambled into his back room and soon ambled back again
carrying a small wooden case filled with stones and gems. \"One of these
priceless gems might interest you,\" he said with an odd mix of curiosity
and disdain." CR CR>
	       <TELL
"Praxix glanced absently at the collection of stones, musing about whether
the proprietor had some confusion between the words 'priceless' and
'worthless'. Just then, I returned to Praxix' side, having found little in the
shop to interest me. But these stones were quite another matter, for
I found them quite beautiful, particularly a pale gray stone cut in the
shape of a pyramid. Under the proprietor's watchful eye, I grasped the
stone, admired it for a moment, then returned it to its case." CR CR>
	       <TELL
"And then, from a seeming stupor, Praxix sprang to life. \"We'll take
the gray stone,\" he said crisply, \"How much do you ask?\"" CR CR>
	       <TELL
"The proprietor pursed his lips, and gave a little shrug. \"Oh, I don't
know about that,\" he said, \"That's quite a valuable stone. I don't
expect you'll be able to afford it.\""> 
	       <END-OPTION>
	       <UPDATE-MOVE ,GRAY-STONE ,HERE>
	       <PROVISION-COMMANDS ,TAG ,BUY-COMMAND ,SELL-COMMAND ,INVENTORY-COMMAND>
	       <FSET ,GRAY-STONE ,SEEN>)
	      (STEAL-STONE
	       <REMOVE ,ZAN-1-CURIO-SHOP>
	       <REMOVE ,HYE-STEAL>
	       <TELL
"Praxix regarded the stone intently, tapping his fingers nervously on
the counter. And then, with a suddenness that surprised us all, he took
matters into his own hands, grabbing the gray stone with his free hand and
knocking the proprietor on the head with his staff. He then crushed the
stone into a powder and placed it among his other magical items." CR CR>
	       <TELL
"\"This would be a good time to leave,\" he said, levelheadedly, as ">
	       <COND (<G? ,PARTY-MAX 3> <TELL "the others">)
		     (T <TELL "Bergon">)>
	       <TELL " arrived on the scene." CR CR>
	       <TELL
"Outside of the shop, Bergon could hardly believe what had happened. \"I
don't know what's gotten into you,\" he said to Praxix in a disapproving
tone, \"I hope the stone is worth it!\"" CR CR>
	       <TELL
"\"As do I,\" Praxix replied. \"The stone appears to be a magical
reagent, and the proprietor was oddly disinclined to sell. Since I am
certain we can put the stone to better use than he would, I thought
it would do no harm to twist his arm a little. And now, I would suggest we
leave the scene of the crime before the poor man recovers from his
headache and discovers what is missing.\"">
	       <FSET ,GRAY-STONE ,SOLVED>
	       <MOVE ,GRAY-REAGENT ,REAGENTS>
	       <COND (<IN? ,REAGENT ,REAGENTS>
		      <MOVE ,BLUE-REAGENT ,REAGENTS>
		      <REMOVE ,REAGENT>)>
	       <FSET ,GRAY-STONE ,INCAPACITATED>
	       <UPDATE-REMOVE ,GRAY-STONE>
	       <MOVE-TO ,ZAN-1>)
	      (BUY
	       <FSET ,GRAY-STONE ,EXAMINED>
	       <TELL
"I took out my purse and looked expectantly at the proprietor. \"Let's
say fifty silver pieces,\" he said." CR CR>
	       <TELL
"We were aghast at the outrageous price; we had not nearly enough
silver to make the purchase.">
	       <CHANGE-PROVISION-COMMAND ,TAG ,BUY-COMMAND ,TRADE-COMMAND>
	       <PROVISION-COMMANDS ,PRAXIX ,STEAL-STONE-COMMAND>)
	      (SELL
	       <TELL
"It occurred to me that selling something to the proprietor might help,
but I wished to reserve this option as a last resort.">
	       <UPDATE-FSET ,HERE ,DONT-DROP>)
	      (TRADE
	       <COND (<OBJECT? SPYGLASS>
		      <UPDATE-REMOVE ,SPYGLASS>
		      <FSET ,GRAY-STONE ,SOLVED>
		      <MOVE ,GRAY-REAGENT ,REAGENTS>
		      <COND (<IN? ,REAGENT ,REAGENTS>
			     <MOVE ,BLUE-REAGENT ,REAGENTS>
			     <REMOVE ,REAGENT>)>
		      <TELL
"Pulling the spyglass from my pack, I held it out to the proprietor
who examined it with keen interest.">
		      <TELL CR CR
"\"Quite a rare piece,\" he said, expressing little of the enthusiasm we
could read in his eyes. Oddly, he was still reluctant to make the trade,
although the spyglass was many times more valuable than the stone possibly
could have been. But then, out of greed, perhaps, he relented. \"The gray
stone for the spyglass,\" he said. \"Now, if you don't mind, it's closing
time.\"">
		      <TELL CR CR
"After handing Praxix the gray stone, he ushered us back onto the
street, where he bade us a perfunctory farewell with a wave of his
hand.">
		      <COND (<NOT <FSET? ,SPYGLASS ,TRIED>>
			     <TELL CR CR
"\"I did not realize you had taken the spyglass,\" Praxix said to me
as he crumbled the gray stone into a fine powder, \"You are indeed a fine
one; full of surprises! I'm certain nothing else would have satisfied
him.\"">)>
		      <TELL CR CR
"\"I, for one, do not trust him,\" Bergon said, discreetly glancing back
toward the shop. \"See how he peers at us still through his darkened
window!\"">
		      <UPDATE-REMOVE ,ZAN-1-CURIO-SHOP>
		      <MOVE-TO ,ZAN-1>)
		     (<FSET? ,ACTION-OBJECT ,DONT-DROP>
		      <TELL
"I took the " AO " out of my pack, and prepared to offer it to the
proprietor, but thought better of it. No matter how valuable the gray
stone might be, it was not worth giving this up for.">)
		     (<NOT <G? <SETG TRADE-COUNT <+ ,TRADE-COUNT 1>> 1>>
		      <TELL
"Removing the " AO " from my pack, I held it up to the proprietor's
view, but elicited only a frown in response. \"I have no time for
haggling with strangers,\" he said, \"and it's past closing time.\"">)
		     (T
		      <TELL
"The proprietor showed even less interest in the " AO ". \"I must be
closing up now,\" he said, \"Perhaps you will find something
else of interest tomorrow. Good day.\" And with that, he hustled us
out the door and back onto the street." CR CR>
		      <TELL ,TELL-NO-SALE>
		      <MOVE-TO ,ZAN-1>)>)
	      (IGNORE
	       <FSET ,GRAY-STONE ,TRAPPED>
	       <TELL
"\"No, nothing in particular,\" Praxix replied, for in fact nothing
whatsoever had caught his eye, only odd trinkets and wood carvings
of questionable value." CR CR>
	       <TELL
"\"Then, perhaps you and your friends would leave,\" he scowled. \"It's
past closing time, and I've no interest in waiting on strangers.\"">
	       <END-OPTION>
	       <TELL CR CR
"And with that, he escorted us out of his shop and back onto the street.">
	       <MOVE-TO ,ZAN-1>) 
	      (EXIT
	       <COND (<FSET? ,BERGON ,BUSY>
		      ;"We've seen the stone"
		      <COND (<FSET? ,GRAY-STONE ,EXAMINED>
			     ;"We've tried to buy it..."
			     <TELL
"It seemed we would be unable to buy the stone at any price, so
we returned to the street, the proprietor closing the shop behind
us." CR CR>
			     <TELL ,TELL-NO-SALE>)
			    (T
			     <TELL
"Praxix abruptly motioned for us to leave, which we did. The only item
of interest had been the gray stone, but Praxix had become highly
suspicious of the shopkeeper." CR CR>
			     <TELL ,TELL-NO-SALE>)>)
		     (T
		      <TELL
"Unsurprisingly, we found mostly worthless trinkets and handicrafts here.
It was just as well, for the proprietor was in a hurry to close up, and
he nervously hustled us out of the shop, locking the door behind us.">)>
	       <MOVE-TO ,ZAN-1>)>)>

<CONSTANT TELL-NO-SALE
"\"It would appear to me,\" Praxix said, \"that the proprietor had no
interest in making a sale, and that itself is disturbing. We must be on
our guard here in Zan.\"">

<GLOBAL TRADE-COUNT 0>

<COMMAND TRADE O-TRADE>

<ROUTINE O-TRADE ()
	 <FIND-OBJECTS ,INVENTORY ,NEVER-DROP>
	 <RTRUE>>

<OBJECT T-O-T-LEAVES
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<AND <NOT <EQUAL? ,PARTY-MODE ,OPTION-MODE>>
			      <IN? ,TAVERN-OTHER-TABLE ,HERE>>
			 <UPDATE-REMOVE ,TAVERN-OTHER-TABLE>
			 <TELL CR CR
"Just then, the group at the other table rose and walked out of the tavern;
peculiarly, three of the men huddled around the fourth, as if protecting him;
from what, we could not imagine.">)>>)> 

<OBJECT TAVERN-OTHER-TABLE
	(LOC ZAN-TAVERN)
	(SDESC "other table")
	(8DESC "others")
	(KBD %<ASCII !\O>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <GRAPHIC ,G-OTHER-TABLE>
		 <PUTP ,HERE ,P?CAST-LIMIT 2>
		 <UPDATE-FCLEAR ,HERE ,DONT-CAST>
		 <QUEUE ,T-O-T-LEAVES 6>
		 <FSET ,TAVERN-OTHER-TABLE ,EXAMINED>
		 <UPDATE-FSET ,HERE ,ADVISE>
		 <COND (<EQUAL? ,ACTOR ,HURTH>
			<TELL "\"One moment">)
		       (T
			<TELL "\"Shh!">)>
		 <TELL
"\" " ACT " said, silencing one of my reminiscences of home. But
what I took for uncharacteristic rudeness was nothing of the sort." CR CR>
		 <TELL
"\"Those men at the next table,\" he whispered, \"They talk of us!\"" CR CR>
		 <TELL
"\"Come now,\" Bergon replied, a little too loudly, \"Why would they be
interested in us?\" And as if to prove that there was nothing suspicious going
on, he turned and stared at the men at the table. As one, they turned away and
their conversation grew quieter. In the dim light of the tavern, it appeared
that Bergon blushed." CR CR>
		 <TELL
"\"This is grave, indeed,\" Praxix said, voice lowered. \"They know us, yet they
are no friends of ours.\"">)>)>

<COMMAND (ORDER-MEAL GET-MEAL)>

<GLOBAL INN-TALK <>>

<ROUTINE TAVERN-TALK ("AUX" (TMP <GET-TEMP>) (CNT <MIN .TMP 3>))
	 <COND (<ZERO? .CNT>
		<SETG INN-TALK T>
		<TELL
"The man farthest away was now speaking. \"...less concerned about what you
desire than about our reward. This is not a barbarian land like the northern
hinterlands, with all respect. If we get caught, there will be hell to pay.\"">)
	       (<EQUAL? .CNT 1>
		<TELL
"The man whose face I could not see spoke in a deep, rasping voice. An
involuntary shudder ran down my spine." CR CR>
		<TELL
"\"Hell to pay? What can you know of Hell?\" He had raised his voice,
but now spoke more softly, in a hypnotic tone. \"Do as I ask; how you do it
is not my concern. Have you checked the inn?\"">)	       
	       (<EQUAL? .CNT 2>
		<TELL
"The man to my left replied. \"We have spoken to the innkeeper. I believe
he will be reliable.\" A long silence followed, and then the hidden man
spoke again." CR CR>
		<TELL
"\"And the waterfront?\" he asked, hissing. \"Is it arranged?\"" CR CR>
		<TELL
"The reply came quickly. \"We have gone to the waterfront, and spoken to
the captains of the ships in port...\"" CR CR>		
		<TELL
"It was at just this point that I started, slowly, to materialize. Rather
than be observed, I hurried back to our table. ">
		<COND (<ZERO? ,RED-ROCK-COUNT>
		       <FSET ,TAVERN-OTHER-TABLE ,DEAD>
		       <TELL
"But Praxix had no more of his invisibility spell, having used the last
of the red rocks." CR CR>
		       <TELL ,TAVERN-MATERIALIZE>
		       <REMOVE ,TAVERN-OTHER-TABLE>
		       <COND (<EQUAL? ,PARTY-MODE ,OPTION-MODE>
			      <END-OPTION>)>
		       <RTRUE>)
		      (T
		       <CAST-INVISIBLE>
		       <TELL
"Fortunately, Praxix still had just enough of the red rock with which to
cast another invisibility spell upon me. This done, I returned to the other
table, ready to overhear the remainder of the conversation.">)>)
	       (<EQUAL? .CNT 3>
		<TELL
"The man at my left was still speaking, though I had missed some of what
he had been saying. \"...easy, but we spoke to them all, except for the
drunkard " ,GOOD-CAPTAIN-NAME>
		<FSET ,TAVERN-OTHER-TABLE ,SOLVED>
		<TELL ", of course, but he hasn't been sober in over a week.
Don't worry. If they leave by boat, I guarantee they will have an unpleasant
voyage, to say the least.\"" CR CR>
		<TELL
"The hidden man had the final words. \"Succeed in your task,\" he said, \"and
your reward will befit they who walk with kings. I must leave Zan at once, but
I shall return in three days. I know I have chosen well here today.\"">
		<REMOVE ,TAVERN-OTHER-TABLE>
		<TELL CR CR
"And that ended the conversation. The men stood up and left the tavern in
a group, and it seemed they protected the fourth man, the one whose face
was hidden from me, making it impossible for me to get a closer look." CR CR>
		<TELL ,TAVERN-MATERIALIZE>
		<COND (<EQUAL? ,PARTY-MODE ,OPTION-MODE>
		       <END-OPTION>)>)>
	 <SET-TEMP <+ .TMP 1>>>

<CONSTANT TAVERN-MATERIALIZE
"Fearing to be seen materializing, I slipped out of the tavern and around back,
waiting there until I was reasonably opaque. I received scant attention as I
returned to the tavern, and in a moment I was seated with the others, telling
them what I had learned.">

<COMMAND EAVESDROP>

<OBJECT WAITER
	(SDESC "waiter")
	(KBD %<ASCII !\W>)
	(LOC ZAN-TAVERN)
	(FLAGS DONT-TAKE DONT-EXAMINE)>

<ROOM ZAN-TAVERN
      (TRAVEL-COMMANDS EXIT-COMMAND ORDER-MEAL-COMMAND NUL-COMMAND)
      (GRAPHIC G-ZAN-TAVERN)
      (FLAGS DANGEROUS DONT-SCOUT INDOORS)
      (CAST-LIMIT 2)
      (TEMP 0)
      (EXIT
       <EXECUTE ()
		<RESTORE-TAG-COMMANDS>
		<COND (<AND ,DEMON-SEARCHING?
			    <NOT <FSET? ,TAVERN-OTHER-TABLE ,SOLVED>>>
		       <HINT ,HINT-TAVERN>)>>)
      (ENTER
       <EXECUTE ()
		<COND (<NOT ,DEMON-SEARCHING?>
		       <UPDATE-REMOVE ,TAVERN-OTHER-TABLE>)
		      (T
		       <CHECK-FOREBODING>
		       <FSET ,HERE ,SEEN>)>
		<TRAVEL-COMMANDS ,TAG>
		<SET-TEMP ,MOVE-NUMBER>>)
      (ACTION
       <ACOND ()
	      (EAVESDROP
	       <TAVERN-TALK>)
	      (RETURN
	       <TELL
"I had heard enough. ">
	       <TELL ,TAVERN-MATERIALIZE>
	       <GRAPHIC ,G-ZAN-TAVERN>
	       <END-OPTION>)
	      (GET-ADVICE:REMOVE
	       <TELL
"\"What do you think?\" Bergon asked, motioning toward the other table."
CR CR>
	       <TELL
"\"I think we'd best stay clear of them,\" I responded, \"There is malice in
their eyes - I fear to imagine what they are saying!\"">)
	      (<AND <ACTION? CAST>
		    <OBJECT? INVISIBLE-SPELL>
		    <FSET? ,TAVERN-OTHER-TABLE ,EXAMINED>
		    <IN? ,TAVERN-OTHER-TABLE ,HERE>>
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <TELL
"\"Are you thinking what I'm thinking?\" I said, turning to Praxix." CR CR>
	       <TELL
"He was; in fact, he had already taken a red rock from his pack and
powdered it, taking care to avoid spilling it on himself. Then, he
stood up and, placing himself between me and the other table, spread
the dust over me. In a moment, I had vanished, and it appears nobody
noticed. Praxix nonchalantly took his seat, and I headed over to the
neighboring table to find out what I could." CR CR>
	       <TELL
"The group was in conversation; there were four men at the table;
of these, there was only one whose face I could not see." CR CR> 
	       ;<GRAPHIC ,G-EAVESDROPPING>
	       <CAST-INVISIBLE>
	       <FSET ,HERE ,SOLVED>
	       <SET-TEMP </ <- <- ,MOVE-NUMBER <GET-TEMP>> 2> 2>>
	       ;"0 = immediate, 1 = soon, etc."
	       <TAVERN-TALK>
	       <COND (<L=? <GET-TEMP> 3>
		      <OPTION ,TAG ,EAVESDROP-COMMAND ,RETURN-COMMAND>)>
	       <RTRUE>)
	      (<AND <ACTION? USE-MIX>
		    <EQUAL? ,MIXTURE ,BEND-WILL-SPELL>
		    <EQUAL? ,ACTION-PRSI ,WAITER ,TAVERN-OTHER-TABLE>>
	       <COND (<PRSI? WAITER>
		      <UPDATE-FSET ,WAITER ,DONT-CAST>
		      <TELL
"Discreetly, Praxix cast his mixture at a passing waiter. The waiter sniffled
just a bit, then sneezed once and continued on his way toward the bar." CR CR>
		      <TELL
"\"You know, I'm getting a bit thirsty,\" Praxix said. \"A pint of ale
would fit the bill nicely.\"" CR CR>
		      <TELL
"Not a minute later, the waiter arrived, bearing a cold pint of ale for
our Wizard-friend. Just as suddenly, he left, returning to the bar." CR CR>
		      <TELL
"\"Must be a mind-reader,\" Praxix said, sipping his drink.">)
		     (T
		      <TELL
"Praxix tried to cast his powders toward the other table, but they dropped
harmlessly to the ground before reaching their intended target.">)>
	       <MIXTURE-CAST>)     
	      (<ACTION? CAST>
	       <PRAXIX-TOO-DANGEROUS-TO-CAST>)	       
	      (ORDER-MEAL:REMOVE
	       <FSET ,HERE ,SCOUTED>
	       <TELL
"We were soon waited upon by a stout fellow with a cheery disposition.
\"Can I bring you folks some dinner?\" he asked." CR CR>
	       <TELL
"Assuring him that he could, we ordered some of the local seafood
specialties with some draught beer. The meal arrived in short order,
and we ate like starving men: quickly and noisily.">)
	      (EXIT
	       <COND (<FSET? ,HERE ,SCOUTED>
		      <TELL "Our dinners finished">
		      <COND (<FSET? ,HERE ,SOLVED>
			     <TELL
" and our heads full of worry from the ominous
conversation I had overheard, we returned to the street. The men
were gone without a trace">)
			    (<FSET? ,TAVERN-OTHER-TABLE ,EXAMINED>
			     <TELL
", we returned to the street. We were concerned about
the men at the other table, but soon put it out of our minds">)
			    (T
			     <TELL
", we returned to the street">)>)
		     (T
		      <TELL "We had not yet eaten, but ">
		      <COND (<FSET? ,HERE ,SOLVED>
			     <TELL
"the results of my eavesdropping">)
			    (<FSET? ,TAVERN-OTHER-TABLE ,EXAMINED>
			     <TELL
"our suspicions about the nearby table">)
			    (T
			     <TELL
"but some ill-defined feeling">)>
		      <TELL
" had caused us to lose our appetites. We rose from the table and
returned to the street">
		      <COND (<AND <FSET? ,TAVERN-OTHER-TABLE ,EXAMINED>
				  <NOT <IN? ,TAVERN-OTHER-TABLE ,HERE>>>
			     <TELL ". There was no sign of the men
at the table, and this alarmed us even further">)>)>
	       <TELL "." CR CR>
	       <TELL
"It was now almost dark, though there was still some activity at the
wharf.">
	       <MOVE-TO ,ZAN-2>)>)>

<COMMAND CHECK-IN>
<COMMAND TO-ROOM>
<COMMAND CAMP-OUT>

;"Foreboding-spell states
  <FSET? ,F-S ,ENCHANTED>	 -> mixture is active
  <FSET? ,F-S ,SEEN>	         -> red glow has been seen before
  <FSET? ,HERE ,ENCHANTED>	 -> red glow has been seen HERE before
"

<OBJECT RESET-FOREBODING-OBJ
	(TIME 0)
	(ACTION RESET-FOREBODING)>

<ROUTINE RESET-FOREBODING ()
	 <COND (<FSET? ,FOREBODING-SPELL ,ENCHANTED>
		<TELL CR CR
"Checking again on Praxix' staff, I found that it had now stopped glowing
altogether.">
		<FCLEAR ,FOREBODING-SPELL ,ENCHANTED>)>>

<ROUTINE CHECK-FOREBODING ()
	 <COND (<AND <FSET? ,FOREBODING-SPELL ,ENCHANTED>
		     <NOT <FSET? ,FOREBODING-SPELL ,SEEN>>>
		<FSET ,HERE ,ENCHANTED>
		<FSET ,FOREBODING-SPELL ,SEEN>
		<TELL CR CR
"I don't know why, but at that very moment I glanced at Praxix' staff -
it was now glowing with a dark red glow." CR CR>
		<TELL
"\"Perhaps the mixture has made itself useful, after all,\" Praxix
said, \"All that's left is to find out what it means!\"">
		<COND (<IN-PARTY? ,ESHER>
		       <TELL CR CR
"\"Is that all that's left?\" Esher asked, rolling his eyes skyward." CR CR>
		       <TELL
"\"I believe so,\" Praxix replied, \"In fact, I'm quite certain.\"">)>
		<RTRUE>)
	       (<FSET? ,FOREBODING-SPELL ,ENCHANTED>
		<FSET ,HERE ,ENCHANTED>
		<TELL CR CR
"Looking down, I again noticed that Praxix' staff shone peculiarly, this time
with a deep red glow.">)
	       (<FSET? ,HERE ,ENCHANTED>
		<TELL CR CR
"Unlike the last time we were here, Praxix' staff was not glowing a deep
red." CR CR>
		<TELL
"\"I'm beginning to believe the mixture I cast on the staff wears off
after a length of time,\" Praxix said, mainly to himself.">)>>

<OBJECT INNKEEPER
	(LOC INN)
	(SDESC "innkeeper")
	(KBD %<ASCII !\I>)
	(FLAGS DONT-TAKE DONT-EXAMINE)>

<ROOM INN
      (TRAVEL-COMMANDS CHECK-IN-COMMAND EXIT-COMMAND NUL-COMMAND)
      (GRAPHIC G-INNKEEPER)
      (FLAGS DONT-SCOUT FORBIDDING INDOORS)
      (CAST-LIMIT 2)
      (EXIT
       <EXECUTE ()
		<COND (<AND <FSET? ,BEND-WILL-SPELL ,TRAPPED>
			    <NOT <QSET? ,BEND-WILL-SPELL ,DEAD>>
			    <IN-PARTY? ,ESHER>>
		       <TELL CR CR
"Back outside, Praxix explained the odd happenings inside the inn." CR CR>
		       <TELL
"\"It would appear that the mixture was quite effective. You see, Esher
had just made one of his typically insulting remarks, and I, not
unnaturally, became angry. But what I was fantasizing, the innkeeper actually
did! I have not heard of such a mind-controlling spell, but I cannot doubt its
power." CR CR>
		       <TELL
"We could not fault Esher for his lack of enthusiasm. \"I don't suppose
there might have been another way to find this out?\" he asked." CR CR>
		       <TELL
"\"None that I am aware of,\" Praxix replied, with just the slightest hint
of a smile.">)>>)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<CHECK-FOREBODING>>)
      (ACTION
       <ACOND ()
	      (ACCEPT
	       <TELL
"\"No, we've been travelling long enough that even doubling up is something of
a luxury,\" Bergon replied. \"Two rooms, just for tonight.\"" CR CR>
	       <TELL
"The rooms were inexpensive enough, and we paid in advance, expecting to
leave early the next morning. The innkeeper gave us our keys, and told
us how to find our rooms. \"Have a pleasant night. Rest easy,\" he said.">
	       <CHANGE-TRAVEL-COMMAND ,HERE
				      ,CHECK-IN-COMMAND
				      ,TO-ROOM-COMMAND>
	       <FSET ,HERE ,SCOUTED>
	       <END-OPTION>)
	      (<AND <ACTION? USE-MIX>
		    <OBJECT? INNKEEPER>
		    <EQUAL? ,MIXTURE ,BEND-WILL-SPELL>>
	       <REMOVE ,HYE-INNKEEPER>
	       <TELL
"Praxix cast his mixture at the innkeeper, who merely sniffled a few times at
first. Then his eyes turned red and he stared blankly, as if in a trance." CR CR>
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL
"\"Praxix, you've outdone yourself this time,\" Esher said, \"I don't
believe I've ever seen an allergy spell before!\"" CR CR>
		      <TELL
"\"I'd like to bust him one,\" or words to that effect were going through
Praxix' mind when the most peculiar thing happened. The innkeeper, still
entranced, walked from behind his counter and slugged poor Esher in the
jaw, knocking him down. Then, calmly, he returned to the counter." CR CR>
		      <FSET ,BEND-WILL-SPELL ,TRAPPED>
		      ;<GRAPHIC ,G-INNKEEPER-HITS-ESHER>)>
	       <TELL
"A moment later, the innkeeper recovered. \"As I was saying,\" he began,
then stopped. \"What was I saying?\"">
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL CR CR
"About this time, Esher was getting back to his feet, preparing to
counterattack. Praxix held him back. \"I'll explain later,\" he said.">)>
	       <MIXTURE-CAST>)
	      (DECLINE
	       <TELL
"\"No, thank you,\" replied Bergon, \"We'll just rough it, I suppose.
Good night to you.\"">
	       <COND (<FSET? ,WHARF ,SOLVED>
		      <REMOVE-TRAVEL-COMMAND ,ZAN-2 ,INN-COMMAND>)>
	       <MOVE-TO ,ZAN-2>
	       <END-OPTION>)
	      (CHECK-IN
	       <TELL
"\"We would like rooms for the night,\" Bergon said." CR CR>
	       <TELL
"The innkeeper was happy to oblige, but there was a slight hitch.
\"I've only got two rooms,\" he said. \"You'll have to double
up, I reckon, or camp out!\"">
	       <OPTION ,LEADER ,ACCEPT-COMMAND ,DECLINE-COMMAND>)
	      (TO-ROOM
	       <COND (<NOT ,CHOSEN-BOAT>
		      <TELL ,HAVENT-CHOSEN-BOAT>
		      <REMOVE-PARTY-COMMAND ,TO-ROOM-COMMAND>
		      <RTRUE>)>
	       <TELL
"Our rooms were not together; Praxix and I took one, and ">
	       <COND (<EQUAL? ,PARTY-MAX 3> <TELL "Bergon">)
		     (T <TELL "the others">)>
	       <TELL 
" took the second. It had been a strenuous day, and a long time since we had
slept in a real bed. And so we fell off into a deep and dreamless sleep." CR CR>
	       <COND (,DEMON-SEARCHING?
		      <HINT ,HINT-INN>
		      <SETG DEMON-SEARCHING? <>>
		      ;<GRAPHIC ,G-ZAN-FIRE>
		      <TELL
"But our slumber turned to horror, as we were awakened by shouting
and screaming. \"Fire! Awake!\" came the cries. Outside our door, the
corridor was consumed in smoke and flame, and we had barely enough
time to escape through our window as the acrid fumes filled our lungs." CR CR>
		      <TELL
"Back at the street, we waited for the others to escape the inferno. Before
long, Bergon ran from the inn, filled with despair. \"" D ,ZAN-VICTIM
"'s been trapped inside!\" he shouted. Praxix and I started to run toward the
building, but were held back. \"It's too late!\" he said, now holding back
tears. \"" D ,ZAN-VICTIM " is dead.\"" CR CR>
		      <TELL
"The eastern sky glowed a fiery orange, as with heavy hearts we made our way
back to the wharf and boarded the " D ,CHOSEN-BOAT ".">
		      <PARTY-REMOVE ,ZAN-VICTIM>)
		     (T
		      <TELL
"We awoke the next morning before dawn and quickly checked ourselves out of
the inn. Soon we had reached the wharf and boarded the " D ,CHOSEN-BOAT ".">)>
	       <MOVE-TO ,BOAT>)
	      (EXIT
	       <COND (<AND <FSET? ,HERE ,SCOUTED>
			   <NOT <QSET? ,HERE ,BLACK-MIX>>>
		      <TELL
"Keys in hand, we started for the door. \"We shall return later,\" Bergon
said." CR CR>
		      <TELL
"\"We're open all night,\" was the reply, and, thanking the man again, we
returned to the street.">)
		     (<FSET? ,HERE ,SCOUTED>
		      <TELL
"Once again, we headed back toward the street. \"Make up your minds,\" the
innkeeper shouted after us.">) 
		     (T
		      <TELL
"\"We may be needing rooms,\" Bergon said to the innkeeper, \"We shall return
before long if we do. Thank you.\"" CR CR>
		      <TELL
"\"We've only a few rooms left; don't spend all night thinking about it!\"
the innkeeper replied with a mischievous giggle.">)>
	       <MOVE-TO ,ZAN-2>)>)>

<CONSTANT HAVENT-CHOSEN-BOAT
"It felt like a good time to retire, but Bergon wouldn't hear of it. \"We
were told not to tarry here in Zan; frankly, I am not comfortable here.
We must not sleep until we have arranged to charter a boat at the wharf!\""> 

<COMMAND ESCAPE>
<COMMAND (CALL-SHERIFF CALL-OUT)>

<OBJECT JAIL-STORAGE>

<ROOM JAIL
      (TRAVEL-COMMANDS ESCAPE-COMMAND CALL-SHERIFF-COMMAND WAIT-COMMAND)
      (GRAPHIC G-JAIL)
      (FLAGS DANGEROUS DONT-SCOUT)
      (CAST-LIMIT 2)
      (ACTION
       <ACOND ()
	      (CALL-SHERIFF:REMOVE
	       <TELL
"We called for the sheriff, but he just yelled back at us, \"I'm
trying to get some sleep! You know, I'm not only the sheriff around here,
but the judge as well, and I can tell you I'm one ornery fellow when I
get too little sleep!\"">)
	      (ESCAPE:REMOVE
	       <TELL
"Escape from this cell was unlikely, if not impossible, but the thought
filled our minds.">)
	      (WAIT
	       <DO-JAIL-WAIT>)
	      (<AND <EQUAL? ,ACTION ,MIX-COMMAND ,CAST-COMMAND>
		    <IN? ,SHERIFF ,HERE>>
	       <TELL
"Praxix took out his pouch of magical powders, but could not hide that fact
from the sheriff. \"Here, I'll have those!\" he said, and demanded the
powders from Praxix, who had little choice but to comply." CR CR>
	       <TELL
"\"What do you know?\" the sheriff said, spitting on the ground, \"We've
got ourselves a Wizard in jail!\" Laughing, he returned to his office." CR CR>
	       <DO-JAIL-WAIT>)
	      (<AND <ACTION? USE-MIX>
		    <OBJECT? SHERIFF>
		    <EQUAL? ,MIXTURE ,BEND-WILL-SPELL>>
	       ;<GRAPHIC ,G-SHERIFF-OPENS-CELL>
	       <TELL
"And then, Praxix cast the mixture at the sheriff. At first, he grabbed
for his sword; then, it appeared he would sneeze; finally, his eyes
glazed over, and he took on a trance-like expression." CR CR>
	       <COND (<FSET? ,BEND-WILL-SPELL ,TRAPPED>
		      <TELL
"Praxix, meanwhile, concentrated on having the cell door opened. And">)
		     (T
		      <FSET ,BEND-WILL-SPELL ,TRAPPED>
		      <TELL
"Praxix, meanwhile, was uncertain of just what the spell would do.
\"We need to get out of this cell!\" he reminded himself, and just">)>
	       <TELL
" then, the sheriff unlocked the cell door and motioned us outside." CR CR>
	       <TELL
"I waved my hand before the sheriff's eyes, but he did not blink. \"Potent
stuff,\" I said, \"Reminds me of the winner of last year's ale drinking
contest.\"" CR CR>
	       <REMOVE-ALL ,JAIL-STORAGE ,INVENTORY>
	       <TELL
"Taking our things, we quietly left the sheriff's office. The nearby
streets were deserted, the fire having been brought under control sometime
earlier. It took but a few minutes to reach the wharf and we were soon
on board the " D ,CHOSEN-BOAT ".">
	       <MIXTURE-CAST>
	       <MOVE-TO ,BOAT>)
	      (CAST
	       <COND (<EQUAL? ,ACTION-OBJECT
			      ,TREMOR-SPELL
			      ,WIND-SPELL
			      ,FAR-VISION-SPELL>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,CALL-SHERIFF-COMMAND>
		      <TELL
"If it was Praxix' goal to get the sheriff's attention, he certainly
did so by casting the \"" AO "\" spell. But the pace of the sheriff's
life was not appreciably quickened, and it was quite a while later that
he finally arrived; he did not seem pleased." CR CR>
		      <TELL
"\"What's going on here?\" he boomed.">
		      <GRAPHIC <> ,G-SHERIFF ,BOTTOM-RIGHT ;"Stamp added 3/15">
		      <COND (<FSET? ,TAG ,TRAPPED>
			     <FCLEAR ,TAG ,TRAPPED>
			     <TELL CR CR
"Well, you can imagine the sheriff's surprise when I started to materialize
with my fingers grasping for the key chain on his belt. I braced for the
worst, but it never came. Rather, the sheriff started to chuckle." CR CR>
			     <TELL
"\"Hell,\" he said, \"there's one I haven't seen before. Now you boys keep
out of trouble or things will be a lot worse for you than they already
are.\"" CR CR>
			     <TELL
"And with that, he sauntered back to his desk, presumably for another
snooze. I slinked into the far corner of the cell where the dark shadows
concealed the redness on my face.">
			     <RTRUE>)>
		      <QUEUE ,SHERIFF-LEAVES 3>
		      <UPDATE-MOVE ,SHERIFF ,HERE>)
		     (<OBJECT? INVISIBLE-SPELL>
		      <UPDATE-REMOVE ,INVISIBLE-SPELL>
		      <REMOVE ,HYE-JAIL>
		      <TELL
"Hope fading, I suggested that we use our remaining piece of red rock
to make one of our party invisible. Praxix was intrigued by the
idea, and consented to casting the spell. I was nominated to become
invisible, and the task was soon accomplished.">
		      <FSET ,TAG ,TRAPPED>
		      <QUEUE ,TAG-BECOMES-VISIBLE 2>)
		     (<OBJECT? LIGHTNING-SPELL>
		      <FSET ,LIGHTNING-SPELL ,SEEN>
		      <TELL
"When Praxix suggested using his Lightning spell, we talked him out
of it." CR CR>
		      <TELL
"\"It is a small cell,\" Bergon noted, \"and I'm not certain I care to
find out how accurate you are!\"" CR CR>
		      <TELL
"\"Nor I,\" replied Praxix, \"Perhaps there is another spell that would be
less dangerous.\"">)>)>)>

<OBJECT TAG-BECOMES-VISIBLE
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<FSET? ,TAG ,TRAPPED>
			 <FCLEAR ,TAG ,TRAPPED>
			 <TELL CR CR
"It was then that I materialized, having failed to turn my invisibility
to our advantage." CR CR>
			 <TELL
"\"Don't be cross with yourself,\" Praxix said reassuringly, \"It was
worth a try; perhaps there is something else we can do.\"" CR CR>
			 <TELL
"If there was, we had precious little time to think of it.">)>>)>

<ROUTINE DO-JAIL-WAIT ()
	 <HINT ,HINT-JAIL>
	 <TELL
"There was nothing to do here but wait. A court convened later in the day, and
we were convicted of burning down the old inn">
	 <COND (<FSET? ,GRAY-STONE ,INCAPACITATED>
		<TELL ", as well as of assault and theft">)>
	 <TELL
". I suppose it could have gone far worse for us, for after the public
flogging they took our possessions and deposited us outside of town with a
warning that we would best not be seen again." CR CR>
	 <TELL
"Dispirited, we returned to Astrix, who was despondent at the outcome of
our venture into Zan." CR CR>
	 <PART-ONE-BAD-ENDING T>>

<OBJECT SHERIFF
	(SDESC "sheriff")
	(KBD %<ASCII !\S>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,HURTHBIT ,ESHERBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"The sheriff had a pleasant enough face, and he didn't seem particularly
evil or dangerous. But his look was determined, and he was entirely
convinced of our guilt. After all, hadn't we checked into the inn, then
hidden outside of town, returning only after the deed had been done?" CR CR>
		 <TELL
"\"I don't believe he's going to let us out of here,\" " ACT " said in a
whisper." CR CR>
		 <TELL
"\"Perhaps not,\" Praxix replied obtusely, \"but it is always possible that
he will have a change of heart.\"">)>)>

<OBJECT JAIL-CELL
	(LOC JAIL)
	(SDESC "cell")
	(KBD %<ASCII !\C>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
", restless, walked to the window and pulled on the heavy iron bars; then,
he walked back to the cell door, examined it, and quickly reached
the conclusion that escape would be nearly impossible. Our possessions having
been taken from us, there was little we could do but wait." CR CR>
		 <TELL
"\"If we only had our things,\" Bergon said">
		 <COND (<IN? ,SHERIFF ,HERE>
			<TELL " quietly">)>
		 <TELL ", \"we might have some chance of escape.\"">
		 <COND (<NOT <FSET? ,GRAY-STONE ,INCAPACITATED>>
			<TELL CR CR
"\"I have some of my things,\" Praxix ">
			<COND (<IN? ,SHERIFF ,HERE>
			       <TELL "whispered, discretely indicating the
pouch of powders hidden beneath his cloak.">)
			      (T
			       <TELL "replied, removing his pouch of
magical powders, \"It is a good thing the sheriff does not fear old
men.\"">)>)>
		 <RTRUE>)>)>

<OBJECT SHERIFF-LEAVES
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<EQUAL? ,HERE ,JAIL>
			 <UPDATE-REMOVE ,SHERIFF>
			 <SETG CURRENT-GRAPHIC <>> ;"3/15"
			 <GRAPHIC ,G-JAIL>
			 <TELL CR CR
"\"I'm going back to sleep now; you boys do yourselves a favor and
don't be waking me up!\" And with that, he returned to his office and
the snoring followed closely upon his departure.">)>>)> 

