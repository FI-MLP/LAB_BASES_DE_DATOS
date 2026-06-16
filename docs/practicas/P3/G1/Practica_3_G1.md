# Práctica 03: Control de Acceso
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 03

**Asignatura:** Laboratorio de Bases de Datos

**Maestra:** M.I.A. Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## Contenido
- 1.[Introducción al lenguaje de control de acceso]()
- 1.1 [Objetivo]()
- 1.1 [Actividades previas]()
- 1.2 [Lenguaje de control de datos en SQL Server]()
   - 1.2.1 [Explorar usuarios administradores]()
   - 1.2.2 [Esquemas]()
   - 1.2.3 [Roles]()
   - 1.2.4 [Usuarios de la base de datos (user)]()
   - 1.2.4.1 [Usuarios por defecto en una BD]()
   - 1.2.4.2 [Privilegios]()
- 1.3. [Contenido del reporte]()

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

Las entidades de seguridad son las cuentas de seguridad que disponen de un acceso al servidor SQL.

Los objetos asegurables representan los objetos gestionados por el servidor. Un objeto puede ser una tabla, un esquema o una base de datos, por ejemplo.

Las autorizaciones se conceden a las entidades de seguridad para que puedan trabajar con los objetos asegurables. Los manejadores definen usuarios administradores que se crean al momento de crear la base de datos. Estos usuarios son los encargados de otorgar privilegios a nuevos usuarios, e inclusive convertirlos en usuarios administradores.


Adicional a los usuarios administradores internos de la base de datos, existen usuarios administradores definidos, que son considerados como los dueños del software y todos los archivos asociados a la base de datos, incluyendo los datos de un usuario final.


Algunos ejemplos de privilegios son:
• CREATE SESSION
• CREATE TABLE
• CREATE VIEW
• CREATE SYNONYM
• CREATE PUBLIC SYNONYM
• CREATE PROCEDURE
• CREATE TRIGGER
• CREATE SEQUENCE
• CREATE USER

Dependiendo de la instalación del manejador, se tendrán dos usuarios administradores. Si el manejador de instaló con autenticación modo mixto, los usuarios administradores son;
- El usuario de Windows con el que se realizó la instalación
- El sa


### 1.2.2. Esquemas

El propósito de los esquemas es facilitar la gestión de la seguridad del acceso de los usuarios a los objetos (tablas, vistas, procedimientos almacenados, funciones). Es parecido a un servidor de archivos con carpetas y subcarpetas, donde se almacenarán los archivos. Los derechos de acceso tienen prioridad sobre las carpetas, que será más fácil que archivo por archivo. En el caso de SQL Server, los derechos se pueden establecer en bases de datos, esquemas y en objetos.


En el caso de que no exista una división de esquema lógico para una base de datos, los objetos se colocarán en el esquema predeterminado, es decir, dbo.

Para acceder a los objetos, incluso si están almacenados en el esquema predeterminado del usuario, es preferible nombrarlos usando su esquema, es decir, nombreEsquema.nombreObjeto. Cuando se usa un nombre corto (solo el nombre del objeto sin prefijarlo con el nombre del esquema), SQL Server verifica la existencia del objeto en el esquema predeterminado del usuario y luego en el esquema dbo, por lo que, si se especifica el nombre del esquema, este paso no se tiene que realizar y optimiza el tiempo de respuesta de las solicitudes.


En SQL server existe la función fn_my_permissions() con la que se puede comprobar los permisos asignados para un usuario. Una función que tienen dos parámetros, el primero es el objeto asegurable y el segundo una cadena de texto con la clase de este objeto. Por ejemplo, se puede comprobar todos los permisos que tiene un usuario en relación con la base de datos con la siguiente instrucción.


**Nota:** Puede realizar las actividades de esta práctica, conectado en el servidor de la facultad o desde su servidor local. En caso de hacerlo en su servidor local, seguir las indicaciones del script llamado 3P_servidor_local.sql y posteriormente continuar con las actividades de la práctica

