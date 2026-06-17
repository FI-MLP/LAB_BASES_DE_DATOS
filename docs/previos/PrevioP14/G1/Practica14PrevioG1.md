# Práctica 14 – Previo: Programación Básica con SQL
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 14 PREVIO

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**  

---

## Contenido

1. [Ejercicio Previo](#11-ejercicio-previo)
2. [Contenido a entregar](#12-contenido)

---

## 1.1. Ejercicio Previo

Con base en el siguiente modelo relacional de un hotel, escriba los scripts de programación SQL solicitados.

```
CLIENTE      = {id_cliente(PK), nombre, apellidoP, apellidoM, telefono, rfc(U)}
HABITACION   = {id_habitacion(PK), numero(U), tipo, precio_noche, estatus}
RESERVACION  = {id_reservacion(PK), fecha_entrada, fecha_salida, total(N), id_cliente(FK), id_habitacion(FK)}
PAGO         = {id_pago(PK), fecha_pago, monto, tipo_pago, id_reservacion(FK)}
```

### Ejercicio A — Store Procedure

Cree un store procedure llamado `spuRegistrarReservacion` que:

a) Reciba como parámetros de entrada: `@id_cliente`, `@id_habitacion`, `@fecha_entrada`, `@fecha_salida`.  
b) Verifique que la habitación exista y que su estatus sea `'DISPONIBLE'`.  
c) Si está disponible: inserte la reservación, cambie el estatus de la habitación a `'OCUPADA'` y devuelva `@Mensaje = 'Reservación registrada correctamente'`.  
d) Si no está disponible: devuelva `@Mensaje = 'Habitación no disponible'` sin realizar ninguna inserción.

```sql
CREATE PROCEDURE spuRegistrarReservacion
    @id_cliente    INT,
    @id_habitacion INT,
    @fecha_entrada DATE,
    @fecha_salida  DATE,
    @Mensaje       VARCHAR(100) OUTPUT
AS
BEGIN
    -- a) Verificar existencia y estatus de la habitación
    -- b) Si disponible: INSERT + UPDATE estatus + COMMIT
    -- c) Si no disponible: mensaje de error
END
GO
```

---

### Ejercicio B — Control de flujo

Escriba un bloque SQL que utilice `IF`, `CASE` y `WHILE`:

1. **IF** — Verificar si un cliente tiene más de 3 reservaciones. Si las tiene, imprimir `'Cliente frecuente'`; si no, imprimir `'Cliente nuevo'`.

```sql
-- IF...ELSE
```

2. **CASE** — Consultar todas las habitaciones y agregar una columna extra `clasificacion` que muestre:
   - `'Económica'` si el precio por noche es menor a $800
   - `'Estándar'` si está entre $800 y $1500
   - `'Suite'` si es mayor a $1500

```sql
-- CASE
```

3. **WHILE** — Escribir un bloque que recorra los números del 1 al 5 e imprima el número y su cuadrado.

```sql
-- WHILE
DECLARE @i INT = 1;
WHILE (@i <= 5)
BEGIN
    -- imprimir número y cuadrado
    SET @i += 1;
END
```

---

### Ejercicio C — Trigger

Cree un trigger llamado `trg_ControlPago` en la tabla `PAGO` que:

a) Se active `AFTER INSERT`.  
b) Verifique que el `monto` del pago sea mayor a 0.  
c) Si no se cumple: deshaga la operación con `ROLLBACK` e imprima un mensaje de error.  
d) Si se cumple: permita la inserción e imprima `'Pago registrado correctamente'`.

```sql
CREATE TRIGGER trg_ControlPago
ON PAGO
AFTER INSERT
AS
BEGIN
    -- Verificar que monto > 0
    -- ROLLBACK si no se cumple
    -- Mensaje de confirmación si se cumple
END
GO
```

---

## 1.2. Contenido

1. Escriba cada script de forma **completa y documentada** con comentarios en cada sección.
2. Identificar claramente en cada ejercicio: el tipo de estructura utilizada (`SP`, `IF`, `CASE`, `WHILE`, `TRIGGER`) y su propósito.
3. Llevarlo **impreso** el día de la práctica.

---
