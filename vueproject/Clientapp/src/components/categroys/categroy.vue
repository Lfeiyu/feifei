<template>
	<div class="categroys">
		<myHead headMes="分类"></myHead>
		<!-- <div class="cont"> -->
			<ul class="nav_title">
				<li><router-link to="girl">女士</router-link></li>
				<li><router-link to="nan">男士</router-link></li>
				<li><router-link to="child">儿童</router-link></li>
			</ul>
			<div class="b_content">
				<router-view></router-view>
			</div>
		<!-- </div> -->
		<myFoot categoryPage="active"></myFoot>
	</div>
</template>
<script>
	import './categroy.scss'
	import myHead from '../head/head.vue'
	import myFoot from '../foot/foot.vue'
	export default{
		components:{
			myHead,myFoot
		},
		data:function(){
			return {

			}
		}
	}
</script>