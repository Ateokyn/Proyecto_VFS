const express = require('express');
const router = express.Router();

module.exports = (db) => {
    router.get('/read', (req, res)=>{
        const sql = 'Select * from Prueba';

        db.query(sql, (err, result) =>{
            if(err){
                console.error('Error al leer registro: ', err);
                res.status(500).json({error: 'Error al leer registro'});
            }else{
                res.status(200).json(result);
            }
        });
    });

    return router;
};

