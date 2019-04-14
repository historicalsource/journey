
	.SEGMENT "ZAN"


	.FUNCT	GOOD-CAPTAIN-SETUP:ANY:0:0,OFF
	GET	CAPTAIN-TBL,0
	RANDOM	STACK >OFF
	GET	CAPTAIN-TBL,OFF >GOOD-CAPTAIN
	GET	CAPTAIN-NAME-TBL,OFF >GOOD-CAPTAIN-NAME
	RETURN	GOOD-CAPTAIN-NAME


	.FUNCT	ANONF-351:ANY:0:0
	ICALL2	UPDATE-REMOVE,MUD-SPELL
	FSET?	ZAN-2,BLACK-MIX \?CND1
	ICALL	ADD-TRAVEL-COMMAND,ZAN-2,INN-COMMAND
?CND1:	CALL	QSET?,HERE,SEEN
	ZERO?	STACK \?CND3
	CRLF	
	CRLF	
	PRINTI	"As we arrived at the waterfront, the harbormaster was just preparing to leave his station for the evening. As we had no clear notion of which boats might be available for charter, or what captains might be willing to take us to the Misty Isle, we sought his advice."
	CRLF	
	CRLF	
	PRINTI	"Rather than divulging our true purpose, Bergon simply told the harbormaster that we wished to charter a boat early the next morning for one of the neighboring islands."
	CRLF	
	CRLF	
	PRINTI	"""If you'd like, I could suggest a few of the captains that might be interested,"" the harbormaster replied. ""Or do you have some particular captain in mind?"""
	ICALL	OPTION,BERGON,YES-COMMAND,NO-COMMAND
?CND3:	FSET?	ELFENTIDE,SEEN \FALSE
	FSET?	SOUTH-SEAS,SEEN \FALSE
	FSET?	ZEPHYR,SEEN /?CCL7
	FSET?	HERE,USED-UP \FALSE
?CCL7:	FSET	HERE,TRAPPED
	FSET	HERE,ADVISE
	RTRUE	


	.FUNCT	ANONF-352:ANY:0:0,WDS,W1,?TMP2
?FCN:	EQUAL?	ACTION,YES-COMMAND \?CCL3
	CALL2	READ-ELVISH,BERGON
	ZERO?	STACK /?CCL6
	GETB	E-LEXV,1 >WDS
	GET	E-LEXV,1 >W1
	PRINTI	"""In fact, we did have someone in mind,"" Bergon replied. ""His name was "
	PRINTT	E-TEMP,E-TEMP-LEN
	PRINTI	", I believe."""
	CRLF	
	CRLF	
	EQUAL?	WDS,1 \?CCL9
	EQUAL?	W1,GOOD-CAPTAIN \?CCL9
	PRINTI	"""Now that's a laugh,"" the harbormaster replied, chortling. ""I can't imagine what use he'll be to you, but you'll find him aboard the Zephyr - that's on the third pier, fourth boat to the left. If you don't have any luck with the old sot, try over at the Elfentide or the South Seas - they're both in port and available for charter. "
	PRINT	GOOD-CAPTAIN-NAME
	PRINTI	", indeed! You folks have yourselves a fine evening."" He laughed again, pointed out the two other boats he had suggested, and strode back into town."
	FSET	HERE,USED-UP
	ICALL	TRAVEL-COMMANDS,HERE,ELFENTIDE-COMMAND,SOUTH-SEAS-COMMAND,ZEPHYR-COMMAND,BACK-COMMAND
	JUMP	?CND4
?CCL9:	EQUAL?	WDS,1 \?CCL13
	EQUAL?	W1,W?CALFON,W?STEGG \?CCL13
	PRINTI	"""Why, that's him over there,"" the harbormaster replied, pointing toward a nearby mooring. ""Boat's called the "
	EQUAL?	W1,W?CALFON \?CCL18
	PRINTI	"Elfentide"
	JUMP	?CND16
?CCL18:	PRINTI	"South Seas"
?CND16:	PRINTI	", and I'm right sure its for hire. But, if it's not, you might try the "
	EQUAL?	W1,W?CALFON \?CCL21
	PRINTI	"South Seas"
	JUMP	?CND19
?CCL21:	PRINTI	"Elfentide"
?CND19:	PRINTI	", right over there. You folks have a good night!"" And with that, he turned and strode away."
	ICALL	TRAVEL-COMMANDS,HERE,ELFENTIDE-COMMAND,SOUTH-SEAS-COMMAND,BACK-COMMAND
