const express = require("express")
const mysql = require("mysql2")
const app = express()
const db = mysql.createConnection({
    host: process.env.host,
    user: process.env.user,
    password: process.env.password,
    database: process.env.database
})

app.get("/produtos", (req, res) => {
    db.query("SELECT categorias.nome AS categoria, produtos.* FROM produtos "+
        "INNER JOIN categorias ON produtos.id_categoria = categorias.id", (err, results) => {
        if (err) {
            console.error(err)
            res.status(500).send("Erro ao buscar produtos")
        } else {
            res.json(results)
        }
    })
})

app.get("/categorias", (req, res) => {
    db.query("SELECT * FROM categorias", (err, results) => {
        if (err) {
            console.error(err)
            res.status(500).send("Erro ao buscar categorias")
        } else {
            res.json(results)
        }
    })
})

app.listen(3000, "0.0.0.0", () => {
    console.log("servidor rodando na porta 3000")
})
