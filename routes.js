'use strict';
module.exports=function(app){
    var myjson=require('./controller')
    app.route('/').get(myjson.index);
    app.route('/product').get(myjson.getProduct);
    app.route('/shopDetails/:id').get(myjson.getShopDetails);
    app.route('/stockDetails/:id').get(myjson.getStockDetails);

    app.route('/postUser').post(myjson.postUser);
    app.route('/moreProduct').get(myjson.getMoreProduct);
    app.route('/register-user').get(myjson.registerUser);
    app.route('/editData').put(myjson.editStock);
}