<template>
	<ul class="c_content">
		<li v-for="(item,index) in title" @click="GotoNan">
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
				title:['SALE','男装','西服','手机','鞋靴','箱包','配件','当季商品'],
				icon:['el-icon-goods','el-icon-star-off','el-icon-view','el-icon-mobile-phone','el-icon-picture','el-icon-sold-out','el-icon-mobile-phone','el-icon-star-on']
			}
		},
		methods:{
			GotoNan:function(){
				this.$router.push({name:'goods',params:{userId:'男士'}})
			}
		}
	}
</script>