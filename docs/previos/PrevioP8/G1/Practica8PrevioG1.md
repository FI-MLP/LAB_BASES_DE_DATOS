# Práctica 08 – Previo: Normalización
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 08 PREVIO

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**  

---

## Contenido

1. [Ejercicio Previo](#11-ejercicio-previo)
2. [Contenido a entregar](#12-contenido)

---

## 1.1. Ejercicio Previo

Aplique el proceso de normalización hasta la **Tercera Forma Normal (3FN)** en cada uno de los siguientes ejercicios. Para cada paso indique claramente qué anomalía se detecta y cómo se resuelve.

### Ejercicio A

Se tiene la siguiente tabla sin normalizar que registra las ventas de una tienda:

| ID_Venta | Fecha | ID_Cliente | Nombre_Cliente | Ciudad_Cliente | ID_Producto | Nombre_Producto | Categoria | Cantidad | Precio_Unitario |
|----------|-------|-----------|----------------|---------------|-------------|-----------------|-----------|----------|-----------------|
| 1 | 01/03/2026 | C01 | Ana López | CDMX | P10 | Teclado | Periférico | 2 | 350.00 |
| 1 | 01/03/2026 | C01 | Ana López | CDMX | P22 | Mouse | Periférico | 1 | 180.00 |
| 2 | 02/03/2026 | C02 | Luis Ramos | Monterrey | P10 | Teclado | Periférico | 1 | 350.00 |

Realice:

a) Identificar la llave primaria y las dependencias funcionales existentes.  
b) Llevar la tabla a **1FN**.  
c) Llevar el resultado a **2FN**.  
d) Llevar el resultado a **3FN**.  
e) Mostrar el modelo relacional final en notación textual.

---

### Ejercicio B

Se tiene la siguiente tabla sin normalizar que registra la asignación de empleados a proyectos:

| ID_Empleado | Nombre_Empleado | ID_Depto | Nombre_Depto | Jefe_Depto | ID_Proyecto | Nombre_Proyecto | Horas_Asignadas |
|-------------|-----------------|----------|-------------|------------|-------------|-----------------|-----------------|
| E01 | Carlos Díaz | D1 | Sistemas | María Ruiz | P1 | App Web | 40 |
| E01 | Carlos Díaz | D1 | Sistemas | María Ruiz | P2 | BD Clínica | 20 |
| E02 | Sara Vega | D2 | Redes | Pedro Sosa | P2 | BD Clínica | 35 |

Realice:

a) Identificar la llave primaria y las dependencias funcionales existentes.  
b) Llevar la tabla a **1FN**, **2FN** y **3FN**.  
c) Mostrar el modelo relacional final en notación textual con simbología `PK`, `FK`, `U`, `N`.

---

## 1.2. Contenido

1. Elabore el proceso de normalización **paso a paso** (papel o notas digitales).
2. Mostrar claramente cada forma normal obtenida con su tabla resultante.
3. Presentar el modelo relacional final en notación textual.
4. Llevarlo **impreso** el día de la práctica.

---
