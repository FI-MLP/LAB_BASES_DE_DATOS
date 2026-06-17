# Práctica 13 – Previo: Utilización de Distintos Tipos de JOIN, Subconsultas y Vistas
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 13 PREVIO

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**  

---

## Contenido

1. [Ejercicio Previo](#11-ejercicio-previo)
2. [Contenido a entregar](#12-contenido)

---

## 1.1. Ejercicio Previo

Con base en el siguiente modelo relacional de una librería, escriba las consultas SQL solicitadas.

```
EDITORIAL    = {id_editorial(PK), nombre, pais}
AUTOR        = {id_autor(PK), nombre, nacionalidad}
LIBRO        = {isbn(PK), titulo, precio, id_editorial(FK), id_autor(FK)}
CLIENTE      = {id_cliente(PK), nombre, correo(U)}
VENTA        = {id_venta(PK), fecha, id_cliente(FK), isbn(FK)}
```

### Ejercicio A — Tipos de JOIN

Escriba la consulta SQL para cada caso e indique qué tipo de JOIN utiliza y por qué:

1. Obtener el título del libro y el nombre de la editorial de **todos los libros** que tengan editorial registrada.

```sql
-- INNER JOIN
```

2. Obtener el título de **todos los libros**, aunque no tengan editorial registrada (mostrar NULL si no tiene).

```sql
-- LEFT JOIN
```

3. Obtener todas las editoriales, aunque no tengan libros registrados.

```sql
-- RIGHT JOIN
```

4. Obtener el título del libro, nombre del autor y nombre de la editorial combinando las tres tablas.

```sql
-- INNER JOIN múltiple
```

---

### Ejercicio B — Subconsultas

Escriba la consulta SQL para cada caso:

1. Obtener el título y precio del libro más caro.

```sql
-- Subconsulta en WHERE con MAX
```

2. Obtener los clientes que **hayan realizado al menos una venta**.

```sql
-- Subconsulta con EXISTS o IN
```

3. Obtener los libros cuyo precio sea mayor al precio promedio de todos los libros.

```sql
-- Subconsulta en WHERE con AVG
```

4. Obtener el nombre del cliente y la cantidad de libros que ha comprado, usando una subconsulta en el SELECT.

```sql
-- Subconsulta en SELECT
```

---

### Ejercicio C — Vistas

1. Cree una vista llamada `vw_LibrosConAutor` que muestre el título del libro, el nombre del autor y el precio.

```sql
-- CREATE VIEW
```

2. Consulte el contenido de la vista creada.

```sql
-- SELECT * FROM vista
```

3. Cree una vista llamada `vw_VentasPorCliente` que muestre el nombre del cliente y el total de ventas realizadas.

```sql
-- CREATE VIEW con JOIN y COUNT
```

---

## 1.2. Contenido

1. Escriba cada consulta SQL de forma **completa y documentada**.
2. Indicar junto a cada JOIN qué tipo es y por qué se eligió ese tipo.
3. Para las subconsultas, indicar en qué cláusula se encuentra (`WHERE`, `SELECT`, `FROM`, `HAVING`).
4. Llevarlo **impreso** el día de la práctica.

---
