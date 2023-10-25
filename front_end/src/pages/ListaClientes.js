import React, { useState, useEffect } from 'react';
import { Table, Button, Container, Card, Row, Col, Form, Modal, FloatingLabel } from 'react-bootstrap';
import Header from '../components/Header';

function ListaCliente() {
  const [clientes, setClientes] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [selectedCliente, setSelectedCliente] = useState({});
  const [formData, setFormData] = useState({
    nombre1_cliente: '',
    nombre2_cliente: '',
    apellido1_cliente: '',
    apellido2_cliente: '',
    fechanac_cliente: '',
    telefono_cliente: '',
    email_cliente: '',
    contrasena_cliente: '',
  });

  // Función para abrir el modal y pasar los datos del docente seleccionado
  const openModal = (clientes) => {
    setSelectedCliente(clientes);

    // Formatea la fecha para el campo "Fecha_Nacimiento"
    const formattedFechanac_cliente = formatDateForInput(clientes.fechanac_cliente);

    setFormData({
      nombre1_cliente: clientes.nombre1_cliente,
      nombre2_cliente: clientes.nombre2_cliente,
      apellido1_cliente: clientes.apellido1_cliente,
      apellido2_cliente: clientes.apellido2_cliente,
      fechanac_cliente: formattedFechanac_cliente,
      telefono_cliente: clientes.telefono_cliente,
      email_cliente: clientes.email_cliente,
      contrasena_cliente: clientes.contrasena_cliente,
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

  const loadCliente = () => {
    fetch('http://localhost:5000/crud/read_cliente')
      .then((response) => response.json())
      .then((data) => setClientes(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  };


   // Función para enviar el formulario de actualización
   const handleUpdate = () => {
    // Realiza la solicitud PUT al servidor para actualizar el registro
    fetch(`http://localhost:5000/crud/update_cliente/${selectedCliente.id_cliente}`, {
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
          loadCliente(); // Cargar la lista de docentes actualizada
        }
      })
      .catch((error) => console.error('Error al actualizar el registro:', error));
  };

  // Función para eliminar un docente
  const handleDelete = (id_cliente) => {
    const confirmation = window.confirm('¿Seguro que deseas eliminar este docente?');
    if (confirmation) {
      // Realiza la solicitud DELETE al servidor para eliminar el docente
      fetch(`http://localhost:5000/crud/delete_cliente/${id_cliente}`, {
        method: 'DELETE',
      })
        .then((response) => {
          if (response.ok) {
            // La eliminación fue exitosa, refresca la lista de docentes
            loadCliente();
          }
        })
        .catch((error) => console.error('Error al eliminar el docente:', error));
    }
  };

  // Realiza una solicitud GET al servidor para obtener los docentes
  useEffect(() => {
    fetch('http://localhost:5000/crud/read_cliente')
      .then((response) => response.json())
      .then((data) => setClientes(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  }, []);

  return (
    <div>
      <Header />

      <Card className="m-3">
        <Card.Body>
          <Card.Title className="mb-3">Listado de Clientes</Card.Title>
          <Table striped bordered hover>
            <thead>
              <tr>
              <th abbr="Id">Id</th>
                <th>Primer nombre</th>
                <th>Segundo nombre</th>
                <th>Primer apellido</th>
                <th>Segundo apellido</th>
                <th>Fecha de Nacimiento</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Contraseña</th>
                <th>Acción</th>
              </tr>
            </thead>
            <tbody>
              {clientes.map((cliente) => (
                <tr key={cliente.id_cliente}>
                  <td>{cliente.id_cliente}</td>
                  <td>{cliente.nombre1_cliente}</td>
                  <td>{cliente.nombre2_cliente}</td>
                  <td>{cliente.apellido1_cliente}</td>
                  <td>{cliente.apellido2_cliente}</td>
                  <td>{formatDateForInput(cliente.fechanac_cliente)}</td>
                  <td>{cliente.telefono_cliente}</td>
                  <td>{cliente.email_cliente}</td>
                  <td>{cliente.contrasena_cliente}</td>
                  <td>
                    <Button variant="primary" onClick={() => openModal(cliente)}>Actualizar</Button>
                    <Button variant="danger" onClick={() => handleDelete(cliente.id_cliente)}>Eliminar</Button>
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
              <Card.Title>Registro de Cliente</Card.Title>
              <Form className="mt-3">
                <Row className="g-3">

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="nombre1_cliente" label="Nombre">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su primer nombre"
                        name="nombre1_cliente"
                        value={formData.nombre1_cliente}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="nombre2_cliente" label="Segundo nombre">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su segundo nombre"
                        name="nombre2_cliente"
                        value={formData.nombre2_cliente}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="apellido1_cliente" label="Apellido">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su primer apellido"
                        name="apellido1_cliente"
                        value={formData.apellido1_cliente}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="apellido2_cliente" label="Segundo apellido">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su segundo apellido"
                        name="apellido2_cliente"
                        value={formData.apellido2_cliente}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="12" md="6" lg="4">
                    <FloatingLabel controlId="fechanac_cliente" label="Fecha nacimiento">
                      <Form.Control
                        type="date"
                        placeholder="Seleccione la fecha de nacimiento"
                        name="fechanac_cliente"
                        value={formData.fechanac_cliente}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="telefono_cliente" label="Telefono">
                      <Form.Control
                        type="number"
                        placeholder="Ingrese su numero telefonico"
                        name="telefono_cliente"
                        value={formData.telefono_cliente}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="email_cliente" label="Email">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su email"
                        name="email_cliente"
                        value={formData.email_cliente}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="contrasena_cliente" label="Contraseña">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su contraseña"
                        name="contrasena_cliente"
                        value={formData.contrasena_cliente}
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

export default ListaCliente;