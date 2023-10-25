import React, { useState, useEffect } from 'react';
import { Table, Button, Container, Card, Row, Col, Form, Modal, FloatingLabel } from 'react-bootstrap';
import Header from '../components/Header';

function ListaEmpleado() {
  const [empleados, setEmpleados] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [selectedEmpleado, setSelectedEmpleado] = useState({});
  const [formData, setFormData] = useState({
    nombre1_empleado: '',
    nombre2_empleado: '',
    apellido1_empleado: '',
    apellido2_empleado: '',
    especialidad_empleado: '',
    telefono_empleado: '',
    email_empleado: '',
    contrasena_empleado: '',
  });

  // Función para abrir el modal y pasar los datos del docente seleccionado
  const openModal = (empleados) => {
    setSelectedEmpleado(empleados);

    setFormData({
      nombre1_empleado: empleados.nombre1_empleado,
      nombre2_empleado: empleados.nombre2_empleado,
      apellido1_empleado: empleados.apellido1_empleado,
      apellido2_empleado: empleados.apellido2_empleado,
      especialidad_empleado: empleados.especialidad_empleado,
      telefono_empleado: empleados.telefono_empleado,
      email_empleado: empleados.email_empleado,
      contrasena_empleado: empleados.contrasena_empleado,
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

  const loadEmpleado = (id_empleado) => {
    fetch('http://localhost:5000/crud/read_empleado')
      .then((response) => response.json())
      .then((data) => setEmpleados(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  };


  // Función para enviar el formulario de actualización
  const handleUpdate = () => {
    // Realiza la solicitud PUT al servidor para actualizar el registro
    fetch(`http://localhost:5000/crud/update_empleado/${selectedEmpleado.id_empleado}`, {
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
          loadEmpleado(); // Cargar la lista de docentes actualizada
        }
      })
      .catch((error) => console.error('Error al actualizar el registro:', error));
  };

  // Función para eliminar un docente
  const handleDelete = (id_empleado) => {
    const confirmation = window.confirm('¿Seguro que deseas eliminar este docente?');
    if (confirmation) {
      // Realiza la solicitud DELETE al servidor para eliminar el docente
      fetch(`http://localhost:5000/crud/delete_empleado/${id_empleado}`, {
        method: 'DELETE',
      })
        .then((response) => {
          if (response.ok) {
            // La eliminación fue exitosa, refresca la lista de docentes
            loadEmpleado();
          }
        })
        .catch((error) => console.error('Error al eliminar el docente:', error));
    }
  };

  // Realiza una solicitud GET al servidor para obtener los docentes
  useEffect(() => {
    fetch('http://localhost:5000/crud/read_empleado')
      .then((response) => response.json())
      .then((data) => setEmpleados(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  }, []);

  return (
    <div>
      <Header />

      <Card className="m-3">
        <Card.Body>
          <Card.Title className="mb-3">Listado de Empleados</Card.Title>
          <Table striped bordered hover>
            <thead>
              <tr>
              <th abbr="Id">Id</th>
                <th>Primer nombre</th>
                <th>Segundo nombre</th>
                <th>Primer apellidos</th>
                <th>Segundo apellidos</th>
                <th>Especialidad</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Contraseña</th>
                <th>Acción</th>
              </tr>
            </thead>
            <tbody>
              {empleados.map((empleado) => (
                <tr key={empleado.id_empleado}>
                  <td>{empleado.id_empleado}</td>
                  <td>{empleado.nombre1_empleado}</td>
                  <td>{empleado.nombre2_empleado}</td>
                  <td>{empleado.apellido1_empleado}</td>
                  <td>{empleado.apellido2_empleado}</td>
                  <td>{empleado.especialidad_empleado}</td>
                  <td>{empleado.telefono_empleado}</td>
                  <td>{empleado.email_empleado}</td>
                  <td>{empleado.contrasena_empleado}</td>
                  <td>
                    <Button variant="primary" onClick={() => openModal(empleado)}>Actualizar</Button>
                    <Button variant="danger" onClick={() => handleDelete(empleado.id_empleado)}>Eliminar</Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
        </Card.Body>
      </Card>

      <Modal show={showModal} onHide={() => setShowModal(false)} size="lg">
        <Modal.Header closeButton>
          <Modal.Title>Actualizar Empleado</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Card className="mt-3">
            <Card.Body>
              <Card.Title>Registro de Empleado</Card.Title>
              <Form className="mt-3">
                <Row className="g-3">

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="nombre1_empleado" label="Nombre">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su primer nombre"
                        name="nombre1_empleado"
                        value={formData.nombre1_empleado}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="nombre2_empleado" label="Segundo nombre">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su segundo nombre"
                        name="nombre2_empleado"
                        value={formData.nombre2_empleado}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="apellido1_empleado" label="Apellido">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su primer apellido"
                        name="apellido1_empleado"
                        value={formData.apellido1_empleado}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="apellido2_empleado" label="Segundo apellido">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su segundo apellido"
                        name="apellido2_empleado"
                        value={formData.apellido2_empleado}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="especialidad_empleado" label="Especialidad">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su segundo apellido"
                        name="especialidad_empleado"
                        value={formData.especialidad_empleado}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="telefono_empleado" label="Numero telefonico">
                      <Form.Control
                        type="number"
                        placeholder="Ingrese su numero telefonico"
                        name="telefono_empleado"
                        value={formData.telefono_empleado}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="email_empleado" label="Email">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su email"
                        name="email_empleado"
                        value={formData.email_empleado}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="contrasena_empleado" label="Contraseña">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese su contraseña"
                        name="contrasena_empleado"
                        value={formData.contrasena_empleado}
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

export default ListaEmpleado;