-- We want to find out how many times each student attended each subject exam.

-- Croos Join :  This ensures that each student has an entry for every subject, regardless of whether they attended the exam.

-- left outer join :  This means if a student did not attend a particular exam, there will be a NULL entry in the Examinations table for that subject and their record for that subject is included in the result with a count of 0.

-- Together, these joins allow us to generate a complete table that shows how many times each student attended each exam, including subjects they never attended, which is essential for a comprehensive report.

select E.student_id , E.student_name ,S.subject_name,count(ex.subject_name) as attended_exams  from Students E cross join Subjects S
left outer join Examinations ex on E.student_id = ex.student_id and S.subject_name = ex.subject_name
group by E.student_id,S.subject_name 
order by E.student_id,S.subject_name