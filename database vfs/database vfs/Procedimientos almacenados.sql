/* Procedimientos almacenados */
-- Insertar Cliente ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarCliente(
    IN nombre1_cliente VARCHAR(15),
    IN nombre2_cliente VARCHAR(15),
    IN apellido1_cliente VARCHAR(15),
    IN apellido2_cliente VARCHAR(15),
    IN fechanac_cliente DATE,
    IN telefono_cliente VARCHAR(9),
    IN email_cliente VARCHAR(255),
    IN contrasena_cliente VARCHAR(255)
)
BEGIN
    INSERT INTO Cliente (
    nombre1_cliente,
    nombre2_cliente, 
    apellido1_cliente,
    apellido2_cliente,
    fechanac_cliente,
    telefono_cliente,
    email_cliente,
    contrasena_cliente) 
    
    VALUES (
    nombre1_cliente,
    nombre2_cliente,
    apellido1_cliente,
    apellido2_cliente,
    fechanac_cliente,
    telefono_cliente,
    email_cliente,
    contrasena_cliente);
END //
DELIMITER ;

-- ActualizarCliente ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarCliente(
    IN id_cliente INT,
    IN nuevo_nombre1 VARCHAR(255),
    IN nuevo_nombre2 VARCHAR(255),
    IN nuevo_apellido1 VARCHAR(255),
    IN nuevo_apellido2 VARCHAR(255),
    IN nueva_fecha_nac DATE,
    IN nuevo_telefono VARCHAR(255),
    IN nuevo_email VARCHAR(255),
    IN nueva_contrasena VARCHAR(255)
)
BEGIN
    UPDATE Cliente
    SET
        nombre1_cliente = nuevo_nombre1,
        nombre2_cliente = nuevo_nombre2,
        apellido1_cliente = nuevo_apellido1,
        apellido2_cliente = nuevo_apellido2,
        fechanac_cliente = nueva_fecha_nac,
        telefono_cliente = nuevo_telefono,
        email_cliente = nuevo_email,
        contrasena_cliente = nueva_contrasena
    WHERE id_cliente = id_cliente;
END //

DELIMITER ;

-- Consultar Cliente ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarCliente(
    IN id_cliente INT
)
BEGIN
    SELECT *
    FROM Cliente
    WHERE id_cliente = id_cliente;
END //

DELIMITER ;

-- Buscar Cliente ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarCliente(
    IN nombre_cliente VARCHAR(255)
)
BEGIN
    SELECT *
    FROM Cliente
    WHERE nombre1_cliente LIKE CONCAT('%', nombre_cliente, '%')
        OR nombre2_cliente LIKE CONCAT('%', nombre_cliente, '%')
        OR apellido1_cliente LIKE CONCAT('%', nombre_cliente, '%')
        OR apellido2_cliente LIKE CONCAT('%', nombre_cliente, '%');
END //

DELIMITER ;

-- Eliminar cliente ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarCliente(
    IN id_cliente INT
)
BEGIN
    DELETE FROM Cliente
    WHERE id_cliente = id_cliente;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Empleado ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarEmpleado(
    IN nombre1_empleado VARCHAR(15),
    IN nombre2_empleado VARCHAR(15),
    IN apellido1_empleado VARCHAR(15),
    IN apellido2_empleado VARCHAR(15),
    IN especialidad_empleado VARCHAR(50),
    IN telefono_empleado VARCHAR(9),
    IN email_empleado VARCHAR(255),
    IN contrasena_empleado VARCHAR(255)
)
BEGIN
    INSERT INTO Empleado (
    nombre1_empleado,
    nombre2_empleado,
    apellido1_empleado,
    apellido2_empleado,
    especialidad_empleado,
    telefono_empleado,
    email_empleado,
    contrasena_empleado)
    VALUES (
    nombre1_empleado,
    nombre2_empleado,
    apellido1_empleado,
    apellido2_empleado,
    especialidad_empleado,
    telefono_empleado,
    email_empleado,
    contrasena_empleado);
