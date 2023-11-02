const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const multer = require('multer');
const path = require('path'); // Importa path

const app = express();
const port = 5000;

// Middleware para analizar el cuerpo de la solicitud en formato JSON
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'KennyTellez',
    password: 'incorrecto',
    database: 'database_vfs'

});

db.connect((err) =>{
    if(err){
        console.error('Error de conexion a la base de datos', err);
    }else{
        console.error('Conexion exitosa a la base de datos');
    }
});

app.use(cors());

// Configura el almacenamiento para los archivos subidos
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'uploads/'); // Carpeta donde se guardarán los archivos
    },
    filename: function (req, file, cb) {
      const extension = path.extname(file.originalname);
      cb(null, Date.now() + extension); // Nombre del archivo se genera con una marca de tiempo para evitar conflictos
    },
  });

// Crea una instancia de multer con la configuración de almacenamiento
const upload = multer({ storage: storage });

// Maneja la carga de archivos
app.post('/uploads', upload.single('imagen'), (req, res) => {
    if (!req.file) {
      return res.status(400).send('No se ha seleccionado ningún archivo.');
    }
    const imageUrl = 'http://localhost:5000/' + req.file.path;
    res.json({ imageUrl });
  });

  app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.listen(port,()=>{
    console.log(`Servidor backend en funcionamiento en el puerto ${port}`);

});

app.use(cors());

const crudRoutes = require('./routes/crudRoutes.js')(db);
app.use('/crud', crudRoutes);

