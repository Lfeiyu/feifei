<template>
    <div class="recommend">
        <myHead headMes="TOPSHOP" goToBack="1" goHome="1" goCar="1"></myHead>
        <div class="recommendBox" @scroll=handleScroll>
            
            <div class="recommendBanner" @click="GotoGirl">
                <div class="swiper-container" :option="swiperOption">
                        <div class="swiper-wrapper">
                            <img :src="str.url"class="swiper-slide" v-for="str in listImg">
                        </div>
                        <div class="swiper-pagination swiper-pagination-white"></div>
                    </div>
            </div>
            <div class="recommendNew" @click="GotoMan">
                <img src="../../img/recommendNew.jpg" />
            </div>
            <ul class="recommendImg">
                <li><a href=""><img src="../../img/recommendImg1.jpg" @click="GotoGirl"/></a></li>
                <li><a href=""><img src="../../img/recommendImg2.jpg" @click="GotoMan"/></a><a href=""><img src="../../img/recommendImg3.jpg" @click="GotoGirl"/></a></li>
            </ul>
            <ul class='recommendImg2'>
                <li><a href=""><img src="../../img/recommendImg4.jpg"  @click="GotoMan"/></a></li>
                <li><a href=""><img src="../../img/recommendImg5.jpg" @click="GotoGirl"/></a><a href=""><img src="../../img/recommendImg6.jpg" @click="GotoMan" /></a></li>
                <li><a href=""><img src="../../img/recommendImg7.jpg" @click="GotoGirl" /></a></li>
            </ul>
            <ul class="recommendFang">
                <li><a href=""><img src="../../img/recommendFang1.jpg" @click="GotoMan" /></a></li>
                <li><a href=""><img src="../../img/recommendFang2.jpg" @click="GotoGirl" /></a></li>
                <li><a href=""><img src="../../img/recommendFang3.jpg" @click="GotoMan"/></a></li>
                <li><a href=""><img src="../../img/recommendFang4.jpg" @click="GotoGirl" /></a></li>
            </ul>
            <div class="recommendMan" @click="GotoMan">
                <img src="../../img/recommendMan.jpg"/>
            </div>
            <div class="recommendType">
                <img src="../../img/recommendType.jpg" @click="GotoMan"/>

                <ul>
                    <li @click="GotoGirl"><a href=""><img src="../../img/recommendType1.jpg" /></a></li>
                    <li @click="GotoMan"><a href=""><img src="../../img/recommendType2.jpg" /></a></li>
                    <li><a href=""><img src="../../img/recommendType3.jpg" @click="GotoGirl"/></a></li>
                    <li><a href=""><img src="../../img/recommendType4.jpg"@click="GotoMan" /></a></li>
                    <li><a href=""><img src="../../img/recommendType5.jpg" /></a></li>
                    <li><a href=""><img src="../../img/recommendType6.jpg" @click="GotoMan"/></a></li>
                    <li><a href=""><img src="../../img/recommendType7.jpg" @click="GotoGirl"/></a></li>
                    <li><a href=""><img src="../../img/recommendType8.jpg" @click="GotoMan"/></a></li>
                    <li><a href=""><img src="../../img/recommendType9.jpg" @click="GotoGirl"/></a></li>
                    <li><a href=""><img src="../../img/recommendType10.jpg" @click="GotoMan"/></a></li>
                    <li><a href=""><img src="../../img/recommendType11.jpg" @click="GotoGirl"/></a></li>
                    <li><a href=""><img src="../../img/recommendType12.jpg" @click="GotoGirl"/></a></li>
                </ul>
            </div>
            <div class="recommendFoot">
                <div class="searchBar" id="searchBar">
                <ul class="searchBarFixed" >
                    <li>筛选</li>
                    <li>排序</li>
                </ul>
                </div>
                <ul class="recommendFootList ">
                    <li v-for="(item,index) in dataset" :key="index":id="item.id" @click="GotoDetails(item.id)">
                    <div class="imgBox"><img v-lazy="item.imgurl" class="lazy-img-fadein"></div>
                        <p class="type">{{item.type}}gs</p>
                        <p>{{item.brand}}</p>
                        <P>{{item.title}}</P>
                        <P>￥{{item.price}}</P>
                    </li>
                </ul>
            </div>
            
        </div> 
        <myFoot minePage="active"></myFoot>
        <div :class="scrollTop1" @click="backTop">
            <s class="el-icon-arrow-up"></s>
            <P>TOP</P>
        </div>      
    </div>
