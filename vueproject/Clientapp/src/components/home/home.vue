<template>
    <div class="home">
    <myHead headMes="SHVNGPIN尚品" selectGender="1"></myHead>
        <div class="homeBox">
            <scroller :on-refresh="refresh" :on-infinite="infinite" ref="myscroller">
                <div class="homeBanner" @click="GotoGirl">
                    <div class="swiper-container" :option="swiperOption">
                        <div class="swiper-wrapper">
                            <img :src="str.url"class="swiper-slide" v-for="str in listImg">
                        </div>
                        <div class="swiper-pagination swiper-pagination-white"></div>
                    </div>
                </div>
                <div class="homeNew" @click="GotoMan">
                    <img src="../../img/home1.jpg">
                </div>
                <div class="homeFashion" @click="GotoChild">
                   <img src="../../img/home2.gif">
                </div>
                <div class="homeList1"  @click="GotoGirl">
                   
                   <slider :pages="pagesL" :sliderinit="sliderinit">

                    </slider>
                </div>
                <h3><i>单品推荐</i></h3>

                <div class="homeLike">
                    
                    <ul>
                        <li><a href="#">
                            <img src="../../img/homeLike1.jpg" @click="GotoMan">
                            <p><span>TOPSHOP</span> <span>早春新品发布会</span></p>
                        </a></li>
                        <li><a href="#">
                            <img src="../../img/homeLike2.jpg" @click="GotoGirl">
                            <p><span>TOPSHOP</span> <span>早春新品发布会</span></p>
                        </a></li>
                        <li><a href="#">
                            <img src="../../img/homeLike3.jpg" @click="GotoMan">
                            <p><span>TOPSHOP</span> <span>早春新品发布会</span></p>
                        </a></li>
                        <li><a href="#">
                            <img src="../../img/homeLike4.jpg" @click="GotoGirl">
                            <p><span>TOPSHOP</span> <span>早春新品发布会</span></p>
                        </a></li>
                        <li><a href="#">
                            <img src="../../img/homeLike5.jpg"@click="GotoMan">
                            <p><span>TOPSHOP</span> <span>早春新品发布会</span></p>
                        </a></li>
                        <li><a href="#">
                            <img src="../../img/homeLike6.jpg"@click="GotoGirl">
                            <p><span>TOPSHOP</span> <span>早春新品发布会</span></p>
                        </a></li>
                        <li><a href="#">
                            <img src="../../img/homeLike7.jpg"@click="GotoMan">
                            <p><span>TOPSHOP</span> <span>早春新品发布会</span></p>
                        </a></li>
                    </ul>
                </div>
                <div class="newGoods">
                    <h3><span>新品到货</span><span class="more">更多></span></h3>
                    <ul>
                        <li v-for="(item,index) in dataset" v-if="index>12&&index<24":id="item.id" @click="GotoDetails(item.id)">
                            <a href="#">
                                <img :src="item.imgurl"/>
                                <p><span>{{item.brand}}</span><span class="kuan">148款</span></p>
                            </a>
                        </li>
                       
                    </ul>
                </div>
                <div class="homeFoot">
                    <ul>
                        <li v-for="(item,index) in dataset" :key="index" v-if="index>18&&index<35" :id="item.id" @click="GotoDetails(item.id)">
                        <div class="imgBox"><img :src="item.imgurl" ></div>
                            
                            <p class="type">{{item.type}}</p>
                            <p>{{item.brand}}</p>
                            <P>{{item.title}}</P>
                            <P>￥{{item.price}}</P>
                        </li>
                    </ul>
                </div>
            </scroller>
        </div>
        
        
        <div :class="scrollTop1" @click="backTop" >
            <s class="el-icon-arrow-up"></s>
            <P>TOP</P>
        </div>
    <myFoot homePage="active"></myFoot>
    </div>

