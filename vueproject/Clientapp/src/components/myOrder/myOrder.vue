<template>
    <div id="myOrder">
        <myHead goToBack="1" :headMes="headMes"></myHead>
        <div class="myOrder_c">
            <div class="myOrder_c_t" @touchstart.stop="change">
                <a href="#/myOrder" class='active' data-id="1">已支付</a>
                <a href="#/myOrder" data-id="0">待支付</a>
                <a href="#/myOrder" data-id="2">待发货</a>
                <a href="#/myOrder" data-id="3">待收货</a>
            </div>
            <div class="myOrder_c_b" v-if="Storage.getItem('id')">
                <ul v-for="(item,index) in lists" :key="index" v-if="item.status==status" :data-userid="item.userid" :data-date="item.date">
                    <li><span>SP尚品</span><span @touchstart.stop="deleteInfo">&times;</span></li>
                    <li>
                        <img v-for="val in item.imgurl" :src="val" height="213" width="160" />
                    </li>
                    <li>
                        <span>{{lists.length | totalProduct}}</span>
                        <span>{{item.total | totalPrice}}</span>
                    </li>
                    <li v-text="item.status==1 ? productStatus1 : productStatus2"></li>
                </ul>
            </div>
            <div class="myOrder_c_b" v-if="noNum[status]==0">
                <p>{{statusExplain}}</p>
            </div>
            <div v-show="myShow==true">
                <div class="dk-spinner-mask"></div>
                <div class="dk-spinner dk-spinner-three-bounce">
                    <div class="dk-bounce1"></div>
                    <div class="dk-bounce2"></div>
                    <div class="dk-bounce3"></div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import '../../sass/myOrder.scss';
    import myHead from '../head/head.vue';
    import Vue from 'vue';
    import http from '../../utils/reqAjax.js';
    import '../../sass/spinner.scss';
    Vue.filter('totalProduct',function(n){
        return '共件'+n+'商品';
    })
    Vue.filter('totalPrice',function(n){
        return '实付款￥'+n+'.00';
    })
    export default{
        components:{
            myHead
        },
        data(){
            return{
                headMes:'全部订单',
                products:2,
                price:1980,
                productStatus1:'已支付',
                productStatus2:'未支付',
                statusExplain:'暂无已支付订单',
                Storage:window.sessionStorage,
                lists:[],
                myShow:false,
                status:1,
                noNum:[0,0,0,0]
            }
        },
        methods:{
            change:function(e){
                var lists = document.querySelectorAll('.myOrder_c_t a');
                var len = lists.length;
                for(var i=0;i<len;i++){
                    lists[i].classList.remove('active');
                }
                e.target.classList.add('active');
                this.headMes = e.target.innerText;
                this.statusExplain = '暂无'+e.target.innerText+'订单';
                this.status = e.target.dataset.id;
            },
            deleteInfo:function(e){
                var ul = e.target.parentNode.parentNode;
                ul.parentNode.removeChild(ul);
                var userid= e.target.parentNode.parentNode.dataset.userid;
                var date = e.target.parentNode.parentNode.dataset.date;console.log(userid,date)
                http.post({url:'orderdelect',params:{userid:userid,date:date}}).then(res=>{
                    console.log(res);
                })
            }
        },
        mounted(){
            this.myShow = true;
            http.post({url:'message',params:{userid:this.Storage.getItem('id')}}).then(res=>{
                this.myShow = false;
                var data = res.data;
                if(data=="无订单"){
                }else{
                    var orderStatus = data.results;
                    var orderGoods = data.orderData;
                    var len = orderStatus.length;
                    for(var i=0;i<len;i++){
                        if(orderStatus[i].status==1){
                            this.noNum[1]++;
                        }else if(orderStatus[i].status == 0){
                            this.noNum[0]++;
                        }else if(orderStatus[i].status == 2){
                            this.noNum[2]++;
                        }else if(orderStatus[i].status == 3){
                            this.noNum[3]++;
                        }
                        this.lists[i] = orderStatus[i];
                        var goods = orderGoods[i].data.results
                        var len1 = goods.length;
                        var imgurl = [];
                        for(var j=0;j<len1;j++){
                            imgurl[j] = (goods[j].imgurl);
                        }
                        this.lists[i].imgurl = imgurl;
                        this.lists[i].date = orderStatus[i].date;
                        this.lists[i].total = orderStatus[i].total;
                    }
                }
            })
        }
    }
</script>