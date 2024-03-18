use facultad;
-- 1) Caracter, nº de alumnos, nota mínima, máxima y media de las asignaturas. Ordenar
-- el resultado por curso primero y nombre de la asignatura después.

select a.curso,a.nombre,a.caracter,count(m.idAlumno) as "Alumnos", min(m.nota) as nota_min,max(m.nota) as nota_max,round(avg(m.nota),2) as nota_media
from matricula m, asignatura a
where a.idAsignatura = m.idAsignatura
group by a.nombre
order by a.curso, a.nombre;

-- Respuestas Opcionales

SELECT a.curso, a.nombre, a.caracter, 
       COUNT(m.idAlumno) AS 'Nº de alumnos', 
       ROUND(MIN(m.nota), 2) AS 'Nota mínima', 
       ROUND(MAX(m.nota), 2) AS 'Nota máxima', 
       ROUND(AVG(m.nota), 2) AS 'Nota media' 
FROM asignatura a
LEFT JOIN matricula m ON a.idAsignatura = m.idAsignatura 
GROUP BY a.curso, a.nombre, a.caracter 
ORDER BY a.curso, a.nombre;

SELECT curso, nombre, caracter, count(nota) AS 'Alumnos', round(min(nota), 2) AS 'Nota min', round(max(nota), 2) AS 'Nota max', round(avg(nota), 2) AS 'Nota Media' 
FROM asignatura, matricula 
WHERE matricula.idAsignatura = asignatura.idAsignatura 
GROUP BY asignatura.nombre 
ORDER BY asignatura.curso ASC, asignatura.nombre ASC;



-- 2) Asignaturas con una nota media inferior a 5 orden por curso y posteriormente 
-- por nombre ascendente

select nombre, curso, round(avg(nota),2) as nota_promedio
from asignatura a, matricula m
where a.idAsignatura = m.idAsignatura
group by a.nombre
having avg(nota) < 5
order by curso asc, nombre asc;




-- 3) Conocer el número de profesores por categoría  y ordenar la tabla de 
-- categoría con más profesores a categoría con menos

select categoria, count(idProfesor) as N_Profesores
from profesor
group by categoria
order by N_Profesores desc;






-- 4) Conocer curso, asignatura, caracter de la asignatura, 
-- coordinador y e-mail de contacto

select asi.curso, asi.nombre, asi.caracter, asi.coordinador, p.email
from asignatura asi, alumno a, profesor p
where p.idProfesor = asi.coordinador
group by curso;







-- 5) Asignaturas impartidas por profesor de más a menos