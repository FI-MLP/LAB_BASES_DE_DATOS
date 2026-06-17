# Práctica 08: Normalización - Material de Apoyo
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 08

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Contenido

1. [Objetivo](#11-objetivo)
2. [Antecedentes teóricos](#11-antecedentes-teóricos)
   - [Dependencias funcionales](#111-dependencias-funcionales)
   - [Primera Forma Normal](#112-primera-forma-normal-1nf)
   - [Segunda Forma Normal](#113-segunda-forma-normal-2nf)
   - [Tercera Forma Normal](#114-tercera-forma-normal-3nf)
   - [Forma Norma de Boyce Codd](#115-forma-normal-de-boyce-codd-bcnf)
   - [Cuarta Forma Normal](#116-cuarta-forma-normal-4nf)
   - [De-normalizacion](#117-de-normalización)

---

## 1.1 Antecedentes teóricos

**Normalizar** es un proceso formado por distintas etapas que tiene como propósito eliminar redundancias y anomalías de diseño:

| Anomalía | Descripción |
|----------|-------------|
| **Inserción** | Algunos atributos no pueden ser agregados a la relación sin la presencia de otros atributos |
| **Modificación** | Al modificar datos duplicados, no se modifican todas las instancias |
| **Eliminación** | Algunos atributos se pierden por la eliminación de otros atributos |

> La normalización es un proceso **secuencial, incremental, cíclico y repetitivo** que consiste en aplicar las formas normales a todas y cada una de las entidades del modelo, con la finalidad de garantizar la Integridad de los datos, evitando la redundancia y corrigiendo las anomalías de diseño.

---

### 1.1.1 Dependencias funcionales

Las dependencias funcionales son muy útiles para analizar una tabla en búsqueda de redundancias innecesarias. Una dependencia funcional es una restricción entre dos conjuntos de atributos de la base de datos.

> Dada una relación R, el atributo `y(R)` depende funcionalmente del atributo `x(R)` sí y solo sí un solo valor de `y(R)` está asociado a cada valor `x(R)` en cualquier momento dado.

**Ejemplo:** `fechaNacimiento → edad`

De lo anterior, "x" puede tomar el rol de llave primaria, siempre y cuando también pueda determinar el valor de los demás atributos.

#### Dependencia Parcial

- Alguno de los atributos que forma parte de la PK puede por sí solo actuar como atributo determinante de uno o más campos de la tabla.
- Las dependencias parciales pueden existir **únicamente** en tablas con una llave primaria compuesta.

#### Dependencia Transitiva

- Sucede cuando un campo que **no** forma parte de la PK puede actuar como atributo determinante de uno o más campos.

---

### Formas Normales

---

#### 1.1.2 Primera Forma Normal (1NF)

Una relación está en **1NF** si y sólo si:
1. No hay tuplas repetidas (grupos de repetición)
2. Todos los atributos son atómicos
3. Existe una Llave Primaria

### 1.1.3 Segunda Forma Normal (2NF)

Una relación está en **2NF** si y sólo si:
1. Está en Primera Forma Normal
2. Todos los atributos dependen de la llave primaria **completa** (se han eliminado las dependencias parciales)

### 1.1.4 Tercera Forma Normal (3NF)

Una relación está en **3NF** si y sólo si:
1. Está en Segunda Forma Normal
2. Ningún atributo "no determinante" depende transitivamente de la llave primaria (se han eliminado las dependencias transitivas)

### 1.1.5 Forma Normal de Boyce-Codd (BCNF)

Variante de la 3NF, desarrollada en 1974 por Boyce y Codd, que resuelve algunas anomalías que no resuelve la 3NF:
- Puede aplicarse en tablas con PK compuesta (generalmente tablas intermedias con atributos que por su naturaleza pudieran también formar parte de la PK)
- Para eliminar anomalías se verifica si es posible intercambiar atributos de forma que sea posible formar una dependencia parcial y así poder eliminarla

### 1.1.6 Cuarta Forma Normal (4NF)

Una tabla está en **4NF** cuando:
1. Está en 3NF
2. Se han eliminado posibles **dependencias multivalor**

Una dependencia multivalor ocurre cuando la PK determina múltiples valores de 2 o más campos totalmente independientes entre sí.

#### 1.1.7 De-normalización

Proceso inverso de la Normalización. En algunos escenarios un nivel alto de normalización puede impactar el desempeño (más tablas = más operaciones JOIN). En ese caso se puede reducir el nivel de normalización, asumiendo la posible existencia de anomalías pero favoreciendo el rendimiento. La aplicación (software) será la responsable de evitar la incorporación de inconsistencias.

---

