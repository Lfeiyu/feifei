<template>
	<ul class="c_content">
		<li v-for="(item,index) in title" @click="GotoGirl">
			<i class="icon" :class="key" v-for='(key,idx) in icon' v-if='(index==idx)'></i>
			<div class="title">
				<span>
					<a href="#">{{item}}</a>
				</span>
				<span class="right"><i class="el-icon-arrow-right"></i></span>
			</div>
		</li>
	</ul>
</template>
<script>
	import './same.scss'
	export default{
		data:function(){
			return {
				title:['SALE','女装','鞋靴','护肤品','箱包','配件','当季商品'],
				icon:['el-icon-goods','el-icon-share','el-icon-picture','el-icon-sold-out','el-icon-mobile-phone','el-icon-star-on','el-icon-printer']
			}
		},
		methods:{
			GotoGirl:function(){
				this.$router.push({name:'goods',params:{userId:'女士'}})
			}
		}
	}
</script>