?CND4:	CALL1	END-OPTION
	RSTACK	
?CCL13:	EQUAL?	WDS,1 \?CCL23
	ADD	CAPTAIN-TBL,2 >?TMP2
	GET	CAPTAIN-TBL,0
	INTBL?	W1,?TMP2,STACK \?CCL23
	PRINTI	"""Hmm,"" the harbormaster replied, ""Last I saw him was a few weeks ago, on the Stout. He'll be back before spring, I expect."""
	CRLF	
	CRLF	
	SET	'ACTION,NO-COMMAND
	JUMP	?FCN
?CCL23:	EQUAL?	WDS,1 /?CTR26
	FSET?	HERE,TRIED \?CCL27
?CTR26:	PRINTI	"""Never heard of him,"" the harbormaster replied."
	CRLF	
	CRLF	
	SET	'ACTION,NO-COMMAND
	JUMP	?FCN
?CCL27:	FSET	HERE,TRIED
	PRINTI	"""Come again,"" the harbormaster replied. ""What was his name?"""
	CRLF	
	SET	'ACTION,NO-COMMAND
	JUMP	?FCN
?CCL6:	PRINTI	"But Bergon apparently had nobody in mind, for he said nothing."
	CRLF	
	CRLF	
	SET	'ACTION,NO-COMMAND
	JUMP	?FCN
?CCL3:	EQUAL?	ACTION,NO-COMMAND \?CCL31
	PRINTI	"""Let me suggest you ask the captains of the Elventide, over there, and the South Seas, over there,"" he said, pointing out the two boats."
	ICALL	TRAVEL-COMMANDS,HERE,ELFENTIDE-COMMAND,SOUTH-SEAS-COMMAND,BACK-COMMAND
	CALL1	END-OPTION
	RSTACK	
?CCL31:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL33
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	FSET?	HERE,TRAPPED \?CCL36
	PRINTI	"Having seen the boats available for hire, we had a difficult choice to make."
	CRLF	
	CRLF	
	FSET?	ELFENTIDE,DEAD \?CCL39
	PRINTI	"""It will help somewhat that we haven't the option of taking the Elfentide,"" I said, ""though the captain's words sent shivers down my spine."" Concluding my thoughts, I added,"
	JUMP	?CND37
?CCL39:	PRINTI	"""The captains were all willing to take us, and that is a good sign,"" I said, hopefully."
?CND37:	PRINTI	" ""Perhaps it does not matter which one we choose."""
	FSET?	SOUTH-SEAS,TRUTHFUL \TRUE
	FSET?	ZEPHYR,TRUTHFUL \TRUE
	FSET?	ELFENTIDE,TRUTHFUL \TRUE
	CRLF	
	CRLF	
	PRINTI	"""The captain of the South Seas was willing to take us directly to the Misty Isle; shall we not take take him up on his offer?"" Bergon asked."
	CRLF	
	CRLF	
	PRINTI	"""His offer does not please me when I consider the responses of the others,"" Praxix countered. ""Why, I wonder, is he so anxious to take us into probable danger?"""
	RTRUE	
?CCL36:	PRINTI	"Huddling together, we agreed that the best plan of attack would be to check out each of the boats and make any decisions later."
	CRLF	
	CRLF	
	PRINTI	"""Our decision here is critical,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said. ""Let us learn as much as we can about the boats and their crews."""
	RTRUE	
?CCL33:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL46
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" took a quick look around the wharf, reporting that there were no other boats obviously available for charter. The rest, it seems, were vacant, or out trawling, or had been previously hired."
	RTRUE	
?CCL46:	EQUAL?	ACTION,BACK-COMMAND \?CCL48
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"I suggested we return to town, but Bergon was firm. ""Astrix warned us not to tarry in Zan, and I feel we are not entirely safe here. Let us arrange to charter one of the boats; I know I will sleep easier knowing that we sail tomorrow."
	RTRUE	
?CCL48:	EQUAL?	ACTION,ELFENTIDE-COMMAND \?CCL50
	FSET	HERE,DONT-SCOUT
	FCLEAR	HERE,ADVISE
	CALL	QSET?,ELFENTIDE,SEEN
	ZERO?	STACK \?CCL53
	PRINTI	"The 'Elfentide' was a fore-and-aft rigged fishing vessel, whose main mast stood fifty feet or more above decks, and whose tall mizzenmast sat just forward of the rudderpost."
	CRLF	
	CRLF	
	PRINTI	"""This is what you'd call a ketch,"" said Bergon, ""and a beauty at that."""
	CRLF	
	CRLF	
	PRINTI	"The captain stood at the bow, peering out over the sea, and every so often barked an order at one of his deck hands."
	CALL2	MOVE-TO,ELFENTIDE
	RSTACK	
