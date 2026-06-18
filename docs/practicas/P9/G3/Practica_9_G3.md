# Práctica 9: Lenguaje de Definición de Datos DDL
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 09

**Asignatura:** Laboratorio de Bases de Datos  

**Maestra:** M.I.A. Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## 1. Lenguaje de Definición de Datos DDL

### Contenido

1. [Lenguaje de Definición de Datos DDL](#1-lenguaje-de-definición-de-datos-ddl)
   
   1.1. [Objetivo](#11-objetivo)
   
   1.2. [Actividades previas](#12-actividades-previas)
   
   1.3. [Actividades a realizar](#13-actividades-a-realizar)
   
   1.4. [Contenido del reporte](#14-contenido-del-reporte)

---

### 1.1. Objetivo

El alumno aprenderá el uso del lenguaje SQL para la creación de tablas e índices en una base de datos. Comprenderá y confirmará el uso del lenguaje SQL para realizar la modificación y/o eliminación de la estructura de los principales objetos de una base de datos empleando las instrucciones ALTER y DROP.

---

### 1.2. Actividades previas

Antes de iniciar con la práctica, realizar, revisar y calificar las actividades del documento previo a esta práctica.

---

### 1.3. Actividades a realizar

Generar el DDL para los siguientes puntos:

1. Crear la tabla REGISTRO_SERVICIO con constraint de columna
2. Crear la tabla ESCRITURA con constraint de columna, la pk es una natural no usar identity
3. Crear la tabla PAGO, es una entidad débil.
4. Implemente la relación unaria de la tabla dueño.
5. La fecha de contratación de los servicios en caso de que el usuario no la indique será la fecha del sistema. Implemente el default
6. Agrega a la tabla datos venta los campos, nombre_dueño varchar(70), telefono_dueño numeric(10) y correo varchar(60) opcional.
7. Ver la estructura de las tablas. Tomar captura de pantallas de cada una de las tablas

```sql
EXEC sp_help 'dbo.empresa';
GO
```

<p align="center">
  <img src="/docs/rs/Practica9Imagen1.png" alt="Estructura de tablas - sp_help dbo.empresa" width="85%">
</p>

8. Realizar operaciones restringidas, en cascada y puesta en nulo **REALIZAR CON PROFESORA**

```sql
CREATE TABLE factura
( idFactura int primary key,
 descripcion varchar(100),
 total int
);

CREATE TABLE articulo(
idFactura int NOT NULL,
idArticulo int NOT NULL,
descripcion varchar(30) NULL,
CONSTRAINT PK_articulo PRIMARY KEY CLUSTERED (idFactura ASC, idArticulo ASC )
)

-- Verificar con select 
SELECT * FROM FACTURA
SELECT * FROM ARTICULO

Alter Table dbo.articulo
Add Constraint FK_articulo_CASCADA Foreign Key (idFactura) References
factura(idFactura) On Update Cascade On Delete Cascade;

-- verficar
insert into dbo.factura values (1,'uno','3000')
insert into dbo.factura values (2,'nueva factura','5000')
insert into dbo.articulo values (1,1,'HOJAS')
insert into dbo.articulo values (1,2,'PINZAS')
insert into dbo.articulo values (1,3,'CUADERNOS')
insert into dbo.articulo values (2,6,'PLUMONES')

select * from dbo.factura
select * from dbo.articulo
-- IMAGEN DEL ANTES
```

<p align="center">
  <img src="/docs/rs/Practica9Imagen2.png" alt="Imagen del antes - factura y articulo" width="85%">
</p>

```sql
/*UPDATE*/
 UPDATE dbo.factura set idFactura = 3 WHERE descripcion = 'uno'
 --IMAGEN DEL DESPUES
--comprobar
select * from dbo.factura
select * from dbo.articulo
```

<p align="center">
  <img src="/docs/rs/Practica9Imagen3.png" alt="Imagen del después - UPDATE factura" width="85%">
</p>

```sql
/*DELETE*/
 -- IMAGEN DEL ANTES
 DELETE FROM DBO.factura 
 WHERE idfactura = 2
--comprobar
select * from dbo.factura
select * from dbo.articulo
-- IMAGEN DEL DESPUES
```

<p align="center">
  <img src="/docs/rs/Practica9Imagen4.png" alt="Imagen antes y después - DELETE factura" width="85%">
</p>

```sql
/* Borrar la tabla factura */
begin tran
 
 SELECT * FROM INFORMATION_SCHEMA.TABLES
DROP TABLE articulo
DROP TABLE factura; 
SELECT * FROM INFORMATION_SCHEMA.TABLES
rollback tran
 
 SELECT * FROM INFORMATION_SCHEMA.TABLES
DROP TABLE articulo
DROP TABLE factura; 
SELECT * FROM INFORMATION_SCHEMA.TABLES
```

<p align="center">
  <img src="/docs/rs/Practica9Imagen5.png" alt="Resultado begin tran y rollback tran" width="85%">
</p>

---

### 1.4. Contenido del reporte

- Elementos comunes a todas las prácticas especificados en la rúbrica correspondiente
- Evidencia de cada actividad, imagen del código y correcta ejecución del mismo, donde se visualice los cambios a la base de datos (explorador de objetos)
- Script documentado, código limpio de cada una de las actividades
- Nombre del script #Equipo_#practica

---
