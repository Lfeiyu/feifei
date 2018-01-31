var db = require('../db/db')
var jwt=require('jsonwebtoken')

module.exports = {
     register: function(app){
        //验证客户端用户名的输入框失去焦点时而发起的请求，查询注册名是否已存在
        app.get('/htverify', function(req, res){
            var username1 = req.query.username;
            console.log(username1);
            var sql = `
                select
                   *
                from
                    htuser
                where
                    username='${username1}';
               `;
               db.select(sql, function(data){
                   if(data.data.results.length <= 0){
                        res.send('yes');
                   }else{
                        res.send('no');
                   }
              })
        })

        //客户端点击提交后，再一次验证
        app.get('/htreg', function(req, res){
            var username1 = req.query.username;
            var password1 = req.query.password;
            var position = req.query.position;
            var chan; 
            var del; 
            if(position == '经理'){
                chan =1; del=1;
            }else{
                chan =0; del=0;
            }

            var sql = `
                select
                   *
                from
                    htuser
                where
                    username='${username1}'
            `;
            // 再次查询注册名是否已存在
            db.select(sql, function(data){

                if(data.data.results.length == 0 ){
                    // 写入数据
                    var sql = `
                        INSERT INTO htuser (id,username,password,position,chan,del,date) VALUES 
                        (id=id+1,'${username1}', '${password1}','${position}','${chan}','${del}',now());
                    `;
                    db.insert(sql,function(data){
                        console.log(data);
                    })
                    res.send('yes');
                }else{
                    res.send('no');
                }
            })
        })
    
        // 登录页
        app.post('/htlogin',function(req, res){
           
            var username1 = req.body.username;
            var password1 = req.body.password;
            var position = req.body.position;
            
            console.log(username1,password1);
            var sql = `
                select
                   *
                from
                    htuser
                where
                    username='${username1}' and password='${password1}' and position='${position}'
            `;
            // 查询登录账号和密码是否已注册
            db.select(sql, function(data){
                var _data =data.data.results;
              
                if(_data.length <=0){
                    return res.send('no');//未注册
                   
                }else{
                    var results = eval(_data);
                   
                    var _results = results[0].id;
                    _results = JSON.stringify(_results);
                    return res.send(_results);//已注册
                    
                }
                
            })
        })
      
    }


}