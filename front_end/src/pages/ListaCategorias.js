import React, { useState, useEffect } from 'react';
import { Table, Button, Container, Card, Row, Col, Form, Modal, FloatingLabel } from 'react-bootstrap';
import Header from '../components/Header';

function ListaCategoria() {
  const [searchQuery, setSearchQuery] = useState('');
  const [categorias, setCategorias] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [selectedCategoria, setSelectedCategoria] = useState({});
  const [formData, setFormData] = useState({
    nombre_categoria: '',
    descripcion_categoria: '',
  });

  const handleSearchChange = (e) => {
    setSearchQuery(e.target.value);
  };

  // Función para abrir el modal y pasar los datos del docente seleccionado
  const openModal = (categorias) => {
    setSelectedCategoria(categorias);

    setFormData({
      nombre_categoria: categorias.nombre_categoria,
      descripcion_categoria: categorias.descripcion_categoria,
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

  const loadCategoria = (id_categoria) => {
    fetch('http://localhost:5000/crud/read_categoria')
      .then((response) => response.json())
      .then((data) => setCategorias(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  };


  // Función para enviar el formulario de actualización
  const handleUpdate = () => {
    // Realiza la solicitud PUT al servidor para actualizar el registro
    fetch(`http://localhost:5000/crud/update_categoria/${selectedCategoria.id_categoria}`, {
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
          loadCategoria(); // Cargar la lista de docentes actualizada
        }
      })
      .catch((error) => console.error('Error al actualizar el registro:', error));
  };

  // Función para eliminar un docente
  const handleDelete = (id_categoria) => {
    const confirmation = window.confirm('¿Seguro que deseas eliminar este docente?');
    if (confirmation) {
      // Realiza la solicitud DELETE al servidor para eliminar el docente
      fetch(`http://localhost:5000/crud/delete_categoria/${id_categoria}`, {
        method: 'DELETE',
      })
        .then((response) => {
          if (response.ok) {
            // La eliminación fue exitosa, refresca la lista de docentes
            loadCategoria();
          }
        })
        .catch((error) => console.error('Error al eliminar el docente:', error));
    }
  };

  // Realiza una solicitud GET al servidor para obtener los docentes
  useEffect(() => {
    fetch('http://localhost:5000/crud/read_categoria')
      .then((response) => response.json())
      .then((data) => setCategorias(data))
      .catch((error) => console.error('Error al obtener los docentes y personas:', error));
  }, []);


  const filteredCategoria = categorias.filter((categoria) => {
    // Convierte los valores de los campos a minúsculas para realizar una búsqueda insensible a mayúsculas y minúsculas
    const nombre_categoria = categoria.nombre_categoria.toLowerCase();
    const descripcion_categoria = categoria.descripcion_categoria.toLowerCase();
    const search = searchQuery.toLowerCase();

    // Verifica si la cadena de búsqueda se encuentra en algún campo
    return (
      nombre_categoria.includes(search) ||
      descripcion_categoria.includes(search)
    );
  });

  return (
    <div>
      <Header />

      <Card className="m-3">
        <Card.Body>
          <Card.Title className="mb-3">Listado de Categorias</Card.Title>
          <Row className="mb-3">
            <Col>
              <FloatingLabel controlId="search" label="Buscar">
                <Form.Control
                  type="text"
                  placeholder="Buscar"
                  value={searchQuery}
                  onChange={handleSearchChange}
                />
              </FloatingLabel>
            </Col>
          </Row>
          <Table striped bordered hover>
            <thead>
              <tr>
                <th abbr="Id">Id</th>
                <th>Nombre categoria</th>
                <th>Descripción categoria</th>
                <th>Acción</th>
              </tr>
            </thead>
            <tbody>
              {filteredCategoria.map((categoria) => (
                <tr key={categoria.id_categoria}>
                  <td>{categoria.id_categoria}</td>
                  <td>{categoria.nombre_categoria}</td>
                  <td>{categoria.descripcion_categoria}</td>
                  <td>
                    <Button variant="primary" onClick={() => openModal(categoria)}>Actualizar</Button>
                    <Button variant="danger" onClick={() => handleDelete(categoria.id_categoria)}>Eliminar</Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
        </Card.Body>
      </Card>

      <Modal show={showModal} onHide={() => setShowModal(false)} size="lg">
        <Modal.Header closeButton>
          <Modal.Title>Actualizar Categoria</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Card className="mt-3">
            <Card.Body>
              <Card.Title>Registro de Categoria</Card.Title>

              <Row className="mb-3">
                <Col>
                  <FloatingLabel controlId="search" label="Buscar">
                    <Form.Control
                      type="text"
                      placeholder="Buscar"
                      value={searchQuery}
                      onChange={handleSearchChange}
                    />
                  </FloatingLabel>
                </Col>
              </Row>

              <Form className="mt-3">
                <Row className="g-3">

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="nombre_categoria" label="Categoria">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese una categoria"
                        name="nombre_categoria"
                        value={formData.nombre_categoria}
                        onChange={handleFormChange}
                      />
                    </FloatingLabel>
                  </Col>

                  <Col sm="6" md="6" lg="4">
                    <FloatingLabel controlId="descripcion_categoria" label="Descripción">
                      <Form.Control
                        type="text"
                        placeholder="Ingrese una descripción"
                        name="descripcion_categoria"
                        value={formData.descripcion_categoria}
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

export default ListaCategoria;
