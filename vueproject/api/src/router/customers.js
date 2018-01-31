var db = require('../db/db');

module.exports = {
    register: function(app){
    	// 查询
	    app.get('/user',function(req,res){
	    	
	    	var sql =`
				select
					*
				from
					user
	    	`;
	    	db.select(sql,function(data){
	    		res.send(data);
	    	})
	    }),
	    // 增
	    app.post('/userinsert',function(req,res){
	    	// 参数
	    	var username= req.body.username;
	    	var password= req.body.password;
	    	var nickname= req.body.nickname;
	    	var phone= req.body.phone;
	    	var gender= req.body.gender;
			var email= req.body.email;
			var birthday= req.body.birthday;
			var vip= req.body.vip;
			var address= req.body.address;
			var date= req.body.date;

	    	var sql=`
				insert into
					user
					(id,username,password,nickname,phone,gender,
					email,birthday,vip,address,date) 
                VALUES
                    (id=id+1,${username},${password},${nickname},${phone},${gender},
					${email},${birthday},${vip},${address},${date});
	    	`;
	    	db.insert(sql,function(data){
	    		console.log(data);
	    		res.send('yes');
	    	})

	    }),
	    // 删
	    app.post('/userdel',function(req,res){
	    	var userid = req.body.id; 

	    	var	sql=`
				delete from user where
					id= '${userid}';
	    	`;

	    	db.delete(sql,function(data){
	    		console.log(data);
	    		res.send('yes');
	    	})

	    })

    }
}