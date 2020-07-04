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
  // let result = await query("SELECT * FROM product WHERE id = 1 lock in share mode")
  // await query("update product set title = '西裝123' WHERE title = '西裝'")
  console.log('query END waiting for commit........')

  setTimeout(async ()=>{
    await query('COMMIT')
    console.log('commit')
    res.send(result)
  },10000)

})

app.listen(PORT,()=>{
  console.log(`server is on ${PORT}`)
});
