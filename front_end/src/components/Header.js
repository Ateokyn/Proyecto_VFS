import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Navbar, Nav, Offcanvas, Button, NavDropdown, Container } from 'react-bootstrap';
import { Link } from 'react-router-dom';

function Header() {
  const [showMenu, setShowMenu] = useState(false);

  const toggleMenu = () => {
    setShowMenu(!showMenu);
  };

  return (
    <div>
      <Navbar className="navbar-color" variant="dark" expand="md">
        <Container>
          <Navbar.Brand href="#home">Variedades Figueroa Soza</Navbar.Brand>
          <Navbar.Toggle
            aria-controls="basic-navbar-nav"
            style={{ display: 'none' }}
            className="d-sm-none d-xs-none"
          />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="ml-auto">

              <Nav.Link>
                <Link to="/" className="link-unstyled">Inicio</Link>
              </Nav.Link>

              <NavDropdown title="Clientes" id="clientes">
                <NavDropdown.Item>
                  <Link to="/Cliente" className="link-unstyled">Registrar Cliente</Link>
                </NavDropdown.Item>

                <NavDropdown.Item>
                  <Link to="/ListaClientes" className="link-unstyled">Listar Clientes</Link>
                </NavDropdown.Item>
              </NavDropdown>

              <NavDropdown title="Empleados" id="empleados">
                <NavDropdown.Item>
                  <Link to="/Empleado" className="link-unstyled">Registrar Empleado</Link>
                </NavDropdown.Item>

                <NavDropdown.Item>
                  <Link to="/ListaEmpleados" className="link-unstyled">Listar Empleado</Link>
                </NavDropdown.Item>
              </NavDropdown>

              <NavDropdown title="Categorias" id="categorias">
                <NavDropdown.Item>
                  <Link to="/Categoria" className="link-unstyled">Registrar Categoria</Link>
                </NavDropdown.Item>

                <NavDropdown.Item>
                  <Link to="/ListaCategorias" className="link-unstyled">Listar Categoria</Link>
                </NavDropdown.Item>
              </NavDropdown>

              <NavDropdown title="Proveedores" id="proveedores">
                <NavDropdown.Item>
                  <Link to="/Proveedor" className="link-unstyled">Registrar Proveedor</Link>
                </NavDropdown.Item>

                <NavDropdown.Item>
                  <Link to="/ListaProveedores" className="link-unstyled">Listar Proveedores</Link>
                </NavDropdown.Item>
              </NavDropdown>

              <NavDropdown title="Productos" id="productos">
                <NavDropdown.Item>
                  <Link to="/Producto" className="link-unstyled">Registrar Producto</Link>
                </NavDropdown.Item>

                <NavDropdown.Item>
                  <Link to="/ListaProductos" className="link-unstyled">Listar Productos</Link>
                </NavDropdown.Item>
              </NavDropdown>

            </Nav>
          </Navbar.Collapse>
          <Button
            variant="outline-light"
            onClick={toggleMenu}
            className="d-md-none d-block"
            aria-controls="basic-navbar-nav"
            aria-expanded={showMenu ? 'true' : 'false'}
          >
            Menú
          </Button>
        </Container>
      </Navbar>

      {/* Menú lateral (Offcanvas) */}
      <Offcanvas show={showMenu} onHide={toggleMenu} placement="start">
        <Offcanvas.Header closeButton>
          <Offcanvas.Title>Menú</Offcanvas.Title>
        </Offcanvas.Header>
        <Offcanvas.Body>
          <Nav className="flex-column">

            <Nav.Link>
              <Link to="/" className="link-unstyled">Inicio</Link>
            </Nav.Link>

            <NavDropdown title="Clientes" id="clientes">
              <NavDropdown.Item>
                <Link to="/Cliente" className="link-unstyled">Registrar Cliente</Link>
              </NavDropdown.Item>
              <NavDropdown.Item>
                <Link to="/ListaClientes" className="link-unstyled">Listar Clientes</Link>
              </NavDropdown.Item>
            </NavDropdown>

            <NavDropdown title="Empleados" id="empleados">
              <NavDropdown.Item>
                <Link to="/Empleado" className="link-unstyled">Registrar Empleado</Link>
              </NavDropdown.Item>

              <NavDropdown.Item>
                <Link to="/ListaEmpleados" className="link-unstyled">Listar Empleado</Link>
              </NavDropdown.Item>
            </NavDropdown>

            <NavDropdown title="Categorias" id="categorias">
              <NavDropdown.Item>
                <Link to="/Categoria" className="link-unstyled">Registrar Categoria</Link>
              </NavDropdown.Item>

              <NavDropdown.Item>
                <Link to="/ListaCategorias" className="link-unstyled">Listar Categoria</Link>
              </NavDropdown.Item>
            </NavDropdown>

            <NavDropdown title="Proveedores" id="proveedores">
              <NavDropdown.Item>
                <Link to="/Proveedor" className="link-unstyled">Registrar Proveedor</Link>
              </NavDropdown.Item>

              <NavDropdown.Item>
                <Link to="/ListaProveedores" className="link-unstyled">Listar Proveedores</Link>
              </NavDropdown.Item>
            </NavDropdown>

            <NavDropdown title="Productos" id="productos">
              <NavDropdown.Item>
                <Link to="/Producto" className="link-unstyled">Registrar Producto</Link>
              </NavDropdown.Item>

              <NavDropdown.Item>
                <Link to="/ListaProductos" className="link-unstyled">Listar Productos</Link>
              </NavDropdown.Item>
            </NavDropdown>

          </Nav>
        </Offcanvas.Body>
      </Offcanvas>
    </div>
  )
}

export default Header;