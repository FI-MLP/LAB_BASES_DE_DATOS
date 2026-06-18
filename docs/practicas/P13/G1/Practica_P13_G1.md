# Práctica 13: Joins, Vistas y Subconsultas
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 13
**Asignatura:** Laboratorio de Bases de Datos  

**Maestra:** M.I.A. Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## 1. Joins, vistas y subconsultas

### Contenido

1. [Joins, vistas y subconsultas](#1-joins-vistas-y-subconsultas)
   
   1.1. [Objetivo](#11-objetivo)
   
   1.2. [Actividades a realizar](#12-actividades-a-realizar)
   
   1.3. [Contenido del reporte](#13-contenido-del-reporte)

---

### 1.1. Objetivo

El alumno pondrá en práctica el uso de los distintos tipos de JOIN, realizará diferentes tipos de subconsultas y creará vistas.

---

### 1.2. Actividades a realizar

**A. Consultas que ejemplifiquen los distintos tipos de JOINs**

1. Mostrar el nombre de los servicios contratados por cada inmueble (clave del inmueble, tamaño, alcaldía y nombre del servicio).
2. Obtener los datos del edificio (clave del edificio y piso) de los departamentos (precio-actual y tamaño) junto con el nombre de su dueño.
3. Mostrar todas las escrituras y el nombre del dueño, incluyendo registros de inmuebles sin escrituras. Los datos a mostrar son: nombre y correo del dueño, clave del inmueble, tamaño, numero de escritura y fecha. **Right Join**
4. Consultar la relación entre inmuebles y ventas para detectar inmuebles no vendidos. **Left Join**
5. Contar cuántas personas ha recomendado cada dueño. **Self Join**
6. Mostrar el nombre de cada dueño y el nombre de quien lo recomendó. **Self Join**
7. Listar dueños (LEFT), sus inmuebles e información de venta (INNER).
8. Obtener departamentos (INNER), sus dueños, venta (INNER), y pagos recibidos (RIGHT).
9. Monto total de pagos por dueño, solo si superan los $500,000.

**B. Subconsultas.**

1. Mostrar los inmuebles que se vendieron por un precio mayor al precio de venta del inmueble con clave 8. **Where**
2. Consultar los inmuebles que tienen un registro en el historial de precios con un valor mayor a $3,000,000. **Where**
3. Obtener los datos de los inmuebles, incluyendo los datos de la venta y el total pagado de cada inmueble. **Subconsulta en el join**
4. Obtener una lista de todos los inmuebles (Casas y Deptos) con su ubicación (Calle o Edificio) unificando mediante una tabla derivada.
5. Obtener las claves de los inmuebles cuyos pagos acumulados sean superiores al precio de venta promedio de los departamentos.


**C. Diferentes tipos de vistas.**

1. Mostrar todos los datos de los inmuebles (departamentos y casas), incluyendo los datos de los dueños. Nombre a la vista `vis_Inmuebles`.
2. Obtener los datos de las ventas de los inmuebles, incluyendo los datos de escrituración si tienes y toda la información de los inmuebles (jerarquía de tipos), incluyendo total pagado y adeudo. Nombre a la vista `vis_ventas`.


> **Nota:** puede mover el valor de las condiciones si fuera necesario, ya que no se aceptan ejercicios sin resultado (registros) de las consultas

---

### 1.3. Contenido del reporte

- Elementos comunes a todas las prácticas especificados en la rúbrica correspondiente
- Evidencia de cada actividad, imagen del código y correcta ejecución del mismo
- Incluir imagen de los registros resultado de cada consulta
- Análisis de la función que realiza cada operador utilizado
- Script documentado, código limpio de cada una de las actividades
- Nombre del script #Equipo_#practica

---