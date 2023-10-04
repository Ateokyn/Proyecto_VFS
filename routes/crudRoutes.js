const express = require('express');
const router = express.Router();

module.exports = (db) => {

  /* Crud Cliente Inicio */

  // Ruta para leer registros
  router.get('/read', (req, res) => {
    // Utiliza la instancia de la base de datos pasada como parámetro
    const sql = 'SELECT * FROM Cliente';

    // Ejecutar la consulta
    db.query(sql, (err, result) => {
      if (err) {
        console.error('Error al leer registros:', err);
        res.status(500).json({ error: 'Error al leer registros' });
      } else {
        // Devolver los registros en formato JSON como respuesta
        res.status(200).json(result);
      }
    });
  });

  // Ruta para crear un nuevo registro con ID específico
  router.post('/create', (req, res) => {
    // Recibe los datos del nuevo registro desde el cuerpo de la solicitud (req.body)
    const { nombre1_cliente,  nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente } = req.body;

    // Verifica si se proporcionaron los datos necesarios
    if (!nombre1_cliente || !nombre2_cliente || !apellido1_cliente || !apellido2_cliente || !fechanac_cliente || !telefono_cliente || !email_cliente || !contrasena_cliente) {
      return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    // Realiza la consulta SQL para insertar un nuevo registro con ID específico
    const sql = `INSERT INTO Cliente (nombre1_cliente, nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
    const values = [nombre1_cliente,  nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente];

    // Ejecuta la consulta
    db.query(sql, values, (err, result) => {
      if (err) {
        console.error('Error al insertar registro:', err);
        res.status(500).json({ error: 'Error al insertar registro' });
      } else {
        // Devuelve el ID del nuevo registro como respuesta
        res.status(201).json({ message:  'Registro exitoso.' });
      }
    });
  });

    // Ruta para actualizar un registro existente por ID
  router.put('/update/:id_cliente', (req, res) => {
    // Obtén el ID del registro a actualizar desde los parámetros de la URL
    const id_cliente = req.params.id_cliente;

    // Recibe los datos actualizados desde el cuerpo de la solicitud (req.body)
    const { nombre1_cliente,  nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente } = req.body;

    // Verifica si se proporcionaron los datos necesarios
    if (!nombre1_cliente || !nombre2_cliente || !apellido1_cliente || !apellido2_cliente || !fechanac_cliente || !telefono_cliente || !email_cliente || !contrasena_cliente) {
      return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    // Realiza la consulta SQL para actualizar el registro por ID
    const sql = `
      UPDATE Cliente
      SET nombre1_cliente = ?, nombre2_cliente = ?, apellido1_cliente = ?, apellido2_cliente = ?, fechanac_cliente = ?, telefono_cliente = ?, email_cliente = ?, contrasena_cliente = ?
      WHERE id_cliente = ?
    `;

    const values = [nombre1_cliente,  nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente, id_cliente];

    // Ejecuta la consulta
    db.query(sql, values, (err, result) => {
      if (err) {
        console.error('Error al actualizar el registro:', err);
        res.status(500).json({ error: 'Error al actualizar el registro' });
      } else {
        // Devuelve un mensaje de éxito
        res.status(200).json({ message: 'Registro actualizado con éxito' });
      }
    });
  });

  // Ruta para eliminar un registro existente por ID
  router.delete('/delete/:id_cliente', (req, res) => {
    // Obtén el ID del registro a eliminar desde los parámetros de la URL
    const id_cliente = req.params.id_cliente;

    // Realiza la consulta SQL para eliminar el registro por ID
    const sql = 'DELETE FROM Cliente WHERE id_cliente = ?';

    // Ejecuta la consulta
    db.query(sql, [id_cliente], (err, result) => {
      if (err) {
        console.error('Error al eliminar el registro:', err);
        res.status(500).json({ error: 'Error al eliminar el registro' });
      } else {
        // Devuelve un mensaje de éxito
        res.status(200).json({ message: 'Registro eliminado con éxito' });
      }
    });
  });

  /* Crud Cliente Fin */
  return router;
};


