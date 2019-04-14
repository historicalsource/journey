"LAVOS for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT LAVOS>

<GLOBAL CHEAT <>> 

<IF-DEBUGGING
 <ROUTINE PART-TWO-CHEAT ()
	 <TELL "[Part Two Cheat. Shame on you.]" CR CR>
	 <SETG CHEAT T>
	 <CLEAR-SUBGROUP>
	 <REMOVE ,I-INIT-RANDOM-STUFF>
	 <COND (<NOT <QSET? ,ESSENCES ,TRIED>>
		<INIT-SPELLS>
		<INIT-RUNES>)>
	 ;"About the best you can do after the first part..."
	 <PUT ,ESSENCE-TBL 1 3>
	 <PUT ,ESSENCE-TBL 2 4>
	 <PUT ,ESSENCE-TBL 3 4>
	 <PUT ,ESSENCE-TBL 4 2>
	 <MOVE ,ESSENCE-FIRE ,ESSENCES>
	 <MOVE ,ESSENCE-WATER ,ESSENCES>
	 <START-PART-TWO>>>

<ROOM START-LOC
      (TRAVEL-COMMANDS START-COMMAND BACKGROUND-COMMAND CHANGE-NAME-COMMAND
		       HELP-COMMAND)
      (GRAPHIC G-LAVOS)
      (ACTION
       <ACOND ()
	      (BACKGROUND
	       <TELL
"Our story began nearly five years ago, at the time of our first crop
failures. These things happen, of course, once in a while, but by the third
year, we knew something was badly amiss. And then, in the fourth year of
our despair, the water, too, failed us; not all at once, mind you, but by
the fifth year, there were only a few folks whose water was not foul-tasting
and disease-ridden. Many moved away, into the north country, but in fact
neither had our neighbors been spared the spreading pestilence." CR CR>
	       <TELL
"Hope was fading as the summer of that fateful year approached, and,
with no respite in sight, it was decided to seek aid beyond
our borders, from a powerful Wizard who was said to live atop the distant
Sunrise Mountain. And so a party of four departed, headed by the elder
blacksmith, Garlimon; and they were never seen again." CR CR>
	       <TELL
"But as winter reached its icy hand toward us, another group was formed
with the same slim hope of finding answers to our desperate situation.
Bergon, the carpenter, was chosen to lead the party; and Bergon
chose Praxix, the local Wizard, and Esher, a learned (but irritable)
physician, to join him. And the group chose me, " TAG ", apprentice
food merchant, to watch the supplies and to keep a diary of our journey,
which, by the fortunes of the good earth, I recount for you now.">)
	      (START
	       <SETG ASTRIX-MAZE-PATH <+ <- <RANDOM 64> 1> 64>>
	       <CLEAR-SUBGROUP>
	       <TELL
"Our journey started on a day bright and clear, and we made quick
progress down the gently winding road that leads south, past the boundaries
of our valley." CR CR>
	       <TELL
"The air was warm, but the cool north wind at our backs
reminded us that winter was near. It seemed that we had only just
started out when we arrived at the outpost town of Lavos, shortly past
noon." CR CR>
	       <GRAPHIC ,G-LAVOS>
	       <TELL
"So this was Lavos! We stood in front of an old wooden storefront, that of
a provisioner. Farther down the road, the Lands End tavern
beckoned us with the promise of food and drink.">
	       <MOVE-TO ,LAVOS>)>)>

<ROOM LAVOS
      (TRAVEL-COMMANDS PROCEED-COMMAND ENTER-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT ADVISE)
      (GRAPHIC G-LAVOS)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"\"I suppose,\" Bergon said with a smile, \"that we've come to our first
decision. How are we set for supplies?\"" CR CR>
	       <TELL
"\"I'm sure we're well enough supplied,\" I said meekly. \"But I wouldn't mind
looking around the shop, if you wouldn't mind taking the time." CR CR>
	       <TELL
"\"Let's not disappoint " TAG ",\" Praxix said kindly. \"And who knows -
maybe we'll find something important there after all.\"">)
	      (PROCEED
	       <COND (<NOT <FSET? ,LANDS-END ,SEEN>>
		      <TELL
"We walked down the dusty road, stopping at the door of the tavern.
As we stood there, an unsavory looking man, approaching from the far
end of town, brushed past us and entered.">)
		     (<NOT <FSET? ,LANDS-END-TAVERN ,SEEN>>
		      <TELL
"Once again, we walked down that dusty road and stood at the door of
the tavern. Loud conversation could be heard within, and we were sorely
tempted to see what lay inside.">)
		     (T
		      <TELL
"We had seen town, such as it was, and it was now time to move on. ">
		      <GRAPHIC ,G-FORK>
		      <MOVE-TO ,NEWHALL-PASS ,LEAVE-LAVOS>
		      <RTRUE>)>
	       <MOVE-TO ,LANDS-END>)
	      (ENTER
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <TELL 
"We entered the provisioner's shop, and introduced ourselves to the
proprietor, a portly man named Webba. \"Look around, look around!\"
he said, proudly, though (if the truth be told) there was not much
to be proud of. Still, this would be our last chance to provision
ourselves before moving south to whatever lay beyond." CR CR>
	       <GRAPHIC ,G-WEBBA>
	       <MOVE-TO ,WEBBAS
"Scanning the shelves, filled mostly with foodstuffs, we could not fail
to notice an unusual map tacked to the wall behind the counter.">)>)>

;<GLOBAL MAP-PATH 0>

;<GLOBAL MAP-PATHS
	<LTABLE "lower-left" "lower-right" "upper-left" "upper-right">>

<ROOM WEBBAS
      (TEMP 0)
      (GRAPHIC G-WEBBA)
      (FLAGS PROVISIONER DONT-CAST INDOORS)
      (TRAVEL-COMMANDS EXIT-COMMAND NUL-COMMAND NUL-COMMAND)
      (ENTER FSET-SEEN)
      (EXIT
       <EXECUTE ()
		<COND (<IN? ,WEBBA-MAP ,INVENTORY>
		       <FSET ,WEBBA-MAP ,DONT-EXAMINE>)>
		<CLEAR-TEMP>>)
      (ACTION
       <ACOND WEBBAS-F ()
	      (SELL
	       <UPDATE-FSET ,HERE ,DONT-DROP>
	       <COND (<OBJECT? WEBBA-MAP>
		      <TELL
"\"No, you just keep the map,\" Webba said, returning the money we had paid for
it. \"If you're going on from here, you'll be needing whatever help you can get!\"">)
		     (T
		      <TELL
"\"Oh, dear me, no!\" was Webba's reply when we tried to sell him the " AO ". \"I'm
sure I've got a whole shelf of them out back somewhere.\"">)>)
	      (REPLY
	       <TELL
ACT " started to tell of our quest, and Webba shook his head,
resigned to having lost a good customer. \"This map will
not help you. I sell this item to 'tourists' - those curious enough to
visit, but not enough to go on!\" He laughed heartily, and told of the peculiar
man who offered him the map in exchange for a few worthless trinkets. Of course, the
map appeared equally worthless, though he thought it amusing, especially the faintly
flickering, oddly shaped runes that appeared on it. He ran his finger across the
map, as if to show us the originals, but none were even vaguely flickering,
and he soon gave up." CR CR>
	       <FSET ,WEBBA-MAP ,USED-UP>
	       <TELL
"\"The old man looked harmless enough,\" the shopkeeper continued, \"so I bought it.
But the map seemed awfully plain, if you know what I mean, so I added some runes of my
own - thought it looked more official that way! But, if I were trying to find my
way somewhere, I would sooner trust my brother's blind mule than this map!\"">
	       <END-OPTION>)
	      (IGNORE
	       <TELL
"Fearing to expose our quest, " ACT " shrugged off the question. Webba didn't
pursue the matter, but he now looked at us with grave concern.">
	       <END-OPTION>)
	      (LOOK-AROUND:REMOVE
	       <TELL
"\"I think I'll just have a look around,\" " ACT " said, as he wandered
off to explore the shop. \"Perhaps there's something more here than meets
the eye.\"">
	       <SET-TEMP ,ACTOR>
	       <MAKE-BUSY ,ACTOR ,GONE-COMMAND>
	       <RTRUE>)
	      (EXIT
	       <TRAVEL-COMMANDS ,LAVOS ,PROCEED-COMMAND>
	       <MOVE-TO ,LAVOS
"Leaving Webba's, we returned to the road. Ahead of us was the Lands End
tavern, and the raucous sounds of music and laughter could be heard even
from where we stood.">)>)>

<OBJECT WEBBA-FOOD
	(LOC WEBBAS)
	(SDESC "food")
	(KBD %<ASCII !\F>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL ACT
", who was by no means an expert on fine foods, browsed through the
food selection, though he could not find anything that he particularly
liked." CR CR>
		 <TELL
"\"Perhaps we should buy some of these things,\" he said, turning in
my general direction. I agreed to take a look around, though we were
not short of supplies.">)
		(BUY
		 <TELL
"I selected the most appetizing of the dry foodstuffs and
placed them in my pack; at least we wouldn't be worrying about
food for a few weeks, which was longer than we hoped to be
gone.">
		 <UPDATE-MOVE ,WEBBA-FOOD>)>)>

<ROOM LANDS-END
      (TRAVEL-COMMANDS PROCEED-COMMAND ENTER-COMMAND BACK-COMMAND)
      (FLAGS DONT-SCOUT INDOORS)
      (GRAPHIC G-LAVOS)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<FSET? ,WEBBAS ,SEEN>
		       <REMOVE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>)>>) 
      (ACTION
       <ACOND ()
	      (ENTER:REMOVE
	       <MOVE-TO ,LANDS-END-TAVERN
"Perhaps for refreshment, perhaps for news from abroad, or perhaps
just to relax once more before moving on, we entered the Lands End tavern.
People of all kinds were there, mostly talking to (or shouting at) each
other in small groups. Our entrance caused something of a stir, with most
everyone stopping to take note.">)
	      (PROCEED
	       <MOVE-TO ,NEWHALL-PASS ,LEAVE-LAVOS>)
	      (BACK
	       <TELL
"\"So, this is all there is,\" Esher said, shaking his head scornfully.
\"Perhaps we were hasty in passing over the provisioner's shop.\"" CR CR>
	       <TELL
"\"It could not hurt to check it out,\" Bergon replied, and we were soon
retracing our steps to the provisioner's door.">
	       <REMOVE-TRAVEL-COMMAND>
	       <MOVE-TO ,LAVOS>)>)>

<CONSTANT LEAVE-LAVOS
"It was mid-afternoon when we left Lavos, heading south. The road,
which soon narrowed to a simple foot path, wound its way down into a deep
canyon, surrounded by sheer walls. After a short time, we found ourselves
at a fork in the path, the left branch leading east along the foothills and
the right one continuing down the valley to the south. Both appeared desolate
and poorly traveled. I wondered which path Garlimon's party had taken, and
how near they had come to reaching Astrix. And then, a cold, bone-dry wind
arose from the north, filling me with dread.">

<OBJECT LANDS-END-PEOPLE
	(LOC LANDS-END-TAVERN)
	(FLAGS DONT-TAKE)
	(SDESC "customers")
	(KBD %<ASCII !\C>)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (<GET-TEMP>
			<FSET ,ACTION-OBJECT ,EXAMINED>
			<TELL
"Praxix motioned toward a particularly dark corner of the tavern, where Esher
was now conversing with someone whose face was obscured in shadow." CR CR>
			<TELL
"\"Perhaps we shall learn something of value from our friend Esher,\" he
said.">)
		       (T
			<FSET ,HERE ,INCAPACITATED>
			<TELL
"Praxix slowly scanned the faces of the customers, but none returned his
gaze. Indeed, although everyone here appeared to know who we were, none 
would acknowledge our presence." CR CR>
			<TELL
"The almost palpable tension inside the tavern made me ill at ease, and I
believe Praxix felt this as well, though he was not nearly as alarmed as I.
\"We have barely left home and already you see danger everywhere you turn,\"
he said, reassuringly. \"Have a">
			<COND (<FSET? ,LANDS-END-DRINKS ,SEEN>
			       <TELL "nother">)>
			<TELL " drink! Do not despair!\"">)>)>)>

<OBJECT LANDS-END-DRINKS
	(LOC LANDS-END-TAVERN)
	(FLAGS DONT-EXAMINE)
	(SDESC "drinks")
	(KBD %<ASCII !\D>)
	(ACTION
	 <ACOND ()
		(BUY
		 <COND (<FSET? ,LANDS-END-DRINKS ,SEEN>
			<REMOVE ,HYE-DRINKS>
			<TELL
"I suggested that another drink might not hurt, but Bergon suggested
that I had had quite enough." CR CR>
			<TELL
"\"We wouldn't want you walking over any cliffs, or falling into
chasms,\" he said.">
			<COND (<FSET? ,HERE ,INCAPACITATED>
			       <TELL CR CR
"The Wizard looked over his shoulder toward me and shrugged, then
emptied his tankard of ale in a single gulp.">)>
			<UPDATE-MOVE ,LANDS-END-DRINKS>)
		       (T
			<FSET ,LANDS-END-DRINKS ,SEEN>
			<TELL
"Stepping up to the bar, we ordered ourselves a few tankards of ale. Though
bitter by our standards, it was nevertheless refreshing, and we passed
some time there with idle talk about the journey that was to come.">)>)>)>

<ROOM LANDS-END-TAVERN
      (TRAVEL-COMMANDS EXIT-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS PROVISIONER DONT-CAST)
      (GRAPHIC G-ZAN-TAVERN ;G-TAVERN)
      (TEMP 0)
      (ENTER FSET-SEEN)
      (EXIT
       <EXECUTE () <CLEAR-TEMP>>)
      (ACTION
       <ACOND ()
	      (LOOK-AROUND
	       <TELL
"It took Esher just a few moments to become restless, and he soon slipped
away from us to mingle with the crowd." CR CR>
	       <TELL
"\"Who knows?\" he said, all but disappearing into the tavern's smoke-filled
air, \"I may even learn something useful.\"">
	       <COND (<NOT <FSET? ,LANDS-END-PEOPLE ,EXAMINED>>
		      <UPDATE-MOVE ,LANDS-END-PEOPLE ,HERE>)>
	       <SET-TEMP ,ACTOR>
	       <MAKE-BUSY ,ACTOR ,GONE-COMMAND>
	       <RTRUE>)
	      (EXIT
	       <COND (<AND <GET-TEMP> <NOT <QSET? ,MINAR ,SEEN>>>
		      <GRAPHIC ,G-MINAR>
		      <TELL
"On our way out, Esher rejoined us, telling of an intriguing conversation he had just
had with one of the locals. Before he could go on, the unsavory man we had seen
before stepped outside and pushed his way into our midst. Bergon, flushed with anger,
grabbed his sword, but Esher held him back. \"This is the man I was telling you
about,\" he said with no particular enthusiasm." CR CR>
		      <CLEAR-BUSY>
		      <TELL ,MINAR-INTRO>
		      <OPTION ,LEADER
			      ,ACCEPT-COMMAND
			      ,DECLINE-COMMAND
			      ,GET-ADVICE-COMMAND>
		      <FSET ,HERE ,ADVISE>
		      <SETG UPDATE-FLAG T>
		      <RTRUE>)
		     (T
		      <TELL
"It was Bergon's opinion that we had tarried here long enough, so we left
the tavern, returning to the road">
		      <COND (<FSET? ,LANDS-END-DRINKS ,SEEN>
			     <TELL " refreshed, and, if I might say,
with a good, warm feeling in our bellies">)>
		      <TELL ".">
		      <MOVE-TO ,LANDS-END>)>)
	      (ACCEPT
	       <TELL D ,LEADER
" appeared troubled, but agreed to Minar's request. \"It is against the
wishes of our Elders, yet we know little of the world that lies beyond Lavos.
We shall take the stranger!\"">
	       <PARTY-ADD ,MINAR>
	       <END-OPTION <>>
	       <MOVE-TO ,LANDS-END>)
	      (DECLINE
	       <TELL D ,LEADER
" thought for a moment, then spoke. \"Wiser men than ourselves have
set our number at four. Though our perils be unknown to us, we must not
lightly bend the wishes of those who have set us upon our way.\" And with
that, he dismissed Minar, who slinked back into the tavern.">
	       <FSET ,MINAR ,SEEN>
	       <END-OPTION <>>
	       <MOVE-TO ,LANDS-END>)
	      (<AND <ACTION? GET-ADVICE>
		    <EQUAL? ,PARTY-MODE ,OPTION-MODE>>
	       <FCLEAR ,HERE ,ADVISE>
	       <TELL
"None spoke, yet all frowned, if only a little, at the prospect of bringing
this stranger into our group.">
	       <OPTION ,LEADER ,ACCEPT-COMMAND ,DECLINE-COMMAND>)>)>

<ROOM NEWHALL-PASS
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND NUL-COMMAND)
      (FLAGS ADVISE)
      (GRAPHIC G-FORK)
      (ENTER
       <EXECUTE ()
		<FCLEAR ,WEBBA-MAP ,DONT-EXAMINE>
		<ADD-TRAVEL-COMMAND ,PRAXIX ,TELL-LEGEND-COMMAND>>)
      (EXIT
       <EXECUTE () <FSET ,WEBBA-MAP ,DONT-EXAMINE>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <COND (<FSET? ,HERE ,SCOUTED>
		      <TELL
"Having considered Minar's report, Bergon asked each of us for our advice.
Esher, Minar, and I favored taking the righthand path and avoiding the
bandits altogether. Praxix, however, was intensely curious as to the meaning
of the bloodstained clothing, feeling that it might relate to the mystery
surrounding the disappearance of Garlimon's party. Bergon listened carefully,
though he kept his thoughts to himself.">)
		     (<IN-PARTY? ,MINAR>
		      <TELL
"Bergon asked for our advice, but only Minar spoke. \"If our goal is the Sunrise
Mountain,\" he said, \"we should have better luck keeping to the left.\"">)
		     (T
		      <TELL
"It felt like hours had passed while we stood at the fork, looking this way
and that, not knowing which would lead more quickly to our destination. Perhaps
it would not matter, yet we feared that time was critial and that our decision
here would be crucial to our success.">)>)
	      (SCOUT:REMOVE
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL ACT
" grudgingly agreed to run on ahead and check out both paths; when he
arrived back, breathless, he was reticent." CR CR>
		      <TELL
"\"Well,\" Bergon prompted, expecting some sort of information to be
forthcoming." CR CR>
		      <TELL
"\"How should I know?\" Esher replied, \"I've never been here
before, and they just look like paths to me. If it's advice you're
after, I say let's go left - there's less climbing that way.\"">
		      <UPDATE-FCLEAR ,HERE ,ADVISE>)
		     (T
		      <TELL
"Bergon asked Minar to scout out the paths before us, but Minar, sensing
an insult, was initially disinclined to do so." CR CR>
		      <SETG FORK-BANDITS <RANDOM 2>>
		      <TELL
"\"I have no need to scout these paths,\" he said harshly, \"for I have
travelled them many times. If we seek the Sunrise Mountain, our best
path is to the left.\"" CR CR>
		      <TELL
"But then, Minar's voice softened. \"However, these are dangerous times,
and we may have been followed.\" And with that, he quietly disappeared down
the lefthand path. When he returned, he shook his head knowingly."
CR CR>
		      <SETG FORK-BANDITS 1>
		      <TELL
"\"It is as I feared. Not long after I left, I discovered this.\" He held up
a shredded piece of clothing, similar to our own, stained heavily with dried
blood. \"There is more - there are fresh tracks in the ground - three or four,
I would say. No doubt they are bandits, and they lie in wait for us. Also,
sunset is near. We must hope to do better down the other path.\""> 
		      <FSET ,HERE ,SCOUTED>)>) 
	      (LEFT
	       <COND (<AND <EQUAL? ,FORK-BANDITS 1>
			   <FSET? ,HERE ,SCOUTED>
			   <IN-PARTY? ,MINAR>>
		      <TELL
"Although Minar had cautioned us against taking this route, Bergon chose to ">
		      <COND (<NOT <FSET? ,HERE ,ADVISE>>
			     ;"Got advice from group..."
			     <TELL "take Praxix' advice and ">)>
		      <TELL "proceed ">)
		     (T
		      <TELL
"We chose to remain north of the mountains, following the path which led">)>
	       <MOVE-TO ,CANYON-COUNTRY
" east through the foothills. The sun was already low in the sky, and after
an hour's march, we stopped for the night.">)
	      (RIGHT
	       <COND (<EQUAL? ,FORK-BANDITS 2>
		      <TELL
"Although Minar had cautioned us against taking this route, Bergon chose to
proceed southward, following a steeply winding path that led down
through a narrow canyon.">)
		     (T
		      <TELL
"Choosing the southern route, we descended through a steeply winding
canyon.">)>
	       <MOVE-TO ,SYLMAR
" It was now late in the day, and we soon decided to stop for the night.">)>)>

<CONSTANT MINAR-INTRO
"\"I am called Minar, and I have travelled often in the Outlands. You are in
great danger, whether you know it or not. If you will have me, I offer you my
services.\" Minar's eyes flickered with a disturbing light, but saying nothing,
we awaited the decision of Bergon.">

<GLOBAL FORK-BANDITS <>>

<GLOBAL BANDITS-SPELL <>>

<OBJECT BANDITS-FIGHT
	(GRAPHIC G-BANDITS)
	(ACTION
	 <ACOND ()
		(SCENE-START
		 <UPDATE-MOVE ,BANDITS ,HERE>
		 <TELL CR CR
"Not a minute after locating a campsite, we were suddenly attacked by a
small gang of bandits." CR CR>
		 <SETG COMBAT-ROUND -1>
		 ;"Run first round, since surprised"
		 <SURPRISE-COMBAT>)
		(SCENE-END
		 <UPDATE-REMOVE ,BANDITS>
		 <GRAPHIC <GETP ,HERE ,P?GRAPHIC>>
		 ;"Restore previous graphic..."
		 <COND (,BANDITS-SPELL
			<TELL CR CR
"It was about this time that Praxix was ready to cast his \""
D ,BANDITS-SPELL "\" spell. But looking around for the first time
since he had started, he came to the belated realization that it
was no longer necessary.">
			<COND (<IN-PARTY? ,ESHER>
			       <TELL CR CR
"\"Would that we had a medal for valor,\" Esher said, patting Praxix
on the back and pouring on the sarcasm. \"I feel safer in battle just
knowing that you are with us.\"">)>
			<CLEAR-BUSY>)>
		 <COND (<NOT <IN-PARTY? ,ESHER>>
			<TELL CR CR
"The battle was now over, and we would have to go on without the
services of our physician. Praxix performed a brief ceremony, after
which we laid our friend to rest in a deep grave in the shade of a sycamore
tree, and marked the spot with a rock cairn.">)
		       (T
			<MAKE-UNBUSY ,MINAR>)>
		 <TELL CR CR
"It was now late, so we set up camp, taking turns on guard through the night.
Later, I dreamed that we stood on a high precipice, far above the clouds; storms
surrounded us, and violent gusts of wind nearly swept us off our feet and down
into a dark abyss. And then, the wind changed, and a gentle breeze blew, and we
were carried off that precipice. But we were not afraid as we glided and soared
through the ocean of still, clear air." CR CR>
		 <TELL
"When morning came, misty and still, we packed silently and prepared to move
onward. But the dream stayed with me, and in later days I would think of it often,
sensing in it a foreshadowing of things to come - but when, or in what manner, I
could not know.">)
		(COMBAT-RESULT
		 <COND (<ZERO? ,COMBAT-ROUND>
			<COND (<EQUAL? ,FORK-BANDITS 1 2>
			       ;"Went into fight intentionally"
			       <TELL
"Having been warned of our danger, we reacted quickly and surely. I
had never been in battle before, but it was clear that Bergon
was our strongest fighter, wielding a heavy broadsword. Esher, surprisingly,
was also a good fighter, and he easily handled the sword thrusts of his
opponent. Praxix and I, however, were new to this sort of thing, and were
satisfied with merely staving off injury.">)
			      (T
			       <TELL "Caught completely unawares, w">
			       <HINT ,HINT-BANDITS>
			       <BANDITS-KILL-ESHER>)>)
		       (T
			<COND (<IN-PARTY? ,ESHER>
			       <TELL
"Just then, a previously unseen attacker approached Esher from behind with
a large club. Not a moment before he">
			       <COND (<FSET? ,HERE ,TRIED>
				      <TELL
" would have been hit, a sword ripped through the attacker's chest. Placing
his foot on the attacker's back, Minar kicked the mortally wounded attacker to
the ground and smiled. Clearly, Minar had done this sort of thing before, and
what's more, he seemed to enjoy it. But the grotesque look on his victim's face
filled me with dread and revulsion.">)
				     (T
				      <TELL
" was hit, I screamed a warning, but it was too late. W">
				      <HINT ,HINT-BANDITS-FLANK>
				      <BANDITS-KILL-ESHER>)>
			       <TELL CR CR>)>
			<COND (<NOT <IN-PARTY? ,ESHER>>
			       <TELL "Our fortunes were finally improving">)
			      (T
			       <TELL "The battle was ">
			       <COND (<EQUAL? ,FORK-BANDITS 0>
				      <TELL "finally ">)>
			       <TELL "going well">)>
			<TELL "; Bergon">
			<COND (<IN-PARTY? ,ESHER>
			       <TELL ", Esher,">)>
			<COND (<IN-PARTY? ,MINAR>
			       <TELL " and Minar">)>
			<COND (<OR <IN-PARTY? ,MINAR> <IN-PARTY? ,ESHER>>
			       <TELL " were">)
			      (T
			       <TELL " was">)>
			<TELL " making some deadly hits with ">
			<COND (<OR <IN-PARTY? ,MINAR> <IN-PARTY? ,ESHER>>
			       <TELL "their weapons">)
			      (T
			       <TELL "his sword">)>
			<TELL ", and the bandits appeared weaker in their
resolve to fight, taking ever more to the defensive.">)>
		 <RTRUE>)
		(CAST
		 <SETG BANDITS-SPELL ,ACTION-OBJECT>
		 <TELL
"In the midst of the fighting, Praxix started preparing a spell of some sort.
It wasn't easy, though, and it appeared we would not be seeing the spell's
effects for some time.">
		 <MAKE-BUSY ,PRAXIX>
		 <NEW-DEFAULT>
		 <RTRUE>) 
		(<AND <ACTION? COMBAT>
		      <NOT <FSET? ,BANDITS-FIGHT ,SEEN>>
		      <NOT <IN-PARTY? ,MINAR>>
		      <EQUAL? ,COMBAT-ROUND 0>>
		 <FSET ,BANDITS-FIGHT ,SEEN>
		 <TELL
"As we prepared to continue the fight, it was clear that something was wrong
in the ranks of the bandits; one dropped dead in his tracks before we
had commenced." CR CR>
		 <PUTP ,BANDITS
		       ,P?STATUS
		       </ <* <GETP ,BANDITS ,P?STATUS> 3> 4>>
		 <RFALSE>)
		(FLANK
		 <COND (<EQUAL? ,ACTOR ,MINAR>
			<MAKE-BUSY ,MINAR ,GONE-COMMAND>
			<FSET ,HERE ,TRIED>
			<TELL
"We almost didn't notice that Minar had quietly slipped away, snaking his way
through the brush to take up a position behind that of the bandits.">)
		       (T
			<CHANGE-CIT ,MINAR 1 ,NUL-COMMAND>
			<TELL ACT
" thought there would be some advantage to sneaking around the bandits'
flank, but he was too large a man and too involved in the battle itself to do
this without attracting notice.">)>
		 <CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>
		 <NEW-DEFAULT>)
		(<AND <ACTION? STRENGTH>
		      <FSET? ,BANDITS-FIGHT ,SEEN>>
		 ;"He's sniping from nearby.."
		 <ADD-PARTY-OFFENSE 40>
		 <ADD-PARTY-DEFENSE 10>
		 <RFALSE>)
		(ACCEPT
		 <TELL D ,LEADER
", still troubled, agreed. ">
		 <COND (<FSET? ,MINAR ,SEEN>
			<TELL "\"It seems we cannot be rid of you,
so you may as well join us.\" ">)>
		 <TELL "Praxix appeared uneasy with
Bergon's decision, but, as for me, I was happy to take any help
we were offered.">
		 <TRAVEL-COMMANDS ,ESHER ,EXAMINE-COMMAND>
		 <END-OPTION>
		 <END-COMBAT <>>
		 <PARTY-ADD ,MINAR>
		 <RTRUE>)
		(RETREAT
		 <REMOVE-PARTY-COMMAND ,RETREAT-COMMAND>
		 <TELL
"Any thought of retreating from these bandits would soon be forgotten, as it
became clear that we were far stronger than they.">)
		(PARLEY
		 <REMOVE-PARTY-COMMAND ,PARLEY-COMMAND>
		 <CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>
		 <COND (<IN-PARTY? ,MINAR>
			<CHANGE-CIT ,MINAR 1 ,NUL-COMMAND>)>
		 <TELL
"Hoping to avoid a bloody battle, we attempted to parley with the bandits,
but they declined with words hardly fit to print. The attempt, however,
cost us precious time in battle and made it virtually impossible for us
to make any surprise moves.">)
		(GET-ADVICE:REMOVE
		 <TELL
"The group, grateful for Minar's help, was quiet, yet none came out against
taking in this inscrutable stranger.">
		 <OPTION ,LEADER ,ACCEPT-COMMAND ,DECLINE-COMMAND>)
		(DECLINE
		 <TELL D ,LEADER
" was firm. \"We are thankful for your help, but we must ">
		 <COND (<FSET? ,MINAR ,SEEN> <TELL "again ">)>
		 <TELL
"refuse your offer. Good luck be with you!\" And, ">
		 <COND (<FSET? ,MINAR ,SEEN> <TELL "as before">)
		       (T <TELL "without further ado">)>
		 <TELL
", Minar left, disappearing into the shadows.">
		 <HINT ,HINT-MINAR>
		 <END-OPTION>
		 <END-COMBAT <>>
		 <RTRUE>)>)>

<ROUTINE BANDITS-KILL-ESHER ()
	 <PARTY-REMOVE ,ESHER>
	 <TELL
"e watched in horror as Esher was felled by a single blow of his attacker's
club. The rest of our group, weapons drawn, began to take the initiative and
scored some deadly hits of our own.">>

<OBJECT BANDITS
	(SDESC "bandits")
	(KBD %<ASCII !\B>)
	(ATTACK 120 60)
	(STATUS 100)
	(RETREAT 60)
	(FLAGS DONT-EXAMINE DONT-TAKE)
	(SPECIAL-ACTION
	 <EXECUTE ()
		  <TELL CR
"The bandits, finding the fight more than they had bargained for,
retreated out of sight.">
		  <COND (<FSET? ,BANDITS-FIGHT ,SEEN>
			 <COND (,BANDITS-SPELL
				<UNUSE-ESSENCES ,BANDITS-SPELL>
				<SETG BANDITS-SPELL <>>
				<TELL
" Praxix, seeing that there was no need for his magic, put away his pouch.">)>
			 <CLEAR-BUSY>
			 <TELL " A moment later, ">
			 <COND (<FSET? ,MINAR ,SEEN>
				<TELL "Minar">)
			       (T
				<TELL
				 "the man we had seen entering the tavern">)>
			 <TELL " appeared, bow in
hand. \"I thought you might be needing some help,\" he said, grinning." CR CR>
			 <COND (<FSET? ,MINAR ,SEEN>
				<TELL
"\"My previous offer stands, and this time I would advise you to
accept it.\" He stood there, grinning all the time, waiting for our
answer.">)
			       (T
				<TELL ,MINAR-INTRO>)>
			 <OPTION ,LEADER
				 ,ACCEPT-COMMAND
				 ,DECLINE-COMMAND
				 ,GET-ADVICE-COMMAND>)
			(T
			 <END-COMBAT <>>)>
		  <RTRUE>>)>

<ROOM SYLMAR
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-BEHIND-MOUNTAINS)
      (FLAGS DANGEROUS)
      (ENTER
       <EXECUTE ()
		<COND (<EQUAL? ,FORK-BANDITS 2 0>
		       <SETG OPPONENT ,BANDITS>
		       <SCENE ,BANDITS-FIGHT ,FIGHT-MODE>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"The path curved toward the east along the foothills of the mountains,
and we were soon forced to choose between climbing higher or veering
off and into the southern valley. But there was no choice, really, since
our goal was to the east; it would be impossible to avoid the mountains, so
we started our ascent." CR CR>
	       <TELL
"The climb was long and arduous, and it was not until late in the second day
that we reached a plateau high in the mountains. But it was dark, and little
could be seen. And so we camped there under a starry sky." CR CR>
	       <COND (<AND <NOT <IN? ,ESSENCE-FIRE ,ESSENCES>>
			   <FSET? ,NEWHALL-PASS ,SCOUTED>
			   <NOT <IN? ,HINT-MINAR ,HINTS>>>
		      <HINT ,HINT-NO-FIRE>)>
	       <NEXT-DAY 2>
	       ;"**Segment change"
	       <GATE-TO-HIGH-PLAIN>)
	      (SCOUT:REMOVE
	       <CAIRN-SCOUT>
	       <RTRUE>)
	      (BACK:REMOVE
	       <TELL
"I suggested returning to Lavos, but the idea was immediately quashed
by the group." CR CR>
	       <TELL
"\"Our destiny lies ahead, not behind,\" Praxix said. \"Try to remember that.\"">)>)>

<ROOM CANYON-COUNTRY
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-CANYON)
      (FLAGS DANGEROUS)
      (ENTER
       <EXECUTE ()
		<COND (<EQUAL? ,FORK-BANDITS 1 0>
		       <SETG OPPONENT ,BANDITS>
		       <SCENE ,BANDITS-FIGHT ,FIGHT-MODE>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <COND (<AND <NOT <IN? ,ESSENCE-FIRE ,ESSENCES>>
			   <FSET? ,NEWHALL-PASS ,SCOUTED>
			   <NOT <IN? ,HINT-MINAR ,HINTS>>>
		      <HINT ,HINT-NO-FIRE>)>
	       <MOVE-TO ,TUJUNGA-PATH
"Getting an early start, we continued along the canyon floor as
the eastern mountains were backlit by the rising sun. Our
morning's march ended at a point where a narrow path rose
along switchbacks to the crest of the mountain range that lay to our
south.">)
	      (SCOUT:REMOVE
	       <CAIRN-SCOUT>
	       <RTRUE>)
	      (BACK:REMOVE
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL "Esher, dismayed by our confrontation with the bandits,">)
		     (T
		      <TELL "Disheartened by the loss of Esher, I">)> 
	       <TELL
" suggested backtracking toward Lavos, but the idea was quickly quashed
by the others who felt that we would make good progress along the path we
had chosen.">)>)>

<OBJECT CANYON-BODIES
	(FLAGS DONT-TAKE)
	(SDESC "bodies")
	(KBD %<ASCII !\B>)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <CLEAR-EXBIT>
		 <TELL ACT " examined the bodies">
		 <COND (<EQUAL? ,ACTOR ,ESHER>
			<TELL
" carefully. \"They were killed with sharp objects of some kind - swords and
knives, I would guess. Whatever weapons they may have carried are gone - in
fact, only their cloaks remain. I'd be willing to bet that they were waylaid
and robbed.\"">)
		       (T
			<FIND-ESSENCE ,ESSENCE-FIRE 2>
			<FIND-ESSENCE ,ESSENCE-WATER 1>
			<TELL
", discovering two small pouches of powders hidden within a seam of one of the
cloaks that had been used as a burial shroud. \"Fire essence,\" he beamed, opening
the first and holding it up for my inspection. \"Or I'm an apprentice food merchant!\"
And then, examining the second pouch, he found a far smaller amount of a different
powder. He dipped a finger into the powder, and touched it to his lips. \"And this
would be water essence, though barely enough for a single spell. And yet, all such
powders are nigh impossible to obtain these days, and much can be done with
them.\"">)>)>)>

<OBJECT CANYON-CAIRN
	(FLAGS DONT-TAKE)
	(SDESC "cairn")
	(KBD %<ASCII !\C>)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL
"At Bergon's request, Praxix looked over the cairn. \"The cairn was
made by our people and not by the locals from Lavos,\" he said.">)
		       (T
			<TELL
"\"This cairn looks like one of ours,\" " ACT " said, looking over the mound
of carefully piled rocks. \"Not at all like those we passed on the outskirts
of Lavos.\"">)>)>)>

<ROOM TUJUNGA-PATH
      (TRAVEL-COMMANDS PROCEED-COMMAND CLIMB-COMMAND NUL-COMMAND)
      (GRAPHIC G-CANYON)
      (ENTER
       <EXECUTE () <FCLEAR ,WEBBA-MAP ,DONT-EXAMINE>>)
      (EXIT
       <EXECUTE () <FSET ,WEBBA-MAP ,DONT-EXAMINE>>)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <TELL ACT " scouted out the climbing path, and reported that it
wound its way out of sight, high in the mountains." CR CR>
	       <TELL
"\"The shortest path to the Sunrise Mountain lies ahead, unless, of course, you
feel the urge to explore the high country,\" he said.">)
	      (PROCEED
	       <NEXT-DAY>
	       <MOVE-TO ,CANYON-GATE
"The winding canyon floor climbed ever higher toward the eastern mountains,
and by late afternoon, we had reached a convenient resting place, where we
decided to camp for the night.">)
	      (CLIMB
	       <TELL
"Opting for the high road, we started to climb into the southern
mountains. The path was narrow, and frequently choked with low
brush, making progress slow. By midday however, we had climbed
more than half of the distance to the ridge which hung above us. It took
the rest of the afternoon, but we finally arrived at the
ridge. We were all tired after our day of climbing, and so we camped there
for the night." CR CR>
	       <GRAPHIC ,G-HIGH-PLAIN>
	       <NEXT-DAY>
	       ;"**Segment change"
	       <MOVE-TO ,HIGH-PLAIN
"When we awoke, we headed east along the ridge, coming finally to
a high plain, thousands of feet above the valley below. Gentle,
rolling hills, covered in pines and firs surrounded us; but most
impressive, a large, glistening lake spread out a few thousand
paces ahead.">)>)>

<ROUTINE CAIRN-SCOUT ()
         <COND (<EQUAL? ,ACTOR ,MINAR>
		<UPDATE-MOVE ,CANYON-CAIRN ,HERE>
		<MOVE ,CANYON-BODIES ,HERE>
		<TELL ACT
" was sent out to explore the area around us. What he found brought little
cheer." CR CR>
		<TELL
"\"A rock cairn,\" he said, leading us to a shaded spot beneath a grove
of stately oaks, \"I am certain this was not here last summer, when I
camped in this same spot.\"" CR CR>
		<TELL
"Minar's words were ominous - whatever was buried here had not lain
long in the earth. Fearful over what we might find, we decided to dig up
whatever remains lay there. It was not long before we found what we were
after - three sets of human remains, their bodies mangled and bloodied, yet
covered with their own cloaks." CR CR>
		<TELL
"\"Garlimon's party!\" cried Bergon. \"But there are only three, not
four....\"" CR CR>
		<TELL
"\"And that is but part of the mystery,\" replied Praxix, \"Who, I wonder,
took the time to bury them? Surely not the assassins that tortured and
killed them.\"">)
	       (T
		<TELL
"Esher took a few moments to scout out the immediate area, but nothing
of interest caught his eye, excepting the few rabbits he suggested
might make a nice dinner.">)>>

<ROOM CANYON-GATE
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-CANYON)
      (ENTER
       <EXECUTE ()
		<COND (<AND ,2ND-PASS
			    <NOT <IN-PARTY? ,MINAR>>
			    <NOT <IN-PARTY? ,ESHER>>
			    <NOT <FSET? ,DWARF-MEETING ,TRIED>>>
		       ;"No kidnapping now..."
		       <ADD-PARTY-COMMAND ,COMB-AREA-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <MOVE-TO ,ANGELES-PATH
"After a refreshingly cool and comfortable night, we pressed on along
the path, coming finally to another path winding up into the southern
mountains.">)
	      (COMB-AREA:REMOVE
	       <TELL
"We split up into two groups in search of the Dwarves' gate; Praxix and I
went toward the hills, and ">
	       <COND (<EQUAL? ,PARTY-MAX 3>
		      <TELL "Bergon">)
		     (T
		      <TELL "the others">)>
	       <TELL " followed the canyon floor. Before
long, I found that I had wandered out of sight of Praxix.">
	       <OPTION ,TAG ,LOOK-AROUND-COMMAND ,GET-HELP-COMMAND>)
	      (SCOUT:REMOVE
	       <FSET ,HERE ,SCOUTED>
	       <SETG KIDNAPPED ,ACTOR>
	       <PARTY-REMOVE ,ACTOR>
	       <COND (<AND <NOT <IN-PARTY? ,ESHER>>
			   <NOT <IN-PARTY? ,MINAR>>>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>)>
	       <TELL D ,LEADER " sent " ACT " off to scout around the
area, which he did. After an hour, though, he had not returned and "
D ,LEADER " was alarmed enough to set us out
searching for him. We split up into two groups; Praxix and I went
toward the hills, and ">
	       <COND (<EQUAL? ,PARTY-MAX 3>
		      <TELL "Bergon">)
		     (T
		      <TELL "the others">)>
	       <TELL " followed the canyon floor. Before long, I found that I
had wandered out of sight of Praxix.">
	       <MAKE-SUBGROUP ,TAG>
	       <OPTION ,TAG ,LOOK-AROUND-COMMAND ,GET-HELP-COMMAND>)
	      (LOOK-AROUND
	       <COND (<QSET? ,HERE ,SEEN>
		      <OPTION ,TAG ,GET-HELP-COMMAND ,RETURN-COMMAND>
		      <TELL
"Having found these peculiar runes, I explored further in hopes of
discovering more artifacts. But my search was fruitless, and I had soon
wandered back to where I had started my explorations.">)
		     (T
		      <GRAPHIC ,G-GATE-RUNES>
		      <TELL
"Ambling aimlessly along the base of a rock cliff, something scurried by in
the tall brush. When I looked, nothing was there, but my eye caught some strange
lettering chiselled in the stone.">
		      <OPTION ,TAG
			      ,LOOK-AROUND-COMMAND
			      ,GET-HELP-COMMAND
			      ,RETURN-COMMAND>)>)
	      (GET-HELP
	       <COND (<AND <NOT <FSET? ,HERE ,SEEN>>
			   <NOT ,2ND-PASS>>
		      <TELL
"Unhappy at exploring alone, I called out for Praxix, who soon appeared. \"What
is it?\" he asked." CR CR>
		      <TELL
"When I told him of my uneasiness in exploring alone, he acted annoyed. \"Return
to our camp, then,\" he said, indicating the direction. \"I shall continue to
look for " D ,KIDNAPPED ".\"" CR CR>
		      <SETG ACTION ,RETURN-COMMAND>
		      <AGAIN>)
		     (T
		      <COND (,2ND-PASS
			     <TELL "Unhappy at exploring alone">)
			    (T
			     <TELL "Eager to share my discovery with the others">)>
		      <TELL ", I called out, and Praxix,
following the sound of my voice, appeared within moments. \"Well, what now?\" he
began, but as if by instinct, his eyes slowly wandered to ">
		      <COND (<FSET? ,HERE ,SEEN>
			     <TELL "the runes that I had discovered.">)
			    (T
			     <GRAPHIC ,G-GATE-RUNES>
			     <TELL "some runes that I hadn't noticed before,
chiselled into the stone.">)>
		      <TELL CR CR
			    "Praxix then called for ">
		      <COND (<EQUAL? ,PARTY-MAX 3> <TELL "Bergon">)
			    (T <TELL "the others">)>
		      <TELL ", who hurried to our side." CR CR>
		      <CANYON-GATE-OPENS>)>)
	      (ENTER
	       <TELL
"Slowly and cautiously, we passed through the gate and into the darkness. As if
on some malicious cue, the gate crashed shut behind us." CR CR>
	       <COND (<FSET? ,PRAXIX ,LIT>
		      <TELL
"We were fortunate indeed that Praxix had magically caused his staff to
glow, for the cavern itself was black as pitch.">)
		     (T
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL
"\"I don't suppose we have a torch anywhere,\" said Esher, knowing fully
well that we didn't. ">)>
		      <TELL
"It was dark as pitch, the outline of the gate as invisible now as it had been
earlier.">)>
	       <MOVE-TO ,BERN-I-LAV>)
	      (RETURN
	       <TELL
"Filled with apprehension, I returned to our camp. Before long the others had
also returned; there was no trace of ">
	       <COND (,KIDNAPPED <TELL D ,KIDNAPPED "!">)
		     (T <TELL "a gate.">)>
	       <COND (<NOT <FSET? ,HERE ,SEEN>>
		      <TELL CR CR
"\"We must face the fact that " D ,KIDNAPPED " is gone,\" Praxix said.
\"Let us continue on our way.\"">
		      <END-OPTION>
		      <CLEAR-SUBGROUP>
		      <FORCE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>
		      <RTRUE>)>
	       <TELL CR CR
"Later, questioned by Praxix, I told of my explorations. He listened
without interest until I came to the part about finding the runes, when he
startled me by jumping to his feet. \"Take me!\" he commanded, and I
did." CR CR>
	       <TELL
"The old Wizard studied the runes, then called for the others. ">
	       <CANYON-GATE-OPENS>)>)>

<ROUTINE CANYON-GATE-OPENS ()
	 <UPDATE-MOVE ,TALE-DWARF-GATES ,PRAXIX-TALES>
	 <MOVE ,TALE-DWARVES ,PRAXIX-TALES>
	 <TELL
"\"The runes here are very old, and ancient languages are not my specialty. But
the runes are Dwarvish, and long ago I learned some of their words. This first
rune, 'Bern,' means a 'gate', and this second one, 'Lav,' refers to 'the
plains'.\"" CR CR>
	 <TELL
"\"The gate to the plains,\" I said, putting two and two together. \"But from
where?\"" CR CR>
	 <TELL
"\"That is a simple question,\" Praxix replied, \"A more interesting one would
be 'How shall we get it to open?'\"">
	 <COND (<IN-PARTY? ,ESHER>
		<TELL CR CR
"\"Or better still, 'What do we do now?'\" snarled Esher as, to everyone's
surprise, a round gate appeared, yawning wide before us.">)
	       (T
		<TELL CR CR
"This was not to be a problem, for a round gate then appeared from
nowhere and opened.">)>
	 <COND (<NOT ,2ND-PASS>
		<TELL CR CR
"Of the group, only Praxix was genuinely pleased by our discovery, though he
was mystified as to just how it had happened. \"Perhaps it was something I
said,\" he offered, shrugging.">)>
	 <PUTP ,CANYON-GATE ,P?GRAPHIC ,G-GATE-RUNES>
	 <GRAPHIC <> ,G-GATE-OPENS ,BOTTOM-RIGHT>
	 <END-OPTION>
	 <CLEAR-SUBGROUP>
	 <ADD-TRAVEL-COMMAND ,HERE ,ENTER-COMMAND>
	 <UPDATE-FSET ,HERE ,NEAR-DARK>	 
	 <RTRUE>>

<ROUTINE CAVERN-GRAPHIC ()
	 <COND (<FSET? ,PRAXIX ,LIT>
		<GRAPHIC ,G-DARK-CAVERN>)
	       (T
		<COND (,BLACK-PICTURE-BORDER
		       <CLEAR ,GRAPHICS-WINDOW>)
		      (T
		       <GRAPHIC ,G-BLACK>)>
		;"Must have something in case of RESTORE..."
		<SETG CURRENT-GRAPHIC -1>)>>

<ROOM BERN-I-LAV
      (TRAVEL-COMMANDS EXIT-COMMAND PROCEED-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ENTER CAVERN-GRAPHIC)
      (ACTION
       <ACOND ()
	      (EXIT:REMOVE
	       <TELL
"We groped for the gate itself, or for some device that would open it, but
to no avail.">)
	      (PROCEED
	       <COND (<NOT <FSET? ,PRAXIX ,LIT>>
		      <TELL
"I meekly suggested trying to feel our way through what ever passage we were in,
and Bergon reluctantly agreed. \"We seem to have no other choice,\" he said." CR CR>)>
	       ;"**Segment change"
	       <MOVE-TO ,DWARF-MEETING-LOC
"Unsure of where this passage would lead, we slowly made our way through
the darkness.">)
	      (CAST
	       <COND (<OBJECT? LIGHT-SPELL>
		      <CAVERN-GRAPHIC>
		      <CAST-LIGHT>)>)>)>

<ROOM ANGELES-PATH
      (TRAVEL-COMMANDS PROCEED-COMMAND CLIMB-COMMAND NUL-COMMAND)
      (GRAPHIC G-CANYON)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"The sun peeked behind some high clouds as we wound our way along the
floor of the canyon. Ahead, the path climbed up a tall ridge, and
we arrived there as dusk approached and stood in awe of the world
that surrounded us." CR CR>
	       ;"**Segment change"
	       <MOVE-TO-FOREST-RIDGE>)
	      (SCOUT:REMOVE
	       <COND (<EQUAL? ,ACTOR ,MINAR>
		      <TELL ACT
" went ahead, paying close attention to the trail that climbed into the
mountains. \"It is a good trail,\" he said. \"As I recall, we can follow it
to a high ridge no more than a day's climb from here.\"">)
		     (T
		      <TELL ACT
" went ahead, reporting back that the trail appeared to be passable
as far as he could see, though it might well be more than a day's climb
to the top of the ridge.\"">)>)
	      (CLIMB
	       <TELL
"The trail was steep, winding its way high into the hills. At times, the trail
disappeared completely, and it was necessary to scout ahead to find the proper
path. But we pressed on, ever climbing, until we reached a spot about halfway
toward the top of the ridge." CR CR>
	       <NEXT-DAY>
	       ;"**Segment change"
	       <MOVE-TO ,HIGH-PLAIN
"After a full afternoon of climbing, we reached a high plain, thousands of feet
above the valley floor. Gentle, rolling hills, covered in pines and firs surrounded
us; but most impressive, a large, glistening lake spread out before us in a bowl
in the mountains. Tired from the climb, we soon feel asleep beneath a moonlit sky.">)>)>



