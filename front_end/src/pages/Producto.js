import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Form, Row, Col, Container, FloatingLabel, Card, Button } from 'react-bootstrap';
import Header from '../components/Header';
import '../styles/App.css';

function Producto() {

    const [id_categorias, setId_categorias] = useState([]); // Estado para almacenar las categorías
    const [id_categoria, setId_categoria] = useState(''); // Estado para el valor seleccionado de categoría
    const [id_proveedores, setId_proveedores] = useState([]); // Estado para almacenar los proveedores
    const [id_proveedor, setId_proveedor] = useState(''); // Estado para el valor seleccionado de proveedor

    const [imageUrl, setImageUrl] = useState('');
    const [imageFile, setImageFile] = useState([]); // Nuevo estado para el archivo de imagen

    // Crear un estado para cada campo del formulario
    const [nombre_producto, setNombre_producto] = useState('');
    const [precio_venta, setPrecio_venta] = useState('');
    const [precio_compra, setPrecio_compra] = useState('');
    const [cantidad, setCantidad] = useState('');
    const [talla, setTalla] = useState(' ');
    const [descripcion, setDescripcion] = useState('');
    const [genero, setGenero] = useState('');

    // Función para manejar el envío del formulario
    const handleSubmit = async (e) => {
        e.preventDefault();

        // Crear un objeto con los datos del formulario
        const formData = {
            id_proveedor,
            id_categoria,
            nombre_producto,
            imageUrl,
            precio_venta,
            precio_compra,
            cantidad,
            talla,
            descripcion,
            genero,
        };

        try {
            // Realizar una solicitud HTTP al backend para enviar los datos
            const response = await fetch('http://localhost:5000/crud/create_producto', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData),
            });

            if (response.ok) {
                // El registro se creó exitosamente
                alert('Registro exitoso');
                // Reiniciar los campos del formulario
                setId_proveedor('');
                setId_categoria('');
                setNombre_producto('');
                setImageUrl('');
                setImageFile('');
                setPrecio_venta('');
                setPrecio_compra('');
                setCantidad('');
                setTalla('');
                setDescripcion('');
                setGenero('');
            } else {
                alert('Error al registrar el producto');
            }
        } catch (error) {
            console.error('Error en la solicitud:', error);
            alert('Error en la solicitud al servidor');
        }
    };

    const handleFileChange = async (e) => {
        const file = e.target.files[0];
        if (file) {
            setImageFile(file); // Actualiza el estado imageFile
            const formData = new FormData();
            formData.append('imagen', file);

            try {
                const response = await axios.post('http://localhost:5000/uploads', formData);
                if (response.data.imageUrl) {
                    setImageUrl(response.data.imageUrl);
                }
            } catch (error) {
                console.error('Error al cargar la imagen:', error);
                // Manejar el error de carga de la imagen
            }
        }
    };

    useEffect(() => {
        // Realiza una solicitud a tu ruta para obtener las especialidades
        fetch('http://localhost:5000/crud/read_proveedor')
            .then(response => response.json())
            .then(data => {
                // Actualiza el estado con las especialidades obtenidas
                setId_proveedores(data);
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
                setId_categorias(data);
            })
            .catch(error => {
                console.error('Error al obtener las especialidades', error);
            });
    }, []);

    return (
        <div>
            <Header />

            <Container>
                <Card className="mt-3">
                    <Card.Body>
                        <Card.Title>Registro de Producto</Card.Title>
                        <Form className="mt-3" onSubmit={handleSubmit}>
                            <Row className="g-3">

                                <Col sm="12" md="6" lg="4">
                                    <FloatingLabel controlId="id_proveedor" label="Proveedor">
                                        <Form.Select
                                            aria-label="id_proveedor"
                                            value={id_proveedor}
                                            onChange={(e) => setId_proveedor(e.target.value)}
                                        >
                                            <option>Seleccione un proveedor</option>
                                            {id_proveedores.map((proveedor) => (
                                                <option key={proveedor.id_proveedor} value={proveedor.id_proveedor}>
                                                    {proveedor.empresa_proveedor}
                                                </option>
                                            ))}
                                        </Form.Select>
                                    </FloatingLabel>
                                </Col>

                                <Col sm="12" md="6" lg="4">
                                    <FloatingLabel controlId="id_categoria" label="Categoria">
                                        <Form.Select
                                            aria-label="Categoria"
                                            value={id_categoria}
                                            onChange={(e) => setId_categoria(e.target.value)}
                                        >
                                            <option>Seleccione una categoría</option>
                                            {id_categorias.map((categoria) => (
                                                <option key={categoria.id_categoria} value={categoria.id_categoria}>
                                                    {categoria.nombre_categoria}
                                                </option>
                                            ))}
                                        </Form.Select>
                                    </FloatingLabel>
                                </Col>


                                <Col sm="6" md="6" lg="6">
                                    <FloatingLabel controlId="nombre_producto" label="Producto">
                                        <Form.Control
                                            type="text"
                                            placeholder="Ingrese el nombre del producto"
                                            value={nombre_producto}
                                            onChange={(e) => setNombre_producto(e.target.value)}
                                        />
                                    </FloatingLabel>
                                </Col>

                            <Col sm="6" md="6" lg="6">
                                <Form.Group controlId="selectedFile" className="mb-3">
                                    <Form.Control
                                        type="file" name="imagen"
                                        accept=".jpg, .png, .jpeg"
                                        size="lg"
                                        onChange={handleFileChange}
                                    />
                                </Form.Group>
                            </Col>

                            <Col sm="6" md="6" lg="6">
                                <FloatingLabel controlId="precio_venta" label="Precio venta">
                                    <Form.Control
                                        type="number" // Cambiado a "number" para capturar valores numéricos
                                        placeholder="Ingrese el precio de venta"
                                        value={precio_venta}
                                        onChange={(e) => setPrecio_venta(e.target.value)}
                                    />
                                </FloatingLabel>
                            </Col>


                            <Col sm="6" md="6" lg="6">
                                <FloatingLabel controlId="precio_compra" label="Precio compra">
                                    <Form.Control
                                        type="number" // Cambiado a "number" para capturar valores numéricos
                                        placeholder="Ingrese el precio de compra"
                                        value={precio_compra}
                                        onChange={(e) => setPrecio_compra(e.target.value)}
                                    />
                                </FloatingLabel>
                            </Col>

                            <Col sm="6" md="6" lg="6">
                                <FloatingLabel controlId="cantidad" label="Cantidad">
                                    <Form.Control
                                        type="number" // Cambiado a "number" para capturar valores numéricos
                                        placeholder="Ingrese la cantidad"
                                        value={cantidad}
                                        onChange={(e) => setCantidad(e.target.value)}
                                    />
                                </FloatingLabel>
                            </Col>

                            <Col sm="12" md="12" lg="12">
                                <FloatingLabel controlId="talla" label="Talla">
                                    <Form.Control
                                        type="text"
                                        placeholder="Ingrese la talla"
                                        value={talla}
                                        onChange={(e) => setTalla(e.target.value)}
                                    />
                                </FloatingLabel>
                            </Col>

                            <Col sm="12" md="12" lg="12">
                                <FloatingLabel controlId="descripcion" label="Descripciòn">
                                    <Form.Control
                                        type="text"
                                        placeholder="Ingrese una descripciòn"
                                        value={descripcion}
                                        onChange={(e) => setDescripcion(e.target.value)}
                                    />
                                </FloatingLabel>
                            </Col>

                            <Col sm="12" md="6" lg="4">
                                <FloatingLabel controlId="genero" label="Género">
                                    <Form.Select
                                        aria-label="Genero"
                                        value={genero}
                                        onChange={(e) => setGenero(e.target.value)}
                                    >
                                        <option>Seleccione el género</option>
                                        <option value="F">F</option>
                                        <option value="M">M</option>
                                    </Form.Select>
                                </FloatingLabel>
                            </Col>

                        </Row>
                        <div className="center-button">
                            <Button variant="primary" type="submit" className="mt-3" size="lg">
                                Registrar
                            </Button>
                        </div>
                    </Form>
                </Card.Body>
            </Card>
        </Container>

        </div >
    );
}

export default Producto;