END //
DELIMITER ;

-- Actualizar Empleado ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarEmpleado(
    IN id_empleado INT,
    IN nuevo_nombre1 VARCHAR(255),
    IN nuevo_nombre2 VARCHAR(255),
    IN nuevo_apellido1 VARCHAR(255),
    IN nuevo_apellido2 VARCHAR(255),
    IN nueva_especialidad VARCHAR(50),
    IN nuevo_telefono VARCHAR(9),
    IN nuevo_email VARCHAR(255),
    IN nueva_contrasena VARCHAR(255)
)
BEGIN
    UPDATE Empleado
    SET
        nombre1_empleado = nuevo_nombre1,
        nombre2_empleado = nuevo_nombre2,
        apellido1_empleado = nuevo_apellido1,
        apellido2_empleado = nuevo_apellido2,
        especialidad_empleado = nueva_especialidad,
        telefono_empleado = nuevo_telefono,
        email_empleado = nuevo_email,
        contrasena_empleado = nueva_contrasena
    WHERE id_empleado = id_empleado;
END //

DELIMITER ;

-- Consultar Empelado ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarEmpleadoPorID(
    IN id_empleado INT
)
BEGIN
    SELECT *
    FROM Empleado
    WHERE id_empleado = id_empleado;
END //

DELIMITER ;

-- Buscar Emppleado ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarEmpleado(
    IN nombre_empleado VARCHAR(255)
)
BEGIN
    SELECT *
    FROM Empleado
    WHERE nombre1_empleado LIKE CONCAT('%', nombre_empleado, '%')
        OR nombre2_empleado LIKE CONCAT('%', nombre_empleado, '%')
        OR apellido1_empleado LIKE CONCAT('%', nombre_empleado, '%')
        OR apellido2_empleado LIKE CONCAT('%', nombre_empleado, '%');
END //

DELIMITER ;

-- Eliminar Empleado ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarEmpleado(
    IN id_empleado INT
)
BEGIN
    DELETE FROM Empleado
    WHERE id_empleado = id_empleado;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Producto ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarProducto(
    IN id_prov INT,
    IN id_cat INT,
    IN nombre VARCHAR(30),
    IN foto_descriptiva BLOB,
    IN precio_venta DECIMAL(12,2),
    IN precio_compra DECIMAL(12,2),
    IN cantidad INT,
    IN talla VARCHAR(20),
    IN descripcion VARCHAR(255),
    IN genero CHAR(1)
)
BEGIN
    INSERT INTO Producto (id_proveedor, id_categoria, nombre_producto, foto_descriptiva, precio_venta, precio_compra, cantidad, talla, descripcion, genero)
    VALUES (id_prov, id_cat, nombre, foto_descriptiva, precio_venta, precio_compra, cantidad, talla, descripcion, genero);
END //

DELIMITER ;

-- Actualizar Producto ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarProducto(
    IN id_producto INT,
    IN nuevo_id_proveedor INT,
    IN nuevo_id_categoria INT,
    IN nuevo_nombre_producto VARCHAR(30),
    IN nueva_foto_descriptiva BLOB,
    IN nuevo_precio_venta DECIMAL(12, 2),
    IN nuevo_precio_compra DECIMAL(12, 2),
    IN nueva_cantidad INT,
    IN nueva_talla VARCHAR(20),
    IN nueva_descripcion VARCHAR(255),
    IN nuevo_genero CHAR(1)
)
BEGIN
    UPDATE Producto
    SET
        id_proveedor = nuevo_id_proveedor,
        id_categoria = nuevo_id_categoria,
        nombre_producto = nuevo_nombre_producto,
        foto_descriptiva = nueva_foto_descriptiva,
        precio_venta = nuevo_precio_venta,
        precio_compra = nuevo_precio_compra,
        cantidad = nueva_cantidad,
        talla = nueva_talla,
        descripcion = nueva_descripcion,
        genero = nuevo_genero
    WHERE id_producto = id_producto;
END //