?CCL53:	ICALL2	CHOOSE-BOAT,STR?761
	ICALL1	CHOOSE-ELFENTIDE
	CALL1	RETURN-FROM-WHARF
	RSTACK	
?CCL50:	EQUAL?	ACTION,ZEPHYR-COMMAND \?CCL55
	FSET	HERE,DONT-SCOUT
	FCLEAR	HERE,ADVISE
	CALL	QSET?,ZEPHYR,SEEN
	ZERO?	STACK \?CCL58
	PRINTI	"The 'Zephyr', like the 'Elfentide', was a fore-and-aft rigged fishing boat, with two tall masts."
	CRLF	
	CRLF	
	PRINTI	"The captain sat at the wheelhouse, head between his knees."
	CALL2	MOVE-TO,ZEPHYR
	RSTACK	
?CCL58:	ICALL2	CHOOSE-BOAT,STR?763
	ICALL1	CHOOSE-ZEPHYR
	CALL1	RETURN-FROM-WHARF
	RSTACK	
?CCL55:	EQUAL?	ACTION,SOUTH-SEAS-COMMAND \FALSE
	FSET	HERE,DONT-SCOUT
	FCLEAR	HERE,ADVISE
	CALL	QSET?,SOUTH-SEAS,SEEN
	ZERO?	STACK \?CCL63
	PRINTI	"Like the other boats here, the 'South Seas' was fore-and-aft rigged, but with a shorter mizzenmast than the other two."
	CRLF	
	CRLF	
	PRINTI	"""This boat's a yawl,"" said Bergon, ""and a beauty at that."""
	CRLF	
	CRLF	
	PRINTI	"At first, it appeared that the boat was deserted, but the captain soon came up from below decks with a member of his crew."
	CALL2	MOVE-TO,SOUTH-SEAS
	RSTACK	
?CCL63:	ICALL2	CHOOSE-BOAT,STR?765
	ICALL1	CHOOSE-SOUTH-SEAS
	CALL1	RETURN-FROM-WHARF
	RSTACK	


	.FUNCT	CHOOSE-BOAT:ANY:1:1,STR
	PRINTI	"We returned to the '"
	PRINT	STR
	PRINTI	"' and told the captain of our decision to accept his offer. ""When do you set sail?"" Bergon asked."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	RETURN-FROM-WHARF:ANY:0:0
	CRLF	
	CRLF	
	PRINTI	"Tired from our travels, and nearer to our goal of setting sail toward the Misty Isle, we returned to the center of town. It was quite late, and the tavern was just closing for the night."
	CRLF	
	CRLF	
	PRINTI	"""I don't know about the rest of you,"" Praxix said, ""but this Wizard could use some rest."""
	ICALL	REMOVE-TRAVEL-COMMAND,ZAN-2,WHARF-COMMAND
	ICALL	REMOVE-TRAVEL-COMMAND,ZAN-2,TAVERN-COMMAND
	REMOVE	ZAN-2-TAVERN
	FSET	WHARF,SOLVED
	FSET	ZAN-2,ADVISE
	CALL2	MOVE-TO,ZAN-2
	RSTACK	


	.FUNCT	CHOOSE-ZEPHYR:ANY:0:0
	SET	'CHOSEN-BOAT,ZEPHYR
	SET	'CAPTAIN,FALSE-VALUE
	PRINT	GOOD-CAPTAIN-NAME
	PRINTI	" gazed skyward dreamily, then back at Bergon. ""Storm's coming; can feel it in my bones. We'd best be leaving early."""
	CRLF	
	CRLF	
	PRINTI	"""That is suitable,"" replied Bergon. ""My name is Bergon,"" he said, and then introduced the rest of our party. ""We shall return when the sun rises."""
	RTRUE	


	.FUNCT	ANONF-353:ANY:0:0
	FSET	HERE,SEEN
	CRLF	
	CRLF	
	PRINTI	"The sound of our footsteps on the wooden planking must have plainly announced our arrival, but nevertheless the captain did not move."
	CRLF	
	CRLF	
	PRINTI	"Finally, Bergon spoke. ""Excuse us, sir,"" he said, and the wizened man at the wheel raised his head. He was not a pretty sight, having not shaved or bathed in a week. A nearly empty bottle of whiskey lay beside him, its former contents amply represented by his foul breath."
	CRLF	
	CRLF	
	PRINTI	"""You're not from these parts,"" he said, in a slur. ""What would you be doing in Zan?"""
	CRLF	
	CRLF	
	PRINTI	"""We've come to charter a boat,"" Bergon replied."
	CRLF	
	CRLF	
	PRINTI	"""And just where do you expect this boat to take you?"""
	CALL	OPTION,BERGON,TELL-TRUTH-COMMAND,LIE-COMMAND
	RSTACK	


	.FUNCT	ANONF-354:ANY:0:0
	EQUAL?	ACTION,ACCEPT-COMMAND \?CCL3
	PRINT	VERY-KIND
	CRLF	
	CRLF	
	ICALL1	CHOOSE-ZEPHYR
	ICALL1	RETURN-FROM-WHARF
	CALL1	END-OPTION
	RSTACK	
?CCL3:	EQUAL?	ACTION,CONSIDER-COMMAND \?CCL5
	ICALL1	TELL-CONSIDER
	ICALL2	MOVE-TO,WHARF
	CALL1	END-OPTION
	RSTACK	
?CCL5:	EQUAL?	ACTION,LIE-COMMAND \?CCL7
	PRINTI	"""We're heading south, to the Isle of Estril,"" Bergon said. It was a lie, of course, but it was roughly in the right direction."
	CRLF	
	CRLF	
	PRINTI	"""Estril? What on earth would send you there?"" the captain scowled. ""No, don't tell me. If that's where you're headed, I can take you."""
	CALL	OPTION,BERGON,ACCEPT-COMMAND,CONSIDER-COMMAND
	RSTACK	
