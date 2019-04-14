"HINTS for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<ROUTINE HINT (H) <MOVE .H ,HINTS>>

<GLOBAL GAME-WON? <>>

<COMMAND MUSINGS <> ("AUX" STR)
	 <CLEAR ,TEXT-WINDOW>
	 <COND (,GAME-WON?
		<HAVE-YOU-EVER-TRIED?>
		<RTRUE>)>
	 <TELL
"The following marginal notes appeared in " TAG "'s account of the
Journey:" CR CR>
	 <TELL
"[Warning: " TAG " gave great thought to the events he witnessed during his
Journey and was able to deduce the solutions to many of the mysteries and
puzzles that faced his party during those dark days. You are encouraged to solve
these puzzles without reference to the musings, as they may tend to reduce your
enjoyment of the game.]" CR> 
	 <REPEAT ()
	    <CLEAR-O-TABLE>
	    <FIND-OBJECTS ,HINTS>
	    <COND (<ZERO? <O-COUNT>>
		   <REMOVE-TRAVEL-COMMAND ,HERE ,MUSINGS-COMMAND>
		   <CLEAR-FIELDS>
		   <NEW-DEFAULT>
		   <RTRUE>)>
	    <FIND-OBJECT ,CANCEL-OBJECT>
	    <CLEAR-FIELDS>
	    <BOLD-CURSOR 1 1 <GET-COMMAND ,MUSINGS-COMMAND>>
	    <PRINT-COLUMNS>
	    <COMMAND-OBJECT-INPUT>
	    <TELL CR>
	    <COND (<CANCEL?>
		   <CLEAR-FIELDS>
		   <NEW-DEFAULT>
		   <RTRUE>)
		  (<APPLY <GETP ,ACTION-OBJECT ,P?ACTION>>
		   T)
		  (<SET STR <GETP ,ACTION-OBJECT ,P?NUDGE>>
		   <PUTP ,ACTION-OBJECT ,P?NUDGE <>>
		   <TELL .STR>)
		  (T
		   <TELL <GETP ,ACTION-OBJECT ,P?SOLUTION>>
		   <UPDATE-REMOVE ,ACTION-OBJECT>)>
	    <TELL CR>>>

<OBJECT HINTS>

