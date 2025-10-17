-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

/*
At Miami’s prestigious Fontainebleau Hotel charity gala, the famous “Heart of Atlantis” diamond necklace suddenly disappeared from its display.

Location: Miami’s prestigious Fontainebleau Hotel
Event: charity gala
Type of crime: Theft
Item Stolen: “Heart of Atlantis” diamond necklace
*/

/*
-Let's find the crime_scene information, maybe we'll get other details we're looking for
SELECT * FROM crime_scene WHERE location LIKE '%Fontainebleau Hotel%';
crime_scene information:
id: 48
date: 19870520
location: Fontainebleau Hotel
description : 'The Heart of Atlantis necklace disappeared. Many guests were questioned but only two of them gave valuable clues. One of them is a really famous actor. The other one is a woman who works as a consultant for a big company and her first name ends with "an".'
*/

/*
-Well now we have the date, id, location and description; let's check it out...
  
-...After investigating it says...
_One suspect they saw was a famous actor
_Second suspect is a consultant whose name ends with an 'an'
*/

/*
-Let's Join the data of guests who were there, with the data of witness_statements to find the two witnesses:
FROM owners FULL JOIN pets
ON owners.owner_id = pets.owner_id
_Found witness 1:
id:	116
name: Vivian Nair
occupation: Consultant
invitation_code: VIP-R
id: 16
guest_id: 116
clue: 'I saw someone holding an invitation ending with "-R". He was wearing a navy suit and a white tie.'

_Found witness 2:
id:	129
name: Clint Eastwood
occupation: Actor
invitation_code: VIP-G
id: 50
guest_id: 129
clue: 'I overheard someone say, "Meet me at the marina, dock 3.'
*/

/*
-We got a lead from someone Clint Eastwood saying that someone was asking another person to meet at the marina in dock 3...Let's see what comes up-
SELECT * FROM guest INNER JOIN marina_rentals
ON guest.id = marina_rentals.renter_guest_id
WHERE dock_number = 3 AND boat_name LIKE '%marina%' AND rental_date = 19870520;
*/

/*
-We found someone, let's further investigate by finding out this guests information...
id: 78
name: Phoenix Mason
occupation: Tech Entrepreneur
invitation_code: VIP-G
id: 29
dock_number: 3
renter_guest_id: 78
rental_date: 19870520
boat_name: Marina Belle II
*/

/*
-Phoenix Mason looks suspicious, is it right place wrong time or wrong place wrong time?...
SELECT * FROM guest INNER JOIN marina_rentals
ON guest.id = marina_rentals.renter_guest_id
WHERE name = 'Phoenix Mason';
id	name	occupation	invitation_code	id	guest_id	confession
78	Phoenix Mason	Tech Entrepreneur	VIP-G	78	78	I was at the doctors office. I didnt kill anyone.
*/

/*
-Looks like this wasn't the right person, maybe she has an interview?
_Looking further I missed a detail!
'"-R". He was wearing a navy suit and a white tie.'
-Let's check the guest list and attire_registry
SELECT * FROM guest INNER JOIN attire_registry
ON guest.id = attire_registry.guest_id
WHERE attire_registry.note LIKE '%white%' AND attire_registry.note LIKE '%tie%' AND guest.invitation_code LIKE '%-R%';
*/

/*
-This is what we found
id: 105
name: Mike Manning
occupation:	Wealth Reallocation Expert
invitation_code: VIP-R
id: 48
guest_id: 105
note: 'navy suit, white tie'
*/

/*
-Let's check his final_interview
SELECT * FROM guest INNER JOIN final_interviews
ON guest.id = final_interviews.guest_id
WHERE final_interviews.guest_id = 105;
_His overview
id: 105
name: Mike Manning
occupation: Wealth Reallocation Expert
invitation_code: VIP-R
id: 105
guest_id: 105
confession: 'I was the one who took the crystal. I guess I need a lawyer now?'
*/

/*
-IT WAS MIKE MANNING
*/
