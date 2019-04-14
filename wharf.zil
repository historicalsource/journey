"WHARF for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT ZAN>

<COMMAND ELFENTIDE>
<COMMAND ZEPHYR>
<COMMAND (SOUTH-SEAS SOUTHSEAS)>

<COMMAND YES>
<COMMAND NO>

<GLOBAL GOOD-CAPTAIN <>>

<GLOBAL GOOD-CAPTAIN-NAME <>>

<GLOBAL CAPTAIN-TBL
	<LTABLE W?ELEVAR W?CRIBALD W?CALFON W?ANDRIL W?BENDOR W?SISKA
		W?IBARA W?KELNOR W?ULMAN W?ANSAX W?GILFAN W?VENDOR W?MEREZI>>

<GLOBAL CAPTAIN-NAME-TBL
	<LTABLE "Elevar" "Cribald" "Calfon" "Andril" "Bendor" "Siska"
		"Ibara" "Kelnor" "Ulman" "Ansax" "Gilfan" "Vendor" "Merezi">>

<ROUTINE GOOD-CAPTAIN-SETUP ("AUX" OFF)
	 <SET OFF <RANDOM <GET ,CAPTAIN-TBL 0>>>
	 <SETG GOOD-CAPTAIN <GET ,CAPTAIN-TBL .OFF>>
	 <SETG GOOD-CAPTAIN-NAME <GET ,CAPTAIN-NAME-TBL .OFF>>>