DELIMITER ;

-- Consultar Producto ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarProductoPorID(
    IN id_producto INT
)
BEGIN
    SELECT *
    FROM Producto
    WHERE id_producto = id_producto;
END //

DELIMITER ;

-- Buscar Producto ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarProductoPorNombre(
    IN nombre_producto VARCHAR(30)
)
BEGIN
    SELECT *
    FROM Producto
    WHERE nombre_producto LIKE CONCAT('%', nombre_producto, '%');
END //

DELIMITER ;

-- Eliminar Producto ----------------------------------------------
-

/*---------------------------------------------------------------------------------*/
-- Insertar Categoria ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarCategoria(
    IN nombre_categoria VARCHAR(50),
    IN descripcion_categoria VARCHAR(255)
)
BEGIN
    INSERT INTO Categoria (nombre_categoria, descripcion_categoria)
    VALUES (nombre_categoria, descripcion_categoria);
END //

DELIMITER ;

-- Actualizar categoria ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarCategoria(
    IN id_categoria INT,
    IN nuevo_nombre_categoria VARCHAR(50),
    IN nueva_descripcion_categoria VARCHAR(255)
)
BEGIN
    UPDATE Categoria
    SET
        nombre_categoria = nuevo_nombre_categoria,
        descripcion_categoria = nueva_descripcion_categoria
    WHERE id_categoria = id_categoria;
END //

DELIMITER ;

-- Consultar Categoria ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarCategoriaPorID(
    IN id_categoria INT
)
BEGIN
    SELECT *
    FROM Categoria
    WHERE id_categoria = id_categoria;
END //

DELIMITER ;

-- Buscar Categoria ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarCategoriaPorNombre(
    IN nombre_categoria VARCHAR(50)
)
BEGIN
    SELECT *
    FROM Categoria
    WHERE nombre_categoria LIKE CONCAT('%', nombre_categoria, '%');
END //

DELIMITER ;

-- Eliminar Categoria ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarCategoria(
    IN id_categoria INT
)
BEGIN
    DELETE FROM Categoria
    WHERE id_categoria = id_categoria;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Cita ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarCita(
    IN id_cliente INT,
    IN id_empleado INT,
    IN tipo_servicio VARCHAR(100),
    IN fecha_cita DATE,
    IN hora_cita TIME,
    IN estado_cita BOOLEAN,
    IN comentario VARCHAR(255)
)
BEGIN
    INSERT INTO Cita (id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario)
    VALUES (id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario);
END //

DELIMITER ;

-- Actualizar Cita ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarCita(
    IN id_cita INT,
    IN nuevo_id_cliente INT,
    IN nuevo_id_empleado INT,
    IN nuevo_tipo_servicio VARCHAR(100),
    IN nueva_fecha_cita DATE,
    IN nueva_hora_cita TIME,
    IN nuevo_estado_cita BOOLEAN,
    IN nuevo_comentario VARCHAR(255)
)
BEGIN
    UPDATE Cita
    SET
        id_cliente = nuevo_id_cliente,
        id_empleado = nuevo_id_empleado,
        tipo_servicio = nuevo_tipo_servicio,
        fecha_cita = nueva_fecha_cita,
        hora_cita = nueva_hora_cita,
        estado_cita = nuevo_estado_cita,
        comentario = nuevo_comentario
    WHERE id_cita = id_cita;
END //

DELIMITER ;

-- Consultar Cita ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarCitaPorID(
    IN id_cita INT
)
BEGIN
    SELECT *
    FROM Cita
    WHERE id_cita = id_cita;
END //

DELIMITER ;

-- Buscar Cita ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarCitaPorCliente(
    IN id_cliente INT
)
BEGIN
    SELECT *
    FROM Cita
    WHERE id_cliente = id_cliente;
END //

DELIMITER ;

