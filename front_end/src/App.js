import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './pages/Inicio';
import Cliente from './pages/Cliente';
import ListaClientes from './pages/ListaClientes';
import Empleado from './pages/Empleado';
import ListaEmpleados from './pages/ListaEmpleados';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/Cliente" element={<Cliente />} />
        <Route path="/ListaClientes" element={<ListaClientes />} />
        <Route path="/Empleado" element={<Empleado />} />
        <Route path="/ListaEmpleados" element={<ListaEmpleados />} />
      </Routes>
    </Router>
  );
}

export default App;