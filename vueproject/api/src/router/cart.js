var db = require('../db/db');
var qs = require('qs')

module.exports ={
	register:function(app){
		// 详情页点击添加购物车，传参数为用户的id，该商品的id和购买数量(如未登录，客户端应跳转到注册页面)
		app.post('/addcar',function(req,res){

			var userId = req.body.userid;
			var gid = req.body.gid;
			var qty = req.body.qty;
			console.log(userId,gid,qty);

	       	var sql = `
		           	SELECT
						*
					FROM	
						car	
					INNER JOIN user on car.userid = user.id 
					where userid = ${userId}
					;
	           `;
	       	db.select(sql, function(data){//查询该用户是否已存在car数据库
	       	
	       		var results ;
	       		if(data.data.results){
		       		 results = eval(data.data.results);
	       		}
		       	var addgoods = {gid:gid,qty:qty};

		       	if(results.length > 0){
		       		//用户存在，获取底下的goodid
			       	var cargoods = results[0].goodsid;
			       	var _cargoods = eval(cargoods);
	
			       	// 遍历商品信息，查询是否该商品已存在
			       	var idx;
			       	var bool = _cargoods.some(function(item,index){
			       		idx = index;
						return item['gid'] == gid;
			       	})

			       	console.log(idx);
			       	//封装
			       	function _car(_cargoods){
			       		var cars = JSON.stringify(_cargoods);
			       		
			       		var sql=`
							UPDATE  car

							SET  goodsid = '${cars}'

							WHERE  userid = ${userId};
						`;
						db.update(sql,function(data){

							console.log(sql,data);
							res.send(_cargoods);
						})
			       	}

			       	if(bool){// 商品id存在，只改变数量qty
						_cargoods[idx].qty = qty;
						_car(_cargoods);

					}else{// 商品不存在，添加进数组
				     	
				     	_cargoods.push(addgoods);
				     	_car(_cargoods);
					}
		       	}else{//car表无该用户
		       		// 写入用户id和新添加的商品信息
		       		var goodsArray = [{gid:gid,qty:qty}];
		       		_goodsArray =JSON.stringify(goodsArray);
		       		var sql =`
						INSERT INTO car (id,userid,goodsid,date) VALUES (id=id+1,${userId}, '${_goodsArray}',now());
		       		`;
		       		db.insert(sql,function(data){
		       			res.send('yes');

		       		})
		       	}
	       	})
		}),

		// 进入购物车页面，响应该用户的购物车商品信息
		app.post('/carts',function(req,res){
			var _userid = req.body.userid;
			
			var sql=`
				select
					* 
				FROM
					car
				where
					userid=${_userid};
				`;

			db.select(sql,function(data){
				
				if(data.data.status == false){
					res.send('购物车无商品');
				}else{

					var results = eval(data.data.results);
					console.log(results);

					if(results.length == 0){
						res.send('购物车无商品');
					}else{

						var cargoods = results[0].goodsid;
						
						if(cargoods == ''){
							res.send('购物车无商品');
						}else{
							var _cargoods = eval(cargoods);

						    // 遍历商品id，以获取相应的商品信息
						    var ids = '(';
		
							 _cargoods.forEach(function(item,index){
						    	ids += item['gid'];//数组
						    	ids+=',';
						    	
						    })
							ids = ids.slice(0,-1);
							ids += ')';
							// res.send(ids);
						   	var sql =`
						   		select * from goods where id in ${ids};
						   	`;
						   	db.select(sql,function(_data){
						   		var das = _data.data.results;
								res.send(das);
						   	})
						}
					}

				}
			})
		})

		//删除
		app.post('/cartsdel',function(req,res){
			var _userid = req.body.userid;
			var gid = req.body.gid;
			console.log(_userid,gid);
			var sql=`
				select
					* 
				FROM
					car
				where
					userid=${_userid};
				`;

			db.select(sql,function(data){
				
					var results = eval(data.data.results);console.log( 'results =='+results);
					var cargoods = results[0].goodsid;//goodsid字符串形式

					console.log('cargoods =='+ cargoods);
					var _cargoods = eval(cargoods);

					    for(var i=0;i<_cargoods.length;i++){
					    	if(_cargoods[i].gid == gid){
					    		_cargoods.splice(i,1);
					    		console.log(_cargoods);

					    		if(_cargoods.length == 0){
					    			var sql =`
										delete from car  WHERE  userid = ${_userid};
								   	`;
								   	db.select(sql,function(_data){
								   		
										res.send('无商品，删除用户购物车信息');
								   	})
					    		}else{

						    		_cargoods = JSON.stringify(_cargoods);
						    		
								   	var sql =`
										UPDATE car SET goodsid= '${_cargoods}' WHERE  userid = ${_userid};
								   	`;
								   	db.select(sql,function(_data){
								   		
										res.send('yes');
								   	})
					    		}
					    	}
					    }
					
				
				
			})
		})
	}
}
// module.exports ={
// 	register:function(app){
// 		// 详情页点击添加购物车，传参数为用户的id，该商品的id和购买数量(如未登录，客户端应跳转到注册页面)
// 		app.post('/addcar',function(req,res){

