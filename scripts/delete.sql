-- Pedido sin venta asociada (Venta.id_pedido es RESTRICT, solo se puede borrar si no tiene venta)
DELETE FROM "pedido" WHERE "id" = 7;

-- Condición sobre varias columnas
DELETE FROM "Producto" WHERE "cantidad" = 0 AND "precio" = 0.0;

-- Cliente: borra en cascada su Tajinaste_Plus y sus pedidos (sin ventas)
DELETE FROM "cliente" WHERE "id" = 5;

-- Con RETURNING
DELETE FROM "Tarea" WHERE "fecha_fin" < '2026-08-01' RETURNING *;

-- Con USING (join)
DELETE FROM "Tarea" t
USING "Zona" z
WHERE t."id_zona" = z."id"
  AND z."id_vivero" = 5
  AND t."fecha_fin" IS NOT NULL;

-- Vivero: borra en cascada sus zonas y productos
DELETE FROM "Vivero" WHERE "id" = 3;

-- Zona: borra en cascada sus tareas
DELETE FROM "Zona" WHERE "id" = 2;

-- Tarea: los puestos que la referencian quedan con id_tarea NULL
DELETE FROM "Tarea" WHERE "id" = 2;

-- Puesto: los empleados quedan con id_puesto NULL
DELETE FROM "Puesto" WHERE "id" = 4;

-- Con subconsulta
DELETE FROM "Empleado"
WHERE "id_puesto" IS NULL
  AND "id" NOT IN (SELECT "id_empleado" FROM "Venta");

-- Empleado: borra en cascada sus ventas
DELETE FROM "Empleado" WHERE "id" = 3;

-- Puesto sin tarea ni descripción
DELETE FROM "Puesto" WHERE "id_tarea" IS NULL AND "descripcion" IS NULL;

-- Tajinaste_Plus por rango de fechas
DELETE FROM "Tajinaste_Plus" WHERE "fecha_alta" BETWEEN '2024-01-01' AND '2024-12-31';

-- Primero la venta (RESTRICT) y después el cliente, que borra sus pedidos en cascada
DELETE FROM "Venta" WHERE "id_cliente" = 7;
DELETE FROM "cliente" WHERE "id" = 7;
