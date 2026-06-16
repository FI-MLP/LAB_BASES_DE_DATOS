# PREVIO - PRÁCTICA 03
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA PREVIO

**Asignatura:** Laboratorio de Bases de Datos

**Maestra:** M.I.A Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## Contenido

Aquí tienes la lista manteniendo su numeración original y con los enlaces aplicados:

- 1.[INTRODUCCIÓN AL LENGUAJE DE CONTROL DE ACCESO]()
  - 1.1. [Introducción]()
  - 1.2. [Métodos de autenticación en SQL Server]()
    - 1.2.1. [Logins]()
    - 1.2.2. [Usuarios]()
  - 1.3. [Usuarios y esquemas]()
    - 1.3.1. [Esquemas]()
    - 1.3.2. [Administración de usuarios]()
    - 1.3.3. [Otorgar y remover privilegios a un usuario]()
    - 1.3.4. [Roles]()
  - 1.4. [Ejercicios previos]()

---

## 1. Introducción al lenguaje de control de acceso

### 1.1. Introducción
En este documento se incluyen conceptos y configuraciones básicas para comprender y practicar los diferentes mecanismos que emplea una base de datos para realizar el control de acceso a los datos, es decir, cuestiones de seguridad: autenticación, administración de roles y usuarios.

Las instrucciones para implementar el control de acceso a una Base de Datos relacional varían con respecto al manejador. En general la implementación del control de acceso a una base de datos está basada en la definición de una serie de objetos que tiene por objetivo el control de quién, cuándo y las acciones que puede realizar un usuario una vez que se le ha otorgado algún tipo de acceso a una Base de Datos

---

### 1.2. Métodos de autenticación en SQL Server

Los permisos en el motor de base de datos se administran a nivel de servidor a través de inicios de sesión y roles de servidor, y a nivel de base de datos a través de usuarios y roles de base de datos


#### 1.2.1. Logins

Los inicios de sesión son cuentas de usuario individuales para iniciar sesión en el Motor de base de datos de SQL Server. SQL Server y SQL Database admiten inicios de sesión basados en la autenticación de Windows e inicios de sesión basados en la autenticación de SQL Server.

Cuando un usuario se conecta a través de una cuenta de usuario de Windows, SQL Server valida el nombre y la contraseña de la cuenta utilizando el token principal de Windows en el sistema operativo. Esto significa que Windows confirma la identidad del usuario. SQL Server no solicita la contraseña y no realiza la validación de identidad. La autenticación de Windows es el modo de autenticación predeterminado

Cuando se usa la autenticación de SQL Server, los inicios de sesión se crean en SQL Server que no se basan en cuentas de usuario de Windows. Tanto el nombre de usuario como la contraseña se crean utilizando SQL Server y se almacenan en SQL Server. Los usuarios que se conectan mediante la autenticación de SQL Server deben proporcionar sus credenciales (inicio de sesión y contraseña) cada vez que se conectan.

Hay tres políticas de contraseña opcionales disponibles para los inicios de sesión de SQL Server.

- El usuario debe cambiar la contraseña en el próximo inicio de sesión

Requiere que el usuario cambie la contraseña la próxima vez que se conecte. La capacidad de cambiar la contraseña la proporciona SQL Server Management Studio.

- Hacer cumplir la caducidad de la contraseña

La política de antigüedad máxima de la contraseña de la computadora se aplica para los inicios de sesión de SQL Server.

- Hacer cumplir la política de contraseña

Las políticas de contraseña de Windows de la computadora se aplican para los inicios de sesión de SQL Server. Esto incluye la longitud y la complejidad de la contraseña.


#### 1.2.2. Usuarios

El usuario de la base de datos es la identidad del inicio de sesión cuando está conectado a una base de datos. El usuario de la base de datos puede utilizar el mismo nombre que el inicio de sesión, pero no es necesario.

- Los Logins son asignados a los usuarios

- Los grants se les asignan a los usuarios

- A los usuarios se le asignan sus propios Esquemas(schemas)

---

### 1.3. Usuarios y esquemas

#### 1.3.1 Esquemas

Un esquema en un servidor SQL es una colección de objetos de base de datos que se vinculan a un sistema de base de datos. Éste incluye tablas, funciones, vistas e índices. Es un tipo lógico de esquema que aporta una serie de ventajas, por ejemplo:

- Un mismo esquema puede utilizarse en varias bases de datos.

- Los permisos de seguridad pueden proteger objetos de base de datos como tablas e índices.

- Es posible transferir la propiedad de los esquemas.

- Los objetos creados en la base de datos pueden moverse entre esquemas.

- Ayuda en el proceso de acceso y manipulación de los objetos de la base de datos.

#### 1.3.2 Administración de Usuarios

- **Crear login**

De esta forma un usuario de base de datos está integrado por su inicio de sesión y el user en la base de datos

Sintaxis:

```sql
CREATE LOGIN <[nombre_login]>
WITH PASSWORD = 'password';
```
Los inicios de sesión se encuentran en la carpeta Login de la carpeta Security

<p align="center">
  <img src="/docs/rs/P3Previo1.png" alt="Creación Usuario" width="75%">
</p>

