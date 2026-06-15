# **Práctica 2:** Entorno de Trabajo
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 02

**Asignatura:** Laboratorio de Bases de Datos

**Maestra:** M.I.A Martha López Pelcastre

**Universidad Nacional Autónoma de México**


---

## Contenido
1. [Objetivo](#21-objetivo)
2. [Explorar el diccionario de datos](#22-explorar-el-diccionario-de-datos)
3. [Creación de objeto de prueba](#23-creacion-de-objeto-de-prueba)
4. [Inserción de un registro](#24-insercion-de-un-registro)
5. [Actividad: Consultar un registro](#25-actividad-consultar-un-registro)
6. [Explorando la herramienta Draw.io](#26-explorando-la-herramienta-drawio)
7. [Instalación del software de la base de datos](#27-instalacion-del-software-de-la-base-de-datos)
8. [Contenido del reporte](#28-contenido-del-reporte)

---

## 2.1. Objetivo
* El alumno conocerá el entorno de trabajo del manejador de base de datos que utilizará en las prácticas siguientes.

---

## 2.2. Explorar el diccionario de datos
Posterior a la configuración de conexión hacia el servidor de base de datos, en esta actividad se creará una tabla de prueba empleada para validar los privilegios otorgados a cada usuario. No preocuparse por la sintaxis, este tema se revisará en prácticas posteriores.

### Consultas básicas al diccionario de datos:
```sql

SELECT * FROM sys.tables;
SELECT * FROM sys.columns;
SELECT * FROM sys.systypes;

SELECT
  'DATADICTIONARY' AS [REPORT],
  @@SERVERNAME AS [ServerName],
  DB_NAME() AS [DatabaseName],
  t.name AS [TableName],
  schema_name(t.schema_id) AS [SchemaName],
  c.name AS [ColumnName],
  st.name AS [DataType],
  c.max_length AS [MaxLength],
  CASE
    WHEN c.is_nullable = 0 THEN 'NO'
    ELSE 'YES'
  END AS [IsNull],
  CASE
    WHEN c.is_identity = 0 THEN 'NO'
    ELSE 'YES'
  END AS [IsIdentity],
  isnull(ep.value, '-- add description here') AS [Description]
FROM [sys].[tables] t
INNER JOIN [sys].[columns] c
  ON t.object_id= c.object_id
INNER JOIN [sys].[systypes] st
  ON c.system_type_id= st.xusertype
INNER JOIN [sys].[objects] o
  ON t.object_id= o.object_id
LEFT JOIN [sys].[extended_properties] ep
  ON o.object_id = ep.major_id
  AND c.column_Id = ep.minor_id
WHERE t.name <> 'sysdiagrams'
ORDER BY
    t.name,
    c.column_Id

```
- Tomar una captura de pantalla del resultado de la consulta. **C1. Incluirla en el
reporte.**

---

## 2.3. Creación de objeto de prueba

Ejecutar la siguiente instrucción para verificar que el usuario tiene privilegios para crear
tablas e insertar datos. La tabla deberá ser creada en la base de datos correspondiente:
grupo de día martes en la base llamada baseMartes, el grupo del viernes utilizará la base
nombrada como baseViernes y en baseSabado el grupo que toma laboratorio en día
sábado. Sustituir los paréntesis $$<>$$ con los valores correspondientes (del alumno)

```sql

create table <numCta>_estudiante (
  estudiante_id numeric(10,0) constraint estudiante_pk primary key,
  nombre varchar(50) not null,
  ap_pat varchar(50) not null,
  ap_mat varchar(50) not null,
  num_cuenta varchar(20) not null,
  gpo_teoria numeric(2,0) not null
);

```

---

## 2.4. Inserción de un registro
Ejecutar la siguiente sentencia SQL para guardar los datos de cada estudiante. Sustituir los paréntesis $$<>$$ con los valores correspondientes (del alumno). El registro deberá ser insertado en la tabla llamada estudianteMartes dentro de la base de datos llamada baseMartes. El grupo del viernes usará tabla estudianteViernes que está dentro de la base llamada baseViernes y el grupo del día sábado en su base correspondiente.

```sql

insert into estudianteMartes(estudiante_id,nombre,ap_pat,ap_mat,num_cuenta,gpo_teoria)
values(<id>,'<nombre>','<ap_pat>','<ap_mat>','<num_cuenta>',<gpo_teoria>);

```
**Ejemplo:**

```sql

insert into estudianteMartes(estudiante_id,nombre,ap_pat,ap_mat,num_cuenta,gpo_teoria)
values(1,'Martha','López','Pelcastre','00000000',2);

```

Nota: El campo estudiante_id corresponde a su número de lista.
 - Tomar una captura de pantalla del resultado. **C3. Incluirla en el reporte.**

---

## 2.5. Actividad: Consultar un registro

Ejecutar las siguientes instrucciones para mostrar el registro insertado anteriormente. Sustituir $$<id>$$ con el valor correspondiente.

```sql

select estudiante_id,nombre,ap_pat,ap_mat,num_cuenta,gpo_teoria
from estudianteMartes
where estudiante_id = <id>;

```

 - Tomar una captura de pantalla del resultado. C4. Incluir la captura en el reporte.

---

## 2.6. Explorando la herramienta Draw.io

Draw.io es una aplicación desarrollada por Google que permite realizar una gran variedad de modelos y diagramas en línea de forma colaborativa.

- Descargar el archivo elementos-er.xml. Puede ser almacenado en cualquier directorio.

- Acceder a https://app.diagrams.net/ o https://draw.io haciendo uso de la cuenta de google que se configuró para este curso.

- Seleccionar el destino donde será almacenado el diagrama, de preferencia en Drive

<p align="center">
  <img src="/docs/rs/P2Explorador1.png" alt="Explorador 1 Draw.io" width="75%">
</p>

- Seleccionar la categoría Entity Relationship Diagram para crear un nuevo diagrama. Hacer click en “Create

<p align="center">
  <img src="/docs/rs/P2Explorador2.png" alt="Explorador 2 Draw.io" width="75%">
</p>

- Aparecerá una interfaz como la siguiente figura:

<p align="center">
  <img src="/docs/rs/P2Explorador3.png" alt="Explorador 3 Draw.io" width="75%">
</p>

- Observar el menú Scratchpad. Este menú permite agregar formas personalizadas que permitirán agilizar el diseño de modelos ER. Para realizar la carga de los elementos de modelado, hacer clic en el ícono del lápiz. Aparecerá un cuadro de diálogo. Seleccionar la opción Import.

- Importar el archivo de formas elementos-er.xml descargado en pasos anteriores. Seguir los pasos en pantalla.

- Generar un diagrama similar al siguiente, agregar los atributos faltantes.

<p align="center">
  <img src="/docs/rs/P2Explorador4.png" alt="Explorador 4 Draw.io" width="75%">
</p>

** C5. Incluir en el reporte ** el o los archivos de los diagramas generados además de la imagen. Ya sea en dia o draw.io.

## 2.7. Instalación del software de la base de datos

- Seguir las indicaciones de la profesora, incluir las instrucciones y/o imágenes correspondientes para realizar la instalación del manejador de bases de datos a utilizar en su equipo personal.

**C6. Incluir en el reporte** imágenes de la configuración y de la conexión exitosa la base de datos (del manejador instalado en su equipo de cómputo) con ambos usuarios –sa y Windows-. Incluir en el informe el password asignado al sa.

**C7. Incluir en el reporte** imagen de la conexión de su equipo personal al servidor de bases de datos de la Facultad de Ingeniería.

## 2.8. Contenido del reporte
  

El reporte deberá contener:


- Objetivo
- Introducción (de la práctica no la del manual de prácticas).
- Desarrollo
 - a) Descripción de las actividades de las prácticas (enunciados de las actividades y comentarios personales).
 - b) Análisis de resultados
- Conclusiones individuales.
- Bibliografía (se acepta material proporcionado por la profesora o manual de prácticas).
- Incluir en el desarrollo las imágenes marcadas como contenido C1, C2, C3, C4, C5, C6 y C7

> 📝 **Nota:** La práctica se entrega en parejas. En esta práctica para las actividades C2, C3 y C4 entregar imágenes por alumno.
