  //权限管理，获取
 app.get('/htmanage', function(req, res){
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