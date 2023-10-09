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
    const { nombre1_cliente, nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente } = req.body;

    if (!nombre1_cliente || !nombre2_cliente || !apellido1_cliente || !apellido2_cliente || !fechanac_cliente || !telefono_cliente || !email_cliente || !contrasena_cliente) {
      return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    const sql = `INSERT INTO Cliente (nombre1_cliente, nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
    const values = [nombre1_cliente, nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente];

    // Ejecuta la consulta
    db.query(sql, values, (err, result) => {
      if (err) {
        console.error('Error al insertar registro:', err);
        res.status(500).json({ error: 'Error al insertar registro' });
      } else {
        res.status(201).json({ message: 'Registro exitoso.' });
      }
    });
  });

  // Actualizar
  router.put('/update_cliente/:id_cliente', (req, res) => {
    const id_cliente = req.params.id_cliente;

    const { nombre1_cliente, nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente } = req.body;

    if (!nombre1_cliente || !nombre2_cliente || !apellido1_cliente || !apellido2_cliente || !fechanac_cliente || !telefono_cliente || !email_cliente || !contrasena_cliente) {
      return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    const sql = `
      UPDATE Cliente
      SET nombre1_cliente = ?, nombre2_cliente = ?, apellido1_cliente = ?, apellido2_cliente = ?, fechanac_cliente = ?, telefono_cliente = ?, email_cliente = ?, contrasena_cliente = ?
      WHERE id_cliente = ?
    `;

    const values = [nombre1_cliente, nombre2_cliente, apellido1_cliente, apellido2_cliente, fechanac_cliente, telefono_cliente, email_cliente, contrasena_cliente, id_cliente];

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
    const values = [nombre1_empleado, nombre2_empleado, apellido1_empleado, apellido2_empleado, especialidad_empleado, telefono_empleado, email_empleado, contrasena_empleado];

    // Ejecuta la consulta
    db.query(sql, values, (err, result) => {
      if (err) {
        console.error('Error al insertar registro:', err);
        res.status(500).json({ error: 'Error al insertar registro' });
      } else {
        res.status(201).json({ message: 'Registro exitoso.' });
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
        UPDATE Empleado
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

    if (!id_proveedor || !id_categoria || !nombre_producto || !precio_venta || !precio_compra || !cantidad || !talla || !descripcion || !genero) {
      return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

      const sql = `INSERT INTO Producto (id_proveedor, id_categoria, nombre_producto, foto_descriptiva, precio_venta, precio_compra, cantidad, talla, descripcion, genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
      const values = [id_proveedor, id_categoria, nombre_producto, foto_descriptiva, precio_venta, precio_compra, cantidad, talla, descripcion, genero];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_producto/:id_producto', (req, res) => {
      const id_producto = req.params.id_producto;

      const { id_proveedor, id_categoria, nombre_producto, foto_descriptiva, precio_venta, precio_compra, cantidad, talla, descripcion, genero } = req.body;

      if (!id_proveedor || !id_categoria || !nombre_producto || !precio_venta || !precio_compra || !cantidad || !talla || !descripcion || !genero) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Producto
        SET id_proveedor = ?, id_categoria = ?, nombre_producto = ?, foto_descriptiva = ?, precio_venta = ?, precio_compra = ?, cantidad = ?, talla = ?, descripcion = ?, genero = ?
        WHERE id_producto = ?
      `;

      const values = [id_proveedor, id_categoria, nombre_producto, foto_descriptiva, precio_venta, precio_compra, cantidad, talla, descripcion, genero, id_producto];

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
    router.delete('/delete_producto/:id_producto', (req, res) => {
      const id_producto = req.params.id_producto;

      const sql = 'DELETE FROM Producto WHERE id_producto = ?';

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

    /* Crud Producto Fin */

    /* Crud Categoria Inicio */

    // Leer
    router.get('/read_categoria', (req, res) => {

      const sql = 'SELECT * FROM Categoria';

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
    router.post('/create_categoria', (req, res) => {
      const { nombre_categoria, descripcion_categoria } = req.body;

      if (!nombre_categoria || !descripcion_categoria) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO Categoria (nombre_categoria, descripcion_categoria) VALUES (?, ?)`;
      const values = [nombre_categoria, descripcion_categoria];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_categoria/:id_categoria', (req, res) => {
      const id_categoria = req.params.id_categoria;

      const { nombre_categoria, descripcion_categoria } = req.body;

      if (!nombre_categoria || !descripcion_categoria) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Categoria
        SET nombre_categoria = ?, descripcion_categoria = ?
        WHERE id_categoria = ?
      `;

      const values = [nombre_categoria, descripcion_categoria, id_categoria];

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
    router.delete('/delete_categoria/:id_categoria', (req, res) => {
      const id_categoria = req.params.id_categoria;

      const sql = 'DELETE FROM Categoria WHERE id_categoria = ?';

      // Ejecuta la consulta
      db.query(sql, [id_categoria], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud Categoria Fin */

    /* Crud Cita Inicio */

    // Leer
    router.get('/read_cita', (req, res) => {

      const sql = 'SELECT * FROM Cita';

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
    router.post('/create_cita', (req, res) => {
      const { id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario } = req.body;

      if (!id_cliente || !id_empleado || !tipo_servicio || !fecha_cita || !hora_cita || !estado_cita || !comentario) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO Cita (id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario) VALUES (?, ?, ?, ?, ? ,?)`;
      const values = [id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_cita/:id_cita', (req, res) => {
      const id_cita = req.params.id_cita;

      const { id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario } = req.body;

      if (!id_cliente || !id_empleado || !tipo_servicio || !fecha_cita || !hora_cita || !estado_cita || !comentario) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Cita
        SET id_cliente = ?, id_empleado = ?, tipo_servicio = ?, fecha_cita = ?, hora_cita = ?, estado_cita = ?, comentario = ?
        WHERE id_cita = ?
      `;

      const values = [id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario, id_cita];

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
    router.delete('/delete_cita/:id_cita', (req, res) => {
      const id_cita = req.params.id_cita;

      const sql = 'DELETE FROM Cita WHERE id_cita = ?';

      // Ejecuta la consulta
      db.query(sql, [id_cita], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud Cita Fin */

    /* Crud Compra Inicio */

    // Leer
    router.get('/read_compra', (req, res) => {

      const sql = 'SELECT * FROM Compra';

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
    router.post('/create_compra', (req, res) => {
      const { id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra } = req.body;

      if (!id_cliente || !id_tipo_pago || !id_entrega || !fecha_compra || !hora_compra) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO Compra (id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra) VALUES (?, ?, ?, ?, ?)`;
      const values = [id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_compra/:id_compra', (req, res) => {
      const id_compra = req.params.id_compra;

      const { id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra } = req.body;

      if (!id_cliente || !id_tipo_pago || !id_entrega || !fecha_compra || !hora_compra) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Compra
        SET id_cliente = ?, id_tipo_pago = ?, id_entrega = ?, fecha_compra = ?, hora_compra = ?
        WHERE id_compra = ?
      `;

      const values = [id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra, id_compra];

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
    router.delete('/delete_compra/:id_compra', (req, res) => {
      const id_compra = req.params.id_compra;

      const sql = 'DELETE FROM Compra WHERE id_compra = ?';

      // Ejecuta la consulta
      db.query(sql, [id_compra], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud Compra Fin */

    /* Crud Tipo Pago Inicio */

    // Leer
    router.get('/read_tipo_pago', (req, res) => {

      const sql = 'SELECT * FROM Tipo_pago';

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
    router.post('/create_tipo_pago', (req, res) => {
      const { tipo } = req.body;

      if (!tipo) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO Tipo_pago (tipo) VALUES (?)`;
      const values = [tipo];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_tipo_pago/:id_tipo_pago', (req, res) => {
      const id_tipo_pago = req.params.id_tipo_pago;

      const { tipo } = req.body;

      if (!tipo) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Tipo_pago
        SET tipo = ?
        WHERE id_tipo_pago = ?
      `;

      const values = [tipo, id_tipo_pago];

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
    router.delete('/delete_tipo_pago/:id_tipo_pago', (req, res) => {
      const id_tipo_pago = req.params.id_tipo_pago;

      const sql = 'DELETE FROM Tipo_pago WHERE id_tipo_pago = ?';

      // Ejecuta la consulta
      db.query(sql, [id_tipo_pago], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud Tipo pago Fin */

    /* Crud Tipo entrega Inicio */

    // Leer
    router.get('/read_tipo_entrega', (req, res) => {

      const sql = 'SELECT * FROM Tipo_entrega';

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
    router.post('/create_tipo_entrega', (req, res) => {
      const { id_empleado, tipo_entrega, estado_entrega, direccion_entrega } = req.body;

      if (!id_empleado || !tipo_entrega || !estado_entrega || !direccion_entrega) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO Tipo_entrega (id_empleado, tipo_entrega, estado_entrega, direccion_entrega) VALUES (?,?,?,?)`;
      const values = [id_empleado, tipo_entrega, estado_entrega, direccion_entrega];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_tipo_entrega/:id_tipo_entrega', (req, res) => {
      const id_tipo_entrega = req.params.id_tipo_entrega;

      const { id_empleado, tipo_entrega, estado_entrega, direccion_entrega } = req.body;

      if (!id_empleado || !tipo_entrega || !estado_entrega || !direccion_entrega) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Tipo_entrega
        SET id_empleado = ?, tipo_entrega = ?, estado_entrega = ?, direccion_entrega = ?
        WHERE id_entrega = ?
      `;

      const values = [id_empleado, tipo_entrega, estado_entrega, direccion_entrega, id_tipo_entrega];

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
    router.delete('/delete_tipo_entrega/:id_tipo_entrega', (req, res) => {
      const id_tipo_entrega = req.params.id_tipo_entrega;

      const sql = 'DELETE FROM Tipo_entrega WHERE id_tipo_entrega = ?';

      // Ejecuta la consulta
      db.query(sql, [id_tipo_entrega], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud Tipo entrega Fin */

    /* Crud Detalle compra Inicio */

    // Leer
    router.get('/read_detalle_compra', (req, res) => {

      const sql = 'SELECT * FROM Detalle_compra';

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
    router.post('/create_detalle_compra', (req, res) => {
      const { id_compra, id_producto, cantidad_compra } = req.body;

      if (!id_compra || !id_producto || !cantidad_compra) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO Detalle_compra (id_compra, id_producto, cantidad_compra) VALUES (?,?,?)`;
      const values = [id_compra, id_producto, cantidad_compra];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_detalle_compra/:id_detalle_compra', (req, res) => {
      const id_detalle_compra = req.params.id_detalle_compra;

      const { id_compra, id_producto, cantidad_compra } = req.body;

      if (!id_compra || !id_producto || !cantidad_compra) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Detalle_compra
        SET id_compra = ?, id_producto = ?, cantidad_compra = ?
        WHERE id_detalle_c = ?
      `;

      const values = [id_compra, id_producto, cantidad_compra, id_detalle_compra];

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
    router.delete('/delete_detalle_compra/:id_detalle_compra', (req, res) => {
      const id_detalle_compra = req.params.id_detalle_compra;

      const sql = 'DELETE FROM Detalle_compra WHERE id_detalle_compra = ?';

      // Ejecuta la consulta
      db.query(sql, [id_detalle_compra], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud Detalle_compra Fin */

    /* Crud Reseñas Inicio */

    // Leer
    router.get('/read_resena', (req, res) => {

      const sql = 'SELECT * FROM Resena';

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
    router.post('/create_resena', (req, res) => {
      const { id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprovacion } = req.body;

      if (!id_cliente || !id_producto || !calificacion || !comentario || !fecha_publicacion || !aprovacion) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO Resena (id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprovacion) VALUES (?,?,?,?,?,?)`;
      const values = [id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprovacion];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_resena/:id_resena', (req, res) => {
      const id_resena = req.params.id_resena;

      const { id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprovacion } = req.body;

      if (!id_cliente || !id_producto || !calificacion || !comentario || !fecha_publicacion || !aprovacion) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Detalle_compra
        SET id_cliente = ?, id_producto = ?, calificacion = ?, comentario = ?, fecha_publicacion = ?, aprovacion = ?
        WHERE id_resena = ?
      `;

      const values = [id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprovacion, id_resena];

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
    router.delete('/delete_resena/:id_resena', (req, res) => {
      const id_resena = req.params.id_resena;

      const sql = 'DELETE FROM Resena WHERE id_resena = ?';

      // Ejecuta la consulta
      db.query(sql, [id_resena], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud Reseña Fin */


    /* Crud ListaDeseo Inicio */

    // Leer
    router.get('/read_lista_deseo', (req, res) => {

      const sql = 'SELECT * FROM ListaDeseos';

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
    router.post('/create_lista_deseo', (req, res) => {
      const { id_cliente, fecha_creacion } = req.body;

      if (!id_cliente || !fecha_creacion) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO ListaDeseos (id_cliente, fecha_creacion) VALUES (?,?)`;
      const values = [id_cliente, fecha_creacion];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_lista_deseo/:id_deseo', (req, res) => {
      const id_deseo = req.params.id_deseo;

      const { id_cliente, fecha_creacion } = req.body;

      if (!id_cliente || !fecha_creacion) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE ListaDeseos
        SET id_cliente = ?, fecha_creacion = ?
        WHERE id_deseo = ?
      `;

      const values = [id_cliente, fecha_creacion, id_deseo];

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
    router.delete('/delete_lista_deseo/:id_lista_deseo', (req, res) => {
      const id_deseo = req.params.id_deseo;

      const sql = 'DELETE FROM ListaDeseos WHERE id_deseo = ?';

      // Ejecuta la consulta
      db.query(sql, [id_deseo], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud ListaDeseos Fin */

    /* Crud ListaDetalle Inicio */

    // Leer
    router.get('/read_lista_detalle', (req, res) => {

      const sql = 'SELECT * FROM ListaDetalle';

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
    router.post('/create_lista_detalle', (req, res) => {
      const { id_producto, id_deseo } = req.body;

      if (!id_producto || !id_deseo) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO ListaDetalle (id_producto, id_deseo) VALUES (?,?)`;
      const values = [id_producto, id_deseo];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_lista_detalle/:id_lista_detalle', (req, res) => {
      const id_lista_detalle = req.params.id_lista_detalle;

      const { id_producto, id_deseo } = req.body;

      if (!id_producto || !id_deseo) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE ListaDetalle
        SET id_producto = ?, id_deseo = ?
        WHERE id_listadetalle = ?
      `;

      const values = [id_producto, id_deseo, id_lista_detalle];

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
    router.delete('/delete_lista_detalle/:id_lista_detalle', (req, res) => {
      const id_lista_detalle = req.params.id_lista_detalle;

      const sql = 'DELETE FROM ListaDetalle WHERE id_listadetalle = ?';

      // Ejecuta la consulta
      db.query(sql, [id_lista_detalle], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud ListaDetalle Fin */

    /* Crud Proveedor Inicio */

    // Leer
    router.get('/read_proveedor', (req, res) => {

      const sql = 'SELECT * FROM Proveedor';

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
    router.post('/create_proveedor', (req, res) => {
      const { empresa_proveedor, direccion_proveedor, ciudad_proveedor } = req.body;

      if (!empresa_proveedor || !direccion_proveedor || !ciudad_proveedor) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `INSERT INTO Proveedor (empresa_proveedor, direccion_proveedor, ciudad_proveedor) VALUES (?,?,?)`;
      const values = [empresa_proveedor, direccion_proveedor, ciudad_proveedor];

      // Ejecuta la consulta
      db.query(sql, values, (err, result) => {
        if (err) {
          console.error('Error al insertar registro:', err);
          res.status(500).json({ error: 'Error al insertar registro' });
        } else {
          res.status(201).json({ message: 'Registro exitoso.' });
        }
      });
    });

    //Actualizar
    router.put('/update_proveedor/:id_proveedor', (req, res) => {
      const id_proveedor = req.params.id_proveedor;

      const { empresa_proveedor, direccion_proveedor, ciudad_proveedor } = req.body;

      if (!empresa_proveedor || !direccion_proveedor || !ciudad_proveedor) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
      }

      const sql = `
        UPDATE Proveedor
        SET empresa_proveedor = ?, direccion_proveedor = ?, ciudad_proveedor = ?
        WHERE id_proveedor = ?
      `;

      const values = [empresa_proveedor, direccion_proveedor, ciudad_proveedor, id_proveedor];

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
    router.delete('/delete_proveedor/:id_proveedor', (req, res) => {
      const id_proveedor = req.params.id_proveedor;

      const sql = 'DELETE FROM Proveedor WHERE id_proveedor = ?';

      // Ejecuta la consulta
      db.query(sql, [id_proveedor], (err, result) => {
        if (err) {
          console.error('Error al eliminar el registro:', err);
          res.status(500).json({ error: 'Error al eliminar el registro' });
        } else {
          res.status(200).json({ message: 'Registro eliminado con éxito' });
        }
      });
    });

    /* Crud Proveedor Fin */

    return router;
  };