// 			var userId = req.body.userid;
// 			var gid = req.body.gid;
// 			var qty = req.body.qty;
// 			console.log(userId,gid,qty);

// 	       	var sql = `
// 		           	SELECT
// 						*
// 					FROM	
// 						car	
// 					INNER JOIN user on car.userid = user.id 
// 					where userid = ${userId}
// 					;
// 	           `;
// 	       	db.select(sql, function(data){//查询该用户是否已存在car数据库
	       	
// 	       		var results ;
// 	       		if(data.data.results){
// 		       		 results = eval(data.data.results);
// 	       		}
// 		       	var addgoods = {gid:gid,qty:qty};

// 		       	if(results.length > 0){
// 		       		//用户存在，获取底下的goodid
// 			       	var cargoods = results[0].goodsid;//goodsid字符串形式
// 			       	var _cargoods = eval(cargoods);
	
// 			       	// 遍历商品信息，查询是否该商品已存在
// 			       	var idx;
// 			       	var bool = _cargoods.some(function(item,index){
// 			       		idx = index;
// 						return item['gid'] == gid;
// 			       	})

// 			       	console.log(idx);
// 			       	//封装
// 			       	function _car(_cargoods){
// 			       		var cars = JSON.stringify(_cargoods);
			       		
// 			       		var sql=`
// 							UPDATE  car

// 							SET  goodsid = '${cars}'

// 							WHERE  userid = ${userId};
// 						`;
// 						db.update(sql,function(data){

// 							console.log(sql,data);
// 							res.send(_cargoods);
// 						})
// 			       	}

// 			       	if(bool){// 商品id存在，只改变数量qty
// 						_cargoods[idx].qty = qty;
// 						_car(_cargoods);

// 					}else{// 商品不存在，添加进数组
				     	
// 				     	_cargoods.push(addgoods);
// 				     	_car(_cargoods);
// 					}
// 		       	}else{//car表无该用户
// 		       		// 写入用户id和新添加的商品信息
// 		       		var goodsArray = [{gid:gid,qty:qty}];
// 		       		_goodsArray =JSON.stringify(goodsArray);
// 		       		var sql =`
// 						INSERT INTO car (id,userid,goodsid,date) VALUES (id=id+1,'${userId}', '${_goodsArray}',now());
// 		       		`;
// 		       		db.insert(sql,function(data){
// 		       			res.send('yes');

// 		       		})
// 		       	}
// 	       	})
// 		})

// 		// 进入购物车页面，响应该用户的购物车商品信息
// 		app.post('/carts',function(req,res){
// 			var _userid = req.body.userid;
			
// 			var sql=`
// 				select
// 					* 
// 				FROM
// 					car
// 				where
// 					userid=${_userid};
// 				`;

// 			db.select(sql,function(data){
				
// 				if(data.data.status == false){

// 					res.send('购物车无商品');
// 				}else{

// 					var results = eval(data.data.results);
// 					console.log(results);
// 					var cargoods = results[0].goodsid;//goodsid字符串形式
					
// 				    var _cargoods = eval(cargoods);//转为object
// 				    console.log(_cargoods);
// 				    // res.send(_cargoods);
// 				    // 遍历商品id，以获取相应的商品信息
// 				    var ids = '(';
				
// 					 _cargoods.forEach(function(item,index){
// 				    	ids += item['gid'];//数组
// 				    	ids+=',';
				    	
// 				    })
// 					ids = ids.slice(0,-1);
// 					ids += ')';
// 					// res.send(ids);
// 				   	var sql =`
// 				   		select * from goods where id in ${ids};
// 				   	`;
// 				   	db.select(sql,function(_data){
// 				   		var das = _data.data.results;
// 						res.send(das);
// 				   	})
// 				}
// 			})
// 		})
// 	}
// }