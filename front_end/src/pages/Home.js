// Home.js
import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';
import '../styles/App.css'; // Agrega un archivo CSS para estilos específicos de la página de inicio

function Home() {
  return (
    <div>
      <Header />
      <div className="home-container">
        <h1 className="title">Servicios de Belleza y Moda</h1> {/* Título con estilo */}
        <div className="intro-section">
          <p>Descubre un mundo de belleza y elegancia</p>
        </div>
        <div className="image-section">
          <img src="/ruta/a/imagen-principal.jpg" alt="Salón de belleza" />
        </div>
        <div className="services-section">
          <h2>Nuestros Servicios</h2>
          <ul>
            <li>Peluquería y estilismo</li>
            <li>Tratamientos faciales y corporales</li>
            <li>Manicura y pedicura</li>
            <li>Maquillaje profesional</li>
            <li>Productos de belleza y moda</li>
          </ul>
        </div>
        <div className="contact-section">
          <h2>Contacto</h2>
          <p>¡Contáctanos para agendar tu cita!</p>
          <p>Teléfono: [Tu número de contacto]</p>
          <p>Email: [Tu dirección de correo electrónico]</p>
        </div>
      </div>
      <Link to="/about">Ir a Información</Link>
    </div>
  );
}


export default Home;
