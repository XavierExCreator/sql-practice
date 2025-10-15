-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

/*
Case and time
Date: July 15, 1983,
Location: Los Angeles, 
Store: West Hollywood Records
Crime: Theft
Value: $10,000, vanished during a busy evening
*/

/*
-Data collected from the crime_scene:
SELECT * FROM crime_scene WHERE location = 'West Hollywood Records';
id: 65	
date: 19830715	
type: theft	
location: West Hollywood Records	
Description: A prized vinyl record was stolen from the store during a busy evening.
*/

/*
  -Let's check the witnesses as the crime_scene_id matches the id of the crime_scene
SELECT * FROM witnesses WHERE crime_scene_id = 65;
Two witnesses saw what occurred!
Witnesses:
_Witness 1:
id: 28
crime_scene_id: 65
clue: 'I saw a man wearing a red bandana rushing out of the store.'
_Witness 2:
id: 75
crime_scene_id: 65
clue: 'The main thing I remember is that he had a distinctive gold watch on his wrist.'
*/

/*
  -Conclusions:
Criminal has:
_a gold watch on his wrist
_has a red bandana

-Lets check the suspects to see who fits the two descriptions
SELECT * FROM suspects WHERE bandana_color = 'red' AND accessory LIKE '%watch%';
*/

/*
  -Unfortunately there's three suspects:
_Suspect 1:
id: 34
name: Tony Ramirez
bandana_color: red
accessory: gold watch
_Suspect 2:
id: 44
name: Mickey Rivera
bandana_color: red
accessory: gold watch
_Suspect 3:
id: 97
name: Rico Delgado
bandana_color: red
accessory: gold watch
*/

/*-Let's check the interviews to see who has what to say?
SELECT * FROM interviews WHERE suspect_id = 35 OR suspect_id = 44 OR suspect_id = 97;
_Suspect 1:
suspect_id: 35
transcript: 'I wasn't anywhere near West Hollywood Records that night.'

_Suspect 2:
suspect_id: 44
transcript: 'I was busy with my music career; I have nothing to do with this theft.'

_Suspect 3:
suspect_id: 97
transcript: 'I couldn't help it. I snapped and took the record.'

It was Rico Delgado!
