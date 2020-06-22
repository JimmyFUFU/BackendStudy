const express = require('express');
const bodyparser = require('body-parser');
const mysql = require('mysql')

const app = express();
const PORT = 3000
app.use('/', express.static('public'))

// connect Database
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  // password: '1234',
  database: 'BackendStudy'
})

db.connect((err) => {
  if (err) console.log(err)
  else console.log('Mysql connected')
})

app.get('/', (req, res) => {
  res.send('transacsion')
})

app.listen(PORT,()=>{
  console.log(`server is on ${PORT}`)
});
