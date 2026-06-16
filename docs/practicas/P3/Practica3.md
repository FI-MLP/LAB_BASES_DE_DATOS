# Práctica 03: Control de Acceso
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 03

**Asignatura:** Laboratorio de Bases de Datos
**Maestra:** M.I.A. Martha López Pelcastre
**Universidad Nacional Autónoma de México**

---

## Contenido
1. Objetivo
2. Actividades previas
3. Lenguaje de control de datos en SQL Server
   - Explorar usuarios administradores
   - Esquemas
   - Roles
   - Usuarios de la base de datos
   - Privilegios
4. Contenido del reporte

---

## 1.1. Objetivo
El alumno aprenderá a utilizar comandos de control de datos para crear usuarios, otorgar y revocar permisos.

---

## 1.1. Actividades previas
Antes de iniciar con la práctica, realizar, revisar y calificar las actividades del documento previo a esta práctica.

---

## 1.2. Lenguaje de control de datos en SQL SERVER

### 1.2.1. Explorar usuarios administradores
SQL Server se apoya sobre tres elementos claves para el control de accesos:
- Entidades de seguridad.
- Objetos asegurables.
- Autorizaciones.

```sql
SELECT * FROM fn_my_permissions(NULL, 'SERVER');
```

### 1.2.2. Esquemas
Los esquemas facilitan la gestión de seguridad sobre tablas, vistas, procedimientos y funciones.

```sql
use baseMartes
go
EXECUTE AS USER = 'G2_89000546'
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
GO
```

### 1.2.3. Roles

```sql
SELECT * FROM fn_builtin_permissions(NULL);
GO
```

```sql
ALTER SERVER ROLE securityadmin ADD MEMBER [G2_89000546];

USE [baseMartes]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [G2_89000546]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [G2_89000546]
GO
```

### Actividad 5.a Crear Login

```sql
CREATE LOGIN [G2_pruebaRol_89000546]
WITH PASSWORD = 'a234567+';
```

### 1.2.4. Usuarios de la base de datos

```sql
use baseMartes
go
create user [G2_pruebaRol_89000546]
FOR LOGIN [G2_pruebaRol_89000546];
```

### 1.2.4.2. Privilegios

```sql
GRANT SELECT
ON estudianteMartes
TO [G2_pruebaRol_89000546];
```

```sql
USE baseMartes;
select * from estudianteMartes;
```

```sql
REVOKE select ON estudianteMartes
TO [89000546_pruebaRol];
```

```sql
use baseMartes
drop user [G2_pruebaRol_89000546];
go

drop login [G2_pruebaRol_89000546];
go
```

---

## 1.3. Contenido del reporte

- Evidencias de las actividades 1 a la 8.
- Scripts realizados.
- Evidencias de ambos integrantes.
