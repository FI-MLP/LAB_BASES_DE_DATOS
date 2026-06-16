# Práctica 1: Acceso a Servidor, Instalación del Sistema Operativo
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 01

**Asignatura:** Laboratorio de Bases de Datos  
**Universidad Nacional Autónoma de México**

---

## Contenido
1. [Objetivo](#11-objetivo)
2. [Acceso al servidor del laboratorio](#12-acceso-al-servidor-del-laboratorio)
3. [Probar conexión hacia el servidor del laboratorio](#13-probar-conexion-hacia-el-servidor-del-laboratorio)
4. [Tarea](#14-tarea)
5. [Contenido del reporte](#15-contenido-del-reporte)

---

## 1.1. Objetivo
* Realizar la configuración inicial para acceder al servidor de base de datos del laboratorio.

---

## 1.2. Acceso al servidor del laboratorio
El laboratorio cuenta con un servidor de bases de datos en el que se realizan las actividades de las prácticas 1 y 2. 

A partir de la práctica 9, las actividades podrán realizarse tanto en este servidor, como en la instalación que cada alumno realizará en su equipo. Este ambiente permitirá trabajar con una base de datos fuera del laboratorio.

---

## 1.3. Probar conexión hacia el servidor del laboratorio
Deberá conectarse al servidor mediante **Azure Data Studio** utilizando los siguientes datos de acceso:

* 🖥️ **Server name:** `132.248.59.8` 
* 👤 **Usuario:** `usr_labbd` 
* 🔑 **Password:** `12345262*`

### Pasos para realizar la conexión en Azure:
1. Abrir la herramienta **Azure Data Studio**.

<p align="center">
  <img src="/docs/rs/P1InicioAzure.png" alt="Azure Data Studio Inicio" width="75%">
</p>

2. En la pantalla principal, hacer clic en la opción **Create a connection** o seleccionar **New Connection**.

<p align="center">
  <img src="/docs/rs/P1Config.png" alt="Azure Data Studio Inicio" width="75%">
</p>

3. Configurar el apartado de *Connection Details* ingresando los siguientes parámetros de inicio:
   * **Authentication type:** Seleccionar `SQL Login`.
   * Ingresar el servidor, usuario y contraseña proporcionados arriba.
  
<p align="center">
  <img src="/docs/rs/P1Config12.png" alt="Azure Data Studio Inicio" width="75%">
</p>


### ⚠️ Posible Error de Conexión (SSL Provider)
Durante el proceso de inicio de sesión, es muy probable que aparezca la siguiente ventana de alerta de seguridad:

> **Connection error:** *A connection was successfully established with the server, but then an error occurred during the login process. (provider: SSL Provider, error: 0 - La cadena de certificación fue emitida por una entidad en la que no se confía).*

<p align="center">
  <img src="/docs/rs/P1Error.png" alt="Error de Conexión SSL" width="60%">
</p>

* **Solución:** Para mitigar este aviso en el entorno de pruebas del laboratorio, debes hacer clic en el botón azul que dice **Enable Trust server certificate** dentro del cuadro de diálogo o marcar dicha casilla en las propiedades avanzadas de la conexión.

---

## 1.4. Tarea
* [X] Revisar y resolver detalladamente los ejercicios correspondientes al previo de la **Práctica 2**.

---

## 1.5. Contenido del reporte
El informe final a entregar de la práctica debe contar estrictamente con la siguiente estructura y elementos de evaluación:

* **a) Portada:** Datos oficiales de la institución, asignatura, número de equipo e integrantes.
* **b) Descripción de las actividades:** Redacción en prosa de los enunciados de las actividades desarrolladas junto con sus respectivos comentarios personales.
* **c) Actividad 1:** Agregar la evidencia de captura de pantalla de la conexión exitosa al servidor de Bases de Datos de la Facultad, especificando el número de equipo de cómputo físico utilizado.
* **d) Actividad 2:** Incluir evidencia gráfica (captura) de que se encuentra correctamente instalada la herramienta **Dia** en el equipo en el cual trabajaron dentro del laboratorio, indicando explícitamente su número de equipo.

> 📝 **Nota:** No olvidar revisar con anticipación y cumplir rigurosamente con los criterios estipulados en la rúbrica de evaluación.

---
<p align="center"><b>FI UNAM</b></p>
