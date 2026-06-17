# Práctica 10 – Previo: Lenguaje de Manipulación de Datos (DML) y Transacciones
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 10 PREVIO

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**  

---

## Contenido

1. [Ejercicio Previo](#11-ejercicio-previo)
2. [Contenido a entregar](#12-contenido)

---

## 1.1. Ejercicio Previo

Con base en el siguiente modelo relacional de una tienda de productos electrónicos, escriba los scripts **DML** solicitados.

```
CATEGORIA    = {id_categoria(PK), nombre_categoria}
PRODUCTO     = {id_producto(PK), nombre, precio, stock, id_categoria(FK)}
CLIENTE      = {id_cliente(PK), nombre, correo(U), ciudad}
VENTA        = {id_venta(PK), fecha, id_cliente(FK)}
DETALLE_VENTA= {[id_venta(FK), id_producto(FK)](PK), cantidad, precio_unitario}
```

### Ejercicio A — INSERT

Escriba las sentencias `INSERT` para poblar todas las tablas con al menos:
- 3 registros en `CATEGORIA`
- 5 registros en `PRODUCTO`
- 4 registros en `CLIENTE`
- 3 registros en `VENTA` con sus respectivos `DETALLE_VENTA`

> Respetar el orden de inserción según las dependencias de llaves foráneas.

```sql
-- INSERT INTO CATEGORIA
-- INSERT INTO PRODUCTO
-- INSERT INTO CLIENTE
-- INSERT INTO VENTA
-- INSERT INTO DETALLE_VENTA
```

---

### Ejercicio B — UPDATE y DELETE

Con los datos insertados en el Ejercicio A, escriba:

a) `UPDATE` que aumente un 10% el precio de todos los productos de una categoría específica.  
b) `UPDATE` que cambie la ciudad de un cliente determinado.  
c) `DELETE` que elimine un cliente que no tenga ventas registradas.  
d) Intente eliminar un cliente que sí tenga ventas y explique qué ocurre y por qué.

```sql
-- UPDATE y DELETE aquí
```

---

### Ejercicio C — Transacciones

Escriba una transacción que registre una nueva venta completa (INSERT en `VENTA` e INSERT en `DETALLE_VENTA`). La transacción debe:

a) Usar `BEGIN TRANSACTION`.  
b) Verificar que el stock del producto sea suficiente antes de insertar.  
c) Si el stock es suficiente: insertar el detalle y actualizar el stock con `COMMIT`.  
d) Si el stock es insuficiente: deshacer la operación con `ROLLBACK` y mostrar un mensaje.

```sql
BEGIN TRANSACTION
    -- Verificar stock
    -- INSERT VENTA
    -- INSERT DETALLE_VENTA
    -- UPDATE PRODUCTO (stock)
    -- COMMIT o ROLLBACK
```

---

## 1.2. Contenido

1. Escriba todos los scripts DML **completos y documentados**.
2. Asegurarse de respetar el orden de inserción según las llaves foráneas.
3. Incluir comentarios explicando cada operación.
4. Llevarlo **impreso** el día de la práctica.

---
