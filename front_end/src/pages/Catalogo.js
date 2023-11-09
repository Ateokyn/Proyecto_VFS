import React, { useState, useEffect } from 'react';  // Importa las funciones useState y useEffect de React
import { Row, Col, Container, Card, Badge, Form, FloatingLabel } from 'react-bootstrap';  // Importa componentes de react-bootstrap
import Header from '../components/Header';  // Importa el componente Header desde su ubicación relativa
import '../styles/App.css';  // Importa estilos CSS del archivo App.css

function Catalogo({ rol }) {  // Define un componente funcional Galeria que recibe props

  const [productos, setProductos] = useState([]);  // Crea un estado para almacenar la lista de productos
  const [searchQuery, setSearchQuery] = useState('');  // Crea un estado para almacenar la cadena de búsqueda

  const handleSearchChange = (e) => {  // Función para manejar cambios en la búsqueda
    setSearchQuery(e.target.value);  // Actualiza el estado con la cadena de búsqueda ingresada
  };

  const filteredProductos = productos.filter((producto) => {  // Filtra los productos según la cadena de búsqueda
    // Convierte a minúsculas los valores de los campos para realizar una búsqueda insensible a mayúsculas y minúsculas
    const id_producto = producto.id_producto;
    const nombre_producto = producto.nombre_producto.toLowerCase(); 
    const cantidad = producto.cantidad;
    const precio_venta = producto.precio_venta;
    const genero = producto.genero.toLowerCase();
    const talla = producto.talla;
    const id_categoria = producto.id_categoria;
    const search = searchQuery.toLowerCase();
    
    // Verifica si la cadena de búsqueda se encuentra en algún campo de los productos
    // Devuelve un nuevo array con los productos filtrados
    return (
      id_producto == (search) ||
      nombre_producto.includes(search) ||
      cantidad == (search) ||
      precio_venta == (search) ||
      genero.includes(search) ||
      talla == (search) ||
      id_categoria == (search)
    );

  });

  useEffect(() => {  // Realiza una solicitud GET al servidor para obtener los productos
    fetch('http://localhost:5000/crud/read_producto')  // Realiza una petición GET al servidor
      .then((response) => response.json())  // Convierte la respuesta a formato JSON
      .then((data) => setProductos(data))  // Actualiza el estado con la lista de productos obtenida
      .catch((error) => console.error('Error al obtener los productos:', error));  // Maneja errores en la obtención de productos
  }, []);  // Se ejecuta solo en la primera renderización del componente

  return (
    <div>
    <Header rol={rol} />

    <Container className="margen-contenedor">

      <Row className="mb-3">
        <Col sm="6" md="6" lg="4">
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

      <Row className="g-3">
        {filteredProductos.map((producto) => (
          <Col sm="12" md="4" lg="3">
            <Card className="h-100"> {/* Agrega la clase h-100 para que todas las tarjetas tengan la misma altura */}
              <Card.Img
                className="image-card"
                variant="top"
                src={producto.imagen}
                alt={producto.nombre_nombre}
                style={{ height: '200px' }}
              />
              <Card.Body>
                <Card.Title>{producto.nombre_producto}</Card.Title>
                <Card.Text>
                  <Badge bg="primary">Género: {producto.genero}</Badge>
                </Card.Text>
                <div>
                  <Badge bg="primary">Stock: {producto.cantidad}</Badge>
                  <Badge bg="success">Precio: {producto.precio_venta}</Badge>
                  <Badge bg="warning" text="dark">
                    Talla: {producto.talla}
                  </Badge>
                </div>
              </Card.Body>
              <Card.Body>
                <Card.Link href="/producto">Comprar</Card.Link>
              </Card.Body>
            </Card>
          </Col>
        ))}
      </Row>
    </Container>
  </div>
  );
}

export default Catalogo;  // Exporta el componente Galeria