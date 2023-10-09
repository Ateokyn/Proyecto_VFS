
-- CRUD Cliente
CALL InsertarCliente(
    'Kenny',
    'Antonio',
    'Tellez',
    'Obando',
    '2004-09-24',
    '123456789',
    'kennyt@gmail.com',
    'contrasena123'
);

CALL ActualizarCliente(
    1, 
    'Antonio', 
    'Kenny', 
    'Obando', 
    'Tellez', 
    '2004-09-25', 
    '83347188', 
    'nuevo@email.com', 
    'NuevaContrasena'
);

Call ConsultarCliente(1);

CALL BuscarCliente('Antonio Tellez');

CALL EliminarCliente(1);

-- CRUD Empleado
CALL InsertarEmpleado(
    'Gisela',
    'Paola',
    'Rocha',
    'Cruz',
    'Delivery',
    '123456789',
    'empleado@email.com',
    'contrasena123'
);

CALL ActualizarEmpleado(
	1,
    'Gisela',
    'Paola',
    'Rocha',
    'Cruz',
    'Pedicurista',
    '83310234',
    'empleado@email.com',
    'contrasena1234'
);

Call ConsultarEmpleado(1);

CALL BuscarEmpleado('Gisela Paola');

CALL EliminarEmpleado(1);

-- CRUD Producto
CALL InsertarProducto(
    1, 
    2, 
    'Nombre del Producto', 
    'DatosBLOB', 
    49.99, 
    29.99, 
    100, 
    'Talla L', 
    'Descripción del Producto', 
    'M'
);

CALL ActualizarProducto(
	1,
    1, 
    2, 
    'Nombre del Producto', 
    'DatosBLOB', 
    49.99, 
    29.99, 
    100, 
    'Talla L', 
    'Descripción del Producto', 
    'M'
);

CALL ConsultarProductoPorID(1);

CALL BuscarProductoPorNombre('NombreABuscar');

CALL EliminarProducto(1);

-- CRUD Categoria 
CALL InsertarCategoria('Nombre de la Categoría', 'Descripción de la Categoría');

CALL ActualizarCategoria(1, 'Nuevo Nombre de Categoría', 'Nueva Descripción de Categoría');

CALL ConsultarCategoriaPorID(1);

CALL BuscarCategoriaPorNombre('NombreABuscar');

CALL EliminarCategoria(1);

-- CRUD Cita
CALL InsertarCita(1, 2, 'Corte de Pelo', '2023-10-02', '14:30:00', TRUE, 'Comentario de la Cita');

CALL ActualizarCita(1, 3, 4, 'Nuevo Tipo de Servicio', '2023-10-03', '15:00:00', FALSE, 'Nuevo Comentario');

CALL ConsultarCitaPorID(1);

CALL BuscarCitaPorCliente(1);

CALL EliminarCita(1);

-- CRUD Compra 
CALL InsertarCompra(1, 2, 3, '2023-10-02', '14:30:00');

CALL ActualizarCompra(1, 2, 3, 4, '2023-10-03', '15:00:00');

CALL ConsultarCompraPorID(1);

CALL BuscarComprasPorCliente(1);

CALL EliminarCompra(1);

-- CRUD Tipo de pago 
CALL InsertarTipoPago('Tarjeta de Crédito');

CALL ConsultarTipoPagoPorID(1);

CALL EliminarTipoPago(1);

-- CRUD Tipo en trega 
CALL InsertarTipoEntrega(1, 'Entrega a domicilio', 'En proceso', 'Calle Principal #123');

CALL ActualizarTipoEntrega(1, 2, 'Entrega a domicilio', 'En proceso', 'Nueva Dirección');

CALL ConsultarTipoEntregaPorID(1);

CALL ConsultarTipoEntregaPorID(1);

CALL BuscarTipoEntregaPorTipo('Entrega a domicilio');

-- CRUD Detalle de compra 
CALL EliminarTipoEntrega(1);

-- CRUD Resena
CALL InsertarDetalleCompra(1, 2, 5);

CALL ConsultarResenaPorID(1);

CALL EliminarResena(1);

-- CRUD Lista de deseos 
CALL InsertarListaDeseos(1, '2023-10-02 14:30:00');

CALL ActualizarListaDeseos(1, '2023-10-02 15:00:00');

CALL ConsultarListaDeseosPorID(1);

CALL BuscarListasDeseosPorCliente(1);

CALL EliminarListaDeseos(1);

-- CRUD Lista de detalle 
CALL InsertarElementoListaDeseos(1, 2);

CALL ConsultarDetalleListaDeseosPorID(1);

CALL EliminarDetalleListaDeseos(1);

-- CRUD Proveedor 
CALL InsertarProveedor('Nombre de la Empresa', 'Dirección del Proveedor', 'Ciudad del Proveedor');

CALL ActualizarProveedor(1, 'Nuevo Nombre de la Empresa', 'Nueva Dirección del Proveedor', 'Nueva Ciudad del Proveedor');

CALL ConsultarProveedorPorID(1);

CALL BuscarProveedoresPorNombreEmpresa('Nombre de la Empresa');

CALL EliminarProveedor(1);
 