</template>
<script>
   import myHead from '../head/head.vue';
    import myFoot from '../foot/foot.vue';
    import http from '../../utils/reqAjax.js'
    import axios from 'axios';
    import '../../sass/base.scss';
    import './recommend.scss';
    import slider from 'vue-concise-slider'
    import Swiper from 'swiper';
    import 'swiper/dist/css/swiper.min.css';
    export default{
        data(){
            return {
                scrollTop1:'scrollTop1',
                counter : 1, //默认已经显示出15条数据 count等于一是让从16条开始加载
                num : 15,  // 一次显示多少条
                pageStart : 0, // 开始页数
                pageEnd : 0, // 结束页数
                listdata: [], // 下拉更新数据存放数组
                downdata: [],  // 上拉更多的数据存放数组
                dataset:[],
               
                noData: '',
                moveList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
                listImg: [
                    {url:'src/img/recommendBanner1.jpg'},
                    {url:'src/img/recommendBanner2.jpg'},
                    {url:'src/img/recommendBanner3.jpg'},
                    {url:'src/img/recommendBanner4.jpg'},
                    {url:'src/img/recommendBanner5.jpg'}
                    
                ]
                

            }
        },
        components: {
            slider,
            myFoot:myFoot,
            myHead:myHead
        },
        mounted(){
            var url = `./getgoodslist?keyword=女士`;
            http.get({url:url}).then((res)=>{
                this.dataset = res.data.data.results;   
                console.log(this.dataset)
            });
            window.addEventListener('scroll', this.handleScroll);
            new Swiper('.swiper-container', {
                slideaPerView:'auto',
                centeredSliders:true,
                initialSlide:0,
                currentPage: 0,//当前页码
                thresholdDistance: 500,//滑动判定距离
                thresholdTime: 3000,//滑动判定时间
                pagination: '.swiper-pagination',
                paginationClickable: true,
                loop: true,
                speed: 600,
                autoplay: true,
                pagination:{
                    el:'.swiper-pagination',
                    clickable:true
                }
            });
        },
        methods:{
            backTop(){
              console.log(document.querySelector('.recommendBox').scrollTop)
              document.querySelector('.recommendBox').scrollTop = 0
              document.documentElement.scrollTop = 0
            },
            handleScroll () {
              var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
              console.log(scrollTop)
        
              
                if(scrollTop > 0) {
                    document.querySelector('.scrollTop1').style.display = 'block';
                } else{

                    document.querySelector('.scrollTop1').style.display = 'none';
                }
                var searchBarFixed=  document.querySelector('.searchBarFixed');
                if(scrollTop ==document.querySelector('.recommendFoot').offsetTop) {
                searchBarFixed.style.position = 'fixed';
                searchBarFixed.style.top = '1.07rem';

                
                } else{
                searchBarFixed.style.position = '';
                searchBarFixed.style.top = '';
                }
              
            },
            GotoGirl:function(){
                console.log('nihao ')
                this.$router.push({name:'goods',params:{userId:'女士'}})
            },
            GotoMan:function(){
            console.log('nihao ')
                this.$router.push({name:'goods',params:{userId:'男士'}})
            },
            GotoChild:function(){
            console.log('nihao ')
                this.$router.push({name:'goods',params:{userId:'儿童'}})
            },
            GotoDetails:function(id){
                console.log(id);
                sessionStorage.setItem('id', id);        
                this.$router.push({ name:'details',params:{goodId:id}})
            }
        }
    }

</script>


 
