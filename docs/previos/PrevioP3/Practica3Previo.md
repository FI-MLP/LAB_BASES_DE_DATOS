# PREVIO - PRÁCTICA 03
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA PREVIO

**Asignatura:** Laboratorio de Bases de Datos

**Maestra:** M.I.A Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## 1. Introducción al lenguaje de control de acceso

### 1.1. Introducción
Se presentan conceptos y configuraciones básicas para comprender los mecanismos de control de acceso a los datos.

### 1.2. Métodos de autenticación en SQL Server

#### 1.2.1. Logins
SQL Server admite:
- Autenticación de Windows.
- Autenticación propia de SQL Server.

```sql
CREATE LOGIN G7_89000546
WITH PASSWORD = 'Fi34567*';
```

<p align="center">
  <img src="/docs/rs/P3Previo1.png" alt="Creación Login" width="75%">
</p>

#### 1.2.2. Usuarios

```sql
USE [baseMartes];
CREATE USER G5_89000546
FOR LOGIN G5_89000546
WITH DEFAULT_SCHEMA = db_datawriter;
```

<p align="center">
  <img src="/docs/rs/P3Previo2.png" alt="Creación Usuario" width="75%">
</p>

### 1.3. Usuarios y esquemas

#### Esquemas
- Un mismo esquema puede utilizarse en varias bases de datos.
- Permite proteger objetos mediante permisos.
- Facilita la administración.

#### Otorgar y remover privilegios

```sql
GRANT INSERT ON OBJECT::dbo.estudiante
TO 3171_BD_practica2;
```

```sql
REVOKE INSERT ON OBJECT::dbo.estudiante
TO 3171_BD_practica2;
```

#### Roles

```sql
CREATE ROLE nombre_rol;
```

```sql
ALTER ROLE nombre_rol
ADD MEMBER nombre_usuario;
```

```sql
DROP ROLE nombre_rol;
```

---

## 1.4. Ejercicios previos

Realizar las actividades 1 y 2 (C1 y C2) y adjuntar evidencias.
