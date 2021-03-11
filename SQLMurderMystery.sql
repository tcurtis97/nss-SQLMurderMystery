select c.date, c.type, c.description, c.city
 from crime_scene_report c
 WHERE c.date = 20180115 AND c.type = 'murder' AND c.city = 'SQL City'
              
 select c.date, c.type, c.description, c.city
 from crime_scene_report c
 WHERE c.date = 20180115 AND c.type = 'murder' AND c.city = 'SQL City'

-- date	type	description	city
--20180115	murder	Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".	SQL City



 select p.name
 from person p
 where p.address_street_name = 'Northwestern Dr'
 order by p.address_number asc
 --Morty Schapiro



 select p.name
 from person p
 where p.address_street_name = 'Franklin Ave'

 --Annabel Miller

 SELECT * FROM person WHERE name = 'Annabel Miller'

 --id	name	license_id	address_number	address_street_name	ssn
--16371	Annabel Miller	490173	103	Franklin Ave	318771143

 SELECT * FROM person WHERE name = 'Morty Schapiro'

-- id	name	license_id	address_number	address_street_name	ssn
--14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949


select i.transcript
 from interview i
 left join person p on p.id = i.person_id
 where p.id = 16371

 --I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.


 select i.transcript
 from interview i
 left join person p on p.id = i.person_id
 where p.id = 14887

 --I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".


select gf.name
 from get_fit_now_member gf
 left join get_fit_now_check_in gfc on gfc.membership_id = gf.id
 left join person p on p.id = gf.person_id
 left join drivers_license di on p.license_id = di.id
  WHERE gfc.membership_id LIKE '48Z%' AND di.plate_number LIKE '%H42W%' AND gf.membership_status = 'gold'

  --Jeremy Bowers

 --Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.

SELECT * FROM person WHERE name = 'Jeremy Bowers'
--id	name	license_id	address_number	address_street_name	ssn
--67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279



 SELECT i.transcript 
 FROM person p
JOIN interview i ON p.id = i.person_id
WHERE p.id = 67318

--I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.


SELECT * FROM person p
 JOIN income i ON p.ssn = i.ssn
 JOIN drivers_license di ON p.license_id = di.id
 JOIN facebook_event_checkin fb ON p.id = fb.person_id
 WHERE di.height BETWEEN 65 AND 67  AND di.hair_color = 'red' AND di.car_make = 'Tesla' AND fb.event_name LIKE '%SQL%'
 ORDER BY i.annual_income ASC

--id	name	license_id	address_number	address_street_name	ssn	ssn	annual_income	id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model	person_id	event_id	event_name	date
--99716	Miranda Priestly	202298	1883	Golden Ave	987756388	987756388	310000	202298	68	66	green	red	female	500123	Tesla	Model S	99716	1143	SQL Symphony Concert	20171206
--99716	Miranda Priestly	202298	1883	Golden Ave	987756388	987756388	310000	202298	68	66	green	red	female	500123	Tesla	Model S	99716	1143	SQL Symphony Concert	20171212
--99716	Miranda Priestly	202298	1883	Golden Ave	987756388	987756388	310000	202298	68	66	green	red	female	500123	Tesla	Model S	99716	1143	SQL Symphony Concert	20171229


INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;
--Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!
