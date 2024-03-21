-- 10) Alumnos que tienen que presentarse a la recuperación de 
-- Algebra lineal y la nota que sacaron    


SELECT concat(alumno.nombre,' ', apellido1, ' ', apellido2) AS alumno, matricula.nota 
FROM alumno INNER JOIN matricula ON alumno.idAlumno = matricula.idAlumno INNER JOIN asignatura ON asignatura.idAsignatura = matricula.idAsignatura
WHERE matricula.nota < 5.00 AND asignatura.nombre = "Algebra lineal";

	-- 11) Alumnos de segundo que han sacado un 10 en alguna materias para ponerles 
    -- mención de honor. Ordenar alfabéticamente por nombre asignatura 
    
SELECT curso, asignatura.nombre, concat(alumno.nombre,' ', apellido1, ' ', apellido2) AS alumno, nota
FROM matricula INNER JOIN alumno ON alumno.idAlumno = matricula.idAlumno INNER JOIN asignatura ON matricula.idAsignatura = asignatura.idAsignatura
WHERE nota = (select max(nota) from matricula) AND curso = 2
ORDER BY asignatura.nombre ASC;

-- 12) Conocer número de alumnos totales, los becados y porcentaje de becados 
-- respecto al total
SELECT count(alumno.idAlumno) AS alumnos, (SELECT count(alumno.idAlumno) FROM alumno WHERE beca = 'si') AS becados,
round((SELECT count(alumno.idAlumno) FROM alumno WHERE beca = 'si')/count(alumno.idAlumno)*100, 2) AS "% becados"
FROM alumno;

	-- 13) Conocer nota media de los becados y el curso en el que están. Ordenar 
    -- resultado por nombre completo descendiente
SELECT curso, concat(alumno.nombre, ' ', apellido1, ' ', apellido2) AS Alumno, round(avg(matricula.nota),2) AS notaMedia
FROM alumno 
LEFT JOIN matricula ON (alumno.idAlumno = matricula.idAlumno) 
LEFT JOIN asignatura ON (asignatura.idAsignatura = matricula.idAsignatura)
WHERE beca = "si"
GROUP BY Alumno
ORDER BY curso ASC, Alumno ASC;
    