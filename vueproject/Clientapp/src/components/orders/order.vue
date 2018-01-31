<template>
	<div class="box">
		<myHead headMes="订单" goToBack="1" ></myHead>
		<div class="order">
			<ul class="top">
				<li>
					<span><a>请填写配送地址</a></span>
					<span>
						<i class="el-icon-arrow-right"></i>
					</span>
					
				</li>
				<li>
					<span><a>请填写配送地址</a></span>
					<span>
						<a>从国内发货</a>
						<i class="el-icon-arrow-right"></i>
					</span>		
				</li>
			</ul>
			<ul class="center">
				<li>
					<span><a>优惠价</a></span>
					<span>
						<a href="#">已优惠300元</a>
						<i class="el-icon-arrow-right"></i>
					</span>
					
				</li>
				<li>
					<span><a>支付方式</a></span>
					<span>
						<i class="el-icon-mobile-phone zfb"></i>
						<a>支付宝支付</a>
						<i class="el-icon-arrow-right"></i>
					</span>		
				</li>
			</ul>
			<ul class="bottom">
				<li>
					<span><a href="#">发票</a></span>
					<span><input type="checkbox"></span>
				</li>
			</ul>
			<div class="total">
				<p>价格：<span>￥{{total}}</span></p>
				<p>运费：<span>￥0</span></p>
				<p>优惠卷：<span>-￥300</span></p>
				<p>应付金额<span>￥{{total}}</span></p>
			</div>
		</div>
		<ul class="footer">
			<li>
				<p>应付金额：<span>￥{{total}}</span></p>
			</li>
			<li>
				<a href="#" @click="GotoPay">提交订单(1)</a>
			</li>
		</ul>
	</div>
</template>

<script>
	import './order.scss'
	import http from '../../utils/reqAjax.js'
	import myHead from '../head/head.vue'
 export default {
    	components:{
			myHead
		},
    data:function(){
    	return {
    		total:window.sessionStorage.getItem('allmoney'),
    		orderId:''
    	}
    },
    mounted:function(){
    	this.orderId = this.$route.params;
    	console.log(this.$route.params);
    	// console.log(this.orderId.goodsid);
  	},
  	methods:{
	   	GotoPay:function(){
	   			var allgoods = JSON.stringify(this.orderId.goodsid);
	    		sessionStorage.setItem('allmoney', this.total);
	    		http.post({url:'order',params:{userid:window.sessionStorage.getItem('id'),total:this.total,goodsid:allgoods}}).then(res=>{

	    			this.$router.push({ name:'pay',params:{'timer':res.data,'userid':window.sessionStorage.getItem('id'),status:0}})
	    		})

   		}
  	}
 }
</script>