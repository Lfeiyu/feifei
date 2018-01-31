<template>
	<div class="details">
		<div class="head_menu">
			<div class="icon_l">
				<a href="javascript:history.go(-1)"><i class="el-icon-arrow-left"></i></a>
			</div>
			<div class="icon_c" v-for='(item,index) in dataset'>
				<h4>{{item.brand}}</h4>
				<p>
					<span><del>￥{{item.price}}</del></span>
					
					<span>￥{{item.saleprice}}</span>
				</p>
			</div>
			<div class="icon_r">
				<i class="el-icon-upload2"></i>
				<i class="el-icon-goods"></i>
			</div>
		</div>
		<main>
			<!-- 商品标题 -->
			<div class="product_title" v-for='(item,index) in dataset'>
				<h3>{{item.brand}}</h3>
				<p>{{item.title}}</p>
				<p>
					<span><del>￥{{item.price}}</del></span> 
					<span>￥{{item.saleprice}}</span>
				</p>
			</div>
			<!-- 商品轮播图 -->
			<div class="swipr_content" v-for='(item,index) in dataset'>
				<a href="#"><img :src='item.imgurl'></a>
			</div>
			
			<!-- <div class="product_info">
				<dl>
					<dt class="dt_1"><span class="ts">7</span>支持7七天无理由退换</dt>
					<dt><a href="#">尺码对照表</a></dt>
					<dd class="d_center">
						<a href="#" class="chose_size">尺码选择<em>（英国码）</em></a>
					</dd>
					<dt><a href="#">配送信息</a></dt>
					<dd><p>商品预计3-5个工作日送达，不同款的商品由于发货地不同可能发货时间不同</p></dd>
					<dt><a href="#">配送信息</a></dt>
					<dd class="d_good" v-for='(item,index) in dataset'>
						<p>商品编号：<span>{{item.id}}</span></p>
						<p>商品名称：<span>{{item.title}}</span></p>
						<p>商品货号：<span>{{item.brand}}</span></p>
						<p>产地：印度等，由于批次不同存在差异，请以收到实物为准</p>
						<p>材质：100%聚酯纤维</p>
						<p>特殊说明：GOODSLISTISONEGL</p>
					</dd>
				</dl>
			</div> -->
			<!-- 商品信息 -->
			<div class="product_info" v-for="(item,index) in dataset">
				<p><span class="ts">7</span>支持7七天无理由退换</p>
				<h6>尺码对照表</h6>
				<div class="chose_size">
					<a href="#">尺码选择<em>（英国码）</em></a>
				</div>
				<h6>配送信息</h6>
				<p>商品预计3-5个工作日送达，不同款的商品由于发货地不同可能发货时间不同</p>
				<h6>商品描述</h6>
				<p>商品编号：<span>{{item.id}}</span></p>
				<p>商品名称：<span>{{item.title}}</span></p>
				<p>商品货号：<span>{{item.brand}}</span></p>
				<p>产地：印度等，由于批次不同存在差异，请以收到实物为准</p>
				<p>材质：100%聚酯纤维</p>
				<p>特殊说明：GOODSLISTISONEGL</p>
			</div>
			<div class="product_link">
				<ul class="one">
					<li>
						<span>温馨提示</span>
						<span><i class="el-icon-arrow-right"></i></span>
					</li>
					<li>
						<span>用户评价</span>
						<span><em>共0条</em><i class="el-icon-arrow-right"></i></span>
					</li>
					<li>
						<span>图文详情</span>
						<span><i class="el-icon-arrow-right"></i></span>
					</li>
					<li>
						<span>售后保养</span>
						<span><i class="el-icon-arrow-right"></i></span>
					</li>
					<li>
						<span>TOPSHOP品牌店</span>
						<span><i class="el-icon-arrow-right"></i></span>
					</li>
				</ul>
				<ul class="two">
					<li>
						<i class="el-icon-service"></i>
						<span>在线客服</span>
						<em>9:00-12:00</em>
					</li>
					<li class="last">
						<i class="el-icon-phone-outline"></i>
						<span>电话客服</span>
						<em>9:00-12:00</em>
					</li>
				</ul>
			</div>
		</main>
		<div class="submit_btn">
			<div class="btn_l">
				<span>加入愿望清单</span>
			</div>
			<div class="btn_r" v-for="(item,index) in dataset "@click="showSize">
				<span>加入购物袋</span>
			</div>
			<div class="sizeBox">
            </div>
            <div class="cont">
                <h3><span>查看尺码对照表</span><span>></span></h3>
                <p v-for="(item,index) in dataset"><span>尺码：</span><i>{{item.size}}</i></p>
                <ul>
                    <li v-for="(item,index) in dataset"><span>{{item.color}}</span><span>{{item.size}}</span><span>{{item.surplus}}</span></li>
                    
                </ul>
                <button class="ver"v-for="(item,index) in dataset " @click="GotoCar" >确认</button>
            </div>
		</div>
	</div>
</template>
<script>
	import './details.scss'
	import http from '../../utils/reqAjax.js'
	export default{
		data:function(){
			return {
				dataset:[],
				id:window.sessionStorage.getItem('goodId')
			}
		},
		mounted(){
			var url = `./getdetails?goodid=${this.id}`;
			http.get({url:url}).then((res)=>{
				this.dataset = res.data.data.results;	
				console.log(this.dataset)
			})
		},
		methods:{
			GotoCar:function(){
				console.log(window.sessionStorage.getItem('id'));
				console.log(this.id);
				if(window.sessionStorage.getItem('id')){
					http.post({url:'addcar',params:{'userid':window.sessionStorage.getItem('id'),'gid':this.id,qty:1}}).then(res=>{
						console.log(res);
						this.$router.push({name:'car'});
					})
				}else{
					this.$router.push({name:'login'});
				}
			},
            showSize:function(){
                document.querySelector('.sizeBox').style.display = 'block';
                document.querySelector('.cont').style.display = 'block';
            },
            hideSize:function(){
            console.log(2)
                document.querySelector('.sizeBox').style.display = 'none';
                document.querySelector('.cont').style.display = 'none';
                
            }
		}
	}
</script>