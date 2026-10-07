# Ejercicios de ADBD práctica 3\.
## Pablo José Dorta Espinosa

## 1\. Entidades y atributos

#### 1.1. Vivero

**Descripción**: Representa cada establecimiento o vivero perteneciente a la empresa. El modelo permite identificarlo y almacenar su posición geográfica, además del atributo Zonas.  
Atributos:

1. id\_vivero  
   * Identificador único del vivero.  
2. Latitud  
   * Coordenada geográfica de latitud correspondiente al vivero.  
3. Longitud  
   * Coordenada geográfica de longitud correspondiente al vivero.  
4. Zonas  
   * Atributo definido en el modelo para representar las zonas del vivero.

**Ejemplo:**  
id\_vivero \= VIV001  
Latitud \= 28.4636  
Longitud \= \-16.2518  
Zonas \= "Exterior, Almacén"

#### 1.2. Producto

**Descripción:** Representa cada producto comercializado por Tajinaste S.A.  
Atributos:

1. id\_producto  
   * Identificador único del producto. Está subrayado en el modelo.  
2. Precio  
   * Precio asociado al producto.

**Ejemplo:**  
id\_producto \= PROD025  
Precio \= 14.95

#### 1.3. Tarea

**Descripción:** Representa una tarea realizada por un empleado en el contexto de un vivero.  
Atributos:

1. id\_tarea  
   * Identificador único de la tarea.  
2. Inicio  
   * Fecha de inicio de la tarea.  
3. Fin  
   * Fecha de finalización de la tarea.  
4. Puesto  
   * Puesto en el que se desarrolla la tarea.

**Ejemplo:**  
id\_tarea \= TAR0105  
Inicio \= 2026-03-01  
Fin \= 2026-03-15  
Puesto \= "Jardinero"

#### 1.4. Empleado

**Descripción:** Representa a cada empleado de Tajinaste S.A.  
Atributos:

1. id\_empleado  
   * Identificador único del empleado.

      2\. 	Nombre

* Nombre del empleado.

**Ejemplo:**  
id\_empleado \= EMP017  
Nombre \= "Ana García"

#### 1.5. Cliente

**Descripción:** Representa a cada cliente de Tajinaste S.A.  
Atributos:

3. id\_cliente  
   * Identificador único del cliente. Está subrayado en el modelo.  
4. Nombre  
   * Nombre del cliente.

**Ejemplo:**  
id\_cliente \= CLI1008  
Nombre \= "María Rodríguez"

#### 1.6. Tajinaste\_Plus

**Descripción:** Representa la pertenencia de un cliente al programa de fidelización Tajinaste Plus. Contiene la información específica asociada a la pertenencia al programa, como la fecha de alta y la bonificación.  
Atributos:

5. fecha\_alta  
   * Fecha en la que el cliente se incorpora al programa Tajinaste Plus.  
6. Bonificación  
   * Bonificación asociada al cliente dentro del programa.

**Ejemplo:**  
fecha\_alta \= 2026-01-10  
Bonificación \= 10%

## 

## 2\. Relaciones

#### 2.1. Tiene

**Descripción:** Representa la asignación de productos a los viveros y permite controlar la cantidad disponible de cada producto en cada vivero.

**Entidades relacionadas:**

* Vivero  
* Producto

**Atributos de la relación:**

1. Cantidad  
   * Cantidad disponible del producto en el vivero.  
   * Debe representar una cantidad no negativa.

**Cardinalidad:**

* **Vivero — Tiene — Producto: 1:N**  
* Un vivero puede tener asignados varios productos.  
* Cada producto se relaciona con un vivero según la cardinalidad indicada en el modelo.

**Ejemplo:**  
 Vivero \= VIV001  
 Producto \= PROD025  
 Cantidad \= 50 unidades

#### 2.2. Requiere

**Descripción:** Representa la relación entre un vivero y las tareas que se realizan en él. Permite indicar la zona concreta del vivero donde se desarrolla la tarea y almacenar su georreferenciación.

**Entidades relacionadas:**

* Vivero  
* Tarea

**Atributos de la relación:**

1. Zona  
   * Zona del vivero en la que se realiza la tarea.  
2. Latitud  
   * Coordenada geográfica de latitud correspondiente a la zona.  
