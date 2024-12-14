'use strict';
var response=require('./res');
var connection=require('./connection');
const bcrypt=require('bcryptjs');
const jwt=require('jsonwebtoken');
exports.index=function(req,res){
    response.ok('API running well',res);
};

exports.getProduct=function(req,res){
    connection.query('SELECT product.id_product,product.nama_product,product.description_product,product.image,price.selling_price,product.more_item FROM product,price WHERE product.id_product=price.id_product AND product.more_item=FALSE',
    function(error,rows,fields){
        if (error){
            connection.log(error);
        }
         else {
            response.ok(rows,res);
         }
    });
};

exports.getMoreProduct=function(req,res){
    connection.query('SELECT product.id_product,product.nama_product,product.description_product,product.image,price.selling_price,product.more_item FROM product,price WHERE product.id_product=price.id_product AND product.more_item=TRUE',
    function(error,rows,fields){
        if (error){
            connection.log(error);
        }
         else {
            response.ok(rows,res);
         }
    });
};

exports.getShopDetails=function(req,res){
    var id = req.params.id;

    connection.query('SELECT product.id_product,product.nama_product,product.description_product,product.image,price.selling_price FROM product,price WHERE product.id_product=price.id_product AND product.id_product=?',[id],
    function(error,rows,fields){
        if (error){
            connection.log(error);
        }
         else {
            response.ok(rows,res);
         }
    });
};

exports.getStockDetails=function(req,res){
    var id = req.params.id;

    connection.query('SELECT product.id_product,product.nama_product,product.description_product,product.image,price.selling_price, product.stock FROM product,price WHERE product.id_product=price.id_product AND product.id_product=?',[id],
    function(error,rows,fields){
        if (error){
            connection.log(error);
        }
         else {
            response.ok(rows,res);
         }
    });
};

exports.editStock=function(req,res) {
    if (!req.body || req.body.id_product) {
        return res.status(400).json({error:"invalid input"});
    };
    console.log(req.body);
    var id_product = req.body.id_product;
    var nama_product = req.body.nama_product;
    var description_product = req.body.description_product;
    var selling_price = req.body.selling_price;
    var stock = req.body.stock;
    /*var id_product = 1;
    var nama_product = "Wongkan Apple";
    var description_product = "Chinese apple grown in Chernobyl";
    var selling_price = 80;
    var stock = 12;*/


    connection.query ('UPDATE product SET nama_product=?, description_product=?, stock=? WHERE id_product=?',
        [nama_product, description_product, stock, id_product],
        function(error,rows,fields) {
            if (error){
                connection.log(error);
            }
             else {
                response.ok('Data successfully updated',res);
             }
        }
);
}

exports.registerUser=function(req,res){
    const{username,email,password,role}=req.body;
    connection.query('SELECT * FROM user WHERE email=?',[email],
    function(error,rows,fields){
        if (error){
            connection.log(error);
        }
         else {
            response.ok('user is successfully registered',res);
            if (res.values.length > 0) {
                return res.status(400).json({message:'user already exist'})
            }
            else {
                const hashedPassword=bcrypt.hash(password,10);
            }
         }
    });

};

exports.postUser=function(req,res){
    var username=req.body.username;
    var email=req.body.email;
    var password=req.body.password;
    var role=req.body.role;

    connection.query('INSERT INTO User(username,email,password) VALUES(?,?,?,?)',[username,email,password,role],
    function(error,rows,fields){
        if (error){
            connection.log(error);
        }
         else {
            response.ok('user is successfully registered',res);
         }
    });
};

exports.loginUser=function(req,res){

};

exports.getUserProfile=function(req,res){

};