**Actividad 1.** Ejecutar la siguiente sentencia para mostrar los permisos al usuario en sesión. Inicie sesión con el usuario. Incluir la salida de la consulta en el reporte


```sql
--conectarse con el usaurio sa si utiliza su equipo personal o
--usuario usr_labbd en el servidor de laboratorio
SELECT * FROM fn_my_permissions(NULL, 'SERVER');
```

En el caso de que se ejecute como administrador deberán aparecer que se dispone de todos los servicios. Pero si se ejecuta para la cuenta de un usuario normal incluso podría no aparecer ninguno.

**Actividad 2.** Comprobar los permisos para una base de datos. Ejecutar la siguiente sentencia para mostrar los objetos que le pertenecen al usuario. Incluir la salida de la consulta en el reporte

```sql
--conectarse con el usuario sa desde su equipo personal o
--usuario usr_labbd en el servidor de laboratorio
use baseMartes --abrir su base de datos, la correspondiente a su grupo
go
EXECUTE AS USER = 'G2_89000546' --escribir el nombre de su usuario de acuerdo a la nomenclatura que le corresponde
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
GO
```

Para obtener el listado de todos los permisos integrados en SQL Server se puede recurrir a la función `fn_builtin_permissions()`.

**Actividad 3.** Ejecutar la siguiente sentencia para mostrar todos los permisos que le pertenecen al usuario activo. Incluir la salida de la consulta en el reporte

```sql
--conectarse con el ussuario sa desde su equipo personal o
--usuario usr_labbd en el servidor de laboratorio
SELECT * FROM fn_builtin_permissions(NULL);
GO
```

### 1.2.3. Roles

Otro concepto comúnmente empleado es el concepto de Rol. Un rol permite agrupar a un conjunto de privilegios y ser asignado a uno o varios usuarios. Los Roles pueden existir a nivel de instancia o base de datos.
A nivel de Instancia:

- Los logins pueden ser agregados a roles llamados “server roles”.
- No se pueden crear Roles nuevos

A nivel de Base de Datos
- Los usuarios de base de datos pueden ser otorgados a roles.
-Se pueden crear roles nuevos.

Por ejemplo, el rol de base de datos ‘admin’ puede estar formado por privilegios como ‘create user’, ‘create table’, etc., y puede ser asignado a varios usuarios.

**Actividad 4.** Roles de servidor. Agregar al rol security_admin a su usuario.

```sql
--desde su equipo personal, conectarse con usuario sa o windows
--si se conecta al servidor del laboratorio conectarse con usr_labbd
ALTER SERVER ROLE securityadmin ADD MEMBER [G2_89000546]; --escribir el nombre de su login <G#_numCta>
--Agregar al usuario al rol db_securityadmin en la base de datos de su grupo
USE [baseMartes] -- colocar el nombre de su base de datos
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [G2_89000546]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [G2_89000546]
GO
```

**Actividad 5.a.** Crear un login con la siguiente nomenclatura G#_pruebaRol_NUMCUENTA con el usuario de la actividad 4 ([G2_89000546]) a este usuario se le otorgaron los permisos de securityadmin. Incluir código y evidencia del login creado. Use el password; 'a234567+' para el nuevo logín.

```sql
-- Conectarse con el nuevo login G2_89000546 y crear otro script
-- Crea el login con la nomenclatura solicitada en el nuevo script
CREATE LOGIN [G2_pruebaRol_89000546]
WITH PASSWORD = 'a234567+';
```

### 1.2.4. Usuarios de la base de datos (user)

El usuario de la base de datos es la identidad del inicio de sesión cuando está conectado a una base de datos. El usuario de la base de datos puede utilizar el mismo nombre que el inicio de sesión, pero no es necesario.

- Los logins son asignados a los usuarios
- Los grants se les asignan a los usuarios.
- A los usuarios se le asignan sus propios Esquemas(schemas)

**Actividad 5.b.** Crear el usuario G#_pruebaRol_NUMCUENTA a la base de datos correspondiente a su grupo (con el usuario de la actividad 4 ([G_02_89000546]) ). Incluir código y evidencia del usuario creado.

