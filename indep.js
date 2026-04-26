const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());

const db = mysql.createConnection({
    host: "localhost",
  user: "root",
  password: "",
  database: "DatAlodetalle"
});

db.connect(err => {
    if (err) {
        console.error('Error de conexión:', err);
    } else {
        console.log('Conectado a MySQL');
    }
});

app.post('/usuarios', (req, res) => {
    const { nombre, email, password } = req.body;

    const sql = 'INSERT INTO usuarios (nombre, email, password) VALUES (?, ?, ?)';
    db.query(sql, [nombre, email, password], (err, result) => {
        if (err) return res.status(500).send(err);
        res.send({ mensaje: 'Usuario creado', id: result.insertId });
    });
});

app.post('/login', (req, res) => {
    const { email, password } = req.body;

    const sql = 'SELECT * FROM usuarios WHERE email = ? AND password = ?';
    db.query(sql, [email, password], (err, result) => {
        if (err) return res.status(500).send(err);

        if (result.length > 0) {
            res.send({ mensaje: 'Login exitoso', usuario: result[0] });
        } else {
            res.status(401).send({ mensaje: 'Credenciales incorrectas' });
        }
    });
});

app.get('/productos', (req, res) => {
    db.query('SELECT * FROM productos', (err, result) => {
        if (err) return res.status(500).send(err);
        res.send(result);
    });
});

app.post('/productos', (req, res) => {
    const { nombre, precio } = req.body;

    const sql = 'INSERT INTO productos (nombre, precio) VALUES (?, ?)';
    db.query(sql, [nombre, precio], (err, result) => {
        if (err) return res.status(500).send(err);
        res.send({ mensaje: 'Producto creado', id: result.insertId });
    });
});


app.post('/pedidos', (req, res) => {
    const { usuario_id, total } = req.body;

    const sql = 'INSERT INTO pedidos (usuario_id, total, estado) VALUES (?, ?, "pendiente")';
    db.query(sql, [usuario_id, total], (err, result) => {
        if (err) return res.status(500).send(err);
        res.send({ mensaje: 'Pedido creado', id: result.insertId });
    });
});


app.get('/pedidos/:id', (req, res) => {
    const { id } = req.params;

    db.query('SELECT * FROM pedidos WHERE id = ?', [id], (err, result) => {
        if (err) return res.status(500).send(err);

        if (result.length > 0) {
            res.send(result[0]);
        } else {
            res.status(404).send({ mensaje: 'Pedido no encontrado' });
        }
    });
});


app.post('/envios', (req, res) => {
    const { pedido_id, direccion } = req.body;

    const sql = 'INSERT INTO envios (pedido_id, direccion, estado) VALUES (?, ?, "en camino")';
    db.query(sql, [pedido_id, direccion], (err, result) => {
        if (err) return res.status(500).send(err);
        res.send({ mensaje: 'Envío creado', id: result.insertId });
    });
});


app.get('/envios/:id', (req, res) => {
    const { id } = req.params;

    db.query('SELECT * FROM envios WHERE id = ?', [id], (err, result) => {
        if (err) return res.status(500).send(err);

        if (result.length > 0) {
            res.send(result[0]);
        } else {
            res.status(404).send({ mensaje: 'Envío no encontrado' });
        }
    });
});


app.listen(3000, () => {
    console.log('Servidor corriendo en http://localhost:3000');
});
