const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 5000;

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'vikingo2030',
    database: 'vfs'

});

db.connect((err) =>{
    if(err){
        console.error('Error de conexion a la base de datos', err);
    }else{
        console.error('Conexion exitosa a la base de datos');
    }
});

app.use(cors());

app.listen(port,()=>{
    console.log(`Servidor backend en funcionamiento en el puerto ${port}`);

});

const crudRoutes = require('./routes/crudRoutes.js')(db);
app.use('/crud', crudRoutes);