-- Eliminar Cita ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarCita(
    IN id_cita INT
)
BEGIN
    DELETE FROM Cita
    WHERE id_cita = id_cita;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Compra ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarCompra(
    IN id_cliente INT,
    IN id_tipo_pago INT,
    IN id_entrega INT,
    IN fecha_compra DATE,
    IN hora_compra TIME
)
BEGIN
    INSERT INTO Compra (id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra)
    VALUES (id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra);
END //

DELIMITER ;

-- Actualizar Compra ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarCompra(
    IN id_compra INT,
    IN nuevo_id_cliente INT,
    IN nuevo_id_tipo_pago INT,
    IN nuevo_id_entrega INT,
    IN nueva_fecha_compra DATE,
    IN nueva_hora_compra TIME
)
BEGIN
    UPDATE Compra
    SET
        id_cliente = nuevo_id_cliente,
        id_tipo_pago = nuevo_id_tipo_pago,
        id_entrega = nuevo_id_entrega,
        fecha_compra = nueva_fecha_compra,
        hora_compra = nueva_hora_compra
    WHERE id_compra = id_compra;
END //

DELIMITER ;

-- Consultar Compra ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarCompraPorID(
    IN id_compra INT
)
BEGIN
    SELECT *
    FROM Compra
    WHERE id_compra = id_compra;
END //

DELIMITER ;

-- Buscar Compra ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarComprasPorCliente(
    IN id_cliente INT
)
BEGIN
    SELECT *
    FROM Compra
    WHERE id_cliente = id_cliente;
END //

DELIMITER ;

-- Eliminar Compra ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarCompra(
    IN id_compra INT
)
BEGIN
    DELETE FROM Compra
    WHERE id_compra = id_compra;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Tipo Pago ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarTipoPago(
    IN tipo VARCHAR(65)
)
BEGIN
    INSERT INTO Tipo_pago (tipo)
    VALUES (tipo);
END //

DELIMITER ;

-- Actualizar Tipo Pago ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarTipoPago(
    IN id_tipo_pago INT,
    IN nuevo_tipo VARCHAR(65)
)
BEGIN
    UPDATE Tipo_pago
    SET
        tipo = nuevo_tipo
    WHERE id_tipo_pago = id_tipo_pago;
END //

DELIMITER ;

-- Consultar Tipo Pago ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarTipoPagoPorID(
    IN id_tipo_pago INT
)
BEGIN
    SELECT *
    FROM Tipo_pago
    WHERE id_tipo_pago = id_tipo_pago;
END //

DELIMITER ;

-- Buscar Tipo Pago ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarTipoPagoPorNombre(
    IN nombre_tipo VARCHAR(65)
)
BEGIN
    SELECT *
    FROM Tipo_pago
    WHERE tipo LIKE CONCAT('%', nombre_tipo, '%');
END //

DELIMITER ;
 
-- Eliminar Tipo pago ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarTipoPago(
    IN id_tipo_pago INT
)
BEGIN
    DELETE FROM Tipo_pago
    WHERE id_tipo_pago = id_tipo_pago;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Tipo Entrega ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarTipoEntrega(
    IN id_empleado INT,
    IN tipo_entrega VARCHAR(50),
    IN estado_entrega VARCHAR(20),
    IN direccion_entrega VARCHAR(255)
)
BEGIN
    INSERT INTO Tipo_entrega (id_empleado, tipo_entrega, estado_entrega, direccion_entrega)
    VALUES (id_empleado, tipo_entrega, estado_entrega, direccion_entrega);
END //

DELIMITER ;

-- Actualizar Tipo entrega ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarTipoEntrega(
    IN id_entrega INT,
    IN nuevo_id_empleado INT,
    IN nuevo_tipo_entrega VARCHAR(50),
    IN nuevo_estado_entrega VARCHAR(20),
    IN nueva_direccion_entrega VARCHAR(255)
)
BEGIN
    UPDATE Tipo_entrega
    SET
        id_empleado = nuevo_id_empleado,
        tipo_entrega = nuevo_tipo_entrega,
        estado_entrega = nuevo_estado_entrega,
        direccion_entrega = nueva_direccion_entrega
    WHERE id_entrega = id_entrega;
