-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

Crime searching for: body was found
Location: docks of Coral Bay Marina
Date: August 14, 1986 '19860814'
THINGS TO KEEP IN MIND:
-JOINs
-Wildcard searches
-Logical deduction

-We'll search what crime_scene matches which
SELECT * FROM crime_scene WHERE location = 'Coral Bay Marina' AND date = 19860814;
id: 43	
date: 19860814	
location: Coral Bay Marina
description: 'The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".'

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

-It putting the data together, someone checked into a hotel called 'Sunset' on August 13 1986 '19860613'

-Lets find the hotel_checkins records!
