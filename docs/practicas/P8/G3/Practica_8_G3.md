# Práctica 8: Normalización
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 08
**Asignatura:** Laboratorio de Bases de Datos

**Maestra:** M.I.A. Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## 1. Normalización

### Contenido

1. [Normalización](#1-normalización)
   
   1.1. [Objetivo](#11-objetivo)
   
   1.2. [Ejercicios](#12-ejercicios)
   
   - 1.2.1. [Ejercicio 1](#121-ejercicio-1)
   
   - 1.2.2. [Ejercicio 2](#122-ejercicio-2)
   
   1.3. [Contenido del reporte](#13-contenido-del-reporte)

---

### 1.1. Objetivo

El alumno comprenderá la importancia de la teoría de la normalización en el diseño de bases de datos y aplicará los conocimientos adquiridos. Conocerá e implementará las formas normales en un caso práctico apoyado de muestras de datos para el adecuado modelado de la base de datos.

---

### 1.2. Ejercicios

Para cada ejercicio realizar:

a) Obtener dependencias funcionales
b) Obtener el diagrama de dependencias funcionales
c) Normalizar hasta la tercera forma normal
d) Obtener el modelo relacional

#### 1.2.1. Ejercicio 1

**Bibliotecas**

La facultad le pide una base de datos para el registro y control de préstamos de libros de sus bibliotecas. Considerar los datos de la siguiente tabla.

| CLAVE_PRESTAMO | NUMCUENTA | NOMBRE | ISBN | CLASIFICACION | TITULO | EDITORIAL | CVE_BIBLIOTECA | BIBLIOTECA | FECHA_PRESTAMO | FECHA_DEV |
|---|---|---|---|---|---|---|---|---|---|---|
| 1001 | 112000540 | JUAN JUAREZ | 14LK52 | 125 | BASES DE DATOS | PEARSON | 1 | ANTONIO DOVADI JAIME | 5/2/2025 | 7/3/2025 |
| 1002 | 124516875 | RITA QUIROZ MATA | 225SE69 | 214 | ING DE SOFTWARE | ALFAOMEGA | 1 | ANTONIO DOVADI JAIME | 10/3/2025 | 13/3/2025 |
| 1023 | 114524782 | ELENA VAS GUZMAN | 6589WS41 | 369 | PROGRMACION | MC GRAW HILL | 1 | ANTONIO DOVADI JAIME | 8/3/2025 | 15/3/2025 |
| 1025 | 112254970 | DARIO JIMENEZ | 14LK52 | 125 | BASES DE DATOS | PEARSON | 2 | ENRIQUE RIVERO BORRELL | 22/2/2025 | 6/2/2025 |
| 1036 | 112000540 | JUAN JUAREZ | 225SE69 | 214 | ING DE SOFTWARE | ALFAOMEGA | 2 | ENRIQUE RIVERO BORRELL | 25/3/2025 | |
| 1039 | 124516875 | RITA QUIROZ MATA | 69AS854 | 102 | REDES | MC GRAW HILL | 2 | ENRIQUE RIVERO BORRELL | 26/3/2025 | |
| 1039 | 124516875 | RITA QUIROZ MATA | 69AS854 | 369 | PROGRMACION | MC GRAW HILL | 2 | ENRIQUE RIVERO BORRELL | 26/3/2025 | |

Considere que de los alumnos se requiere registrar también el correo para avisarles un día antes de la fecha de devolución que deben regresar el libro y que en un préstamo pueden llevarse hasta 3 libros

<p align="center">
  <img src="/docs/rs/Practica8Imagen1.png" alt="Ejercicio 1 - Dependencias funcionales Bibliotecas" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/Practica8Imagen2.png" alt="Ejercicio 1 - Diagrama de dependencias funcionales" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/Practica8Imagen3.png" alt="Ejercicio 1 - Normalización hasta 3FN" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/Practica8Imagen4.png" alt="Ejercicio 1 - Modelo relacional Bibliotecas" width="85%">
</p>

#### 1.2.2. Ejercicio 2

**Competencias**

La siguiente tabla corresponde a las competencias (caminatas, carreras de diferentes kilómetros, maratones, carrera de relevos, etc.) realizadas por el Instituto del Deporte de la Ciudad de México.

La información que resguardan es:

Datos de la competencia: tipo, descripción, fecha. Las competencias se distinguen por un número único

Datos de los competidores: nombre, correo, nacionalidad, y si habla español

y de cada competencia en la que participan, el tiempo que hacen en minutos, segundos y milisegundos, así como la posición.

| NUM_COMPETENCIA | FECHA | TIPO | DESCRIPCION | CLAVE_ATLETA | NOMBRE | APELLIDOS | CORREO | TIEMPO | POSICION | CLAVE_PAIS | NOM_PAIS | HABLA_ESPAÑOL |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 001-2024 | 10/3/2024 | CA | CAMINATA | 453 | JUAN | MONTES LOPEZ | juan34@gmail.com | 69:06:00 | 56 | 66 | FRANCIA | SI |
| 001-2024 | 10/3/2024 | CA | CAMINATA | 236 | LUIS | RUIZ LARA | ruizll09@yahoo.com | 54:04:00 | 34 | 66 | MEXICO | SI |
| 001-2024 | 10/3/2024 | CA | CAMINATA | 145 | JIMENA | MARTINEZ | jime001@gmail.com | 45:23:00 | 12 | 26 | BRASIL | SI |
| 015-2024 | 20/10/2024 | CI | CIEN METROS | 1569 | ERICK | PEREZ TORREZ | | 05:20 | 1 | 9 | ARGENTINA | SI |
| 015-2024 | 20/10/2024 | CI | CIEN METROS | 236 | LUIS | RUIZ LARA | ruizll09@yahoo.com | 09:44 | 15 | 117 | MEXICO | SI |
| 001-2025 | 10/1/2025 | 5K | 5 KILOMETROS | 874 | ANTONIO | SOTO | toño77@gmail.com | 89:15:00 | 36 | 117 | MEXICO | SI |
| 001-2025 | 10/1/2025 | 5K | 5 KILOMETROS | 9514 | ROSA | FLORES GARCIA | | 92:10:00 | 29 | 139 | PERU | SI |
| 001-2025 | 10/1/2025 | 5K | 5 KILOMETROS | 453 | JUAN | MONTES LOPEZ | juan34@gmail.com | 79:45:00 | 14 | 66 | FRANCIA | NO |

<p align="center">
  <img src="/docs/rs/Practica8Imagen5.png" alt="Ejercicio 2 - Dependencias funcionales Competencias" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/Practica8Imagen6.png" alt="Ejercicio 2 - Diagrama de dependencias funcionales" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/Practica8Imagen7.png" alt="Ejercicio 2 - Normalización hasta 3FN" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/Practica8Imagen8.png" alt="Ejercicio 2 - Modelo relacional Competencias" width="85%">
</p>

---

### 1.3. Contenido del reporte

- Elementos comunes a todas las prácticas especificados en la rúbrica correspondiente
- Borrador con revisiones y anotaciones de los ejercicios realizados en clase.
- Archivos de modelos relacionales finales realizados en la herramienta seleccionada.

---