3. Longitud  
   * Coordenada geográfica de longitud correspondiente a la zona.

**Cardinalidad:**

* **Vivero — Requiere — Tarea: 1:N**  
* Un vivero puede requerir o tener asociadas varias tareas.  
* Cada tarea queda asociada a un vivero.

**Ejemplo:**  
 Vivero \= VIV001  
 Tarea \= TAR0105  
 Zona \= "Exterior"  
 Latitud \= 28.4638  
 Longitud \= \-16.2521

#### 2.3. Ocupa

**Descripción:** Representa la relación entre los empleados y las tareas que realizan, permitiendo determinar qué empleado ocupa el puesto asociado a una tarea.

**Entidades relacionadas:**

* Empleado  
* Tarea

**Cardinalidad:**

* **Empleado — Ocupa — Tarea: 1:1**  
* Un empleado ocupa una tarea según la cardinalidad indicada en el modelo.  
* Cada tarea queda asociada a un empleado.

Esta relación permite vincular las tareas realizadas con el empleado responsable de llevarlas a cabo.

**Ejemplo:**  
 Empleado \= EMP017  
 Tarea \= TAR0105

#### 2.4. Vende a

**Descripción:** Representa la relación entre los empleados y los clientes pertenecientes al programa Tajinaste Plus. Permite reflejar la actividad comercial de los empleados sobre estos clientes.

**Entidades relacionadas:**

* Empleado  
* Tajinaste\_Plus

**Cardinalidad:**

* **Empleado — Vende a — Tajinaste\_Plus: 1:N**  
* Un empleado puede vender a varios clientes pertenecientes a Tajinaste Plus.  
* La relación permite asociar la actividad comercial de los empleados con los clientes del programa.

**Ejemplo:**  
 Empleado \= EMP017  
 Tajinaste\_Plus \= cliente dado de alta el 2026-01-10

#### 2.5. Se da de alta

**Descripción:** Representa la incorporación de un cliente al programa de fidelización Tajinaste Plus.

**Entidades relacionadas:**

* Cliente  
* Tajinaste\_Plus

**Cardinalidad:**

* **Cliente — Se da de alta — Tajinaste\_Plus: 1:1**  
* Un cliente se corresponde con una única pertenencia a Tajinaste Plus.  
* Una ocurrencia de Tajinaste\_Plus corresponde a un único cliente.

La relación permite distinguir a los clientes que pertenecen al programa de fidelización y asociarlos con los datos específicos del programa, como la fecha de alta y la bonificación.

**Ejemplo:**  
 Cliente \= CLI1008  
 fecha\_alta \= 2026-01-10  
 Bonificación \= 10%

#### 2.6. Hace pedidos

**Descripción:** Representa la relación mediante la cual se registran los pedidos realizados por los clientes sobre los productos de la empresa.

**Entidades relacionadas:**

* Cliente  
* Producto

**Cardinalidad:**

* **Cliente — Hace pedidos — Producto: 1:N**  
* Un cliente puede realizar pedidos de diferentes productos.  
* La relación permite asociar los clientes con los productos que solicitan.

**Ejemplo:**  
 Cliente \= CLI1008  
 Producto \= PROD025

### 3\. Restricciones semánticas

#### 3.1. Identificadores únicos

Los atributos identificadores deben ser únicos:

* `id_vivero` identifica de forma única a cada vivero.  
* `id_producto` identifica de forma única a cada producto.  
* `id_tarea` identifica de forma única a cada tarea.  
* `id_empleado` identifica de forma única a cada empleado.  
* `id_cliente` identifica de forma única a cada cliente.

#### 3.2. Cantidad de productos

El atributo **Cantidad** de la relación `Tiene` debe ser un valor numérico igual o superior a cero.

#### 3.3. Precio de los productos

El atributo **Precio** debe ser un valor numérico no negativo.

#### 3.4. Coordenadas geográficas

Los atributos Latitud y Longitud, tanto del vivero como de la zona, deben contener valores correspondientes a coordenadas geográficas válidas.

* La latitud debe encontrarse entre \-90 y 90\.  
* La longitud debe encontrarse entre \-180 y 180\.

#### 3.5. Fechas de las tareas

En cada Tarea, la fecha de Inicio debe ser anterior o igual a la fecha de Fin.