?CCL7:	EQUAL?	ACTION,TELL-TRUTH-COMMAND \FALSE
	FSET	HERE,TRUTHFUL
	PRINTI	"""We were hoping to sail to the Misty Isle."""
	CRLF	
	CRLF	
	PRINTI	"The old man's eyes widened. ""The Misty Isle,"" he repeated. Then, he sat for a long while before speaking again."
	CRLF	
	CRLF	
	PRINTI	"""Lots of legends about the Misty Isle,"" he said, snivelling, ""and ain't none of them wouldn't keep you up nights. They say that none's returned that's gone there. No, I'm afraid I'm not young enough or drunk enough to try it. Tell you what - I can take you as far as Estril. Could be there's boats you can hire there that'll take you where you're heading."""
	CALL	OPTION,BERGON,ACCEPT-COMMAND,CONSIDER-COMMAND
	RSTACK	


	.FUNCT	CHOOSE-ELFENTIDE:ANY:0:0
	SET	'CHOSEN-BOAT,ELFENTIDE
	SET	'CAPTAIN,STR?784
	PRINTI	"""We sail with the sun, and we can't be waiting for you."""
	CRLF	
	CRLF	
	PRINTI	"""I am Bergon,"" our leader said, feeling it was the time for introductions. ""We shall be here early."""
	CRLF	
	CRLF	
	PRINTI	"""Name's Lemet. I'll see you boys later; there's lots to do before we sail. If you'll excuse me..."""
	RTRUE	


	.FUNCT	ANONF-355:ANY:0:0
	FSET	HERE,SEEN
	CRLF	
	CRLF	
	PRINTI	"As we approached him, he turned and looked us over, as if we were the catch of the day, and a poor day at that."
	CRLF	
	CRLF	
	PRINTI	"""What can I do for you folks? I don't got any work, if that's what you're looking for,"" he said."
	CRLF	
	CRLF	
	PRINT	NEED-BOAT
	CRLF	
	CRLF	
	PRINTI	"""That can be arranged. And where might you be going?"""
	CALL	OPTION,BERGON,TELL-TRUTH-COMMAND,LIE-COMMAND
	RSTACK	


	.FUNCT	ANONF-356:ANY:0:0
	EQUAL?	ACTION,ACCEPT-COMMAND \?CCL3
	PRINT	VERY-KIND
	CRLF	
	CRLF	
	ICALL1	CHOOSE-ELFENTIDE
	ICALL1	RETURN-FROM-WHARF
	CALL1	END-OPTION
	RSTACK	
?CCL3:	EQUAL?	ACTION,CONSIDER-COMMAND \?CCL5
	ICALL1	TELL-CONSIDER
	ICALL2	MOVE-TO,WHARF
	CALL1	END-OPTION
	RSTACK	
?CCL5:	EQUAL?	ACTION,LIE-COMMAND \?CCL7
	PRINTI	"""We're heading south, to the Isle of Estril,"" Bergon said. It was a lie, of course, but at least in the right direction."
	CRLF	
	CRLF	
	PRINTI	"""Estril, aye,"" the captain said, ""We can take you there, and get in a day's fishing at that."""
	CALL	OPTION,BERGON,ACCEPT-COMMAND,CONSIDER-COMMAND
	RSTACK	
