SELECT v."id" AS vivero, v."latitud", v."longitud",
       z."id" AS zona,
       t."id" AS tarea, t."tipo_tarea", t."fecha_inicio", t."fecha_fin",
       p."id" AS puesto, p."nombre" AS puesto_nombre, p."descripcion",
       e."id" AS empleado, e."nombre" AS empleado_nombre
FROM "Vivero" v
LEFT JOIN "Zona"     z ON z."id_vivero" = v."id"
LEFT JOIN "Tarea"    t ON t."id_zona"   = z."id"
LEFT JOIN "Puesto"   p ON p."id_tarea"  = t."id"
LEFT JOIN "Empleado" e ON e."id_puesto" = p."id"
ORDER BY v."id", z."id", t."id", p."id", e."id";


SELECT v."id" AS vivero,
       pr."id" AS producto, pr."precio", pr."cantidad" AS stock,
       pe."id" AS pedido, pe."cantidad" AS unidades_pedidas, pe."fecha_pedido",
       c."id" AS cliente, c."nombre" AS cliente_nombre
FROM "Vivero" v
LEFT JOIN "Producto" pr ON pr."id_vivero"   = v."id"
LEFT JOIN "pedido"   pe ON pe."id_producto" = pr."id"
LEFT JOIN "cliente"  c  ON c."id"           = pe."id_cliente"
ORDER BY v."id", pr."id", pe."id";


SELECT ve."id" AS venta,
       pe."id" AS pedido, pe."fecha_pedido", pe."cantidad",
       pr."id" AS producto, pr."precio",
       c."id" AS cliente, c."nombre" AS cliente_nombre,
       e."id" AS empleado, e."nombre" AS empleado_nombre
FROM "Venta" ve
JOIN "pedido"   pe ON pe."id" = ve."id_pedido"
JOIN "Producto" pr ON pr."id" = pe."id_producto"
JOIN "cliente"  c  ON c."id"  = ve."id_cliente"
JOIN "Empleado" e  ON e."id"  = ve."id_empleado"
ORDER BY ve."id";


SELECT *
FROM "Tajinaste_Plus"
NATURAL JOIN "Venta"
NATURAL JOIN (SELECT "id" AS "id_cliente", "nombre" FROM "cliente") AS c
ORDER BY "id_cliente";

