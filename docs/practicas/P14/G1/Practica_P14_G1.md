# Práctica 14: Programación en SQL
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 14
**Asignatura:** Laboratorio de Bases de Datos  
**Universidad Nacional Autónoma de México**

---

## 1. Programación en sql

### Contenido

1. [Programación en sql](#1-programación-en-sql)
   1.1. [Objetivo](#11-objetivo)
   1.2. [Actividades a realizar](#12-actividades-a-realizar)
   1.3. [Contenido del reporte](#13-contenido-del-reporte)

---

### 1.1. Objetivo

El alumno comprenderá los principales conceptos, así como la estructura básica para realizar la construcción de scripts SQL empleando las extensiones de programación SQL ofrecidas por los manejadores. Aplicará los conceptos referentes a disparadores para reflejar la integridad de la información.

---

### 1.2. Actividades a realizar

En base al modelo siguiente, realice lo que se pide:

<p align="center">
  <img src="/docs/rs/Practica14Imagen1.png" alt="Modelo entidad-relación - DUEÑO, INMUEBLE, SERVICIO, PAGO, etc." width="85%">
</p>

**A. Procedimientos almacenados.**

**I.** Elabore un store procedure para actualizar los precios de los inmuebles. Crear un store procedure llamado `ActualizarPrecioInmueble` el store procedure debe:

a) Verificar si el precio actual tiene más de 3 meses.
b) Si lo es, actualizar la tabla INMUEBLE y registrar el cambio en HISTORIAL_PRECIO.
c) Devolver un mensaje de éxito o fracaso como parámetro de salida (`@MensajeSalida`).

**II.** Store procedure para asignar Dueño Recomendado: Crear un store procedure llamado `AsignarRecomendado` con parámetros `@IDDueñoNuevo` y `@IDDueñoRecomendador`. El SP debe:

a) Verificar que ambos IDs existan en DUEÑO.
b) Verificar que el dueño nuevo no se esté recomendando a sí mismo.
c) Si se cumplen las condiciones, actualizar la columna ID_DUEÑO_RECOMENDO.
d) Devolver `@EstadoProceso` ('OK' o 'ERROR') como parámetro de salida.

<p align="center">
  <img src="/docs/rs/Practica14Imagen2.png" alt="Evidencia store procedure ActualizarPrecioInmueble" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/Practica14Imagen3.png" alt="Evidencia store procedure AsignarRecomendado" width="85%">
</p>

**B. Triggers.**

**I.** Crear un TRIGGER en DATOS_VENTA (AFTER INSERT, UPDATE) que asegure que el PRECIO_VENTA sea mayor que el PRECIO_OFICIAL del INMUEBLE. Si no se cumple, debe deshacer la operación (ROLLBACK).

**II.** Crear un trigger que al insertar un PAGO el monto sea mayor que cero y la fecha de pago sea mayor a la fecha de compra

<p align="center">
  <img src="/docs/rs/Practica14Imagen4.png" alt="Evidencia trigger DATOS_VENTA" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/Practica14Imagen5.png" alt="Evidencia trigger PAGO" width="85%">
</p>

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
