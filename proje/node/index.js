/* eslint-disable */
const express = require('express')
const mysql = require('mysql')

const bodyParser = require('body-parser');
const cors = require('cors');

// Create connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    // BURAYI KENDİ DATABASİNE GÖRE GÜNCELLE
    password: '',
    database: "proje",
    timezone: 'utc'
});

// MySQL Bağlantı
db.connect(err => {
    if(err){
        throw err;
    }
    console.log('MySQL Conencted Baran')
});
// Port dinleme
const app = express();
app.get('/', (req, res) => {
    res.send(`Hi! Server is listening on port 3000`)
  });

// Çalışan Ekleme işlemi için gerekli
app.get('/ekle/:rol_id/:name/:surname/:cep/:TC/:eposta/:giris_tarih/:dogum/:dogum_yeri/:anne_adi/:baba_adi', (req, res) => {
    let sql = `INSERT INTO kullanıcılar (rol_id, name, surname, cep, TC, eposta, giris_tarih, dogum, dogum_yeri, anne_adi, baba_adi) VALUES 
        ('${req.params.rol_id}', '${req.params.name}', '${req.params.surname}', '${req.params.cep}', '${req.params.TC}', '${req.params.eposta}', '${req.params.giris_tarih}', 
        '${req.params.dogum}', '${req.params.dogum_yeri}', '${req.params.anne_adi}', '${req.params.baba_adi}')`;
    let query = db.query(sql, err => {
        if(err){
            throw err
        }
        res.send("Employee1 Eklendi Baran")
    })
});
// Çalışan veri güncelleme işlemi için gerekli
app.get('/update/:rol_id/:name/:surname/:cep/:TC/:eposta/:giris_tarih/:dogum/:dogum_yeri/:anne_adi/:baba_adi/:id', (req,res) => {
    let sql = 'UPDATE kullanıcılar SET rol_id =?, name =?, surname =?, cep =?, TC =?, eposta =?, giris_tarih =?, dogum =?, dogum_yeri =?, anne_adi =?, baba_adi =?   WHERE id=?';

    let query = db.query(sql, [req.params.rol_id, req.params.name, req.params.surname, req.params.cep, req.params.TC, req.params.eposta, req.params.giris_tarih, req.params.dogum, req.params.dogum_yeri, req.params.anne_adi, req.params.baba_adi, req.params.id], error => {
        if(error){
            throw error
        }
        res.send("Employee 1 Verisi Güncellendi Baran")
    })
});
// Silme işlemi için gerekli
app.get('/delete/:id', (req, res) => {
    let sql = `DELETE FROM kullanıcılar WHERE id = ${req.params.id}`
    let query = db.query(sql, err => {
        if(err){
            throw err
        }
        res.send("Employee 1 Silindi")
    })
})
// Giriş için gerekli
app.get('/giris/:eposta/:sifre', (req, res) => {
    let sql = "SELECT * FROM kullanıcılar WHERE eposta=? AND sifre=?"
    let query = db.query(sql, [req.params.eposta, req.params.sifre], (err, results) => {
        if(err){
            throw err
        }
        console.log(results)
        res.send(results)
    })
    
    
});
// Select Employees
app.get('/getemployee', (req, res) => {
    let sql = "SELECT * FROM kullanıcılar"
    let query = db.query(sql, (err, results) => {
        if(err){
            throw err
        }
       // console.log(results)
        res.send(results)
    })
});
// Select Roles
app.get('/getrol', (req, res) => {
    let sql = "SELECT * FROM roller"
    let query = db.query(sql, (err, results) => {
        if(err){
            throw err
        }
        //console.log(results)
        res.send(results)
    })
});

app.listen("3000", () => {
    console.log("Server Started on Port 3000");
});
/* eslint-disable */