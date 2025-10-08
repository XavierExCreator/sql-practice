-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

-- MURDER MYSTER NOTES --

--GOALS--
/*
-Find people who committed crimes
SELECT * FROM crime_scene_report;   
-Bring it down to those who murdered
 SELECT 20180115, 'murder', 'SQL City' FROM crime_scene_report;
-Be more specific
SELECT date, type, description, city
FROM crime_scene_report
WHERE date= '20180115' AND type= 'murder' AND city = 'SQL City';
-Found a crime that happened, searching Witness Annabel
SELECT * FROM person WHERE name LIKE '%Annabel%';
- Annabel Miller
SELECT * FROM interview WHERE person_id = '16371';
'I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.'
-She saw a murder happen at the gym while working out
SELECT * FROM get_fit_now_member WHERE name LIKE '%Annabel%';
-Now look into when she saw the murder happen
SELECT * FROM get_fit_now_check_in WHERE membership_id = ‘90081’;
-She was checked in from 1600 to 1700
SELECT * FROM get_fit_now_check_in WHERE check_in_date = ‘20180109’ AND check_in_time = 1600 OR check_out_time = 1700;
- Two people who are the suspects
Jeremy Bowers and Joe Germuska
BONUS:
-Jeremy Bowers was the hitman, but who's the one who put the kill?
-Checked his interview and he gave the woman appearance but didn't know her name
SELECT * FROM drivers_license WHERE hair_color = 'red' AND height BETWEEN '65' AND '67' AND car_make = 'Tesla'; 
-Three woman are suspects
SELECT * FROM person WHERE license_id = '202298' OR license_id = '291182' OR license_id = '918773'; 
-Who was at the facebook event for so long?
SELECT * FROM facebook_event_checkin
WHERE event_name LIKE '%Symphony%' AND person_id = '99716';
Miranda Priestly made the kill!
*/

