var db = require('../db/db');

module.exports = {
    register: function(app){
        // 提交订单，写入数据
        var now = new Date();
        var _now = now.toLocaleString();
       
        app.post('/order', function(req, res){
          
            var userId = req.body.userid;
            var goodsid = req.body.goodsid;
            var total = req.body.total;
            // goodsid = JSON.parse(goodsid);
           console.log("orders=="+userId,goodsid,total);
            var sql = `
                INSERT INTO 
                    orders 
                    (id,userid,status,total,goodsid,date) 
                VALUES

                    (id=id+1,${userId},0,${total},'${goodsid}','${_now}');
            
            `;
            console.log(sql);
            db.insert(sql, function(data){
                // 发送该用户的时间订单信息
                res.send( _now);
            })
        }),
        // 响应用户的订单信息
        app.post('/message', function(req, res){
            var ids = req.body.userid;
           
            var sql = `
                select
                    *
                from 
                    orders
                 where userid=${ids}
            `;
                
            db.select(sql,function(data){
                var results = eval(data.data.results);

                if(results.length == 0){
                    res.send('无订单');
                }else{  
                    var gids= [];
                    var gidsstr= '(';
                    
                    console.log('results='+results);
                    results.forEach(function(item,index){
                        var _item = eval(item.goodsid);
                                    console.log('_item='+_item);
                        _item.forEach(function(items,index){
                            gidsstr += items.gid;
                             gidsstr += ',';
                        })
                        gidsstr = gidsstr.slice(0,-1);
                        gidsstr += ')';
                        gids.push(gidsstr);
                        gidsstr = '(';
                    })
       
                    
                    var orderData = [];
                   
                    gids.forEach(function(item,index){
                        // console.log('item'+item);
                        var idx = index;
                        var sql =`
                            select * from goods where id in ${item};
                        `;
                        db.select(sql,function(data){
                            console.log('data'+data);
                            orderData.push(data);

                            if(idx == gids.length-1){
                                // console.log('orderData'+orderData);
                                res.send({results:results,orderData:orderData});
                            } 
                        })
                    })
                }
            })
        }),
        // 支付页
       app.post('/pay', function(req, res){
            var userid = req.body.userid;
            var status = req.body.status;
            var date = req.body.time;
           
            var sql =`
                select
                    *
                from
                    orders
                where userid = '${userid}';

            `;
            db.select(sql,function(data){
                console.log(data);
            })
            if( status == 1){//确定为该时间编号订单并status为1已付款
                res.send('yes');
            }else if(status == 0){//未支付
                res.send('no');
            }
       }),
         // 删
        app.post('/orderdelect',function(req,res){
            var date = req.body.date; 
            var userid = req.body.userid; 
            console.log(date,userid);
            var sql=`
                delete from orders where 
                date= '${date}' and userid=${userid};
            `;

            db.delete(sql,function(data){
                // console.log(data);
                res.send('yes');
            })
        })
    }
}