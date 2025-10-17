-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

/*
Crime searching for: body was found
Location: docks of Coral Bay Marina
Date: August 14, 1986 '19860814'
THINGS TO KEEP IN MIND:
-JOINs
-Wildcard searches
-Logical deduction
*/
  
/*
-We'll search what crime_scene matches which
SELECT * FROM crime_scene WHERE location = 'Coral Bay Marina' AND date = 19860814;
id: 43	
date: 19860814	
location: Coral Bay Marina
description: 'The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".'
*/

/*
-Lets see where the people who were nearby
SELECT * FROM person WHERE name LIKE '%ez' OR name LIKE '%ul';
_person 1:
id: 101
name: Carlos Mendez
alias: Los Ojos
occupation: Fisherman
address: 369 Ocean Drive

_person 2:
id: 102
name: Raul Gutierrez
alias: The Cobra
occupation: Nightclub Owner
address: 45 Sunset Ave
*/

/*
-Let's check their interviews
SELECT * FROM interviews WHERE person_id = 101 OR person_id = 102;
These are their interviews:
_Carlos Mendez:
id: 101
person_id: 101
transcript: 'I saw someone check into a hotel on August 13. The guy looked nervous'
  
_Raul Gutierrez:
id: 103
person_id: 102
transcript: 'I heard someone checked into a hotel with "Sunset" in the name.'
*/

/*
-It putting the data together, someone checked into a hotel called 'Sunset' on August 13 1986 '19860813'
*/

/*
-Lets find the hotel_checkins records!
Wow this is A LOT of information to get through...
Ok, so I tried an inner join and it doesn't fit personally-
*/

/*
-Let's make it a full join!
SELECT *
FROM hotel_checkins 
FULL JOIN surveillance_records
ON hotel_checkins.person_id = surveillance_records.person_id
WHERE hotel_name LIKE '%sunset%' AND hotel_name LIKE '%%hotel' AND check_in_date = 19860813;
*/

/*
This is the information that came up was:
This person have very suspicious behavior...
id: 22
person_id: 7
hotel_name: Sunset Marina Hotel
check_in_date: 19860813
id: 7
person_id: 7
hotel_checkin_id: 89
suspicious_activity: 'Seen arguing with an unknown person'
*/

/*
-Someone suddenly left abruptly?
SELECT *
FROM surveillance_records
WHERE person_id = 8;
id: 8	
person_id: 8	
hotel_checkin_id: 2	
suspicious_activity: Left suddenly at 3 AM
*/

/*
-Let's look at this guy's confessions
id: 73	
person_id: 8
transcript: 'Alright! I did it. I was paid to make sure he never left the marina alive.'
*/

/*
-So they confessed but WHO is this?
SELECT *
FROM person
WHERE id = 8;
id: 8	
name: Thomas Brown	
alias: The Fox	
occupation: Dock Worker	
address: 234 Port Street
*/

/*
-Well well well...looks like we got you Thomas Brown
*/
