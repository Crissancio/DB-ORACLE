/*------*/, xep.ci
SELECT xl.titulo
FROM LIBRO xl, ESCRITO_POR xep
WHERE xl.codlibro = xep.codlibro

-- >
SELECT DISTINCT TMP.titulo
FROM AUTOR xa, (SELECT xl.titulo, xep.ci
                FROM LIBRO xl, ESCRITO_POR xep
                WHERE xl.codlibro = xep.codlibro) TMP
WHERE xa.ci = TMP.ci
AND xa.nacionalidad like 'Boliviana'
ORDER BY TMP.titulo
/*-------*/
SELECT xpl.codlibro
FROM PEDIDO xp,  PEDIDO_LIBROS xpl
WHERE xp.nropedido = xpl.nropedido
AND (to_char(xp.fecha, 'YYYY') >1993 OR to_char(xp.fecha, 'YYYY') < 2006)

-- >
SELECT  xl.titulo
FROM LIBRO xl, (SELECT xpl.codlibro, xp.fecha
                      FROM PEDIDO xp,  PEDIDO_LIBROS xpl
                      WHERE xp.nropedido = xpl.nropedido
                      AND (to_char(xp.fecha, 'YYYY') = 1993 OR to_char(xp.fecha, 'YYYY') = 2006)) TMP
WHERE xl.codlibro = TMP.codlibro

/*-----*/
SELECT DISTINCT xa.nacionalidad
FROM AUTOR xa, (SELECT xl.titulo, xep.ci
                FROM LIBRO xl, ESCRITO_POR xep
                WHERE xl.codlibro = xep.codlibro
                AND (xl.titulo like 'SEGURIDAD INFORMATICA' or xl.titulo like 'TECNICAS DE OPTIMIZACION') ) TMP
WHERE xa.ci = TMP.ci
ORDER BY xa.nacionalidad

/*------*/
SELECT DISTINCT TMP.titulo
FROM PERSONA xp, (SELECT xl.titulo, xep.ci
                FROM LIBRO xl, ESCRITO_POR xep
                WHERE xl.codlibro = xep.codlibro) TMP
WHERE xp.ci = TMP.ci
AND xp.sexo like 'Femenino'
AND (2024 - to_char(xp.fechanaci, 'yyyy')) > 29
ORDER BY TMP.titulo