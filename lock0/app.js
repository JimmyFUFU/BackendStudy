const express = require('express');
const bodyparser = require('body-parser');
const mysql = require('mysql')

const app = express();
const PORT = 3001
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

function query(sql){
  return new Promise(function(resolve, reject) {
    db.query(sql, (err, result)=>{
      if(err) reject(err)
      else resolve(result)
    })
  });
}

app.get('/product', async (req, res) => {

  await query('START TRANSACTION')
  console.log('START TRANSACTION')

  console.log('START query')
  let result = await query("SELECT * FROM product WHERE title = '西裝' for update")
  console.log('query END')

  await query('COMMIT')
  console.log('commit')

  res.send(result)
})

app.listen(PORT,()=>{
  console.log(`server is on ${PORT}`)
});
