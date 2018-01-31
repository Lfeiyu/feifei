<template>
	<div class="box">
		<ul class="categroy" v-if='categroy.length>0'>
			<li v-for="item in categroy">
				<router-link to="goods">{{item}}</router-link>
			</li>
		</ul>
		<ul class="zm" v-if='categroy.length>0'>
			<li  v-for="item in zm"  @click="$router.push({name:'recommend'})">
				<a href="#">{{item}}</a>
				<span></span>
			</li>
		</ul>
	</div>
</template>
<script>
	import './comme.scss'
	import myHead from '../head/head.vue'
	import myFoot from '../foot/foot.vue'
	export default{
		components:{
			myHead,myFoot
		},
		data(){
			return {
				categroy:['纸尿裤','牛奶','奶片','衣服','鞋子','奶瓶GOOSE','童袜','TODS','PRADA'],
				zm:['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','S','Y','Z']
			}
		}
	}
</script>