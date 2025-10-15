-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

/*
Time it look place
Year: 1980s
Item: valuable briefcase
Place of disappearance: Blue Note Lounge
Description of person?: A man in a trench coat
*/

/*
NOTES OF SEQUEL PROCESS:
-Locating what the crime_scene database looks like
SELECT * FROM crime_scene;
*/

/*
-Looking for crime_scenes with cases where a briefcase and a man with a trench coat is mentioned.
SELECT * FROM crime_scene WHERE description LIKE '%briefcase%' AND description LIKE '%trench coat%';

-Two cases shows but only one is the location of the Blue Note Lounge
RESULT:
ID: 76	
DATE: 19851120	
TYPE: theft	
LOCATION: Blue Note Lounge	
DESCRIPTION: A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.

-Let's see which suspects match the descriptions
SELECT * FROM suspects WHERE attire = 'trench coat' AND scar = 'left cheek';

-There's two suspects after looking into who had a trench coat and a left scar on their cheek
SUSPECT 1:
id: 3
name: Frankie Lombardi
attire: trench coat
scar: left cheek
SUSPECT 2:
id: 183
name: Vincent Malone
attire: trench coat
scar: left cheek

-Who said what for their interviews?
Frankie Lombardi 'Gave no commentary'
Vincent Malone 'I wasn’t going to steal it, but I did.'

CASE SOLVED:
It was Vincent Malone!
*/
