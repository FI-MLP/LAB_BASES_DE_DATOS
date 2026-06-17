# Práctica 07 – Previo: Diseño Avanzado de Modelos Relacionales
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 07 PREVIO

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**  

---

## Contenido

1. [Ejercicio Previo](#11-ejercicio-previo)
2. [Contenido a entregar](#12-contenido)

---

## 1.1. Ejercicio Previo

A partir del siguiente modelo E/R avanzado, obtenga el **modelo relacional** correspondiente aplicando todas las reglas de transformación vistas en clase (entidades fuertes, débiles, relaciones 1:1, 1:m, m:m, relaciones recursivas y atributos multivalorados).

### Ejercicio A

Una universidad desea modelar la información de sus **profesores** y los **cursos** que imparten. Cada profesor tiene una clave, nombre, RFC (único) y puede tener varios correos electrónicos. Un profesor puede supervisar a otros profesores (relación recursiva). Cada curso tiene una clave y nombre. Un profesor puede impartir varios cursos y un curso puede ser impartido por varios profesores; la relación guarda la fecha de inicio.

Obtenga el modelo relacional en notación textual. Ejemplo:

```
ENTIDAD = {atributo(PK), atributo, atributo(FK)}
```

---

### Ejercicio B

Una clínica registra a sus **pacientes** y las **consultas** que realizan con los **médicos**. Cada paciente tiene NSS (PK), nombre y fecha de nacimiento. Cada médico tiene cédula (PK), nombre y especialidad. Una consulta pertenece a un solo paciente y a un solo médico, y tiene fecha, hora y diagnóstico. Un paciente puede tener un **expediente** que solo existe si hay al menos una consulta registrada (entidad débil).

Obtenga el modelo relacional en notación textual e identifique claramente las llaves primarias, foráneas y restricciones de unicidad.

---

## 1.2. Contenido

1. Elabore el modelo relacional en notación **textual** (papel o notas digitales).
2. Identificar con simbología correcta: `PK`, `FK`, `U`, `N`, `CK`, `D`.
3. Llevarlo **impreso** el día de la práctica.

---
