var mysql=require('mysql2');
const conn=mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'Lefruitz_shop'
});

conn.connect ((err)=>{
    if(err) throw err;
    console.log('database connection successful');
});

module.exports=conn;