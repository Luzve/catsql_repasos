 -- 14) Queremos repartir un bonus a los 10 profesores con mejores medias en las asignaturas que imparten
SELECT profesor.idProfesor, concat(profesor.nombre, ' ', apellido1, ' ', apellido2) AS profesor, round(avg(nota),2) AS notaMedia
FROM profesor 
LEFT JOIN impartir ON (profesor.idProfesor = impartir.idProfesor)
LEFT JOIN asignatura ON (impartir.idAsignatura = asignatura.idAsignatura)
LEFT JOIN matricula ON (asignatura.idAsignatura = matricula.idAsignatura)
GROUP BY profesor.idProfesor
ORDER BY notaMedia DESC
LIMIT 10;

	-- 15) Obtener toda la información de asignaturas que contienen la palabla 'datos' o 'progra' en su nombre. Ordenar por curso y luego por nombre
SELECT *
FROM asignatura
WHERE nombre LIKE '%datos%' OR nombre LIKE '%progra%'
ORDER BY curso ASC, nombre ASC;

select *  from asignatura
where nombre like '%datos%' or nombre like '%progra%'
order by curso, nombre;
  
	-- 16) Obtener listado para enviar un comunicado oficial personalizado con el nombre a todas las personas de la universidad (alumnos y profesores)
(SELECT nombre, email FROM alumno)
UNION
(SELECT nombre, email FROM profesor);
    
