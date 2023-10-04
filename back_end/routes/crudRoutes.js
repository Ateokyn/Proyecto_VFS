const express = require('express');
const router = express.Router();

module.exports = (db) => {

  /* Crud Cliente Inicio */

  // Leer
  router.get('/read_cliente', (req, res) => {

    const sql = 'SELECT * FROM Cliente';

    // Ejecutar la consulta
    db.query(sql, (err, result) => {
      if (err) {
        console.error('Error al leer registros:', err);
        res.status(500).json({ error: 'Error al leer registros' });
      } else {
        res.status(200).json(result);
      }
    });
  });

// Crear
  router.post('/create_cliente', (req, res) => {
    const { nombre1_cliente,  nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente } = req.body;

    if (!nombre1_cliente || !nombre2_cliente || !apellido1_cliente || !apellido2_cliente || !fechanac_cliente || !telefono_cliente || !email_cliente || !contrasena_cliente) {
      return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    const sql = `INSERT INTO Cliente (nombre1_cliente, nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
    const values = [nombre1_cliente,  nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente];

    // Ejecuta la consulta
    db.query(sql, values, (err, result) => { 
      if (err) {
        console.error('Error al insertar registro:', err);
        res.status(500).json({ error: 'Error al insertar registro' });
      } else {
        res.status(201).json({ message:  'Registro exitoso.' });
      }
    });
  });

// Actualizar
  router.put('/update_cliente/:id_cliente', (req, res) => {
    const id_cliente = req.params.id_cliente;

    const { nombre1_cliente,  nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente } = req.body;

    if (!nombre1_cliente || !nombre2_cliente || !apellido1_cliente || !apellido2_cliente || !fechanac_cliente || !telefono_cliente || !email_cliente || !contrasena_cliente) {
      return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

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
        res.status(200).json({ message: 'Registro actualizado con éxito' });
      }
    });
  });

// Eliminar
  router.delete('/delete_cliente/:id_cliente', (req, res) => {
    const id_cliente = req.params.id_cliente;

    const sql = 'DELETE FROM Cliente WHERE id_cliente = ?';

    // Ejecuta la consulta
    db.query(sql, [id_cliente], (err, result) => {
      if (err) {
        console.error('Error al eliminar el registro:', err);
        res.status(500).json({ error: 'Error al eliminar el registro' });
      } else {
        res.status(200).json({ message: 'Registro eliminado con éxito' });
      }
    });
  });

  /* Crud Cliente Fin */

  /* Crud Empleado Inicio */

    // Leer
    router.get('/read_empleado', (req, res) => {

      const sql = 'SELECT * FROM Empleado';
  
      // Ejecutar la consulta
      db.query(sql, (err, result) => {
        if (err) {
          console.error('Error al leer registros:', err);
          res.status(500).json({ error: 'Error al leer registros' });
        } else {
          res.status(200).json(result);
        }
      });
    });
  
  // Crear
    router.post('/create_empleado', (req, res) => {
      const { nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado } = req.body;
  
      if (!nombre1_empleado || !nombre2_empleado || !apellido1_empleado || !apellido2_empleado || !especialidad_empleado || !telefono_empleado || !email_empleado || !contrasena_empleado) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }
  
      const sql = `INSERT INTO Empleado (nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
      const values = [ nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado];
  
      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message:  'Registro exitoso.' });
        }
      });
    });
  
  //Actualizar
    router.put('/update_empleado/:id_empleado', (req, res) => {
      const id_empleado = req.params.id_empleado;
  
      const { nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado } = req.body;
  
      if (!nombre1_empleado || !nombre2_empleado || !apellido1_empleado || !apellido2_empleado || !especialidad_empleado || !telefono_empleado || !email_empleado || !contrasena_empleado) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }
  
      const sql = `
        UPDATE Cliente
        SET nombre1_empleado = ?, nombre2_empleado = ?, apellido1_empleado = ?, apellido2_empleado = ?, especialidad_empleado = ?, telefono_empleado = ?, email_empleado = ?, contrasena_empleado = ?
        WHERE id_empleado = ?
      `;
  
      const values = [nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado, id_empleado];
  
      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al actualizar el registro:', err);
          res.status(500).json({ error: 'Error al actualizar el registro' });
        } else {
          res.status(200).json({ message: 'Registro actualizado con éxito' });
        }
      });
    });
  
  //Eliminar
    router.delete('/delete_empleado/:id_empleado', (req, res) => {
      const id_empleado = req.params.id_empleado;
  
      const sql = 'DELETE FROM Empleado WHERE id_empleado = ?';
  
      // Ejecuta la consulta
      db.query(sql, [id_empleado], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });
  
    /* Crud Empleado Fin */

    /* Crud Producto Inicio */
    
    // Leer
    router.get('/read_producto', (req, res) => {

      const sql = 'SELECT * FROM Producto';
  
      // Ejecutar la consulta
      db.query(sql, (err, result) => {
        if (err) {
          console.error('Error al leer registros:', err);
          res.status(500).json({ error: 'Error al leer registros' });
        } else {
          res.status(200).json(result);
        }
      });
    });
  
  // Crear
    router.post('/create_producto', (req, res) => {
      const { id_proveedor, id_categoria, nombre_producto, foto_descriptiva, precio_venta, precio_compra, cantidad, talla, descripcion, genero } = req.body;
  
      if (!id_proveedor || !id_categoria || !nombre_producto || !foto_descriptiva || !precio_venta || !precio_compra || !cantidad || !talla || !descripcion || !genero) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }
  
      const sql = `INSERT INTO Empleado (nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
      const values = [ nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado];
  
      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message:  'Registro exitoso.' });
        }
      });
    });
  
  //Actualizar
    router.put('/update_empleado/:id_empleado', (req, res) => {
      const id_empleado = req.params.id_empleado;
  
      const { nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado } = req.body;
  
      if (!nombre1_empleado || !nombre2_empleado || !apellido1_empleado || !apellido2_empleado || !especialidad_empleado || !telefono_empleado || !email_empleado || !contrasena_empleado) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }
  
      const sql = `
        UPDATE Cliente
        SET nombre1_empleado = ?, nombre2_empleado = ?, apellido1_empleado = ?, apellido2_empleado = ?, especialidad_empleado = ?, telefono_empleado = ?, email_empleado = ?, contrasena_empleado = ?
        WHERE id_empleado = ?
      `;
  
      const values = [nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado, id_empleado];
  
      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al actualizar el registro:', err);
          res.status(500).json({ error: 'Error al actualizar el registro' });
        } else {
          res.status(200).json({ message: 'Registro actualizado con éxito' });
        }
      });
    });
  
  //Eliminar
    router.delete('/delete_empleado/:id_empleado', (req, res) => {
      const id_empleado = req.params.id_empleado;
  
      const sql = 'DELETE FROM Empleado WHERE id_empleado = ?';
  
      // Ejecuta la consulta
      db.query(sql, [id_empleado], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });
  return router;
};