<OBJECT HINT-STUMP
	(SDESC "Stump")
	(KBD %<ASCII !\S>)
	(SOLUTION
"I have always wondered about the stump Praxix found in the middle of a field of
flowers. Did it have some other meaning or purpose?")> 

<OBJECT HINT-NIGHTFANG
	(SDESC "Nightfang")
	(KBD %<ASCII !\N>)
	(ACTION
	 <EXECUTE ()
		  <UPDATE-REMOVE ,HINT-NIGHTFANG>
		  <TELL
"I have always wondered whether we could have saved " D ,BITE-VICTIM " from
the deadly bite of the Nightfang.">
		  <COND (<FSET? ,ELFSTREAM-1 ,SEEN>
			 <TELL
" Could the woman at the stream have helped if I had approached her?">)
			(T
			 <TELL
" Would it have helped if I had followed the stream?">)>
		  <TELL
" Was there someplace else Praxix could have explored?">>)>

<OBJECT HINT-BITE-FOREST
	(SDESC "Forest")
	(KBD %<ASCII !\F>)
	(SOLUTION
"I wonder what I would have found had I explored the path following the stream.
Perhaps it didn't matter, since Praxix found the westflake root and saved our
friend from the Nightfang.")>

<OBJECT HINT-WOOD-ELF
	(SDESC "Forest")
	(KBD %<ASCII !\F>)
	(SOLUTION
"Perhaps I was too hasty in running away from the creature by the waterfall.")>

<OBJECT HINT-ELF-SPEAK
	(SDESC "Elves")
	(KBD %<ASCII !\E>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <FSET? ,ELFSTREAM-1 ,BLUE-MIX>>
			 <TELL
"Perhaps I should have tried talking to the Elf, even though there was little
chance of being understood.">)
			(<NOT ,SPOKE-ELVISH>
			 <TELL
"I might have tried speaking Elvish, though I don't know whether I
could have said anything meaningful.">)
			(<AND <FSET? ,STORY-ELVES ,SEEN>
			      <NOT <QSET? ,STORY-ELVES ,USED-UP>>>
			 <TELL
"Thinking back, I'm certain I heard one of our party saying some Elvish words;
clearly, I should have paid closer attention.">
			 <RTRUE>)
			(<FSET? ,STORY-ELVES ,SEEN>
			 <TELL
"I believe Hurth said something about his meeting the Elves. What strikes
me is that his father, Agrith, was their friend. Was there any way I could tell
them that I was a friend of Agrith?">)
			(<NOT <QSET? ,STORY-ELVES ,USED-UP>>
			 <TELL
"I don't believe I heard any of our party speaking Elvish, so I can't see
how I could have communicated with the Elf. It's possible, of course, that
either Praxix or Hurth might have known the language, but nothing they said
indicated it.">
			 <RTRUE>)
			(T
			 <TELL
"I wonder if Hurth knew any stories about the Elves that would have helped
me communicate with them.">)>
		  <UPDATE-REMOVE ,HINT-ELF-SPEAK>>)>

<OBJECT HINT-RIVER
	(SDESC "River")
	(KBD %<ASCII !\R>)
	(NUDGE
"We should have been more cautious crossing such a swiftly flowing river.")
	(SOLUTION
"In order to cross, it is now clear that we had to start as far upstream as
possible, and then paddle across the river with all our strength.")>

<OBJECT HINT-LAKE
	(SDESC "Lake")
	(KBD %<ASCII !\L>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <FSET? ,LAKE-POOL ,SEEN>>
			 <TELL
"I do not know why we failed to explore the area around the lake
for clues to " D ,LAKE-VICTIM "'s disappearance.">)
			(<NOT <FSET? ,UL-2 ,SEEN>>
			 <TELL
"I do not understand our hesitation to more fully explore the
cave and the pool we had found within it.">)
			(<AND ,NYMPHS-COMING? <NOT <FSET? ,UL-2 ,TRIED>>>
			 ;"Didn't hide..."
			 <TELL
"If only I could have avoided the strange creatures that had captured " D
,LAKE-VICTIM ". I may have inadvertantly worsened my chances by allowing
myself to have been seen by one of them earlier.">)
			(,NYMPHS-COMING?
			 <TELL
"If I had explored more quickly, I might have averted discovery by the creatures
that had captured " D ,LAKE-VICTIM ".">)
			(T
			 <TELL
"Perhaps if I had allowed more time for " D ,LAKE-VICTIM " to have regained
consciousness, I could have rescued him.">)>
		  <UPDATE-MOVE ,HINT-LAKE>>)>

<OBJECT HINT-NYMPH-STONE
	(SDESC "Nymphs")
	(KBD %<ASCII !\N>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <FSET? ,UL-TREASURY ,SEEN>>
			 <TELL
"Perhaps I should have spend more time exploring the Nymphs' world.">)
			(<NOT <FSET? ,NYMPH-STONE ,TRIED>>
			 ;"Didn't try taking it"
			 <TELL
"Knowing that we needed the Nymph Stone, why did I not try to take it when
I had the chance?">)
			(<AND <FSET? ,UL-TREASURY ,SCOUTED>
			      <NOT <QSET? ,HINT-NYMPH-STONE ,BLUE-MIX>>>
			 ;"Couldn't leave with stone..."
			 <TELL
"I could not remove the Nymph Stone by normal means; was there another way?">
			 <RTRUE>)
			(<FSET? ,UL-PIT ,TORCHBIT>
			 ;"Never got a torch..."
			 <TELL
"Exploration of the Nymphs' world would have been easier with a
portable light source. But I didn't try taking all of the torches!">)			
			(<AND <NOT <FSET? ,UL-2-PIT ,SCOUTED>>
			      <NOT <FSET? ,UL-TREASURY-PIT ,SCOUTED>>>
			 ;"Never moved a grate"
			 <TELL
"I wonder at the significance of the circular stone pieces. Could they
have been moved?">)
			(<ZERO? ,UL-DROPPED>
			 ;"Never dropped something into pool"
			 <TELL
"What was the meaning of the pits? I couldn't find out where they led, or
could I?">)				  
			(T
			 ;"Dropped something; didn't figure it out."
			 <TELL
"I think I was on the right track when I tried dropping things into the pools.
Where did they lead?">)>
		  <UPDATE-REMOVE ,HINT-NYMPH-STONE>>)> 

<OBJECT HINT-ELVES
	(SDESC "Elf Home")
	(KBD %<ASCII !\E>)
	(ACTION
	 <EXECUTE ()
		  <UPDATE-REMOVE ,HINT-ELVES>
		  <COND (<FSET? ,FOREST-FIRE ,TRIED>
			 <TELL
"It is unfortunate that Praxix hadn't enough water essence to put out the
Elves' fire. Perhaps there was more water essence to be found, or less that
could have been used earlier?">)
			(<FSET? ,FOREST-FIRE ,SEEN>
			 <TELL
"I regret that, in our haste to find Astrix, we did not try to help the
Elves try to contain the great fire that burned to the north.">)
			(<NOT <FSET? ,ESSENCE-WATER ,SCOUTED>>
			 ;"Never found water..."
			 <TELL
"We would have helped the Elves if it were possible, but it seemed we had no
means to accomplish the task.">)
			(T
			 <TELL
"I suppose we could have helped the Elves with their fire; perhaps Praxix had some
reason for standing by and doing nothing.">)>>)>

<OBJECT HINT-DWARVES
	(SDESC "Dwarves")
	(KBD %<ASCII !\D>)
	(SOLUTION
"I don't know why Bergon decided to fight the Dwarves; though they
surprised us and were formidably armed, they did not attack.")>

<OBJECT HINT-DWARF-LIE
	(SDESC "Dwarves")
	(KBD %<ASCII !\D>)
	(SOLUTION
"I wish we had been able to enlist the aid of the Dwarves in our quest.
Perhaps we got off on the wrong foot with them.")>

<OBJECT HINT-RUNES
	(SDESC "Runes")
	(KBD %<ASCII !\R>)
	(SOLUTION
"I feel certain that we did not pay close enough attention to the runes that were
inscribed on the walls of the Dwarvish cavern.")>

<OBJECT HINT-ORC-FIGHT
	(SDESC "Orc Fight")
	(KBD %<ASCII !\O>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <QSET? ,HINT-ORC-FIGHT ,BLUE-MIX>>
			 <TELL
"Did we fight to our best advantage? I think not.">
			 <RTRUE>)
			(<NOT <FSET? ,ORC-FIGHT ,SEEN>>
			 <TELL
"Perhaps things would have gone differently if we had gained the element
of surprise by sending one of our party to flank the orcs.">)
			(<FSET? ,ORC-FIGHT ,BLUE-MIX>
			 <TELL
"Sending one of our party to flank the orcs was a good move, but its effect
would have been greater if we had thought of it earlier.">)
			(<NOT ,ORC-FIGHT-SPELL>
			 <TELL
"Even with the element of surprise, we were not strong enough for the orcs.
Maybe Praxix' magic could have helped things along.">)
			(T
			 <TELL
"The right spell might have made all the difference in our fight with the
orcs - something to slow them down perhaps. But what?">)>
		  <UPDATE-REMOVE ,HINT-ORC-FIGHT>>)>
	  
<OBJECT HINT-AVALANCHE
	(SDESC "Avalanche")
	(KBD %<ASCII !\A>)
	(ACTION HINT-MAP)>

<OBJECT HINT-MTN-LION
	(SDESC "Mtn. Lion")
	(KBD %<ASCII !\M>)
	(ACTION HINT-MAP)>	

<OBJECT HINT-WEBBA-MAP
	(SDESC "Astrix")
	(KBD %<ASCII !\A>)
	(ACTION HINT-MAP)>

<ROUTINE HINT-MAP ()
	 <COND (<FSET? ,WEBBA-MAP ,INCAPACITATED>
		<TELL
"The map had been rendered useless; if only we had found a better way out of the
underground tunnel!">)
	       (<AND <FSET? ,WEBBA-MAP ,SOLVED>
		     <IN? ,WEBBA-MAP ,INVENTORY>>
		;"We made it glow, but never used it?"
		<TELL
"I don't understand why we didn't examine Webba's map more often. Perhaps it would
have helped show the way to Astrix.">)
	       (<AND <FSET? ,WEBBA-MAP ,USED-UP>
		     <IN? ,WEBBA-MAP ,INVENTORY>>
		;"Got the explanation..."
		<TELL
"I fear there is something we missed in Webba's explanation of the circumstances
surrounding his acquisition of the mysterious map we purchased.">)
	       (<IN? ,WEBBA-MAP ,INVENTORY>
		<TELL
"We never did find out what the strange runes on the map we bought at
Webba's meant. Perhaps if we had spoken to him, he would have explained.">)
	       (T
		<TELL
"I don't know how we might have avoided the grizzly scene at the Sunrise
Mountain. We had no map, and all paths looked similar. Perhaps it was
unavoidable.">)>
	 <UPDATE-REMOVE ,ACTION-OBJECT>>

<OBJECT HINT-ALLERGY
	(SDESC "Hurth")
	(KBD %<ASCII !\H>)
	(ACTION
	 <EXECUTE ()
		  <COND	(<FSET? ,HINT-ALLERGY ,BLUE-MIX>
			 <TELL
"I don't believe we could have saved Hurth from the illness that caused his
death. If only Esher or Praxix had been there, I feel there would have been
a chance of saving him.">)
			(<NOT <FSET? ,HURTH-OBJECT ,BLACK-MIX>>
			 <TELL
"Why didn't Esher examine Hurth? After all, he was a physician, even if
he wasn't knowledgable about Dwarvish illnesses.">)
			(<NOT <QSET? ,HINT-ALLERGY ,BLACK-MIX>>
			 <TELL
"Esher had no potion, herb, or root that could help him, but perhaps one
could have been found earlier in our travels.">
			 <RTRUE>)
			(T
			 <TELL
"It occurs to me that the underground tunnel in the forest, with all of its
mysterious growths, might have been worth examining more closely.">)> 
		  <UPDATE-REMOVE ,HINT-ALLERGY>>)>

<OBJECT HINT-TANGLETREES
	(SDESC "Snaketrees")
	(8DESC "Snaketree")
	(KBD %<ASCII !\S>)
	(SOLUTION
"It has always struck me as odd that Bergon would continue onward into
the grips of those deadly trees. But then, Bergon was a headstrong man.")>

<OBJECT HINT-TANGLESCENE
	(SDESC "Snaketrees")
	(8DESC "Snaketree")
	(KBD %<ASCII !\S>)
	(SOLUTION
"It seems we had no alternative to slugging our way through the grove of
snaketrees, since Praxix was short on magical essences.")>

<OBJECT HINT-MINAR
	(SDESC "Minar")
	(KBD %<ASCII !\M>)
	(SOLUTION
"I did not like his looks, yet in hindsight it seems that we would may have been
hasty in turning away the stranger.")>

<OBJECT HINT-BANDITS
	(SDESC "Bandits")
	(KBD %<ASCII !\B>)
	(SOLUTION
"We should never have allowed ourselves to be caught off guard. Were it not
for the element of surprise, Esher may never have been killed.")>

<OBJECT HINT-BANDITS-FLANK
	(SDESC "Bandits")
	(KBD %<ASCII !\B>)
	(SOLUTION
"We knew the bandits were lying in wait for us, yet we did virtually nothing to
take advantage of this.")>

<OBJECT HINT-NO-FIRE
	(SDESC "Bandits")
	(KBD %<ASCII !\B>)
	(SOLUTION
"We had defeated the bandits, though we were no closer to revealing the mystery
of the bloodstained clothing that Minar had found.")>

<OBJECT HINT-GOLD
	(SDESC "Storm")
	(KBD %<ASCII !\S>)
	(NUDGE
"Why would we spend time looking for gold? All the gold in the world would not
save our lands from the destruction that was sure to come if we failed. But the
essences that Praxix found would have been reason enough. If only the storm had
not come!")
	(SOLUTION
"The storm only did damage to my possessions; fortunately, nobody was hurt.
If the items in my pack had been protected from the oncoming water, we
might would have looked upon the storm not so much as a catastrophe, but as
an opportunity.")>

<OBJECT HINT-PRISON
	(SDESC "Caverns")
	(KBD %<ASCII !\C>)
	(SOLUTION
"Did we explore the Dwarvish caverns fully? After all, the passage at the
bottom of the stairs continued onward.")>

<OBJECT HINT-CHASM
	(SDESC "Chasm")
	(KBD %<ASCII !\C>)
	(NUDGE
"We failed to get across the chasm, but perhaps we did not do enough. Praxix'
magic might have worked. But how?")
	(SOLUTION
"Even with the spells that Praxix had at his disposal, there must have been some
progression of magical incantations that would have gotten us across the dark
abyss.")>

<OBJECT HINT-EVIL-CAVERN
	(SDESC "Caverns")
	(KBD %<ASCII !\C>)
	(ACTION
	 <EXECUTE ()
		  <UPDATE-REMOVE ,HINT-EVIL-CAVERN>
		  <COND (<NOT <FSET? ,DARK-EVIL-CAVERN ,SEEN>>
			 <TELL
"Exploration was always vital in our quest; why, then, did we never finish exploring
the Dwarven caverns past the stairs?">)
			(T
			 <TELL
"It was a relief to get away from the dark, evil presence we felt in the Dwarven
caverns. Yet we turned back with great haste, not fully exploring what lay ahead.
Perhaps there was nothing but evil to be found, but, then again, who can
say?">)>>)> 

<OBJECT HINT-DARK-PRESENCE
	(SDESC "Dark Evil")
	(KBD %<ASCII !\D>)
	(SOLUTION
"Praxix failed to hold back the dark presence we felt in the caverns. I cannot
help wondering whether he could have done more to protect the Dwarves whose
caverns the evil being now roams.")>	 

<OBJECT HINT-ORC-TRAP
	(SDESC "Orc Trap")
	(KBD %<ASCII !\O>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT ,A-B-FLAG>
			 <TELL
"Perhaps taking the northern path in the forest would have prevented
us from walking into the orcs' trap.">
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)
			(<NOT <FSET? ,MINE-JUNCTION ,SEEN>>
			 <TELL
"Why we did not fully explore the lower chambers remains a mystery.">
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)
			(<NOT <QSET? ,ACTIVE-MINE ,SOLVED>>
			 <TELL
"We never did discover the meaning of the tapping sounds in the mine.
It may have been worthwhile to check them out again.">)
			(<FSET? ,RED-ROCK ,SOLVED>
			 <TELL
"I'm certain the red rock I recovered from the mine was the key to the
miner's disappearances! Could we have used it to save " D ,TRAP-VICTIM
" from the orcs?">
			 <COND (<NOT <FSET? ,RED-ROCK ,DEAD>>
				<TELL
" I think I had the rocks with me, though I would have had to check
my inventory to be sure.">)>
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)
			(<NOT <IN? ,RED-ROCK ,ACTIVE-MINE>>
			 <TELL
"Did we fail to pay close enough attention to the mine itself;
did we examine everything?">
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)
			(T
			 <TELL
"The miner surely knew many things. Did we ask him enough questions?">
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)>>)>

<OBJECT HINT-SIGNAL
	(SDESC "Stranded")
	(KBD %<ASCII !\S>)
	(SOLUTION
"It's very sad that Praxix hadn't enough essences to send us some sort of
signal from the castle. It only shows how vital those essences were, and how
important to use them wisely.")>

<OBJECT HINT-CASTLE
	(SDESC "Castle")
	(KBD %<ASCII !\C>)
	(SOLUTION
"It was quite unlike Praxix to fail to explore the castle because the bridge
appeared too flimsy; but we were all frightened then, mostly of the unknown.
I must not judge him too harshly.")>

<OBJECT HINT-UMBER
	(SDESC "Umber")
	(KBD %<ASCII !\U>)
	(SOLUTION
"Why did Praxix refuse Umber's offer to join him? Pride? Stubborness? I
suppose we shall never know.")>

<OBJECT HINT-DUNGEON
	(SDESC "Castle")
	(KBD %<ASCII !\C>)
	(SOLUTION
"I have never understood why Praxix failed to explore the entire grounds of
the castle. I suppose I never shall.")>

<OBJECT HINT-VAULT
	(SDESC "Vault")
	(KBD %<ASCII !\V>)
	(ACTION
	 <EXECUTE ()
		  <COND (<FSET? ,REAGENT ,SOLVED>
			 <TELL ,MIXTURE-HELPFUL?>
			 <UPDATE-REMOVE ,HINT-VAULT>)
			(<NOT <QSET? ,HINT-VAULT ,EXAMINED>>
			 <TELL ,BGR-NOT-FOUND>)
			(T <HINT-REAGENT ,HINT-VAULT>)>>)>

<CONSTANT MIXTURE-HELPFUL?
"Astrix said that mixing reagents with magical essences would provide greater
magical powers. Could a mixture have helped us here?">

<OBJECT HINT-WOUNDS
	(SDESC "Wounds")
	(KBD %<ASCII !\W>)
	(ACTION
	 <EXECUTE ()
		  <COND (<FSET? ,REAGENT ,SOLVED>
			 <TELL ,MIXTURE-HELPFUL?>
			 <UPDATE-REMOVE ,HINT-WOUNDS>)
			(<NOT <QSET? ,HINT-WOUNDS ,EXAMINED>>
			 <TELL ,BGR-NOT-FOUND>)
			(T <HINT-REAGENT ,HINT-WOUNDS>)>>)>

<CONSTANT BGR-NOT-FOUND
"I feel the key to many things lies in the blue-green reagent that
Astrix told us about. We never found it, and this, perhaps, was
our greatest problem.">

<OBJECT HINT-STONES
	(SDESC "Stone Pile")
	(8DESC "Stones")
	(KBD %<ASCII !\S>)
	(ACTION
	 <EXECUTE ()
		  <COND (<AND <FSET? ,REAGENT ,SOLVED>
			      <NOT <QSET? ,HINT-STONES ,SEEN>>>
			 <TELL
"I don't know for certain, but I suspect that one of the Stones was
hidden in the pile Praxix found in the castle dungeon. It would take forever,
I suppose, to have looked at every one, and even then, how would it be
distinguished? Was there some magic in Praxix' possession that might have
revealed it to him?">)
			(<FSET? ,REAGENT ,SOLVED>
			 <TELL ,MIXTURE-HELPFUL?>
			 <UPDATE-REMOVE ,HINT-STONES>)
			(<NOT <QSET? ,HINT-STONES ,EXAMINED>>
			 <TELL ,BGR-NOT-FOUND>)
			(T <HINT-REAGENT ,HINT-STONES>)>>)>

<ROUTINE HINT-REAGENT (H)
	 <COND (<NOT <FSET? ,HIGH-PLAIN ,SCOUTED>>
		<TELL
"I think back, trying to piece together what we never explored, what
things we might have done. And then I think of that high ridge in the
mountains, high above the lake. We left there abruptly; was there
more to be seen there?">
		<REMOVE-HINT-REAGENT .H>)
	       (<NOT <QSET? ,HERMIT-HUT ,SCOUTED>>
		<TELL
"And what of the hut and the hermit that lived inside? Did we explore
it? Did we learn what secrets may lie inside?">
		<REMOVE-HINT-REAGENT .H>)>>

<ROUTINE REMOVE-HINT-REAGENT (H)
	 <UPDATE-REMOVE .H>>

<OBJECT HINT-DIVERSION
	(SDESC "Diversion")
	(KBD %<ASCII !\D>)
	(SOLUTION
"I regret deeply the loss of our friend while saving Praxix. It would
seem that Praxix' idea was better than its execution. His magic got
the attention of the orcs, to be sure; but he did nothing to place him
out of harm's way.")>

<OBJECT HINT-TREMOR
	(SDESC "Orc Fight")
	(KBD %<ASCII !\O>)
	(NUDGE
"We were trapped there, and it seems there was no alternative to
fighting the orcs to the bitter end. Or were we? And what of the water
sounds nearby?")
	(SOLUTION
"I wonder what would have happened if Praxix had cast his tremor spell
at that point. Surely it could not have hurt!")>

<OBJECT HINT-STRANGE-GATE
	(SDESC "Caverns")
	(KBD %<ASCII !\C>)
	(SOLUTION
"I wonder what we might have found if we had attempted going around the orcs
to the north, rather than being forced to fight them.")>

<OBJECT HINT-GATE-RUNES
	(SDESC "Runes")
	(KBD %<ASCII !\R>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <QSET? ,HINT-GATE-RUNES ,BLUE-MIX>>
			 <TELL
"Perhaps Praxix should have paid more attention to the runes above the gate.">
			 <COND (<NOT <FSET? ,GATE-RUNES ,SEEN>>
				<UPDATE-REMOVE ,HINT-GATE-RUNES>)>
			 <RTRUE>)
			(T
			 <TELL
"On the other hand, it is possible that Praxix didn't know as much about the
Wizards' language as he said he did, having studied only a dictionary.">
			 <UPDATE-REMOVE ,HINT-GATE-RUNES>)>>)>

;"If never got the essences from the mill..."

<OBJECT HINT-MILL
	(SDESC "Mill")
	(KBD %<ASCII !\M>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <FSET? ,MILL-MACHINERY ,EXAMINED>>
			 <TELL
"Why wasn't the mill examined more closely? Perhaps something would have
been revealed.">)
			(<NOT <FSET? ,XFER-JCN ,SEEN>>
			 <TELL
"It is unfortunate that Praxix did not explore the area within
the mill mechanism, for he might have found something useful there.">)
			(<OR <NOT <FSET? ,XFER-MASTER ,SEEN>>
			     <NOT <FSET? ,XFER-1 ,SEEN>>>
			 <TELL
"From what he told us, there was more within the mill's mechanism for Praxix
to have explored.">)
			(<NOT <FSET? ,XFER-CONTROLS ,EXAMINED>>
			 <TELL
"Praxix may indeed have explored the mill, but I suspect there is more he could
have done while inside its mechanism - something, perhaps, that might have
helped him get the essences he had seen in the walls of the first pit.">)
			(<NOT ,FIDDLED-WITH-DEVICE>
			 <TELL
"The device Praxix described was certainly complicated, yet he did not describe
any attempt to use or manipulate it.">)
			(<AND <NOT <FSET? ,XFER-MASTER ,SOLVED>>
			      <NOT <QSET? ,HINT-MILL ,BLUE-MIX>>>
			 <TELL
"Praxix found six runes on each of the dials, yet there was no clue as to
what, if anything, those runes represented. There were only three pits, of
course, yet the passage beside the third was blocked. Might have there been
more pits behind the rockslide?">
			 <RTRUE>)
			(<AND <NOT <FSET? ,XFER-MASTER ,SOLVED>>
			      <NOT <QSET? ,HINT-MILL ,GRAY-MIX>>>
			 <TELL
"This is all idle speculation. Even if there were six pits altogether, how
could it be possible to identify a particular rune with a particular pit?">
			 <RTRUE>)
			(<AND <NOT <FSET? ,XFER-MASTER ,SOLVED>>
			      <NOT <QSET? ,HINT-MILL ,BLACK-MIX>>>
			 <TELL
"The pits were not marked in any manner, or were they?">
			 <RTRUE>)
			(<NOT <FSET? ,XFER-MASTER ,SOLVED>>
			 <TELL
"Praxix noted that the entire area around the pits was covered with a thick
layer of grime or dust of some sort. Perhaps there were markings underneath
the dirt!">)
			(<AND <FSET? ,XFER-3 ,SCOUTED>
			      <NOT <QSET? ,HINT-MILL ,SCOUTED>>>
			 <TELL
"Praxix certainly found an expensive way to escape from the mill's mechanism,
and the loss of magical essences was difficult to compensate for. If Praxix
had understood the device in the control room better, perhaps he might have
reached us without using his magic.">
			 <RTRUE>)
			(<FSET? ,XFER-3 ,TRAPPED>
			 <TELL
"Somehow, Praxix would have needed to know which symbol corresponded to that
third pit without using himself as the guinea pig. But how?">)
			(T
			 <TELL
"Praxix determined that two of the pits corresponded with two of the runes
on the dials in the control room. Perhaps setting the dials to these two
runes and pushing the button would have revealed the nature of the device
itself.">)>
		  <UPDATE-REMOVE ,HINT-MILL>>)>

;"If Praxix got himself trapped inside the mill mechanism..."

<OBJECT HINT-MILL-TRAPPED
	(SDESC "Mill")
	(KBD %<ASCII !\M>)
	(ACTION
	 <EXECUTE ()
		  <COND (<AND ,XFER-TRAP
			      <NOT <QSET? ,HINT-MILL-TRAPPED ,BLUE-MIX>>>
			 <TELL
"Perhaps Praxix should have learned more about the workings of the device
before using it himself.">
			 <RTRUE>)
			(,XFER-TRAP
			 <APPLY <GETP ,HINT-MILL ,P?ACTION>>)
			(<AND <FSET? ,XFER-3-ANTE ,SEEN>
			      <NOT <QSET? ,HINT-MILL-TRAPPED ,GRAY-MIX>>>
			 <TELL
"It was clear to Praxix that there was light pouring into the bottom of
the third pit. Perhaps that was an exit to the mill's inner mechanism.">
			 <RTRUE>)
			(<FSET? ,XFER-3-ANTE ,SEEN>
			 <TELL
"Since jumping was out of the question, Praxix had few choices. One spell,
though, comes to mind, although its use would be somewhat ironic under the
circumstances. Otherwise, Praxix had little choice unless he could somehow
make the mechanism work to his advantage.">)
			(T
			 <TELL
"If Praxix had looked some more before he leaped, perhaps he would not have
become trapped beneath the mill.">)>
		  <UPDATE-REMOVE ,HINT-MILL-TRAPPED>>)>

<OBJECT HINT-DOOR
	(SDESC "Door")
	(KBD %<ASCII !\D>)
	(SOLUTION
"We never got through the door; neither did we finish exploring all
of the passageways nearby. This could well have been a mistake.")>

<OBJECT HINT-HOLE
	(SDESC "Hole")
	(KBD %<ASCII !\H>)
	(SOLUTION
"It seems obvious now that Hurth would have fared best in that dark hole. How did
we expect anyone else to get back out?")>

<OBJECT HINT-OLD-MINE
	(SDESC "Old Mine")
	(KBD %<ASCII !\O>)
	(ACTION
	 <EXECUTE ()
		  <COND (<FSET? ,REAGENT ,SOLVED>
			 <TELL
"It is a great tragedy that Hurth died in the old mine. Was it worth it? Did
we really need more of that magical reagent?">
			 <UPDATE-REMOVE ,HINT-OLD-MINE>)
			(<NOT <QSET? ,HINT-OLD-MINE ,SEEN>>
			 <TELL
"I do not see how this tragedy could have been avoided. If we were to
get the reagent we needed, what alternative did we have?">
			 <UPDATE-REMOVE ,HINT-OLD-MINE>)
			(T <HINT-REAGENT ,HINT-OLD-MINE>)>>)>

<OBJECT HINT-TAVERN
	(SDESC "Tavern")
	(KBD %<ASCII !\T>)
	(ACTION
	 <EXECUTE ()
		  <UPDATE-REMOVE ,HINT-TAVERN>
		  <COND (<FSET? ,TAVERN-OTHER-TABLE ,DEAD>
			 ;"Did right thing; had no more red rocks..."
			 <TELL
"It is a shame that we ran out of the red rocks that I had found in the mines.
Perhaps we used them carelessly.">)
			(<NOT <FSET? ,TAVERN-OTHER-TABLE ,EXAMINED>>
			 ;"Didn't examine other table..."
			 <TELL
"There was not much going on in the tavern, to be sure. Yet we did not check
out the other customers in any way.">)
			(<NOT <FSET? ,ZAN-TAVERN ,SOLVED>>
			 ;"Never used invisibility..."
			 <TELL
"If only we knew what the people at the other table were saying - for surely,
they were talking about us! It would have been far too dangerous to simply
walk up to them, but I wonder....">)
			(T
			 <TELL
"I know it is impolite, yet I wished I had spent more time eavesdropping on
the other table in the tavern.">)>>)>

<OBJECT HINT-INN
	(SDESC "Inn")
	(KBD %<ASCII !\I>)
	(ACTION HINT-MURDER)>

<OBJECT HINT-CAMPGROUND
	(SDESC "Campground")
	(8DESC "Camp Out")
	(KBD %<ASCII !\C>)
	(ACTION HINT-MURDER)>

<ROUTINE HINT-MURDER ()
	 <COND (<NOT <QSET? ,ACTION-OBJECT ,SEEN>>
		<TELL
"We were warned by Astrix to be careful in Zan; clearly, someone knew
we were coming and knew how to find us.">)
	       (T
		<TELL
"How did they know we'd be staying at the ">
		<COND (<EQUAL? ,ACTION-OBJECT ,HINT-INN>
		       <TELL "inn">)
		      (T
		       <TELL "campground">)>
		<TELL "? ">
		<COND (<FSET? ,INN ,SEEN>
		       <TELL
"They asked at the inn, of course. We should have known not to trust
the innkeeper; knowing now what I did not know then, I'm sure we could have
fooled them.">)
		      (T
		       <TELL
"They may have checked at the inn and found out we were not staying there.
I suppose it would not have been hard to figure out that we had camped
outside of town.">)>
		<UPDATE-REMOVE ,ACTION-OBJECT>)>>

<OBJECT HINT-SOUTH-SEAS
	(SDESC "Boat")
	(KBD %<ASCII !\B>)
	(NUDGE
"As I look back, there were quite a few hints that this was the wrong boat to
choose. But, there must have been some sign, some help, to have guided us to
a better decision.")
	(SOLUTION
"Perhaps we should have picked a different boat, but then again, we had only
the two choices suggested by the harbormaster. Or might we have heard of
another captain somewhere else in town?")> 

<OBJECT HINT-REEF-STUCK
	(SDESC "Reef")
	(KBD %<ASCII !\R>)
	(SOLUTION
"It is tragic that Praxix ran out of air essence when he did. Perhaps he
could have been more sparing of its use earlier in our journey, or perhaps
there was more to be found? We shall never know.")>

<OBJECT HINT-REEF
	(SDESC "Reef")
	(KBD %<ASCII !\R>)
	(NUDGE
"The mast would surely have broken if I had tried to get above the mist.
Was there another way of rising above it?")
	(SOLUTION
"Could Praxix have helped? Could he have elevated me? We shall never know.")>

<OBJECT HINT-JAIL
	(SDESC "Jail")
	(KBD %<ASCII !\J>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <QSET? ,HINT-JAIL ,SEEN>>
			 <TELL
"We were trapped in the jail with no escape possible. There is no one to
blame, nothing we could have done.">
			 <RTRUE>)
			(<FSET? ,GRAY-STONE ,SOLVED>
			 <TELL
"I wonder about the gray reagent we had bought. Could some mixture
have helped us? If so, we would have done better to experiment before
getting caught!">)
			(<NOT <FSET? ,CURIO-SHOP ,SCOUTED>>
			 <TELL
"And yet, we did not explore everywhere in town. Not the curio shop,
at any rate.">)
			(<FSET? ,GRAY-STONE ,TRAPPED>
			 <TELL
"But why was Praxix so ornery; why didn't he ask to see some of the things
that were for sale in the curio shop? There might have been something
useful there.">)
			(<NOT <FSET? ,GRAY-STONE ,EXAMINED>>
			 <TELL
"Alas that we did not try to buy the gray stone. Later, Praxix confided
that it was a magical reagent, and its magic could have helped us.">)
			(<NOT <QSET? ,HINT-JAIL ,SOLVED>>
			 <TELL
"Alas that we had nothing to trade for the gray stone. It was certainly
a magical reagent, and might have helped us escape from jail.">
			 <RTRUE>)
			(<NOT <FSET? ,STAIR-CHASM ,SEEN>>
			 <TELL
"I think back to all we had accomplished, everything we had seen: was there
any place we did not explore? Yes! The left stair in the caverns; but now
I will never know what lay along that path.">)
			(<NOT <FSET? ,FAR-CHASM ,SEEN>>
			 <TELL
"The chasm between the broken stairs! I don't know why, but it occurs to me
that we never found a way across. Could that have helped?">)
			(<NOT <FSET? ,SUNSET-TOWER ,SOLVED>>
			 <TELL
"The Sunset Tower: why do I feel that we have missed simething there? Was
there something hidden there?">)
			(T
			 <TELL
"The spyglass! Of course! Praxix said it was a priceless treasure!">)>
		  <UPDATE-REMOVE ,HINT-JAIL>>)>

<OBJECT HINT-FOG
	(SDESC "Demon")
	(KBD %<ASCII !\D>)
	(NUDGE
"Praxix was surprisingly absentminded in not figuring out the proper
mixture to create fog; I can think of at least two ways he might not
have resorted to guessing.")
	(SOLUTION
"First, he might have guessed at which two elements would most likely yield
fog; second, he might have realized that there was only one combination whose
effect he did not already know.")> 
	 
<OBJECT HINT-DKAO
	(SDESC "Demon")
	(KBD %<ASCII !\D>)
	(SOLUTION
"What fools we were to assume the shadow to have been benign. If we had
taken a better look while we had the chance, the tragedy outside of Zan
might have been averted.")>

<OBJECT HINT-POUCH
	(SDESC "Demon")
	(KBD %<ASCII !\D>)
	(SOLUTION
"Perhaps I should have taken Praxix' pouch and used some of his magic
to defeat the evil demon; it could not have hurt.")>

<OBJECT HINT-MAGIC
	(SDESC "Demon")
	(KBD %<ASCII !\D>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <QSET? ,HINT-MAGIC ,BLUE-MIX>>
			 <TELL
"The fearsome demon was our final undoing. If I had only come up with
the proper mixture! And yet I am certain that I had seen or heard things
that could have helped me discover the relationship between the spells
and their colors. But what?">)
			(<NOT <FSET? ,TALE-MAGIC ,EXAMINED>>
			 <TELL
"First of all, I never had Praxix tell me about magic - that certainly
would have been useful!">
			 <UPDATE-REMOVE ,HINT-MAGIC>)
			(<NOT <QSET? ,HINT-MAGIC ,GRAY-MIX>>
			 <TELL
"Yes, I recall having noted the color on Praxix' hands after casting
'Flare' to get us through the snaketrees. And now that I think of it,
there were other times as well.">)
			(T
			 <TELL
"The solution should be obvious; between what Praxix said to me about magic
and the colors I had seen on his fingers, all I needed was a little common sense.">
			 <UPDATE-REMOVE ,HINT-MAGIC>)>>)>

<OBJECT HINT-MUDWARGS
	(SDESC "Mudwargs")
	(KBD %<ASCII !\M>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <FSET? ,BLACK-REAGENT ,SEEN>>
			 <TELL
"It was foolish to attempt to get past the mudwargs. Why didn't we stay
with Umber and seek his advice?">)
			(,BLACK-COUNT
			 <TELL
"The black reagent frightened Praxix, I am sure. Nevertheless, he might
have experimented more with the various combinations of mixtures.">)
			(T
			 <TELL
"I will never understand why Praxix never experimented with the black
reagent. Perhaps he had his reasons, but I have never understood what
they could be.">)>
		  <UPDATE-REMOVE ,HINT-MUDWARGS>>)>
	

;"Have you ever tried...."

<ROUTINE HAVE-YOU-EVER-TRIED? ("AUX" F)
	 <TELL
"At the end of the account of the Journey, the following was written in "
TAG "'s hand." CR CR>
	 <TELL
"I wonder what would have happened if..." CR>
	 <SET F <FIRST? ,HAVE-YOU-EVER>>
	 <TELL CR "... " <GETP .F ,P?SOLUTION>>
	 <REMOVE .F>
	 <COND (<FIRST? ,HAVE-YOU-EVER>
		<CHANGE-TRAVEL-COMMAND ,HERE ,MUSINGS-COMMAND ,MORE-COMMAND>)
	       (T
		<REMOVE-TRAVEL-COMMAND ,HERE ,MUSINGS-COMMAND>)>>

<COMMAND MORE <> ("AUX" F)
	 <SET F <FIRST? ,HAVE-YOU-EVER>>
	 <TELL "... " <GETP .F ,P?SOLUTION>>
	 <REMOVE .F>
	 <COND (<NOT <FIRST? ,HAVE-YOU-EVER>>
		<REMOVE-TRAVEL-COMMAND>)>
	 <RTRUE>>

<OBJECT HAVE-YOU-EVER>

<OBJECT HYE-DRINKS
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"I had ordered one too many drinks at the tavern in Lavos.")>

<OBJECT HYE-DROP
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"I had tried dropping the rope, or something else of importance.")>

<OBJECT HYE-SPELLS
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had used his magic when no magic was needed.")>

<OBJECT HYE-FIRE
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Blaze or Lightning at the Elves' fire.")>

<OBJECT HYE-RIVER
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Rain when we were on the raft in the river. It occurs to
me that he might not have had enough left after putting out the Elves'
fire, though.")>

<OBJECT HYE-GLOW
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix cast Glow on his already glowing staff.")>

<OBJECT HYE-TOWER
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Flare at the top of the Sunset Tower.")>

<OBJECT HYE-DIVERSION
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had experimented with his Elevation spell before diverting the
orcs.")>

<OBJECT HYE-TANGLE
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Rain in the grove of snaketrees.")>

<OBJECT HYE-INNKEEPER
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had used the mind bending mixture on the innkeeper.")>

<OBJECT HYE-VOYAGE
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Rain or Lightning during our ocean voyage.")>

<OBJECT HYE-FOREBODING
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"we had figured out the meaning of the mixture of gray reagent and
air essence.")>

<OBJECT HYE-JAIL
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had made me invisible in the jail cell and then gotten the
sheriff's attention.")>

<OBJECT HYE-MIST
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had used his Wind spell when we were afloat in the mist
before knowing in which direction the Misty Isle lay.")>    

<OBJECT HYE-BOAT
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had used his Wind or Elevation spells on the boat before
the storm.")>

<OBJECT HYE-STEAL
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had tried to steal the gray stone, rather than trading the
spyglass for it.")>

