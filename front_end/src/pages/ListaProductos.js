import React, { useState, useEffect } from 'react';
import { Table, Button, Container, Card, Row, Col, Form, Modal, FloatingLabel } from 'react-bootstrap';
import Header from '../components/Header';

function ListaProducto() {
  const [categorias, setCategorias] = useState([]); // Estado para almacenar las categorías
  const [Categoria, setCategoria] = useState(''); // Estado para el valor seleccionado de categoría

  const [proveedores, setProveedores] = useState([]); // Estado para almacenar los proveedores
  const [Proveedor, setProveedor] = useState(''); // Estado para el valor seleccionado de proveedor

  const [productos, setProductos] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [selectedProducto, setSelectedProducto] = useState({});
  const [formData, setFormData] = useState({
    id_proveedor: 0,
    id_categoria: 0,
    nombre_producto: '',
    foto_descriptiva: null, // Puedes inicializarlo con el valor adecuado o como null
    precio_venta: 0,
    precio_compra: 0,
    cantidad: 0,
    talla: '',
    descripcion: '',
    genero: '',
  });

  // Función para abrir el modal y pasar los datos del docente seleccionado
  const openModal = (productos) => {
    setSelectedProducto(productos);

    // Modificar esta parte para asignar los nombres de proveedor y categoría
    setFormData({
      nombre_producto: productos.nombre_producto,
      foto_descriptiva: productos.foto_descriptiva,
      precio_venta: productos.precio_venta,
      precio_compra: productos.precio_compra,
      cantidad: productos.cantidad,
      proveedor: productos.id_proveedor,  // Asignar el nombre del proveedor
      categoria: productos.id_categoria,  // Asignar el nombre de la categoría
      talla: productos.talla,
      descripcion: productos.descripcion,
      genero: productos.genero,
    });
    setShowModal(true);
  };

  // Función para manejar cambios en el formulario
  const handleFormChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const loadProducto = () => {
    fetch('http://localhost:5000/crud/read_producto')
      .then((response) => response.json())
      .then((data) => setProductos(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  };


  // Función para enviar el formulario de actualización
  const handleUpdate = () => {
    // Realiza la solicitud PUT al servidor para actualizar el registro
    fetch(`http://localhost:5000/crud/update_producto/${selectedProducto.id_producto}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(formData),
    })
      .then((response) => {
        if (response.ok) {
          // La actualización fue exitosa, puedes cerrar el modal y refrescar la lista de docentes
          setShowModal(false);
          loadProducto(); // Cargar la lista de docentes actualizada
        }
      })
      .catch((error) => console.error('Error al actualizar el registro:', error));
  };

  // Función para eliminar un docente
  const handleDelete = (id_producto) => {
    const confirmation = window.confirm('¿Seguro que deseas eliminar este docente?');
    if (confirmation) {
      // Realiza la solicitud DELETE al servidor para eliminar el docente
      fetch(`http://localhost:5000/crud/delete_producto/${id_producto}`, {
        method: 'DELETE',
      })
        .then((response) => {
          if (response.ok) {
            // La eliminación fue exitosa, refresca la lista de docentes
            loadProducto();
          }
        })
        .catch((error) => console.error('Error al eliminar el docente:', error));
    }
  };

  // Realiza una solicitud GET al servidor para obtener los docentes
  useEffect(() => {
    fetch('http://localhost:5000/crud/read_producto')
      .then((response) => response.json())
      .then((data) => setProductos(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  }, []);

  useEffect(() => {
    // Realiza una solicitud a tu ruta para obtener las especialidades
    fetch('http://localhost:5000/crud/read_proveedor')
      .then(response => response.json())
      .then(data => {
        // Actualiza el estado con las especialidades obtenidas
        setProveedores(data);
      })
      .catch(error => {
        console.error('Error al obtener las especialidades', error);
      });
  }, []);

  useEffect(() => {
    // Realiza una solicitud a tu ruta para obtener las especialidades
    fetch('http://localhost:5000/crud/read_categoria')
      .then(response => response.json())
      .then(data => {
        // Actualiza el estado con las especialidades obtenidas
        setCategorias(data);
      })
      .catch(error => {
        console.error('Error al obtener las especialidades', error);
      });
  }, []);

  return (
    <div>
      <Header />

      <Card className="m-3">
        <Card.Body>
          <Card.Title className="mb-3">Listado de Productos</Card.Title>
          <Table striped bordered hover>
            <thead>
              <tr>
                <th abbr="Id">Id</th>
                <th>Producto</th>
                <th>Foto</th>
                <th>Precio venta</th>
                <th>Precio compra</th>
                <th>Cantidad</th>
                <th>Proveedor</th>
                <th>Categoria</th>
                <th>Talla</th>
                <th>Descripciòn</th>
                <th>Genero</th>
                <th>Acción</th>
              </tr>
            </thead>
            <tbody>
              {productos.map((producto) => (
                <tr key={producto.id_producto}>
                  <td>{producto.id_producto}</td>
                  <td>{producto.nombre_producto}</td>
                  <td>{producto.foto_descriptiva}</td>
                  <td>{producto.precio_venta}</td>
                  <td>{producto.precio_compra}</td>
                  <td>{producto.cantidad}</td>
                  <td>{producto.empresa_proveedor}</td> {/* Cambia a empresa_proveedor */}
                  <td>{producto.nombre_categoria}</td> {/* Cambia a nombre_categoria */}
                  <td>{producto.talla}</td>
                  <td>{producto.descripcion}</td>
                  <td>{producto.genero}</td>
                  <td>
                    <Button variant="primary" onClick={() => openModal(producto)}>Actualizar</Button>
                    <Button variant="danger" onClick={() => handleDelete(producto.id_producto)}>Eliminar</Button>
                  </td>
                </tr>
              ))}
            </tbody>

          </Table>
        </Card.Body>
      </Card>

      <Modal show={showModal} onHide={() => setShowModal(false)} size="lg">
        <Modal.Header closeButton>
          <Modal.Title>Actualizar Producto</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Card className="mt-3">
            <Card.Body>
              <Card.Title>Registro de Producto</Card.Title>
              <Form className="mt-3">
                <Row className="g-3">

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="nombre_producto" label="Producto">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese el nombre del producto"
                        name="nombre_producto"
                        value={formData.nombre_producto}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="foto_descriptiva" label="Foto">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese un foto"
                        name="foto_descriptiva"
                        value={formData.foto_descriptiva}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="precio_venta" label="Precio venta">
                      <Form.Control
                        type="number"
                        placeholder="Ingrese el precio de venta"
                        name="precio_venta"
                        value={formData.precio_venta}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="precio_compra" label="Precio compra">
                      <Form.Control
                        type="number"
                        placeholder="Ingrese el precio de compra"
                        name="precio_compra"
                        value={formData.precio_compra}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="cantidad" label="Cantidad">
                      <Form.Control
                        type="number"
                        placeholder="Ingrese la cantidad"
                        name="cantidad"
                        value={formData.cantidad}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="12" md="6" lg="4">
                    <FloatingLabel controlId="Proveedor" label="Proveedor">
                      <Form.Select
                        aria-label="Proveedor"
                        value={Proveedor}
                        onChange={(e) => setProveedor(e.target.value)}
                      >
                        <option>Seleccione un proveedor</option>
                        {proveedores.map((proveedor) => (
                          <option key={proveedor.id_proveedor} value={proveedor.empresa_proveedor}>
                            {proveedor.empresa_proveedor}
                          </option>
                        ))}
                      </Form.Select>
                    </FloatingLabel>
                  </Col>


                  <Col sm="12" md="6" lg="4">
                    <FloatingLabel controlId="Categoria" label="Categoria">
                      <Form.Select
                        aria-label="Categoria"
                        value={Categoria}
                        onChange={(e) => setCategoria(e.target.value)}
                      >
                        <option>Seleccione una categoria</option>
                        {categorias.map((categoria) => (
                          <option key={categoria.id_categoria} value={categoria.nombre_categoria}>
                            {categoria.nombre_categoria}
                          </option>
                        ))}
                      </Form.Select>
                    </FloatingLabel>
                  </Col>


                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="talla" label="Talla">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su talla"
                        name="talla"
                        value={formData.talla}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="descripcion" label="Descripciòn">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese una descripciòn"
                        name="descripcion"
                        value={formData.descripcion}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="12" md="6" lg="4">
                    <FloatingLabel controlId="genero" label="Género">
                      <Form.Select
                        aria-label="Genero"
                        name="Genero"
                        value={formData.genero}
                        onChange={handleFormChange}
                      >
                        <option>Seleccione el género</option>
                        <option value="F">F</option>
                        <option value="M">M</option>
                      </Form.Select>
                    </FloatingLabel>
                  </Col>

                </Row>
              </Form>
            </Card.Body>
          </Card>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => setShowModal(false)}>
            Cerrar
          </Button>
          <Button variant="primary" onClick={handleUpdate}>
            Actualizar
          </Button>
        </Modal.Footer>
      </Modal>

    </div>
  );
}

export default ListaProducto;
