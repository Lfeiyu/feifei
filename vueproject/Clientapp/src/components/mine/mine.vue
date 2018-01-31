<template>
    <div id="mine">
        <myHead headMes="个人中心"></myHead>
        <dl>
            <dt v-if="Storage.getItem('name')">
                <div class="myTop">
                    <div class="myTop_l">
                        <img :src="Storage.getItem('imgurl')" v-if="Storage.getItem('imgurl')" />
                        <img src="../../assets/imgs/icon/mine_main.png" v-else />
                    </div>
                    <div class="myTop_r">
                        <dl>
                            <dt>{{nickname}}</dt>
                            <dd>普通会员</dd>
                        </dl>
                    </div>
                </div>
                <div class="myBottom">
                    <img src="../../assets/imgs/icon/mine_big.png" />
                </div>
            </dt>
            <dt v-else>
                <a href="#/login">
                    <span>登录\注册</span>
                </a>
            </dt>
            <dd>
                <a href="#/wishCatalog" v-if="Storage.getItem('name')">
                    <div class="mine_l">
                        <i class="el-icon-star-off"></i>愿望清单
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
                <a href="#/login" v-else>
                    <div class="mine_l">
                        <i class="el-icon-star-off"></i>愿望清单
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
            </dd>
            <dd>
                <a href="#/myOrder" v-if="Storage.getItem('name')">
                    <div class="mine_l">
                        <i class="el-icon-document"></i>订单
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
                <a href="#/login" v-else>
                    <div class="mine_l">
                        <i class="el-icon-document"></i>订单
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
            </dd>
            <dd>
                <a href="#/discountCoupon" v-if="Storage.getItem('name')">
                    <div class="mine_l">
                        <i class="el-icon-shangpin-coupons"></i>卡券
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
                <a href="#/login" v-else>
                    <div class="mine_l">
                        <i class="el-icon-shangpin-coupons"></i>卡券
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
            </dd>
            <dd>
                <a href="#/service" v-if="Storage.getItem('name')">
                    <div class="mine_l">
                        <i class="el-icon-shangpin-message"></i>客服
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
                <a href="#/login" v-else>
                    <div class="mine_l">
                        <i class="el-icon-shangpin-message"></i>客服
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
            </dd>
            <dd>
                <a href="#/address" v-if="Storage.getItem('name')">
                    <div class="mine_l">
                        <i class="el-icon-shangpin-dizhi"></i>收货地址管理
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
                <a href="#/login" v-else>
                    <div class="mine_l">
                        <i class="el-icon-shangpin-dizhi"></i>收货地址管理
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
            </dd>
            <dd>
                <a href="#/setting" v-if="Storage.getItem('name')">
                    <div class="mine_l">
                        <i class="el-icon-shangpin-setup"></i>设置
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
                <a href="#/login" v-else>
                    <div class="mine_l">
                        <i class="el-icon-shangpin-setup"></i>设置
                    </div>
                    <div class="mine_r"><i class="el-icon-arrow-right"></i></div>
                </a>
            </dd>
        </dl>
        <myFoot minePage="active"></myFoot>
        <div v-show="myShow==true">
            <div class="dk-spinner-mask"></div>
            <div class="dk-spinner dk-spinner-three-bounce">
                <div class="dk-bounce1"></div>
                <div class="dk-bounce2"></div>
                <div class="dk-bounce3"></div>
            </div>
        </div>
    </div>
</template>
<script>
    import '../../sass/mine.scss';
    import myFoot from '../foot/foot.vue';
    import myHead from '../head/head.vue';
    import http from '../../utils/reqAjax.js';
    export default{
        components:{
            myFoot:myFoot,
            myHead:myHead
        },
        data(){
            return{
                Storage:window.sessionStorage,
                nickname:'nickname',
                myShow:false
            }
        },
        mounted(){
            if(this.Storage.getItem('id')){
                this.myShow = true;
                http.post({url:'carts',params:{userid:this.Storage.getItem('id')}}).then(res=>{
                    this.myShow = false;
                    if(data=='购物车无商品'){
                    }else{
                        var data = res.data;
                        this.Storage.setItem('proNum',data.length);
                        this.nickname = this.Storage.getItem('name');
                    }
                });
            }
        }
    }
</script>