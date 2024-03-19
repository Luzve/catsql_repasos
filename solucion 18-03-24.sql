-- 5) Asignaturas impartidas por profesor de más a menos

 SELECT concat(profesor.nombre, ' ', profesor.apellido1, ' ', profesor.apellido2) AS Profesor, count(impartir.idAsignatura) AS materiasImpartidas
 FROM profesor INNER JOIN impartir ON profesor.idProfesor = impartir.idProfesor 
 GROUP BY impartir.idProfesor
 ORDER BY materiasImpartidas DESC;


-- 6) Mostrar aquellos alumnos que tienen una media superior a 7.00 y su nota media

 SELECT concat(alumno.nombre, ' ', alumno.apellido1, ' ', alumno.apellido2) 
 AS Alumno, round(avg(nota),2) AS nota_total
 FROM alumno INNER JOIN matricula ON alumno.idAlumno = matricula.idAlumno 
 GROUP BY alumno.idAlumno
 having avg(matricula.nota) > 7
 ORDER BY nota_total desc;
 
 SELECT concat(nombre, ' ', apellido1, ' ', apellido2) AS alumno, round(avg(matricula.nota),2) AS notaMedia
FROM alumno INNER JOIN matricula ON alumno.idAlumno = matricula.idAlumno
GROUP BY alumno.idAlumno
HAVING avg(matricula.nota) > 7.00 -- Filto de la agrupación alumno con una nota media superior a 7
ORDER BY notaMedia DESC;
 
-- 7) Obtener los créditos totales por curso (con separación según caracter). 
-- El curso 6 tiene 0 créditos, al ser un doctorado las asignaturas no forman parte 
-- de la nota final

select sum(creditos) as creditos_total, caracter, curso from asignatura
group by curso,caracter;

-- 8) Obtener aquellas optativas sin alumnos

SELECT asignatura.nombre, count(matricula.idAlumno) AS alumnos
FROM asignatura LEFT JOIN matricula ON (asignatura.idAsignatura = matricula.idAsignatura)
GROUP BY asignatura.nombre
HAVING alumnos = 0;

-- 9) Obtener el número de alumnos de primero que tienen que recuperar cada asignatura

SELECT nombre, count(idAlumno) as alumnosRecuperacion
FROM asignatura INNER JOIN matricula ON asignatura.idAsignatura = matricula.idAsignatura
WHERE nota < 5.00 AND curso = 1
GROUP BY nombre
ORDER BY nombre ASC;