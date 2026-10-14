INSERT INTO "Vivero" ("latitud", "longitud") VALUES
  (28.4874, -16.3159),
  (28.4636, -16.2518),
  (90, 180),
  (-90, -180),
  (0, 0);

INSERT INTO "Zona" ("id_vivero") VALUES
  (1),
  (1),
  (2),
  (3),
  (4),
  (5);

INSERT INTO "Producto" ("id_vivero", "precio", "cantidad") VALUES
  (1, 12.50, 40),
  (1, 3.99, 0),
  (2, 0.00, 10);

INSERT INTO "Producto" ("id_vivero") VALUES
  (3);

INSERT INTO "Producto" ("id_vivero", "precio", "cantidad") VALUES
  (4, 149.95, 5),
  (5, 7.25, 120);

INSERT INTO "cliente" ("nombre") VALUES
  ('Ana Pérez'),
  ('Luis García'),
  ('María Hernández'),
  ('Carlos Díaz'),
  ('Elena Rodríguez'),
  ('Javier Morales'),
  ('Lucía Medina');

INSERT INTO "Tajinaste_Plus" ("id_cliente", "fecha_alta", "fecha_baja", "bonificacion") VALUES
  (1, '2025-01-15', NULL, 0.10),
  (2, '2024-03-01', '2025-03-01', 0.25),
  (4, '2023-11-10', NULL, 1.00);

INSERT INTO "Tajinaste_Plus" ("id_cliente", "fecha_alta", "fecha_baja") VALUES
  (3, '2026-05-20', '2026-05-20');

INSERT INTO "Tajinaste_Plus" ("id_cliente", "fecha_alta", "fecha_baja", "bonificacion") VALUES
  (5, '2026-01-01', '2026-09-30', 0.05);

INSERT INTO "pedido" ("id_producto", "id_cliente", "cantidad", "fecha_pedido") VALUES
  (1, 1, 2, '2026-09-01'),
  (2, 2, 1, '2026-09-05'),
  (3, 3, 10, '2026-09-12'),
  (5, 4, 1, '2026-09-20'),
  (6, 6, 100, '2026-10-01'),
  (1, 7, 3, '2026-10-02'),
  (4, 5, 1, '2026-10-10');

INSERT INTO "Tarea" ("id_zona", "tipo_tarea", "fecha_inicio", "fecha_fin") VALUES
  (1, 'Riego', '2026-09-01', '2026-09-01'),
  (1, 'Poda', '2026-09-10', NULL),
  (2, 'Trasplante', '2026-08-15', '2026-08-20'),
  (3, NULL, '2026-10-01', NULL),
  (4, 'Fertilización', '2026-07-01', '2026-07-03'),
  (5, 'Siembra', '2026-10-05', NULL),
  (6, 'Riego', '2026-10-10', '2026-10-12');

INSERT INTO "Puesto" ("id_tarea", "nombre", "descripcion") VALUES
  (1, 'Regador', 'Riego de plantas'),
  (2, 'Podador', 'Poda de arbustos'),
  (3, 'Jardinero', NULL),
  (NULL, 'Cajero', 'Atención en caja'),
  (5, 'Fertilizador', 'Abonado de zonas'),
  (NULL, 'Gerente', NULL);

INSERT INTO "Empleado" ("nombre", "id_puesto") VALUES
  ('Pedro Álvarez', 4),
  ('Sofía Ramos', 4),
  ('Raúl Cabrera', 1),
  ('Marta Suárez', 2),
  ('Diego Santana', 3),
  ('Nuria Báez', NULL);

INSERT INTO "Venta" ("id_pedido", "id_cliente", "id_empleado") VALUES
  (2, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 1),
  (5, 6, 4),
  (6, 7, 2);
