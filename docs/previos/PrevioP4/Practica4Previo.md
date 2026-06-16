# PREVIO - PRÁCTICA 04 
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA PREVIO

**Asignatura:** Laboratorio de Bases de Datos

**Maestra:** M.I.A Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## Contenido
- 1.[DISEÑO DE MODELOS BÁSICOS E/R CON NOTACIÓN CHEN UTILIZANDO UNA HERRAMIENTA CASE](#1-diseño-de-modelos-básicos-er-con-notación-chen-utilizando-una-herramienta-case)
   - 1.1. [Antecedentes teóricos](#11-antecedentes-teóricos)
     - 1.1.1. [Diseño conceptual y lógico](#111-diseño-conceptual-y-lógico)
     - 1.1.2. [Elementos básicos de un Modelo E/R](#112-elementos-básicos-de-un-modelo-er)
       - 1.1.2.1 [Entidad](#1121-entidad)
       - 1.1.2.2 [Atributo](#1122-atributo)
       - 1.1.2.3 [Relación](#1123-relación)
       - 1.1.2.4 [Cardinalidad](#1124-cardinalidad)
       - 1.1.2.5 [Claves](#1125-claves)
       - 1.1.2.6 [Relaciones Recursivas o Unarias](#1126-relaciones-recursivas-o-unarias)
   - 1.2. [Herramientas CASE para crear modelos E/R](#12-herramientas-case-para-crear-modelos-er)
     - 1.2.1. [Dia](#121-dia)
     - 1.2.2. [Draw.io](#122-drawio)
   - 1.3. [Ejemplo resuelto](#13-ejemplo-resuelto)

---

## 1.1.Antecedentes teóricos

  ### 1.1.1.  Diseño conceptual y lógico

El diseño de una base de datos relacional se realiza a través de una metodología formada por las siguientes etapas posterior al levantamiento de requerimientos funciones y no funcionales:

- **Diseño  conceptual.**  En  esta  actividad  se  realiza  la  construcción  de  un  Modelo Entidad/Relación  (Modelo  E/R).    Generalmente se  emplea  la  notación  de  Chen,  el  cual  es considerado como estándar. Este modelo es independiente al tipo de modelo de datos. Por ejemplo, el Modelo E/R, no incluye conceptos del modelo relacional (PKs, FKs, tablas, etc.). Esta independencia permite que un modelo E/R pueda ser implementado en diferentes tipos de modelos de datos.  La implementación más común es su implementación a través de los conceptos del modelo relacional.

- **Diseño lógico.**  En esta actividad se realiza la construcción de un Modelo Relacional el cual implementa  toda  la  teoría  y  conceptos  de  dicho  modelo.    Se  emplean  2  principales notaciones:  Crow’s foot e IDEF1X.

En esta práctica se revisa el proceso para realizar el diseño conceptual de una base de datos. En prácticas posteriores se realizará el diseño lógico.

  ### 1.1.2.  Elementos básicos de un Modelo E/R
  #### 1.1.2.1 Entidad

Es un objeto real o abstracto de interés, sobre el que se recoge información y se representa gráficamente mediante un rectángulo y su nombre aparece en el interior en mayúsculas y en singular. Un nombre de entidad sólo puede aparecer una vez en el esquema conceptual. Generalmente se expresa con sustantivos.

<p align="center">
  <img src="/docs/rs/img-Previos/P4Previo1.png" alt="Recuadro Entidad" width="75%">
</p>

Hay dos tipos de entidades: fuertes y débiles.

- Una entidad fuerte es una entidad que tiene existencia propia y tiene una clave primaria.

- Una entidad débil es una entidad que no tiene suficientes atributos para formar una clave primaria.  No  puede  existir  sin  su  entidad  fuerte.  Se  representa  gráficamente  por  dos rectángulos concéntricos, la relación de asociación se representa con un doble rombo, su cardinalidad es 1:m.

<p align="center">
  <img src="/docs/rs/img-Previos/P4Previo2.png" alt="Recuadro Entidad" width="75%">
</p>

  #### 1.1.2.2 Atributo

Es una propiedad o característica asociada a una determinada entidad o relación y por lo tanto común a todos los ejemplares de esa entidad. La representación gráfica utilizada es por medio de una elipse etiquetada en letra en minúsculas.

<p align="center">
  <img src="/docs/rs/img-Previos/P4Previo3.png" alt="Recuadro Entidad" width="75%">
</p>

En función de las características respecto de la entidad que definen, se distinguen varios tipos de atributos:

|Tipo|Descripción|Representación|
|:----:|:----:|:----:|
|Normal|Tiene un solo valor|<p align="center"><img src="/docs/rs/img-Previos/P4Previo4.png" alt="Representación" width="75%"></p>|
|Compuesto|Se dividen en otros atributos|<p align="center"><img src="/docs/rs/img-Previos/P4Previo5.png" alt="Representación" width="75%"></p>|
|Multivalorado|Tiene un conjunto  de  valores para una entidad concreta. Se representa con doble elipse.|<p align="center"><img src="/docs/rs/img-Previos/P4Previo6.png" alt="Representación" width="75%"></p>|
|Derivado|Cuando un valor puede calcularse u obtenerse a partir de otro.  ya  sea  de  la  misma  o  de  diferentes  entidades.  Se representa con una elipse con línea discontinua.|<p align="center"><img src="/docs/rs/img-Previos/P4Previo7.png" alt="Representación" width="75%"></p>|
|Opcional|Son  usados  cuando  es  posible  desconocer  el  valor  del atributo para cierta entidad o no se tiene un valor aplicable. Se representa con un línea discontinua entre la  entidad y el atributo.|<p align="center"><img src="/docs/rs/img-Previos/P4Previo8.png" alt="Representación" width="75%"></p>|

  #### 1.1.2.3 Relación

Es una asociación, vinculación o correspondencia entre entidades. Se representa gráficamente  con  un  rombo  etiquetado  con  letras  minúsculas. Generalmente están representadas por verbos.

Una Relación se caracterizada por tres propiedades:

- Nombre. Debe de tener un nombre que la identifique unívocamente.
- Grado.  Número  de  tipos  de  entidad  sobre  las  que  se  realiza  la  asociación.  Generalmente binaria.
- Tipo  de  Correspondencia.  Número  máximo  de  ejemplares  de  cada  tipo  de  entidad  que pueden  intervenir  en  un  ejemplar  del  tipo  de  relación.   A  esta  propiedad  también  se  le denomina cardinalidad.

  ### 1.1.2.4 Cardinalidad

Número de ejemplares de una entidad asociadas a otro ejemplar de una entidad o de la misma.

Para una relación binaria (grado = 2), existen tres tipos:

-  Cardinalidad  uno a  uno.   Un  ejemplar  de la  Entidad  A se  asocia con un  ejemplar  de  una Entidad B y viceversa

<p align="center"><img src="/docs/rs/img-Previos/P4Previo9.png" alt="Representación" width="75%"></p>

- Cardinalidad  uno  a  muchos.   Un  ejemplar  de  la  Entidad  A  se  puede  asociar  con  muchos ejemplares de una Entidad B. y un ejemplar de la Entidad B se asocia con un solo ejemplar de la Entidad A

<p align="center"><img src="/docs/rs/img-Previos/P4Previo10.png" alt="Representación" width="75%"></p>

- Cardinalidad muchos a muchos. Un ejemplar de la Entidad A se puede asociar con muchos ejemplares de una Entidad B y viceversa.

<p align="center"><img src="/docs/rs/img-Previos/P4Previo11.png" alt="Representación" width="75%"></p>

Observar que se emplea un punto para indicar el lado m y la flecha siempre apunta al lado 1.

Existen dos tipos de correspondencia:

- Cardinalidad mínima. Indica el número mínimo de asociaciones en las que aparecerá cada ejemplar de la entidad (el valor puede ser cero o uno)

- Cardinalidad  máxima.  Indica  el  número  máximo  de  relaciones  en  las  que  puede  aparecer cada ejemplar de la entidad (el valor puede ser uno o muchos)


<p align="center"><img src="/docs/rs/img-Previos/P4Previo12.png" alt="Representación" width="75%"></p>

  #### 1.1.2.5 Claves

**Clave primaria.**

Es  un  atributo  o  conjunto  de  atributos  que  identifican  en  forma única  a  una  entidad.  Se  representa  subrayando  el  nombre  del atributo.


<p align="center"><img src="/docs/rs/img-Previos/P4Previo13.png" alt="Representación" width="75%"></p>

**Clave débil o discriminante.**

Es un atributo en una entidad débil que la identifica junto con la clave primaria de la entidad fuerte. Se representa subrayando en forma discontinua el atributo.


<p align="center"><img src="/docs/rs/img-Previos/P4Previo14.png" alt="Representación" width="75%"></p>

**Clave candidata o alternativa.**

Es un atributo que puede ser clave primaria, pero no fue elegida como tal. Sin embargo, es importante considerarla.

#### 1.1.2.6 Relaciones Recursivas o Unarias

Son relaciones donde el tipo de relación sólo participa con un único tipo de entidad.

Una instancia de una entidad A puede asociarse con una o más instancias de la misma entidad.


<p align="center"><img src="/docs/rs/img-Previos/P4Previo15.png" alt="Representación" width="75%"></p>

---

## 1.2.Herramientas CASE para crear modelos E/R

Para realizar el diseño conceptual de una base de datos existen varias herramientas que facilitan la construcción  de  diagramas  ER  empleando  notación  Chen.    Se  recomiendan  3  principales

herramientas:

- DIA: http://dia-installer.de/shapes/ER/index.html.es
- Draw.io https://app.diagrams.net

### 1.2.1.  Dia

La principal ventaja es que esta herramienta es libre y está disponible para diversas plataformas. El software  se  puede  descargar  de  la  página  arriba  mencionada.  Su  utilización  es  muy  sencilla  e intuitiva.  Para crear un nuevo modelo realizar las siguientes acciones después de haber instalado:

1.  Del menú de tipos de diagramas seleccionar la opción ER.  Aparecerá una pantalla similar a la siguiente:


<p align="center"><img src="/docs/rs/img-Previos/P4Previo16.png" alt="Representación" width="75%"></p>

2.  Empleando los 5 elementos que se muestran en el menú se puede realizar el diagrama de casos de estudio arrastrando los elementos del diagrama al editor.


3.    Para personalizar o configurar algún elemento basta con hacer clic derecho en el elemento y seleccionar propiedades.


<p align="center"><img src="/docs/rs/img-Previos/P4Previo17.png" alt="Representación" width="75%"></p>


4.  Una  vez  concluido  el  diagrama  se  recomienda  emplear  la  opción  Archivo  →  Exportar seleccionando algún formato de imagen, en especial si se desea incorporar el diagrama en algún otro documento.

### 1.2.2.  Draw.io

Esta herramienta en línea permite crear diagramas de diversas categorías. Draw.io se ejecuta desde un navegador web.  Es una herramienta Open Source, y al ser en línea puede ser empleada desde cualquier sistema operativo.  Para facilitar su uso, se ha creado una librería de elementos gráficos que se emplean con alta frecuencia durante el desarrollo de modelos E/R, lo cual se configuró en la práctica 2 entorno de trabajo, se anexan indicaciones nuevamente. Para realizar su configuración realizar las siguientes instrucciones

- 1. En  classroom  práctica  2    se  deberán  descargar  el  archivo    `elementos-er.xml`.  Puede  ser almacenado en cualquier directorio.

- 2. Acceder con un navegador ( de preferencia Google Chrome)  al sitio https://draw.io/

- 3. Seleccionar  el  destino  o  carpeta  donde  los  diagramas  serán  almacenados  (seleccionar  la opción de su preferencia).


<p align="center"><img src="/docs/rs/img-Previos/P4Previo18.png" alt="Representación" width="75%"></p>

- 4. Seleccionar  las  opciones  correspondientes  para  crear  un  nuevo  diagrama.  Seleccionar  la categoría Entity Relationship.  Hacer click en “Create”

<p align="center"><img src="/docs/rs/img-Previos/P4Previo19.png" alt="Representación" width="75%"></p>

- 5. Observar que aparece una interfaz gráfica similar a la siguiente figura:

<p align="center"><img src="/docs/rs/img-Previos/P4Previo20.png" alt="Representación" width="75%"></p>

- 6. Observar el menú **Scratchpad**.   La primera vez que se accede al sitio aparecerá vacío. Este menú permite agregar formas personalizadas que permitirán agilizar el diseño de modelos ER.   Para realizar la carga de los elementos de modelado, hacer clic en el ícono del lápiz.

Aparecerá un cuadro de diálogo.  Seleccionar la opción Import.

- 7. Importar el archivo de formas `elementos-er.xml` descargado en pasos anteriores.  Seguir los pasos en pantalla.


<p align="center"><img src="/docs/rs/img-Previos/P4Previo21.png" alt="Representación" width="75%"></p>

- 8.  Al  terminar  la  carga  del  archivo  se  deberán  visualizar  los  nuevos  elementos  en  el  menú “Scratchpad”.


<p align="center"><img src="/docs/rs/img-Previos/P4Previo22.png" alt="Representación" width="75%"></p>

  - Observar los elementos nuevos dentro del Menú Scratchpad.  Para comenzar a emplearlos, basta con hacer click sobre ellos, o arrastrarlos hacia el área de trabajo.

  - Los elementos están agrupados por default. Si se requiere manipular de forma individual a sus subelementos hacer click derecho sobre el elemento y seleccionar la opción ungroup.


<p align="center"><img src="/docs/rs/img-Previos/P4Previo23.png" alt="Representación" width="75%"></p>

---

## 1.3.Ejemplo resuelto

Un instituto que imparte cursos de tecnología de la información, requiere una base de datos con los siguientes requerimientos:

De  los  estudiantes  tienen  el  registro  de  su  número  de  estudiante,  nombre  completo,  fecha  de nacimiento, edad, la cual la obtienen de la fecha de nacimiento, el número de hijos para aquellos que tengan, su curp, y el correo (considerar que hay estudiantes con más de un correo). Para el instituto es importante registra los pagos que realizan; almacenado la fecha y el monto. Por temas contables a cada estudiante se le asigna una secuencia numérica para sus pagos, la cual inicia en uno.

Requieren  además  almenar  la  foto  d  su  credencial  son  sus  datos:  número  que  identifica  a  cada credencial, el año de vigencia y la fecha de expedición.

En cuanto a los cursos que toman se registra la calificación en cada curso, nombre del curso y horas de duración del curso. Es importante considerar que en un curso se inscriben muchos estudiantes y  que  un  estudiante  puede  inscribirse  en  varios  cursos.  Algunos  cursos  requieren  de  otros,  por ejemplo,  para  cursar  programación  avanzada  deben  haber  estudiado  programación  básica  y  hay cursos que pueden ser obligatorios para varios.

Finalmente tienen una bitácora de las asesorías que toman los estudiantes, en la cual se tiene la fecha y un campo donde registran lo revisado en las asesorías, tienen un folio que identifica cada asesoría las cuales son personalizadas.


<p align="center"><img src="/docs/rs/img-Previos/P4Previo24.png" alt="Representación" width="75%"></p>
