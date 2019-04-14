
	.SEGMENT "BOAT"


	.FUNCT	ISLAND-ENDING:ANY:0:0
	PRINTI	"We stepped off the boat, and onto the shore. The sky was a brilliant blue, and not a cloud could be seen. Before us, high upon a hill, stood a grand castle, whose turrets and spires rose hundreds of feet into the air. Our steps were quick and light as we climbed the winding path that led to the castle door."
	CRLF	
	CRLF	
	EQUAL?	PARTY-MAX,5 \?CCL3
	ICALL2	GRAPHIC,G-ALMOST
	PRINTI	"Even as we arrived at the threshold, the door opened, and we were greeted by a hooded man in a blue and silver robe. He stood a while in silence then removed his cloak, revealing a familiar face."
	CRLF	
	CRLF	
	PRINT	IT-IS-I-ASTRIX
	CRLF	
	CRLF	
	PRINTI	"And then Astrix led us into a large and elegant chamber, in the center of which stood a table. Around the table sat six figures; each, like Astrix, in robes of blue and silver. But there was something unearthly about them, and their very forms seemed to shimmer and dance in the reflected sunlight."
	CRLF	
	CRLF	
	PRINTI	"""These are the last of my race,"" Astrix said, ""Many ages ago, we Wizards led a great and successful struggle against the "
	PRINT	BAD-GUY
	PRINTI	"s. And then, our work done, we left the world you know, creating this island apart from it. Venturing forth little into your world, we have been sundered from it, and are now unable to return. Except that I, of all the Wizards, remained in your world, and, over time, befriended the races that now walk in freedom upon it."""
	CRLF	
	CRLF	
	PRINTI	"""Yet not all of the "
	PRINT	BAD-GUY
	PRINTI	"s were destroyed, and one remained deep within the earth, patiently awaiting the day he might again rule. That day has come, and though the Wizards care greatly for the world, and would give their lives to save it, yet they cannot."""
	CRLF	
	CRLF	
	PRINTI	"""Our hope lay in finding those who might, through their strength of intellect, courage, and character, bring together the Six Stones and, with them, seek out the Anvil, whose power was wielded by the hand of Evil. There have been others before you; one group that you know, four still before them. All have failed, and, yet, beyond hope, you have come!"""
	CRLF	
	CRLF	
	PRINTI	"""But we, too, have failed,"" I said, ""for we have not found the Anvil."""
	CRLF	
	CRLF	
	ICALL	GRAPHIC,FALSE-VALUE,G-WIZARDS,TOP-LEFT
	PRINTI	"""Ah, but you have,"" Astrix replied, as he took the silver locket from around my neck and opened it, revealing a crystal stone on a slender golden chain. ""Behold!"" said Astrix, raising it up before the eyes of our party and the assembled Wizards. ""The Anvil!"""
	CRLF	
	CRLF	
	PRINTI	"""Then the Dread Lord..."" I began."
	CRLF	
	CRLF	
	PRINTI	"...had the Anvil all along,"" Astrix said, finishing my thought. ""Yes, we knew he had the Anvil, yet we also knew he lusted for the other six, both in fear of the Legend and for the powers they were said to command. Alas, that those powers faded long ago. But the power of the Anvil is real, and with it, much Evil that has been done may be undone."
	CRLF	
	CRLF	
	PRINTI	"""We shall keep the Anvil here, and it shall pass from the world with us,"" he said, placing the Anvil around my neck. ""But for now, I believe it is yours!"""
	CRLF	
	CRLF	
	PRINTI	"Praxix now turned to the elder Wizard and related our experience with Umber. Who was he, Praxix asked, and what was the magic that he possessed? There was a faint murmur from the other Wizards, followed by a tense silence."
	CRLF	
	CRLF	
	PRINTI	"""We know him not,"" Astrix replied firmly. ""Now, come! There is much to do!"""
	ICALL1	DIVIDER
	PRINTI	"We stayed a long while at the castle, for the wisdom of the Wizards was great, and there was much to learn. And though his name was never spoken, the dark memory of Umber rested deeply, uneasily in our minds, where it lay forever bathed in the black glow of an unearthly light."
	CRLF	
	CRLF	
	PRINTI	"When we did finally return to our homes, the winter's chill had passed, and the meadows and pastures were a brilliant green - it was springtime in the dawn of a Golden Age."
	CRLF	
	CRLF	
	SET	'GAME-WON?,TRUE-VALUE
	CALL1	ENDING
	RSTACK	
?CCL3:	ICALL2	GRAPHIC,G-ALMOST
	PRINTI	"The massive door opened as if by magic. Before us, the entrance hall led down a long, oak-panelled corridor to a large and elegant chamber. Inside, a solitary man sat, head down, at huge banquet table."
	CRLF	
	CRLF	
	PRINTI	"He turned to us slowly, and cast his hood from his face. We stood awestruck by the sight."
	CRLF	
	CRLF	
	PRINT	IT-IS-I-ASTRIX
	CRLF	
	CRLF	
	PRINTI	"""We had hoped you were the ones,"" he said with a sigh."
	CRLF	
	CRLF	
	PRINTI	"""We?"" I said, again gazing around the empty chamber."
	CRLF	
	CRLF	
	PRINTI	"""It does not matter anymore,"" he said, ignoring the question. ""You have found the Six Stones, and are by any accounting brave, resourceful, and wise. But the Anvil remains hidden from us, and without it we cannot hope to destroy the "
	PRINT	BAD-GUY
	PRINTI	". I am sorry indeed - not only for yourselves, but for your fallen friends and for all that must abide the Darkness that is to come."
	CRLF	
	CRLF	
	PRINTI	"""Go, now, return to your families and friends. For the storm will come, swift and terrible, and all will be changed."""
	CRLF	
	CRLF	
	PRINTI	"And though we had a thousand questions, Astrix was too distracted to answer. He led us from the castle, and "
	GET	INT-STR,PARTY-MAX
	PRINT	STACK
	PRINTI	" eagles came at his command, swiftly bearing us back to our lands, far to the north."
	CALL1	BAD-ENDING
	RSTACK	

	.ENDSEG

	.ENDI
