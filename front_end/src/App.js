import React, { useState } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './pages/Inicio';
import Cliente from './pages/Cliente';
import ListaClientes from './pages/ListaClientes';
import Empleado from './pages/Empleado';
import ListaEmpleados from './pages/ListaEmpleados';
import Categoria from './pages/Categoria';
import ListaCategorias from './pages/ListaCategorias';
import Proveedor from './pages/Proveedor';
import ListaProveedores from './pages/ListaProveedores';
import Producto from './pages/Producto';
import ListaProductos from './pages/ListaProductos';

function App() {

  return (
    <Router>
      <Routes>
        <Route path="/home" element={<Home />} />
        <Route path="/" element={<Home />} />
        <Route path="/Cliente" element={<Cliente />} />
        <Route path="/ListaClientes" element={<ListaClientes />} />
        <Route path="/Empleado" element={<Empleado />} />
        <Route path="/ListaEmpleados" element={<ListaEmpleados />} />
        <Route path="/Categoria" element={<Categoria />} />
        <Route path="/ListaCategorias" element={<ListaCategorias />} />
        <Route path="/Proveedor" element={<Proveedor />} />
        <Route path="/ListaProveedores" element={<ListaProveedores />} />
        <Route path="/Producto" element={<Producto />} />
        <Route path="/ListaProductos" element={<ListaProductos />} />
      </Routes>
    </Router>
  );
}

export default App;