END //

DELIMITER ;

-- Consultar Tipo entrega ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarTipoEntregaPorID(
    IN id_entrega INT
)
BEGIN
    SELECT *
    FROM Tipo_entrega
    WHERE id_entrega = id_entrega;
END //

DELIMITER ;

-- Buscar Tipo entrega ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarTipoEntregaPorTipo(
    IN tipo_entrega VARCHAR(50)
)
BEGIN
    SELECT *
    FROM Tipo_entrega
    WHERE tipo_entrega LIKE CONCAT('%', tipo_entrega, '%');
END //

DELIMITER ;

-- Eliminar Tipo entrega ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarTipoEntrega(
    IN id_entrega INT
)
BEGIN
    DELETE FROM Tipo_entrega
    WHERE id_entrega = id_entrega;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Detalle Compra ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarDetalleCompra(
    IN id_compra INT,
    IN id_producto INT,
    IN cantidad_compra INT
)
BEGIN
    -- Insertar el detalle de compra
    INSERT INTO Detalle_compra (id_compra, id_producto, cantidad_compra)
    VALUES (id_compra, id_producto, cantidad_compra);

    -- Actualizar el stock del producto
    UPDATE Producto
    SET cantidad = cantidad + cantidad_compra
    WHERE id_producto = id_producto;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Resena ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarResena(
    IN id_cliente INT,
    IN id_producto INT,
    IN calificacion INT,
    IN comentario VARCHAR(255),
    IN fecha_publicacion DATETIME,
    IN aprobacion BOOLEAN
)
BEGIN
    INSERT INTO Resena (id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprovacion)
    VALUES (id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprobacion);
END //

DELIMITER ;

-- Actualizar Resena ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarResena(
    IN id_resena INT,
    IN nuevo_id_cliente INT,
    IN nuevo_id_producto INT,
    IN nueva_calificacion INT,
    IN nuevo_comentario VARCHAR(255),
    IN nueva_fecha_publicacion DATETIME,
    IN nueva_aprobacion BOOLEAN
)
BEGIN
    UPDATE Resena
    SET
        id_cliente = nuevo_id_cliente,
        id_producto = nuevo_id_producto,
        calificacion = nueva_calificacion,
        comentario = nuevo_comentario,
        fecha_publicacion = nueva_fecha_publicacion,
        aprobacion = nueva_aprobacion
    WHERE id_resena = id_resena;
END //

DELIMITER ;

-- Consultar Resena ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarResenaPorID(
    IN id_resena INT
)
BEGIN
    SELECT *
    FROM Resena
    WHERE id_resena = id_resena;
END //

DELIMITER ;

-- Buscar Resena ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarResenasPorProducto(
    IN id_producto INT
)
BEGIN
    SELECT *
    FROM Resena
    WHERE id_producto = id_producto;
END //

DELIMITER ;

-- Eliminar Resena ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarResena(
    IN id_resena INT
)
BEGIN
    DELETE FROM Resena
    WHERE id_resena = id_resena;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Lista de deseo ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarListaDeseos(
    IN id_cliente INT,
    IN fecha_creacion DATETIME
)
BEGIN
    INSERT INTO ListaDeseos (id_cliente, fecha_creacion)
    VALUES (id_cliente, fecha_creacion);
END //

DELIMITER ;

-- Actualizar Lista de deseo ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarListaDeseos(
    IN id_deseo INT,
    IN nueva_fecha_creacion DATETIME
)
BEGIN
    UPDATE ListaDeseos
    SET fecha_creacion = nueva_fecha_creacion
    WHERE id_deseo = id_deseo;
END //

DELIMITER ;

-- Consultar Lista de deseo ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarListaDeseosPorID(
    IN id_deseo INT
)
BEGIN
    SELECT *
    FROM ListaDeseos
    WHERE id_deseo = id_deseo;
END //

DELIMITER ;

