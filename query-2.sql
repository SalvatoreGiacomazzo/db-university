---JOIN QUERY- `-- 

/*
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
*/
SELECT `students`.`name`, `students`.`surname`, `degrees`.`name`
FROM `students`
INNER JOIN `degrees` 
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";
/*
2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
Neuroscienze
*/
SELECT `degrees`.`name`, `degrees`.`level`, `departments`.`name`
FROM `degrees`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = "Magistrale"
AND `departments`.`name` = "Dipartimento di Neuroscienze"



/*
3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
*/
SELECT `teachers`.`id` AS `id_teacher`,`teachers`.`name`,`teachers`.`surname`,`courses`.*
FROM `teachers`
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teachers`.`id` = "44";





/*
4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nome */

SELECT `students`.`id`,  `students`.`name`, `students`.`surname`, `degrees`.`name`, `departments`.`name`
FROM `students`
JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname`, `students`.`name` ASC;



/*
5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti*/
SELECT `departments`.`name`, `degrees`.`name`, `courses`.`name`, `teachers`.`name`, `teachers`.`surname`
FROM `degrees`
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`





/*
6. Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)*/
SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`
FROM `departments`
JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` = "Dipartimento di Matematica";




/*
7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
per ogni esame, stampando anche il voto massimo. Successivamente,
filtrare i tentativi con voto minimo 18.*/








/* ---- GROUP BY ----
1. Contare quanti iscritti ci sono stati ogni anno
*/
SELECT YEAR(`enrolment_date`) AS `enrolment_year`, COUNT(*) AS `new_students`
FROM `students`
GROUP BY `enrolment_year`;


/*
2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
*/


SELECT `office_address`, COUNT(*) AS `number_teachers`
FROM `teachers`
GROUP BY `office_address`;


/*
3. Calcolare la media dei voti di ogni appello d'esame
*/
SELECT AVG(`vote`) as `average_vote`, `exam_id` 
FROM `exam_student` 
GROUP BY `exam_id`
ORDER BY (`average_vote`) DESC; 


/*
4. Contare quanti corsi di laurea ci sono per ogni dipartimento
*/

SELECT `department_id`, COUNT(*) as `number_courses`
FROM `degrees` 
GROUP BY `department_id`;  