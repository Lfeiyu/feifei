var db = require('../db/db');

module.exports = {
    register: function(app){
    	// 加载页面获取数据
	    	app.get('/htorder',function(req,res){
	    	var limit = req.query.limit * 1;
            var page = req.query.page * 1;
	    	var sql =`
				select
					SQL_CALC_FOUND_ROWS
					*
				from
					orders
				inner join user on user.id = orders.userid
				limit ${(page - 1) * limit}, ${limit};
                select FOUND_ROWS() as rowscount;
	    	`;
	    	db.select(sql,function(data){
	    		var results = eval(data.data.results);
	    		res.send(results);
	    	})
	    }),


	    // 查询
	    app.post('/orderselect',function(req,res){
	    	var str = req.body.str;

	    	var sql=`
				select * from orders where title like '%${str}%';
	    	`;

	    })
	    // 增
	    app.post('/orderinsert',function(req,res){
	    	// 参数
	    	var userid = req.body.userid;
	    	var status = req.body.status;
	    	var total = req.body.total;
	    	var goodsid = req.body.goodsid;
	    	var date = new Date();
	    	date = date.date.toLocaleString();
	    	var sql=`
				insert into
					orders
					(id,userid,status,total,goodsid,date) 
                VALUES
                    (id=id+1,${userid},${status},${total},
                    ${goodsid},${date};
	    	`;
	    	db.insert(sql,function(data){
	    		console.log(data);
	    		res.send('yes');
	    	})

	    }),
	    // 删
	    app.post('/orderdel',function(req,res){
	    	var userid = req.body.id; 

	    	var	sql=`
				delete from orders where id= ${userid};
	    	`;

	    	db.delete(sql,function(data){
	    		console.log(data);
	    		res.send('yes');
	    	})
	    }),
	    // 改
	     app.post('/orderupdate',function(req,res){
	    	var id = req.body.id;
	    	var userid = req.body.userid;
	    	var status = req.body.status;
	    	var total = req.body.total;
	    	var goodsid = req.body.goodsid;
	    	var date = req.body.date;

	    	// 所改变的参数
	    	var	sql=`
	    		UPDATE orders SET userid= ${userid}, status=${status}, total=${total},
				goodsid='${goodsid}', date =${date} WHERE id = ${id};
	    	`;

	    	db.delete(sql,function(data){
	    		console.log(data);
	    		res.send('yes');
	    	})
	    })


    }
}