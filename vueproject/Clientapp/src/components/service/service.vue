<template>
    <div id="service">
        <myHead goToBack="1" headMes="客服帮助"></myHead>
        <div class="service_c">
            <div class="service_c_t">
                <dl>
                    <dt><i class="el-icon-message"></i></dt>
                    <dd>在线客服</dd>
                    <dd>(早09:00-晚22:00)</dd>
                </dl>
                <dl>
                    <dt><i class="el-icon-service"></i></dt>
                    <dd>电话客服</dd>
                    <dd>(早09:00-晚22:00)</dd>
                </dl>
            </div>
            <div class="service_c_c" @touchstart.stop="changePage">
                <a href="#/service" class="active">售后服务</a>
                <a href="#/service/payMethod">支付方式</a>
                <a href="#/service/deliveryExplain">配送说明</a>
                <a href="#/service/userSafe">用户安全</a>
            </div>
            <div class="service_c_b" v-show="page=='售后服务'">
                <ul>
                    <li><a href="#/billExplain">发票说明<i class="el-icon-arrow-right"></i></a></li>
                    <li><a href="#/returnProduct">退换货流程<i class="el-icon-arrow-right"></i></a></li>
                    <li><a href="#/returnExplain">退换货说明<i class="el-icon-arrow-right"></i></a></li>
                    <li><a href="#/returnCare">退换货注意事项<i class="el-icon-arrow-right"></i></a></li>
                    <li><a href="#/returnPrice">退款说明<i class="el-icon-arrow-right"></i></a></li>
                    <li><a href="#/afterSale">售后维修<i class="el-icon-arrow-right"></i></a></li>
                    <li><a href="#/honest">诚信经营承诺<i class="el-icon-arrow-right"></i></a></li>
                </ul>
            </div>
            <router-view></router-view>
        </div>
    </div>
</template>
<script>
    import myHead from '../head/head.vue';
    import '../../sass/service.scss';
    export default{
        components:{
            myHead
        },
        data(){
            return{
                page:'售后服务'
            }
        },
        methods:{
            changePage:function(e){
                var lists = document.querySelectorAll('.service_c_c a');
                var len = lists.length;
                for(var i=0;i<len;i++){
                    lists[i].classList.remove('active');
                }
                e.target.classList.add('active');
                this.page = e.target.innerText;
            }
        }
    }
</script>