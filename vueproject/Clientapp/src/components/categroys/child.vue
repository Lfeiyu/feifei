<template>
	<ul class="c_content">
		<li v-for="(item,index) in title" @click="GotoChild">
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
				title:['SALE','童装','尿不湿','奶粉','童鞋','玩具'],
				icon:['el-icon-goods','el-icon-star-off','el-icon-view','el-icon-sold-out','el-icon-mobile-phone','el-icon-star-on']
			}
		},
		methods:{
			GotoChild:function(){
				this.$router.push({name:'goods',params:{userId:'儿童'}});
			}
		}
	}
</script>