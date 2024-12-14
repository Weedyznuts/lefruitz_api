const express=require('express');
const bodyParser=require('body-parser');
const cors=require('cors');
const authRoutes=require('./routes/authRoutes');
const app=express();

app.use(cors());
var routes=require("./routes");
routes(app);
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use('/api/auth',authRoutes);
app.listen(3000,()=>{
    console.log('server started on port 3000');
});