-- Buscar Lista de deseo ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarListasDeseosPorCliente(
    IN id_cliente INT
)
BEGIN
    SELECT *
    FROM ListaDeseos
    WHERE id_cliente = id_cliente;
END //

DELIMITER ;

-- Eliminar Lista de deseo ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarListaDeseos(
    IN id_deseo INT
)
BEGIN
    DELETE FROM ListaDeseos
    WHERE id_deseo = id_deseo;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Lista Detalle ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarElementoListaDeseos(
    IN id_producto INT,
    IN id_deseo INT
)
BEGIN
    INSERT INTO ListaDetalle (id_producto, id_deseo)
    VALUES (id_producto, id_deseo);
END //

DELIMITER ;

-- Actualizar Lista detalle ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarDetalleListaDeseos(
    IN id_listadetalle INT,
    IN nuevo_id_producto INT,
    IN nuevo_id_deseo INT
)
BEGIN
    UPDATE ListaDetalle
    SET
        id_producto = nuevo_id_producto,
        id_deseo = nuevo_id_deseo
    WHERE id_listadetalle = id_listadetalle;
END //

DELIMITER ;

-- OCnsultar Lista detalle ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarDetalleListaDeseosPorID(
    IN id_listadetalle INT
)
BEGIN
    SELECT *
    FROM ListaDetalle
    WHERE id_listadetalle = id_listadetalle;
END //

DELIMITER ;

-- Buscar Lista detalle ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarDetalleListaDeseosPorListaDeseos(
    IN id_deseo INT
)
BEGIN
    SELECT *
    FROM ListaDetalle
    WHERE id_deseo = id_deseo;
END //

DELIMITER ;

-- Eliminar Lista Detalle ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarDetalleListaDeseos(
    IN id_listadetalle INT
)
BEGIN
    DELETE FROM ListaDetalle
    WHERE id_listadetalle = id_listadetalle;
END //

DELIMITER ;

/*---------------------------------------------------------------------------------*/
-- Insertar Proveedor ----------------------------------------------
DELIMITER //

CREATE PROCEDURE InsertarProveedor(
    IN empresa_proveedor VARCHAR(60),
    IN direccion_proveedor VARCHAR(255),
    IN ciudad_proveedor VARCHAR(50)
)
BEGIN
    INSERT INTO Proveedor (empresa_proveedor, direccion_proveedor, ciudad_proveedor)
    VALUES (empresa_proveedor, direccion_proveedor, ciudad_proveedor);
END //

DELIMITER ;

-- Actualizar Proveedor ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ActualizarProveedor(
    IN id_proveedor INT,
    IN nuevo_empresa_proveedor VARCHAR(60),
    IN nuevo_direccion_proveedor VARCHAR(255),
    IN nuevo_ciudad_proveedor VARCHAR(50)
)
BEGIN
    UPDATE Proveedor
    SET
        empresa_proveedor = nuevo_empresa_proveedor,
        direccion_proveedor = nuevo_direccion_proveedor,
        ciudad_proveedor = nuevo_ciudad_proveedor
    WHERE id_proveedor = id_proveedor;
END //

DELIMITER ;

-- Consultar Proveedor ----------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarProveedorPorID(
    IN id_proveedor INT
)
BEGIN
    SELECT *
    FROM Proveedor
    WHERE id_proveedor = id_proveedor;
END //

DELIMITER ;

-- Buscar Proveedor ----------------------------------------------
DELIMITER //

CREATE PROCEDURE BuscarProveedoresPorNombreEmpresa(
    IN nombre_empresa VARCHAR(60)
)
BEGIN
    SELECT *
    FROM Proveedor
    WHERE empresa_proveedor LIKE CONCAT('%', nombre_empresa, '%');
END //

DELIMITER ;

-- Eliminar Proveedor ----------------------------------------------
DELIMITER //

CREATE PROCEDURE EliminarProveedor(
    IN id_proveedor INT
)
BEGIN
    DELETE FROM Proveedor
    WHERE id_proveedor = id_proveedor;
END //

DELIMITER ;