<ROOM WHARF
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-WHARF)
      (ENTER
       <EXECUTE ()
		<UPDATE-REMOVE ,MUD-SPELL> ;"Added 3/15"
		<COND (<FSET? ,ZAN-2 ,BLACK-MIX>
		       <ADD-TRAVEL-COMMAND ,ZAN-2 ,INN-COMMAND>)>
		<COND (<NOT <QSET? ,HERE ,SEEN>>
		       <TELL CR CR
"As we arrived at the waterfront, the harbormaster was just preparing to leave
his station for the evening. As we had no clear notion of which boats might be
available for charter, or what captains might be willing to take us to
the Misty Isle, we sought his advice." CR CR>
		       <TELL
"Rather than divulging our true purpose, Bergon simply told the harbormaster
that we wished to charter a boat early the next morning for one of the neighboring
islands." CR CR>
		       <TELL
"\"If you'd like, I could suggest a few of the captains that might be interested,\"
the harbormaster replied. \"Or do you have some particular captain in mind?\"">
		       <OPTION ,BERGON ,YES-COMMAND ,NO-COMMAND>)>
		<COND (<AND <FSET? ,ELFENTIDE ,SEEN>
			    <FSET? ,SOUTH-SEAS ,SEEN>
			    <OR <FSET? ,ZEPHYR ,SEEN>
				<FSET? ,HERE ,USED-UP>>>
		       ;"Have seen all of those available..."
		       <FSET ,HERE ,TRAPPED>
		       <FSET ,HERE ,ADVISE>)>>)
      (FLAGS ADVISE)
      (ACTION
       <ACOND ("AUX" WDS W1)
	      (YES
	       <COND (<READ-ELVISH ,BERGON>
		      <SET WDS <GETB ,E-LEXV 1>>
		      <SET W1 <GET ,E-LEXV 1>>
		      <TELL
"\"In fact, we did have someone in mind,\" Bergon replied. \"His name was ">
		      <PRINTT ,E-TEMP ,E-TEMP-LEN>
		      <TELL ", I believe.\"" CR CR>
		      <COND (<AND <EQUAL? .WDS 1>
				  <EQUAL? .W1 ,GOOD-CAPTAIN>>
			     <TELL
"\"Now that's a laugh,\" the harbormaster replied, chortling. \"I can't imagine
what use he'll be to you, but you'll find him aboard the Zephyr - that's on the
third pier, fourth boat to the left. If you don't have any luck with the old sot,
try over at the Elfentide or the South Seas - they're both in port and available
for charter. " ,GOOD-CAPTAIN-NAME>
			     <TELL
", indeed! You folks have yourselves a fine evening.\" He laughed again, pointed
out the two other boats he had suggested, and strode back into town.">
			     <FSET ,HERE ,USED-UP>
			     <TRAVEL-COMMANDS ,HERE
					      ,ELFENTIDE-COMMAND
					      ,SOUTH-SEAS-COMMAND
					      ,ZEPHYR-COMMAND
					      ,BACK-COMMAND>)
			    (<AND <EQUAL? .WDS 1>
				  <EQUAL? .W1 ,W?CALFON ,W?STEGG>>
			     <TELL
"\"Why, that's him over there,\" the harbormaster replied, pointing toward a
nearby mooring. \"Boat's called the ">
			     <COND (<EQUAL? .W1 ,W?CALFON>
				    <TELL "Elfentide">)
				   (T
				    <TELL "South Seas">)>
			     <TELL
", and I'm right sure its for hire. But, if it's not, you might try the ">
			     <COND (<EQUAL? .W1 ,W?CALFON>
				    <TELL "South Seas">)
				   (T
				    <TELL "Elfentide">)>
			     <TELL
", right over there. You folks have a good night!\" And with that, he turned
and strode away.">
			     <TRAVEL-COMMANDS ,HERE
					      ,ELFENTIDE-COMMAND
					      ,SOUTH-SEAS-COMMAND
					      ,BACK-COMMAND>)
			    (<AND <EQUAL? .WDS 1>
				  <INTBL? .W1
					  <REST ,CAPTAIN-TBL 2>
					  <GET ,CAPTAIN-TBL 0>>>
			     <TELL
"\"Hmm,\" the harbormaster replied, \"Last I saw him was a few weeks ago, on the
Stout. He'll be back before spring, I expect.\"" CR CR>
			     <SETG ACTION ,NO-COMMAND>
			     <AGAIN>)
			    (<OR <EQUAL? .WDS 1>
				 <FSET? ,HERE ,TRIED>>
			     <TELL
"\"Never heard of him,\" the harbormaster replied." CR CR>
			     <SETG ACTION ,NO-COMMAND>
			     <AGAIN>)
			    (T
			     <FSET ,HERE ,TRIED>
			     <TELL
"\"Come again,\" the harbormaster replied. \"What was his name?\"" CR>
			     <SETG ACTION ,NO-COMMAND>
			     <AGAIN>)>)
		     (T
		      <TELL
"But Bergon apparently had nobody in mind, for he said nothing." CR CR>
		      <SETG ACTION ,NO-COMMAND>
		      <AGAIN>)>
	       <END-OPTION>)
	      (NO
	       <TELL
"\"Let me suggest you ask the captains of the Elventide, over there, and
the South Seas, over there,\" he said, pointing out the two boats.">
	       <TRAVEL-COMMANDS ,HERE
				,ELFENTIDE-COMMAND
				,SOUTH-SEAS-COMMAND
				,BACK-COMMAND>
	       <END-OPTION>)
	      (GET-ADVICE:REMOVE
	       <COND (<FSET? ,HERE ,TRAPPED>
		      <TELL
"Having seen the boats available for hire, we had a difficult choice to
make." CR CR>
		      <COND (<FSET? ,ELFENTIDE ,DEAD>
			     <TELL
"\"It will help somewhat that we haven't the option of taking
the Elfentide,\" I said, \"though the captain's words sent shivers
down my spine.\" Concluding my thoughts, I added,">)
			    (T
			     <TELL
"\"The captains were all willing to take us, and that is a good sign,\" I said,
hopefully.">)>
		       <TELL
" \"Perhaps it does not matter which one we choose.\"">
		       <COND (<AND <FSET? ,SOUTH-SEAS ,TRUTHFUL>
				   <FSET? ,ZEPHYR ,TRUTHFUL>
				   <FSET? ,ELFENTIDE ,TRUTHFUL>>
			      <TELL CR CR
"\"The captain of the South Seas was willing to take us directly to
the Misty Isle; shall we not take take him up on his offer?\" Bergon
asked.">
			      <TELL CR CR
"\"His offer does not please me when I consider the responses of
the others,\" Praxix countered. \"Why, I wonder, is he so anxious
to take us into probable danger?\"">)>
		       <RTRUE>)
		     (T
		      <TELL
"Huddling together, we agreed that the best plan of attack would be to
check out each of the boats and make any decisions later." CR CR>
		      <TELL
"\"Our decision here is critical,\" " ACT " said. \"Let us learn as much
as we can about the boats and their crews.\"">)>) 
	      (SCOUT:REMOVE
	       <TELL ACT
" took a quick look around the wharf, reporting that there were
no other boats obviously available for charter. The rest, it seems, were
vacant, or out trawling, or had been previously hired.">)
	      (BACK:REMOVE
	       <TELL
"I suggested we return to town, but Bergon was firm. \"Astrix warned us
not to tarry in Zan, and I feel we are not entirely safe here. Let us
arrange to charter one of the boats; I know I will sleep easier knowing that
we sail tomorrow.">) 
	      (ELFENTIDE
	       <FSET ,HERE ,DONT-SCOUT>
	       <FCLEAR ,HERE ,ADVISE>
	       <COND (<NOT <QSET? ,ELFENTIDE ,SEEN>>
		      <TELL
"The 'Elfentide' was a fore-and-aft rigged fishing vessel, whose main mast
stood fifty feet or more above decks, and whose tall mizzenmast sat just
forward of the rudderpost." CR CR>
		      <TELL
"\"This is what you'd call a ketch,\" said Bergon, \"and a beauty at
that.\"" CR CR>
		      <TELL
"The captain stood at the bow, peering out over the sea, and every so often
barked an order at one of his deck hands.">
		      <MOVE-TO ,ELFENTIDE>)
		     (T
		      ;"Choosing this one"
		      <CHOOSE-BOAT "Elfentide">
		      <CHOOSE-ELFENTIDE>
		      <RETURN-FROM-WHARF>)>) 
	      (ZEPHYR
	       <FSET ,HERE ,DONT-SCOUT>
	       <FCLEAR ,HERE ,ADVISE>
	       <COND (<NOT <QSET? ,ZEPHYR ,SEEN>>
		      <TELL
"The 'Zephyr', like the 'Elfentide', was a fore-and-aft rigged fishing boat,
with two tall masts." CR CR>
		      <TELL
"The captain sat at the wheelhouse, head between his knees.">
		      <MOVE-TO ,ZEPHYR>)
		     (T
		      ;"Choosing this one"
		      <CHOOSE-BOAT "Zephyr">
		      <CHOOSE-ZEPHYR>
		      <RETURN-FROM-WHARF>)>)
	      (SOUTH-SEAS
	       <FSET ,HERE ,DONT-SCOUT>
	       <FCLEAR ,HERE ,ADVISE>
	       <COND (<NOT <QSET? ,SOUTH-SEAS ,SEEN>>
		      <TELL
"Like the other boats here, the 'South Seas' was fore-and-aft rigged, but
with a shorter mizzenmast than the other two." CR CR>
		      <TELL
"\"This boat's a yawl,\" said Bergon, \"and a beauty at that.\"" CR CR>
		      <TELL
"At first, it appeared that the boat was deserted, but the captain soon came up
from below decks with a member of his crew.">
		      <MOVE-TO ,SOUTH-SEAS>)
		     (T
		      ;"Choosing this one"
		      <CHOOSE-BOAT "South Seas">
		      <CHOOSE-SOUTH-SEAS>
		      <RETURN-FROM-WHARF>)>)>)>

<ROUTINE CHOOSE-BOAT (STR)
	 <TELL
"We returned to the '" .STR "' and told the captain of our decision to
accept his offer. \"When do you set sail?\" Bergon asked." CR CR>>

<ROUTINE RETURN-FROM-WHARF ()
	 <TELL CR CR
"Tired from our travels, and nearer to our goal of setting sail toward
the Misty Isle, we returned to the center of town. It was quite late,
and the tavern was just closing for the night." CR CR>
	 <TELL
"\"I don't know about the rest of you,\" Praxix said, \"but this Wizard
could use some rest.\"">
	 <REMOVE-TRAVEL-COMMAND ,ZAN-2 ,WHARF-COMMAND>
	 <REMOVE-TRAVEL-COMMAND ,ZAN-2 ,TAVERN-COMMAND>
	 <REMOVE ,ZAN-2-TAVERN>
	 <FSET ,WHARF ,SOLVED>
	 <FSET ,ZAN-2 ,ADVISE>
	 <MOVE-TO ,ZAN-2>>

<ROUTINE CHOOSE-ZEPHYR ()
	 <SETG CHOSEN-BOAT ,ZEPHYR>
	 <SETG CAPTAIN <>>
	 <TELL ,GOOD-CAPTAIN-NAME
" gazed skyward dreamily, then back at Bergon. \"Storm's coming; can
feel it in my bones. We'd best be leaving early.\"" CR CR>
	 <TELL
"\"That is suitable,\" replied Bergon. \"My name is Bergon,\" he said,
and then introduced the rest of our party. \"We shall return when the
sun rises.\"">>

<ROOM ZEPHYR
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (SDESC "Zephyr")
      (GRAPHIC G-ZEPHYR)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<TELL CR CR
"The sound of our footsteps on the wooden planking must have plainly announced
our arrival, but nevertheless the captain did not move." CR CR>
		<TELL
"Finally, Bergon spoke. \"Excuse us, sir,\" he said, and the wizened
man at the wheel raised his head. He was not a pretty sight, having not
shaved or bathed in a week. A nearly empty bottle of whiskey lay beside
him, its former contents amply represented by his foul breath." CR CR>
		<TELL
"\"You're not from these parts,\" he said, in a slur. \"What would you be
doing in Zan?\"" CR CR>
		<TELL
"\"We've come to charter a boat,\" Bergon replied." CR CR>
		<TELL
"\"And just where do you expect this boat to take you?\"">
		<OPTION ,BERGON ,TELL-TRUTH-COMMAND ,LIE-COMMAND>>) 
      (ACTION
       <ACOND ()
	      (ACCEPT
	       <TELL ,VERY-KIND CR CR>
	       <CHOOSE-ZEPHYR>
	       <RETURN-FROM-WHARF>
	       <END-OPTION>)
	      (CONSIDER
	       <TELL-CONSIDER>
	       <MOVE-TO ,WHARF>
	       <END-OPTION>)
	      (LIE
	       <TELL
"\"We're heading south, to the Isle of Estril,\" Bergon said. It
was a lie, of course, but it was roughly in the right direction." CR CR>
	       <TELL
"\"Estril? What on earth would send you there?\" the captain scowled. \"No,
don't tell me. If that's where you're headed, I can take you.\"">
	       <OPTION ,BERGON ,ACCEPT-COMMAND ,CONSIDER-COMMAND>) 
	      (TELL-TRUTH
	       <FSET ,HERE ,TRUTHFUL>
	       <TELL
"\"We were hoping to sail to the Misty Isle.\"" CR CR>
	       <TELL
"The old man's eyes widened. \"The Misty Isle,\" he repeated. Then, he sat
for a long while before speaking again." CR CR>
	       <TELL
"\"Lots of legends about the Misty Isle,\" he said, snivelling, \"and ain't
none of them wouldn't keep you up nights. They say that none's returned
that's gone there. No, I'm afraid I'm not young enough or drunk enough to
try it. Tell you what - I can take you as far as Estril. Could be there's
boats you can hire there that'll take you where you're heading.\"">   
	       <OPTION ,BERGON ,ACCEPT-COMMAND ,CONSIDER-COMMAND>)>)>

<ROUTINE CHOOSE-ELFENTIDE ()
	 <SETG CHOSEN-BOAT ,ELFENTIDE>
	 <SETG CAPTAIN "Lemet">
	 <TELL
"\"We sail with the sun, and we can't be waiting for you.\"" CR CR>
	 <TELL
"\"I am Bergon,\" our leader said, feeling it was the time for introductions.
\"We shall be here early.\"" CR CR>
	 <TELL
"\"Name's Lemet. I'll see you boys later; there's lots to do before
we sail. If you'll excuse me...\"">>

<COMMAND CONSIDER>

<ROOM ELFENTIDE
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (SDESC "Elfentide")
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<TELL CR CR
"As we approached him, he turned and looked us over, as if we were the
catch of the day, and a poor day at that." CR CR>
		<TELL
"\"What can I do for you folks? I don't got any work, if that's what you're
looking for,\" he said." CR CR>
		<TELL ,NEED-BOAT CR CR>
		<TELL
"\"That can be arranged. And where might you be going?\"">
		<OPTION ,BERGON ,TELL-TRUTH-COMMAND ,LIE-COMMAND>>) 
      (GRAPHIC G-ELFENTIDE)
      (ACTION
       <ACOND ()
	      (ACCEPT
	       <TELL ,VERY-KIND CR CR>
	       <CHOOSE-ELFENTIDE>
	       <RETURN-FROM-WHARF>
	       <END-OPTION>)
	      (CONSIDER
	       <TELL-CONSIDER>
	       <MOVE-TO ,WHARF>
	       <END-OPTION>)
	      (LIE
	       <TELL
"\"We're heading south, to the Isle of Estril,\" Bergon said. It
was a lie, of course, but at least in the right direction." CR CR>
	       <TELL
"\"Estril, aye,\" the captain said, \"We can take you there, and
get in a day's fishing at that.\"">
	       <OPTION ,BERGON ,ACCEPT-COMMAND ,CONSIDER-COMMAND>) 
	      (TELL-TRUTH
	       <FSET ,HERE ,TRUTHFUL>
	       <TELL
"\"We are headed toward the Misty Isle.\"" CR CR>
	       <TELL
"\"The Misty Isle,\" the captain started, \"Is that so?\" He rubbed his
stubbled face and continued, \"There's nobody fool enough to go there;
ain't nobody ever returned. I'm sorry, lads, you'll have no luck around
here. Now, if you don't mind, I've got some serious work to do.\"">
	       <REMOVE-TRAVEL-COMMAND ,WHARF ,ELFENTIDE-COMMAND>
	       <FSET ,ELFENTIDE ,DEAD>
	       <MOVE-TO ,WHARF>
	       <END-OPTION>)>)>

<GLOBAL CHOSEN-BOAT <>>
<GLOBAL CAPTAIN <>>

<ROUTINE CHOOSE-SOUTH-SEAS ()
	 <SETG CHOSEN-BOAT ,SOUTH-SEAS>
	 <SETG CAPTAIN "Stegg">
	 <TELL
"\"We can leave whenever you'd like.\"" CR CR>
	 <TELL
"\"All right, then,\" our leader said, \"we shall return here after
we rise tomorrow morning.\"" CR CR>
	 <TELL
"\"That'll be fine. If you'll excuse me, I've got some things to attend to.
Sleep well!\"">>

<GLOBAL CONSIDER-COUNT 0>

<ROUTINE TELL-CONSIDER ()
	 <SETG CONSIDER-COUNT <+ ,CONSIDER-COUNT 1>>
	 <TELL <GET ,CONSIDER-TBL ,CONSIDER-COUNT>>>

<CONSTANT CONSIDER-TBL
	  <LTABLE
"\"You are kind to offer; we need a chance to talk among ourselves,
and shall return quickly to give our answer,\" Bergon replied. And with
that, we returned to the wharf."
"\"We thank you for the offer,\" Bergon said, \"and we shall return
with a reply as soon as we have had a chance to consider.\" Returning
to the wharf, we pondered our alternatives."
"\"You are too kind,\" Bergon said, \"but we must retire to consider
your offer.\" And, thanking the captain again, we again made our
way back to the wharf to consider the offers we had received.">>

<CONSTANT VERY-KIND
"\"You are very kind, sir,\" Bergon replied, \"When do you set
sail?\"">

<CONSTANT NEED-BOAT
"\"We need to charter a boat,\" Bergon replied, \"and we're willing to pay
whatever you ask.\"">

<ROOM SOUTH-SEAS
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (SDESC "South Seas")
      (GRAPHIC G-SOUTH-SEAS)
      (FLAGS FORBIDDING)
      (EXIT RESET-FOREBODING)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<TELL CR CR
"As we approached, he smiled broadly and welcomed us aboard. \"Name's
Stegg,\" he said, \"and this here's my boat. Mighty proud of her, I
am.\"" CR CR>
		<TELL ,NEED-BOAT CR CR>
		<TELL
"\"That's my business,\" Stegg replied. \"Where is it then that you're
bound?\"">
		<CHECK-FOREBODING>
		<OPTION ,BERGON ,TELL-TRUTH-COMMAND ,LIE-COMMAND>>) 
      (ACTION
       <ACOND ()
	      (ACCEPT
	       <TELL ,VERY-KIND CR CR>
	       <CHOOSE-SOUTH-SEAS>
	       <RETURN-FROM-WHARF>
	       <END-OPTION>)
	      (CONSIDER
	       <TELL-CONSIDER>
	       <MOVE-TO ,WHARF>
	       <END-OPTION>)
	      (LIE
	       <TELL
"\"We're travelling to the Isle of Estril,\" Bergon said." CR CR>
	       <TELL
"\"Beautiful spot,\" the captain said, \"I can take you there
tomorrow, if you like.\"">
	       <OPTION ,BERGON ,ACCEPT-COMMAND ,CONSIDER-COMMAND>) 
	      (TELL-TRUTH
	       <FSET ,HERE ,TRUTHFUL>
	       <TELL
"\"We are headed toward the Misty Isle.\"" CR CR>
	       <TELL
"\"Well, then,\" Stegg replied without the least hesitation, \"the Misty
Isle it is. We can leave in the morning, if you like.\"">
	       <OPTION ,BERGON ,ACCEPT-COMMAND ,CONSIDER-COMMAND>)>)>
