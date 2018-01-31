var db = require('../db/db')

module.exports = {
    register: function(app){
        app.get('/gethtlist', function(req, res){
            var keyword = req.query.keyword;
          
            var sql = `
            select
               *
            from
                goods
                where type = '${keyword}'
            `;
            db.select(sql, function(data){
                res.send(data);
            })
        })
        app.get('/gethtdetails',function(req, res){
            var goodid = req.query.goodid;
            console.log(req.query,req.query.goodid)
            var sql = `
            select
               *
            from
                goods
                where id = '${goodid}'
            `;
            db.select(sql, function(data){
                res.send(data);
            })
        })
        /*------------分页-------------------*/
        app.get('/gethtcommodity',function(req,res){
            var keyword = req.query.keyword;
            var limit = req.query.limit * 1;
            var page = req.query.page * 1;
            console.log(limit,page)
            var sql = `
                select
                    SQL_CALC_FOUND_ROWS
                    *
                from
                    goods
                    where type = '${keyword}'
                    limit ${(page - 1) * limit}, ${limit};
                    select FOUND_ROWS() as rowscount;
            `;
            db.select(sql, function(data){
                console.log(data)
                res.send(data);
            })
        })
        /*------------------搜索-------------------*/
        app.get('/htseek',function(req,res){
            var seekkeyword = req.query.keyword;
            console.log(seekkeyword)
            var limit = req.query.limit * 1;
            var page = req.query.page * 1;
            var sql = `
                SELECT
                    SQL_CALC_FOUND_ROWS
                    * 
                    FROM
                goods WHERE title LIKE  '%${seekkeyword}%' 
                limit ${(page - 1) * limit}, ${limit};
                select FOUND_ROWS() as rowscount;
                `;
            console.log(sql)
            db.select(sql, function(data){
                // console.log(data)
                res.send(data);
            })
        })
        /*------------------所有---------------*/
        app.get('/gethtall',function(req,res){
            var seekkeyword = req.query.keyword;
            console.log(seekkeyword)
            var limit = req.query.limit * 1;
            var page = req.query.page * 1;
            var sql = `
                SELECT
                    SQL_CALC_FOUND_ROWS
                    * 
                    FROM
                goods
                limit ${(page - 1) * limit}, ${limit};
                select FOUND_ROWS() as rowscount;
                `;
            db.select(sql, function(data){
                // console.log(data)
                res.send(data);
            })
        })

        // 响应点击修改时id的信息
         app.get('/htgoodsselect',function(req,res){
            var goodsid = req.query.goodsid;

            var sql =`
                select * from goods where id=${goodsid}
            `;
            db.select(sql,function(data){
                res.send(data);
            })

         })

        /*--------------------删-------------------*/
         app.get('/htgoodsdel',function(req,res){
            var goodsid = req.query.goodsid;
            // console.log(goodsid);
            var sql =`
                delete from goods where id=${goodsid}
            `;
            db.delete(sql,function(data){
                res.send(data);
            })

         })

         /*-----------------改------------------*/
        app.post('/htgoodsupdate',function(req,res){
            var urls = req.body;
            console.log(urls);
            var id = req.body.id;
            var brand = req.body.brand;
            var title = req.body.title;
            var imgurl = req.body.imgurl;
            var price = req.body.price;
            var saleprice = req.body.saleprice;
            var color = req.body.color;
            var qty = req.body.qty;
            var saleqty = req.body.saleqty;
            var size = req.body.size;
            var type = req.body.type;
            var surplus = req.body.surplus;
            var date = req.body.date;
            
            var sql =`
                UPDATE goods SET 
                brand= '${brand}',
                title='${title}', 
                imgurl='${imgurl}',
                price='${price}',
                saleprice= '${saleprice}',
                color='${color}',
                qty=${qty},
                saleqty= '${saleqty}', 
                size='${size}',
                type='${type}',
                surplus= '${surplus}', 
                date ='${date}'
                 WHERE id = ${id};
            `;
            db.update(sql,function(data){
                res.send('yes');
            })
        })
        /*-------------------增------------------*/
         app.post('/htgoodsadd',function(req,res){
            var urls = req.body;
            console.log(urls);
            var brand = req.body.brand;
            var title = req.body.title;
            var price = req.body.price;
            var saleprice = req.body.saleprice;
            var color = req.body.color;
            var qty = req.body.qty;
            var size = req.body.size;
            var type = req.body.type;
            var surplus = req.body.surplus;
            var date = req.body.date;
           
            var sql =`
                insert into
                    goods
                    (brand,title,price,saleprice,color,
                    qty,size,type,surplus,date) 
                VALUES
                    ('${brand}','${title}', '${price}',
                '${saleprice}','${color}', ${qty}, '${size}', 
                '${type}', '${surplus}', '${date}');      
            `;
            console.log(sql);
            db.insert(sql,function(data){

                res.send(data);
            })
        })
    }
}