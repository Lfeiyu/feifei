<template>
	<div class="brand">
		<myHead headMes="品牌"></myHead>	
		<ul class="nav_title">
			<li><router-link to="wom">女士</router-link></li>
			<li><router-link to="/man">男士</router-link></li>
			<li><router-link to="/children">儿童</router-link></li>
		</ul>
		<div class="b_content">
			<router-view></router-view>
		</div>
		<myFoot brandPage="active"></myFoot>	
	</div>
</template>
<script>
	import './brand.scss'
	import myHead from '../head/head.vue'
	import myFoot from '../foot/foot.vue'
	export default{
		components:{
			myHead,myFoot
		}
	}
</script>