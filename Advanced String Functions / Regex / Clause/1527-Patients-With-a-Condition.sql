# Write your MySQL query statement below

-- your task is to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

SELECT *
FROM Patients
-- Check for conditions that start with 'DIAB1' or contain ' DIAB1' (where 'DIAB1' is preceded by a space) 
WHERE conditions like 'DIAB1%' or conditions like '% DIAB1%' ;