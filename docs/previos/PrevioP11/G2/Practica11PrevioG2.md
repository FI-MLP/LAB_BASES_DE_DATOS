# Práctica 11 – Previo: Álgebra Relacional y Uso de JOIN Básico
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 11 PREVIO

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**  

---

## Contenido

1. [Ejercicio Previo](#11-ejercicio-previo)
2. [Contenido a entregar](#12-contenido)

---

## 1.1. Ejercicio Previo

Con base en el siguiente modelo relacional de un sistema de recursos humanos, resuelva los ejercicios de álgebra relacional y tradúzcalos a SQL.

```
DEPARTAMENTO = {depto_numero(PK), nombre, localidad}
EMPLEADO     = {emp_numero(PK), nombre, puesto, salario, fingreso, cant_comision(N), depto_numero(FK)}
```

### Ejercicio A — Álgebra Relacional

Exprese en **notación de álgebra relacional** cada una de las siguientes consultas y luego escriba su equivalente en SQL:

1. Obtener el nombre y puesto de todos los empleados.

   **Álgebra relacional:**
   ```
   π nombre, puesto (EMPLEADO)
   ```

   **SQL:**
   ```sql
   -- Escribir aquí
   ```

2. Obtener todos los datos de los empleados del departamento número 10.

   **Álgebra relacional:**
   ```
   σ depto_numero = 10 (EMPLEADO)
   ```

   **SQL:**
   ```sql
   -- Escribir aquí
   ```

3. Obtener el nombre del empleado y el nombre del departamento al que pertenece.

   **Álgebra relacional:**
   ```
   π e.nombre, d.nombre (EMPLEADO ⋈ depto_numero DEPARTAMENTO)
   ```

   **SQL:**
   ```sql
   -- Escribir aquí
   ```

4. Obtener los empleados que trabajan en la localidad 'GUADALAJARA'.

   **Álgebra relacional:**
   ```
   π emp_numero, nombre (σ localidad='GUADALAJARA' (EMPLEADO ⋈ DEPARTAMENTO))
   ```

   **SQL:**
   ```sql
   -- Escribir aquí
   ```

---

### Ejercicio B — Operadores de conjunto

Con base en las mismas tablas, escriba en SQL las siguientes operaciones:

a) **UNION** — Obtener una lista de todos los nombres que aparezcan en `EMPLEADO` o en `DEPARTAMENTO`.

```sql
-- UNION
```

b) **INTERSECT** — Obtener los nombres que aparezcan tanto en empleados como en departamentos.

```sql
-- INTERSECT
```

c) **EXCEPT** — Obtener los nombres de empleados que no coincidan con ningún nombre de departamento.

```sql
-- EXCEPT
```

d) **Producto Cartesiano** — Obtener todas las combinaciones posibles entre empleados y departamentos.

```sql
-- Producto Cartesiano
```

---

## 1.2. Contenido

1. Escriba la expresión de álgebra relacional **y** su equivalente SQL para cada consulta.
2. Identificar claramente el operador utilizado en cada caso.
3. Llevarlo **impreso** el día de la práctica.

---
