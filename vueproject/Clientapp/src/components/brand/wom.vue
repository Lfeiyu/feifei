<template>
	<div class="box">
		<ul class="categroy" v-if='categroy.length>0'>
			<li v-for="item in categroy">
				<router-link :to="'/goods/'+'女士'">{{item}}</router-link>
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
	export default{
		data(){
			return {
				categroy:['TOPMAN','SUBO','MOOSEKNUCKLES','BURBERRY','KENZO','CANADA GOOSE','SALVATMO','TODS','PRADA'],
				zm:['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','S','Y','Z']
			}
		}
	}
</script>