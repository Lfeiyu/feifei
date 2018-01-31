<template>
	<div class="car_order">
	 <myHead headMes="购物袋" goToBack="1" ></myHead>
		<main>

			<div class="order_tips">
				<a href="login">成为金牌会员，享受VIP专属会员，点击查看<span class="close">&times;</span></a>
			</div>
			<div class="order_content" v-if="carlist.length>0">
				<ul v-for="(item,index) in carlist" :id="item.id" @click="total($event,index,id)" class="ul" >
					<li class="car_l">
						<input type="checkbox" class="checkbox">
					</li>
					<li class="car_c">
						<a href="#"><img :src="item.imgurl"></a>
					</li>
					<li class="car_r">
						<span class="close" @click.prevent="deleteRow($event,index,carlist)">&times;</span>
						<h3>{{item.brand}}<span>{{item.title}}</span></h3>
						<p><span>颜色：{{item.color}}</span><span>尺码：{{item.size}} 码</span></p>
						<p><span class="icon7">7</span>支持七天无理由退换</p>
						<div class="btn">
							<span class="price">￥{{item.price}}</span>
							<div class="b_r"  >
								<a href="#" @click="sub(index,id)">-</a>
								<span>{{item.qty}}</span>
								<a href="#" @click="add(index,id)">+</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</main>
		<ul class="c_footer">
			<li class="c_l">
				<input type="checkbox" @click="checkAll($event)"><a href="#">全选</a>
			</li>
			<li class="c_c">
				<p>总金额：<span>￥{{all.count}}</span></p>
			</li>
			<li class="c_r" @click="GotoOrder">
				<a href="#">结算(1)</a>
			</li>
		</ul>
	</div>
</template>
<script>
	import './car.scss'
	import http from '../../utils/reqAjax.js'
	import myHead from '../head/head.vue';
    import myFoot from '../foot/foot.vue';
	export default{
		data:function(){
			return {
				carlist:[],
				id:this.$route.params.goodId,
				num:[],
				sl:'',
				all:{
					qty:1,
					count:0
				}
				

			}
		},
        components: {
            
            myFoot:myFoot,
            myHead:myHead
        },
		mounted:function(){
			http.post({url:'carts',params:{'userid':window.sessionStorage.getItem('id')}}).then(res=>{
				console.log(res.data)
				if(res.data == '购物车无商品'){
					return false;
				}else{
					this.carlist = res.data;
				}
			})
		},
		methods:{

			GotoOrder:function(){
				if(this.all.count > 0){
					sessionStorage.setItem('allmoney', this.all.count);
					
					var news = [];
					
					var check = document.querySelectorAll('.checkbox');

						for(var i= 0;i<check.length;i++){

							if(check[i].checked == true){
								var obj= {};

								obj.gid = this.carlist[i].id;
								obj.qty = this.carlist[i].qty;

								news.push(obj);
							}
							
						}

						var totals = this.all.count;
						console.log(news);
					        
					this.$router.push({ name:'order',params:{userid:window.sessionStorage.getItem('id'),goodsid:news,total:totals}})
	   				
		   		}else{
		   			alert('尚未选择商品');
		   		}

			},
			sub:function(index,id){
				this.carlist[index].qty--;
				if(this.carlist[index].qty <= 1){
					this.carlist[index].qty = 1;
				}
				this.common();

			},
			add:function(index,id){
				this.carlist[index].qty++;
				this.common();
				
			},
			common(){

				var checks = [];
				var pricess= 0;
					var check = document.querySelectorAll('.checkbox');

					for(var i= 0;i<check.length;i++){
						if(check[i].checked == true){
							var qty = this.carlist[i].qty;
							var gid = this.carlist[i].id;

							checks.push(check[i]);
							var t = this.carlist[i].price*qty;
							pricess += t;
							
						}
					}
					this.all.count = pricess;
					
			},
			total:function(event,index,id){
				if(event.target.className === 'checkbox'){
					var obj = {};

					this.common();
				}
				if(event.target.className === 'close'){
					
					
				}
			},
			checkAll:function(event){
      			var checkboxs = document.querySelectorAll('.checkbox');

      			if(event.target.checked == true){
 					
    				
      				for(var i=0; i< checkboxs.length; i++){
      					checkboxs[i].checked = true;
      				}

      			}else{
      				for(var i=0; i< checkboxs.length; i++){
      					checkboxs[i].checked = false;
      				}

      			}

      			this.common();
			},
			deleteRow:function($event,index,carlist){
				
				console.log(carlist[index]);
				if(carlist[index]){

					// console.log(carlist[index].id);
					http.post({url:'cartsdel',params:{'userid':window.sessionStorage.getItem('id'),'gid':carlist[index].id}}).then(res=>{
					})
				}
				
				carlist.splice(index, 1);
			}
		}
	}
</script>