?CCL7:	EQUAL?	ACTION,TELL-TRUTH-COMMAND \FALSE
	FSET	HERE,TRUTHFUL
	PRINTI	"""We are headed toward the Misty Isle."""
	CRLF	
	CRLF	
	PRINTI	"""The Misty Isle,"" the captain started, ""Is that so?"" He rubbed his stubbled face and continued, ""There's nobody fool enough to go there; ain't nobody ever returned. I'm sorry, lads, you'll have no luck around here. Now, if you don't mind, I've got some serious work to do."""
	ICALL	REMOVE-TRAVEL-COMMAND,WHARF,ELFENTIDE-COMMAND
	FSET	ELFENTIDE,DEAD
	ICALL2	MOVE-TO,WHARF
	CALL1	END-OPTION
	RSTACK	


	.FUNCT	CHOOSE-SOUTH-SEAS:ANY:0:0
	SET	'CHOSEN-BOAT,SOUTH-SEAS
	SET	'CAPTAIN,STR?787
	PRINTI	"""We can leave whenever you'd like."""
	CRLF	
	CRLF	
	PRINTI	"""All right, then,"" our leader said, ""we shall return here after we rise tomorrow morning."""
	CRLF	
	CRLF	
	PRINTI	"""That'll be fine. If you'll excuse me, I've got some things to attend to. Sleep well!"""
	RTRUE	


	.FUNCT	TELL-CONSIDER:ANY:0:0
	INC	'CONSIDER-COUNT
	GET	CONSIDER-TBL,CONSIDER-COUNT
	PRINT	STACK
	RTRUE	


	.FUNCT	ANONF-357:ANY:0:0
	FSET	HERE,SEEN
	CRLF	
	CRLF	
	PRINTI	"As we approached, he smiled broadly and welcomed us aboard. ""Name's Stegg,"" he said, ""and this here's my boat. Mighty proud of her, I am."""
	CRLF	
	CRLF	
	PRINT	NEED-BOAT
	CRLF	
	CRLF	
	PRINTI	"""That's my business,"" Stegg replied. ""Where is it then that you're bound?"""
	ICALL1	CHECK-FOREBODING
	CALL	OPTION,BERGON,TELL-TRUTH-COMMAND,LIE-COMMAND
	RSTACK	


	.FUNCT	ANONF-358:ANY:0:0
	EQUAL?	ACTION,ACCEPT-COMMAND \?CCL3
	PRINT	VERY-KIND
	CRLF	
	CRLF	
	ICALL1	CHOOSE-SOUTH-SEAS
	ICALL1	RETURN-FROM-WHARF
	CALL1	END-OPTION
	RSTACK	
?CCL3:	EQUAL?	ACTION,CONSIDER-COMMAND \?CCL5
	ICALL1	TELL-CONSIDER
	ICALL2	MOVE-TO,WHARF
	CALL1	END-OPTION
	RSTACK	
?CCL5:	EQUAL?	ACTION,LIE-COMMAND \?CCL7
	PRINTI	"""We're travelling to the Isle of Estril,"" Bergon said."
	CRLF	
	CRLF	
	PRINTI	"""Beautiful spot,"" the captain said, ""I can take you there tomorrow, if you like."""
	CALL	OPTION,BERGON,ACCEPT-COMMAND,CONSIDER-COMMAND
	RSTACK	
?CCL7:	EQUAL?	ACTION,TELL-TRUTH-COMMAND \FALSE
	FSET	HERE,TRUTHFUL
	PRINTI	"""We are headed toward the Misty Isle."""
	CRLF	
	CRLF	
	PRINTI	"""Well, then,"" Stegg replied without the least hesitation, ""the Misty Isle it is. We can leave in the morning, if you like."""
	CALL	OPTION,BERGON,ACCEPT-COMMAND,CONSIDER-COMMAND
	RSTACK	

	.ENDSEG

	.ENDI
