<template>
	<ul class="pay">
		<h2 href="">请在<span>5</span>分钟内完成支付</h2>
		<li @click="qr">确认支付</li>
		<li @click="GotoHome">取消支付</li>
	</ul>
</template>
<script>
	import './pay.scss'
	import http from '../../utils/reqAjax.js'
	export default {
		data:function(){
			return {
				carlist:[],
				show:true,
				pay:this.$route.params,
				time:this.$route.params.timer
			}
		},
		mounted:function(){
			console.log(this.time);
		},
		methods:{
			qr:function(){
				http.post({url:'pay',params:{'userid':1,status:1,'time':this.time}}).then(res=>{
					console.log(res)
				})
			},
			GotoHome:function(){
				this.$router.push({name:'home'});
			}
		}
	}
</script>