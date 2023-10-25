import React, { useState, useEffect } from 'react';
import { Table, Button, Container, Card, Row, Col, Form, Modal, FloatingLabel } from 'react-bootstrap';
import Header from '../components/Header';

function ListaProveedor() {
  const [proveedores, setProveedores] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [selectedProveedor, setSelectedProveedor] = useState({});
  const [formData, setFormData] = useState({
    empresa_proveedor: '',
    direccion_proveedor: '',
    ciudad_proveedor: '',
  });

  // Función para abrir el modal y pasar los datos del docente seleccionado
  const openModal = (proveedores) => {
    setSelectedProveedor(proveedores);

    setFormData({
      empresa_proveedor: proveedores.empresa_proveedor,
      direccion_proveedor: proveedores.direccion_proveedor,
      ciudad_proveedor: proveedores.ciudad_proveedor,
    });
    setShowModal(true);
  };

  function formatDateForInput(dateTimeString) {
    const date = new Date(dateTimeString);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Agregar ceros iniciales
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }

  // Función para manejar cambios en el formulario
  const handleFormChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const loadProveedor = () => {
    fetch('http://localhost:5000/crud/read_proveedor')
      .then((response) => response.json())
      .then((data) => setProveedores(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  };


   // Función para enviar el formulario de actualización
   const handleUpdate = () => {
    // Realiza la solicitud PUT al servidor para actualizar el registro
    fetch(`http://localhost:5000/crud/update_proveedore/${selectedProveedor.id_proveedor}`, {
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
          loadProveedor(); // Cargar la lista de docentes actualizada
        }
      })
      .catch((error) => console.error('Error al actualizar el registro:', error));
  };

  // Función para eliminar un docente
  const handleDelete = (id_proveedor) => {
    const confirmation = window.confirm('¿Seguro que deseas eliminar este docente?');
    if (confirmation) {
      // Realiza la solicitud DELETE al servidor para eliminar el docente
      fetch(`http://localhost:5000/crud/delete_proveedor/${id_proveedor}`, {
        method: 'DELETE',
      })
        .then((response) => {
          if (response.ok) {
            // La eliminación fue exitosa, refresca la lista de docentes
            loadProveedor();
          }
        })
        .catch((error) => console.error('Error al eliminar el docente:', error));
    }
  };

  // Realiza una solicitud GET al servidor para obtener los docentes
  useEffect(() => {
    fetch('http://localhost:5000/crud/read_proveedor')
      .then((response) => response.json())
      .then((data) => setProveedores(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  }, []);

  return (
    <div>
      <Header />

      <Card className="m-3">
        <Card.Body>
          <Card.Title className="mb-3">Listado de proveedores</Card.Title>
          <Table striped bordered hover>
            <thead>
              <tr>
              <th abbr="Id">Id</th>
                <th>Empresa</th>
                <th>Direcciòn</th>
                <th>Ciudad</th>
                <th>Acción</th>
              </tr>
            </thead>
            <tbody>
              {proveedores.map((proveedor) => (
                <tr key={proveedor.id_proveedor}>
                  <td>{proveedor.id_proveedor}</td>
                  <td>{proveedor.empresa_proveedor}</td>
                  <td>{proveedor.direccion_proveedor}</td>
                  <td>{proveedor.ciudad_proveedor}</td>
                  <td>
                    <Button variant="primary" onClick={() => openModal(proveedor)}>Actualizar</Button>
                    <Button variant="danger" onClick={() => handleDelete(proveedor.id_proveedor)}>Eliminar</Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
        </Card.Body>
      </Card>

      <Modal show={showModal} onHide={() => setShowModal(false)} size="lg">
        <Modal.Header closeButton>
          <Modal.Title>Actualizar Cliente</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Card className="mt-3">
            <Card.Body>
              <Card.Title>Registro de Proveedor</Card.Title>
              <Form className="mt-3">
                <Row className="g-3">

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="empresa_proveedor" label="Empresa">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese el nombre de la empresa"
                        name="empresa_proveedor"
                        value={formData.empresa_proveedor}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="direccion_proveedor" label="Direcciòn">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese la direcciòn de la empresa"
                        name="direccion_proveedor"
                        value={formData.direccion_proveedor}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="ciudad_proveedor" label="Ciudad">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese la ciudad de la empresa"
                        name="ciudad_proveedor"
                        value={formData.ciudad_proveedor}
                        onChange={handleFormChange}
                      />
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

export default ListaProveedor;