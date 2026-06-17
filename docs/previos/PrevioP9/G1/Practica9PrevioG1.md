# Práctica 09 – Previo: Lenguaje de Definición de Datos (DDL)
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 09 PREVIO

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**  

---

## Contenido

1. [Ejercicio Previo](#11-ejercicio-previo)
2. [Contenido a entregar](#12-contenido)

---

## 1.1. Ejercicio Previo

A partir de los siguientes modelos relacionales, escriba el script **DDL** completo en SQL Server para crear la base de datos con todas sus tablas, restricciones, llaves primarias, foráneas y constraints.

### Ejercicio A

Dado el siguiente modelo relacional de una biblioteca:

```
AUTOR        = {id_autor(PK), nombre, nacionalidad}
LIBRO        = {isbn(PK), titulo, anio_publicacion, id_autor(FK)}
SOCIO        = {id_socio(PK), nombre, correo(U), telefono(N)}
PRESTAMO     = {[id_socio(FK), isbn(FK)](PK), fecha_prestamo, fecha_devolucion(N)}
```

Escriba el script DDL que incluya:

a) `CREATE DATABASE` y `USE`.  
b) `CREATE TABLE` para cada entidad en el orden correcto (respetando dependencias).  
c) Restricciones `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE` y `NOT NULL`.  
d) Al menos una restricción `CHECK` (ej. año de publicación mayor a 1800).  
e) `DROP TABLE` comentado al inicio del script para limpieza.

```sql
-- Escribir aquí su script DDL
```

---

### Ejercicio B

Dado el siguiente modelo relacional de una empresa de logística:

```
SUCURSAL     = {id_sucursal(PK), nombre, ciudad, telefono(N)}
EMPLEADO     = {id_empleado(PK), nombre, puesto, salario, id_sucursal(FK)}
CLIENTE      = {id_cliente(PK), nombre, rfc(U), correo(N)}
ENVIO        = {id_envio(PK), fecha, peso, costo, id_cliente(FK), id_empleado(FK)}
```

Escriba el script DDL completo con:

a) Creación de todas las tablas en orden correcto.  
b) Restricción `CHECK` sobre el salario (mayor a 0) y el peso del envío (mayor a 0).  
c) Comandos `ALTER TABLE` para agregar una columna `estatus VARCHAR(20)` a la tabla `ENVIO`.  
d) Comando para eliminar la columna agregada.

```sql
-- Escribir aquí su script DDL
```

---

## 1.2. Contenido

1. Escriba el script DDL **completo y documentado** (papel, digital o en SQL Server Management Studio).
2. Asegurarse de crear las tablas en el **orden correcto** según las dependencias de llaves foráneas.
3. Incluir comentarios en el script explicando cada sección.
4. Llevarlo **impreso** el día de la práctica.

---
