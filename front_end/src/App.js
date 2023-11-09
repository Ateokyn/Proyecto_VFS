import React, { useState } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './pages/Home';
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
import Resena from './pages/Resena';
import ListaResenas from './pages/ListaResenas';
import Cita from './pages/Cita';
import ListaCitas from './pages/ListaCitas';
import Tipo_pago from './pages/Tipo_pago';
import ListaTipoPago from './pages/ListaTipoPagos';
import Tipo_entrega from './pages/Tipo_entrega';
import ListaTipoEntrega from './pages/ListaTipoEntrega';
import Estadisticas from './pages/Estadisticas';
import Catalogo from './pages/Catalogo';
import Login from './pages/Login';
import Venta from './pages/Venta';

function App() {

  const [userRol, setUserRol] = useState('');

  return (
    <Router>
      <Routes>
        <Route path="/" element={<Login setRol={setUserRol} />} />
        <Route path="/Home" element={<Home rol={userRol} />} />
        <Route path="/Catalogo" element={<Catalogo rol={userRol} />} />
        <Route path="/Cliente" element={<Cliente rol={userRol} />} />
        <Route path="/ListaClientes" element={<ListaClientes rol={userRol} />} />
        <Route path="/Empleado" element={<Empleado rol={userRol} />} />
        <Route path="/ListaEmpleados" element={<ListaEmpleados rol={userRol} />} />
        <Route path="/Categoria" element={<Categoria rol={userRol} />} />
        <Route path="/ListaCategorias" element={<ListaCategorias rol={userRol} />} />
        <Route path="/Proveedor" element={<Proveedor rol={userRol} />} />
        <Route path="/ListaProveedores" element={<ListaProveedores rol={userRol} />} />
        <Route path="/Producto" element={<Producto rol={userRol} />} />
        <Route path="/ListaProductos" element={<ListaProductos rol={userRol} />} />
        <Route path="/Resena" element={<Resena rol={userRol} />} />
        <Route path="/ListaResenas" element={<ListaResenas rol={userRol} />} />
        <Route path="/Cita" element={<Cita rol={userRol} />} />
        <Route path="/ListaCitas" element={<ListaCitas rol={userRol} />} />
        <Route path="/Tipo_pago" element={<Tipo_pago rol={userRol} />} />
        <Route path="/ListaTipoPago" element={<ListaTipoPago rol={userRol} />} />
        <Route path="/Tipo_entrega" element={<Tipo_entrega rol={userRol} />} />
        <Route path="/ListaTipoEntrega" element={<ListaTipoEntrega rol={userRol} />} />
        <Route path="/Estadisticas" element={<Estadisticas rol={userRol} />} />
        <Route path="/Venta" element={<Venta rol={userRol} />} />
      </Routes>
    </Router>
  );
}

export default App;