```sql
--Código ejemplo
use baseMartes
go
create user [G2_pruebaRol_89000546]
FOR LOGIN [G2_pruebaRol_89000546];
```

### 1.2.4.1. Usuarios por defecto en una BD

**dbo:** Propietario. No puede ser borrado de la BD

**guest:** Permite a usuarios que no tienen cuenta en la BD que accedan a ella, pero hay que darle permiso explícitamente

**Information_schema:** Permite ver los metadatos de SQL Server

**Sys:** Permite consultar las tablas y vistas del sistema, procedimientos extendidos y otros objetos del catálogo del sistema

Los usuarios pueden pertenecer a Roles.

- Todos los usuarios son miembros del Role “Public”

- El login “sa” está asignado al usuario dbo en todas las bases de datos.

### 1.2.4.2. Privilegios
La creación de un nuevo usuario permite que este sea autenticado en la base de datos. Sin embargo, no tiene autorización o permiso alguno para realizar acciones en la base de datos: crear sesión, crear objetos, etc.

Existen 2 tipos de privilegios:

- Privilegios a nivel sistema. Permiten realizar acciones que modifican la estructura de la base de datos.
  
- Privilegios a nivel objeto. Permiten el acceso de objetos que pertenecen a un usuario esquema.

Ejemplo de privilegios a nivel systema

```sql
create session, create table, create view, create synonym, create public synonym
create procedure, create trigger, create sequence, create user, etc. 
alter user
```

- Sintaxis empleada para otorgar privilegios.

```sql
GRANT { ALL [ PRIVILEGES ] }
| permission [ ( column [ , ...n ] ) ] [ , ...n ]
[ ON [ class :: ] securable ] TO principal [ , ...n ]
[ WITH GRANT OPTION ] [ AS principal ];
```

**Actividad 6.a** Cada usuario deberá ejecutar las instrucciones siguientes para otorgar a su nuevo usuario el privilegio para realizar consultas. Incluir en el reporte la salida de la instrucción.

**Ejemplo:** Otorguemos el privilegio de hacer consultas a la tabla estudiante:

```sql
-- con el usuario G#_numCuenta
GRANT SELECT
ON estudianteMartes --sustituir por la tabla que le corresponde de acuerdo a su grupo
TO [G2_pruebaRol_89000546]; -- sustituir por el nombre de su usuario
```

Actividad 6.b Ejecutar la siguiente sentencia para ver el contenido de la tabla estudiante.
**Incluir en el reporte** la salida obtenida.

```sql
--conectarse con su usuario <G#_pruebaRol_numCuenta>
USE baseMartes;
select * from estudianteMartes; --ponga el nombre de su tabla
```

Quitar permisos sobre tablas

**Actividad 7.** Ejecutar la instrucción, comprobar consultando nuevamente la tabla estudiante. **Incluir en el reporte** la salida de la instrucción.

``` sql
-- con el usuario G#_numCuenta
REVOKE select ON estudianteMartes
TO [89000546_pruebaRol];
```

**Actividad 8.** Borrar los inicios de sesión y usuarios creados (G_##_numcuenta y G#_pruebaRol_numcuenta). **Incluir en el reporte** la salida de la instrucción.

```sql
--Ejemplo de borrado de login y user
--Desde su equipo personal, conectarse con usuario sa o windows
--si se conecta al servidor del laboratorio conectarse con usr_labbd
--primero borramos a usuario de la base de datos
use baseMartes
drop user [G2_pruebaRol_89000546];
go
--desconectar al usuario del servidor y ejecutar
drop login [G2_pruebaRol_89000546];
go
```
---

## 1.3. Contenido del reporte
- Elementos comunes a todas las prácticas especificados en la rúbrica correspondiente
- Contenidos de este documento. Evidencias de las actividades de la 1 a la 8
- La practica se entrega en parejas: en el informe deben incluirse las evidencias de ambos integrantes. Cada integrante entrega sus scripts (los 3 scripts). El que no entrega informe indica en comentario en privado quien lo entregó.