</template>
<script>
    import axios from 'axios';
    import http from '../../utils/reqAjax.js'
    import '../../sass/base.scss';
    import './home.scss';
    import slider from 'vue-concise-slider'
    import myHead from '../head/head.vue';
    import myFoot from '../foot/foot.vue';
    import Swiper from 'swiper';
    import 'swiper/dist/css/swiper.min.css';
   
    export default{
        data(){
            return {
                scrollTop1:'scrollTop1',
                dataset:[],
                 noData: '',
                moveList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
                listImg: [
                    {url:'src/img/homeBanner1.jpg'},
                    {url:'src/img/homeBanner2.jpg'}
                ],
               
                pagesL:[
                  {
                    html: ` <ul>
                        <li><a href=""><img src="src/assets/imgs/lady/g5.jpg" alt="" /><p class="p1">GCDS</p><p class="p2">￥889</p></a></li>
                        <li><a href=""><img src="src/assets/imgs/lady/g6.jpg" alt="" /><p class="p1">GCDS</p><p class="p2">￥889</p></a></li>
                        <li><a href=""><img src="src/assets/imgs/lady/g7.jpg" alt="" /><p class="p1">GCDS</p><p class="p2">￥889</p></a></li>

                    </ul>`,
                    
                 },
                 {
                    html: ` <ul>
                        <li><a href=""><img src="src/assets/imgs/lady/g8.jpg" alt="" /><p class="p1">GCDS</p><p class="p2">￥889</p></a></li>
                        <li><a href=""><img src="src/assets/imgs/lady/g9.jpg" alt="" /><p class="p1">GCDS</p><p class="p2">￥889</p></a></li>
                        <li><a href=""><img src="src/assets/imgs/lady/g11.jpg" alt="" /><p class="p1">GCDS</p><p class="p2">￥889</p></a></li>
                        
                    </ul>`,
                    
                 }
                  
                ],
                //滑动配置[obj]
                sliderinit: {
                  currentPage: 0,//当前页码
                thresholdDistance: 500,//滑动判定距离
                  thresholdTime: 3000,//滑动判定时间
                  autoplay:5000,//自动滚动[ms]
                  loop:true,//循环滚动
                 direction:'horizontal',//方向设置，垂直滚动
                 infinite:1,//无限滚动前后遍历数
                  slidesToScroll:1,//每次滑动项数
                }
                
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
            })
            var _this = this;//此this指向的是vue
            window.onmousewheel = function (e) {
              if(e.wheelDelta<0){
                _this.$refs.myscroller && (_this.$refs.myscroller.scrollBy(0, 30, false));//避免ref中不存在myscroller
              }else{
                _this.$refs.myscroller && (_this.$refs.myscroller.scrollBy(0, -30, false));
              }
              var scrollTop = _this.$refs.myscroller.getPosition().top;
              if(scrollTop>120){
                document.querySelector('.scrollTop1').style.display = 'block';
              }else{
                document.querySelector('.scrollTop1').style.display = 'none';
              }

            };
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
               this.$refs.myscroller.scrollTo(0,0,false);
               document.querySelector('.scrollTop1').style.display = 'none';
            },
            infinite(done) {
                if(this.noData) {
                    setTimeout(()=>{
                        this.$refs.myscroller.finishInfinite(2);
                    })
                    return;
                }
                let self = this;
                let start = this.moveList.length;

                setTimeout(() => {
                    for(let i = start + 1; i < start + 10; i++) {
                        self.moveList.push(i)
                    }
                    if(start > 30) {
                        self.noData = "没有更多数据"
                    }
                    self.$refs.myscroller.resize();
                    done()
                }, 1500)
            },
            refresh(done) {
                if(this.noData) {
                    setTimeout(()=>{
                        this.$refs.myscroller.finishRefresh(2);
                        console.log(this.$refs.myscroller)
                    },1000)
                    return;
                }
                let self = this;
                let start = this.moveList.length;

                setTimeout(() => {
                    for(let i = start + 10; i < start + 1; i--) {
                        self.moveList.push(i)
                    }
                    if(start > 30) {
                        self.noData = "刷新成功"
                    }
                    self.$refs.myscroller.resize();
                    done()
                }, 1500)
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
