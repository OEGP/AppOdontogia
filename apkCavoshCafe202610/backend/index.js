const express = require("express");
const cors = require("cors");
const mysql = require("mysql2");

const app = express();


app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true })); 

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "appDB"
});

db.connect(err => {
  if (err) {
    console.log("❌ Error conexión:", err);
  } else {
    console.log("✅ Conectado a MySQL");
  }
});


app.post("/register", (req, res) => {
  const { nombre, correo, password } = req.body;

  if (!nombre || !correo || !password) {
    return res.status(400).json({ message: "Faltan datos" });
  }

  const sql = "INSERT INTO usuarios (nombre, correo, password) VALUES (?, ?, ?)";

  db.query(sql, [nombre, correo, password], (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send(err);
    }

    res.json({ message: "Registrado correctamente" });
  });
});


app.post("/login", (req, res) => {
  const { correo, password } = req.body;

  console.log("LOGIN DATA:", req.body); // 🔍 DEBUG

  if (!correo || !password) {
    return res.status(400).json({ message: "Faltan datos" });
  }

  const sql = "SELECT * FROM usuarios WHERE correo = ? AND password = ?";

  db.query(sql, [correo, password], (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send(err);
    }

    if (result.length > 0) {
      res.json({
        id: result[0].id,
        nombre: result[0].nombre,
        correo: result[0].correo
      });
    } else {
      res.status(401).json({ message: "Credenciales incorrectas" });
    }
  });
});


app.get("/user/:id", (req, res) => {
  const id = req.params.id;

  db.query(
    "SELECT nombre, correo FROM usuarios WHERE id = ?",
    [id],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send(err);
      }

      if (result.length > 0) {
        res.json(result[0]);
      } else {
        res.status(404).json({ message: "Usuario no encontrado" });
      }
    }
  );
});


app.post("/update-password", (req, res) => {
  const { id, password } = req.body;

  if (!id || !password) {
    return res.status(400).json({ message: "Faltan datos" });
  }

  db.query(
    "UPDATE usuarios SET password = ? WHERE id = ?",
    [password, id],
    (err) => {
      if (err) {
        console.log(err);
        return res.status(500).send(err);
      }

      res.json({ message: "Contraseña actualizada" });
    }
  );
});


app.get("/productos", (req, res) => {
  db.query("SELECT * FROM productos", (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send(err);
    }

    res.json(result);
  });
});


app.listen(3000, () => {
  console.log("🚀 Servidor corriendo en http://localhost:3000");
});
