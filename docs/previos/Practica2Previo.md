# PREVIO - PRÁCTICA 02 
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA PREVIO

**Asignatura:** Laboratorio de Bases de Datos

**Maestra:** M.I.A Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## 2. ENTORNO DE TRABAJO

## Contenido

1. [2.1 Entorno de trabajo para interactuar con la base de datos](#21-entorno-de-trabajo-para-interactuar-con-la-base-de-datos)
2. [2.2 Antecedentes teóricos](#22-antecedentes-teóricos)
    * [2.2.1 Concepto de DBMS, RDBMS, instancia y base de datos](#221-concepto-de-dbms-rdbms-instancia-y-base-de-datos)
3. [2.3 SQL Server](#23-sql-server)
4. [2.4 Ejercicios previos](#24-ejercicios-previos)
    * [2.4.1 Instalación de herramientas de modelado](#241-instalación-de-herramientas-de-modelado)
    * [2.4.2 Descarga en Windows](#242-descarga-en-windows)
    * [2.4.3 Descarga de SQL Server Management Studio](#243-descarga-de-sql-server-management-studio)
    * [2.4.4 Instalación en otros Sistemas Operativos](#244-instalación-en-otros-sistemas-operativos)
    * [2.4.5 Entorno con Visual Studio Code](#245-entorno-con-visual-studio-code)
---

## 2.1 Entorno de trabajo para interactuar con la base de datos
Durante el curso se trabajará con una base de datos. El estudiante podrá interactuar con el manejador de 2 formas:

*  Empleando el servidor de base de datos ubicado en la Facultad.
*  Empleando su propio ambiente de bases de datos instalado en la máquina personal del estudiante.

---

## 2.2 Antecedentes teóricos
En esta práctica se realizará una exploración básica del entorno de base de datos. Los principales conceptos a revisar son:

*  Concepto de DBMS, RDBMS, instancia y base de datos.
*  Concepto de diccionario de datos.

### 2.2.1 Concepto de DBMS, RDBMS, instancia y base de datos
**Database Management System (DBMS)** describe a un sistema de software formado por un conjunto de componentes que se encargan de realizar la administración de una base de datos, así como del control de acceso a los datos. Un DBMS es agnóstico al tipo de modelo de datos empleado para representar la organización lógica de los datos.

Un **RDBMS** es un DBMS que implementa el modelo relacional (la letra R representa al modelo relacional). Esto significa que los datos en este modelo están lógicamente almacenados haciendo uso de los conceptos del modelo relacional. El ejemplo más representativo es el de una Tabla. En este modelo, los datos se organizan y se representan a través de relaciones, entidades o tablas. Cada tabla está formada por un junto de tuplas o registros y por un conjunto de columnas.

Así como existen los RDBMS, existen otros DBMS que implementan otros modelos. Por ejemplo, OODBMS es un DBMS que implementa el modelo orientado a objetos.

Una **instancia** del Motor de base de datos es una copia del archivo ejecutable `sqlservr.exe` que se ejecuta como un servicio del sistema operativo. Cada instancia administra varias bases de datos del sistema y una o varias bases de datos de usuario. Cada equipo puede ejecutar varias instancias del Motor de base de datos. Una instancia del Motor de base de datos funciona como un servicio que controla todas las solicitudes de aplicación para trabajar con datos de cualquiera de las bases de datos administradas por dicha instancia.

Una **base de datos** es una colección de datos almacenados de manera organizada para su uso posterior. Está formada por todos los archivos físicos en los que se encuentran los datos finales del usuario, así como a otro conjunto de datos que describen a los datos finales llamados metadatos, o típicamente, el diccionario de datos. Tanto los datos finales como el diccionario de datos se almacenan en archivos llamados **data files**.

<p align="center">
  <img src="/docs/rs/P2Previo1.png" alt="Conexion SQL Server" width="75%">
</p>

Un **diccionario de datos** es el esquema de la base de datos, documenta los metadatos más ligados a su almacenamiento en la base de datos. Es decir, incluye aspectos técnicos como el tipo de dato, formato, longitud, posibles valores que puede tomar e, incluso, transformaciones sufridas, sin olvidar la definición de cada campo.

---

## 2.3 SQL Server.
Para trabajar con el manejador de base de datos se requieren dos cosas:
*  Motor de base de datos, donde se almacenará la información
*  Herramienta para acceder a los datos

El motor de SqlServer se puede instalar en Windows y es compatible con distribuciones como Red Hat Enterprise Linux (RHEL), SUSE Linux Enterprise Server (SLES) y Ubuntu, además de estar disponible como imagen de Docker.

En cuanto a la herramienta para acceso a datos:
*  **SQL Server Management Studio** es la herramienta para Windows.
*  **Azure Data Studio** es una herramienta multiplataforma compatible con los principales sistemas operativos: Windows, macOS y Linux (CentOS, Debian, SUSE y Ubuntu).
*  **Visual Studio Code** en Linux y macOS a través de la extensión SQL Server (mssql) de Microsoft.

> 📝 **Nota:** Puedes instalar únicamente la herramienta de acceso a Datos, y conectarte al servidor de Bases de Datos de la Facultad de Ingeniería.

---

## 2.4 Ejercicios previos

### 2.4.1 Instalación de herramientas de modelado
Realizar la instalación del Día y ERStudio, para ello deberá seguir el manual proporcionado por la profesora, **agregar la evidencia de la instalación** de cada herramienta en su equipo personal (con la aplicación abierta).

### 2.4.2 Descarga en Windows
Si el sistema operativo de tu equipo personal es Windows, seguir las indicaciones del manual de instalación de SQL Server proporcionado por la profesora hasta la página 4 (`instalacionSQL2022.pdf`), con esto se tendrán en el equipo de cómputo personal descargados todos los archivos para la instalación del motor de bases de datos, la cual se hará de manera conjunta durante la práctica 2.

### 2.4.3 Descarga de SQL Server Management Studio
Descargar el archivo ejecutable `SSMS-Setup-ENU.exe`, el archivo está dentro de la carpeta con el nombre SQLManagement 20. La herramienta se instalará durante la práctica 2 (se instalará durante la clase).

### 2.4.4 Instalación en otros Sistemas Operativos
En caso de requerir instalar SQLServer en otro sistema operativo, seguir las indicaciones del enlace anexo, según corresponda. Instalar preferentemente la versión 2022. Deberá documentar con imágenes el paso a paso de la instalación indicando en qué SO realizó la instalación.

* 🔗 **Enlace Oficial:** [Guía de instalación de SQL Server en Linux](https://learn.microsoft.com/es-es/sql/linux/sql-server-linux-setup?view=sql-server-ver17)

### 2.4.5 Entorno con Visual Studio Code
Para la instalación de Visual Studio Code y las extensiones de SQL, Seguir las indicaciones del manual proporcionado por la profesora.

En el siguiente link podrán descargar las herramientas y también se encuentran las guías de instalación (dentro de las carpetas de cada una de las herramientas).

* 🔗 **Enlace de Descarga:** [Carpeta de Recursos de la Asignatura en Google Drive](https://drive.google.com/drive/folders/11MgVTT0lxyt1F_aYCPk6cSYZnid_9E-O?usp=sharing)

> ⚠️ **Nota:** Esta carpeta solo es para que descarguen el software a utilizar, no pueden hacer uso de ella de ningún tipo, ni borrar información.