**Nota:** Los ejercicios deben realizarse en el servidor de la facultad. Utilizar el usuario: **usr_labbd.**
Actividad_1: a) Cree el inicio de sesión en su servidor local con el comando anterior:
    
    • el nombre de logín debe estar formado por la letra G y el número de grupo+guion bajo seguido del número de cuenta [Gnumero_numCuentaAlumno], quitar pico paréntesis. Número corresponde al grupo de laboratorio; G2 para martes, G7 para viernes, G8 para SABADO.

**Ejemplo:**

```sql
CREATE LOGIN G7_89000546
WITH PASSWORD = 'Fi34567*';
```

b) Comprobando los inicios de sesión:
  
Entrar a SQL Server 2022 con el inicio de sesión creado anteriormente


<p align="center">
  <img src="/docs/rs/P3Previo2.png" alt="Creación Usuario" width="75%">
</p>

**C1. Coloque evidencia de la conexión con su login creado. Ejemplo en la siguiente imagen**


<p align="center">
  <img src="/docs/rs/P3Previo3.png" alt="Creación Usuario" width="75%">
</p>

Hacer doble clic sobre cualquier base de datos y obtendremos la siguiente ventana:

<p align="center">
  <img src="/docs/rs/P3Previo4.png" alt="Creación Usuario" width="75%">
</p>

Esto ocurre porque el login creado tiene acceso al servidor, pero a ninguna base de datos, para ello hay que crear un usuario en alguna base de datos.

- Crear usuarios de base de datos

Sintaxis:
```sql
USE BASE_DE_DATOS;
CREATE USER nombre_usuario FOR LOGIN nombre_login
WITH DEFAULT_SCHEMA = algun_esquema;
```
Ejemplo de creación de usuarios de base de datos:


```sql
USE [baseMartes]; -- abriendo la base de datos de su grupo, SI
CREATE USER G5_89000546 FOR LOGIN G5_89000546 --creando el usuario
WITH DEFAULT_SCHEMA = db_datawriter;
```
Los usuarios de base de datos se encuentran en la carpeta Users dentro de la carpeta Security a nivel de la base de datos

Actividad 2: Crear el usuario a la base de datos creada en la práctica 2 (baseMartes, baseViernes o baseSabado según le corresponda). Siga el código del ejemplo anterior.
- Utilice el usuario usr_labbd para crear el usuario en la base de datos.
- Una vez creado el usuario en la base de datos conéctese nuevamente al servidor con su login y explore el contenido de la base de datos en donde creo el usuario.


**C2 Evidencia de la creación del usuario en la base de datos correspondiente, como se muestra en la imagen anterior**

- Eliminar un usuario de base de datos

Para eliminar un usuario de la base de datos se utiliza el comando drop user, la sintaxis es la siguiente:

```sql
drop user <nombre_usuario>;
```

- Eliminar un logín

Para borrar un login del servidor:
  - a) Primero se elimina el usuario de la base de datos
  - b) Después se elimina el login con el comando drop login, como se muestra a continuación:


drop login <nombre_login>;

**Nota:** No borraremos ni el logín ni el usuario

#### 1.3.3. Otorgar y remover privilegios a un usuario

Para otorgar un privilegio a un usuario típicamente se emplea una sintaxis similar a la siguiente:

```sql
GRANT <privilege>[,<privilege>,....]
TO <username> [,<username>,...]
[WITH ADMIN OPTION];
```

Generalmente existen 2 tipos de privilegios:

- Privilegios a nivel sistema. Permiten realizar acciones que modifican la estructura de la base de datos.

- Privilegios a nivel objeto. Permiten el acceso de objetos que pertenecen a un usuario esquema.

- Asignado privilegios a nivel sistema

```sql
GRANT INSERT ON OBJECT::dbo.estudiante --objeto de la bd
TO 3171_BD_practica2 --usuario de la bd
```

• Quitar permisos sobre tablas

```sql
REVOKE INSERT ON OBJECT:: dbo.estudiante
TO 3171_BD_practica2 --usuario de la bd
```

**Nota:** Los ejercicios sobre este tema los haremos durante la práctica

#### 1.3.4. Roles
Otro concepto comúnmente empleado en este contexto es el concepto de Rol. Un rol permite agrupar a un conjunto de privilegios y ser asignado a uno o varios usuarios. Por ejemplo, el rol ‘admin’ puede estar formado por privilegios como ‘create user’, ‘create table’, etc., y puede ser asignado a varios usuarios.

**Roles a nivel servidor**


<p align="center">
  <img src="/docs/rs/P3Previo5.png" alt="Creación Usuario" width="75%">
</p>


<p align="center">
  <img src="/docs/rs/P3Previo6.png" alt="Creación Usuario" width="75%">
</p>

- Crear un rol

```sql
CREATE ROLE <nombre_rol>
```

Agregar o borrar un usuario a un rol

```sql
ALTER ROLE nombre_rol
{
  ADD MEMBER nombre_usuario | DROP MEMBER nombre_usuario
}
```

- Borrar un rol

```sql
DROP ROLE <nombre_rol>
```

**Nota:** Los ejercicios sobre este tema los haremos durante la práctica

---

## 1.4. Ejercicios previos

Realizar las actividades 1 y 2 (C1 y C2) y adjuntar evidencias.
