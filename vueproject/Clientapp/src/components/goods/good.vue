<template>
	<div class="goodslist">
		<myHead headMes="TOPSHOP" goSearch="1" goToBack="1" goToHome="1"></myHead>
		<nav>
			<ul class="nav_top">
				<li>排序</li>
				<li>筛选</li>
			</ul>
		</nav>
		<main>
			<ul class="content" v-if='dataset.length>0'>
				<li v-for='(item,index) in dataset' :id="item.id" @click="GotoDetails(item.id)">
					<img :src='item.imgurl'>
					<h4>{{item.brand}}</h4>
					<p>{{item.title}}</p>
					<p>
						<span class="p1">￥{{item.saleprice}}</span>
						<span class="p2"><del>￥{{item.price}}</del></span>
					</p>
				</li>
			</ul>
		</main>
	</div>
</template>
<script type="text/javascript">
	// import category from './category.js'
	import './goods.scss'
	import http from '../../utils/reqAjax.js'
	import myHead from '../head/head.vue'
	export default{
		components:{
			myHead
		},
		data(){
			return {
				dataset:[],
				userId:''
			}
		},
		mounted(){
			this.userId = this.$route.params.userId;
			console.log(this.userId);
			var url = `./getgoodslist?keyword=${this.userId}`;
			http.get({url:url}).then((res)=>{
				console.log(res)
				//console.log(res.data.data.results);
				this.dataset = res.data.data.results;
				console.log(this.dataset)
			})
		},
		methods:{
			GotoDetails:function(id){
				console.log(id);
				sessionStorage.setItem('goodId', id);        
				this.$router.push({ name:'details',params:{goodId:id}})
			}
		}
	}
</script>