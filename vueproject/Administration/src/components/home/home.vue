<template>
  <div id="home">
        <div class="home-top">
            <el-menu class="el-menu-demo" mode="horizontal" background-color="#545c64" text-color="#fff">
                <el-menu-item index="1">后台管理平台</el-menu-item>
                <el-menu-item index='2'><span>欢迎</span><span>{{username}}</span><span @click='login'>登录</span></el-menu-item>
                <i class="glyphicon glyphicon-off" @click='exit'></i>
            </el-menu>
        </div>
        <div class="home-centent clearfix">
            <div class="home-left">
                <el-row class="tac">
                    <el-col >
                        <el-menu default-active="2" class="el-menu-vertical-demo"  background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
                            <el-submenu index="1">
                                <template slot="title">
                                    <i class="el-icon-location"></i>
                                    <span>商品管理</span>
                                </template>
                                    <el-submenu index="7" >
                                        <template slot="title" >
                                            <i class="el-icon-tickets"></i>
                                            <span @click='all'>商品列表</span>
                                        </template>
                                    </el-submenu>
                                    <el-submenu index="8" >
                                        <template slot="title" >
                                            <i class="el-icon-circle-plus"></i>
                                            <span @click='addgoods'>添加商品</span>
                                        </template>
                                    </el-submenu>
                                    <el-submenu index="6">
                                        <template slot="title">
                                            <i class="el-icon-edit-outline"></i>
                                            <span>商品类别</span>
                                        </template>
                                        <el-menu-item-group>
                                            <el-menu-item index="1-1" @click="classify($event)">男士</el-menu-item>
                                            <el-menu-item index="1-2" @click='classify($event)'>女士</el-menu-item>
                                            <el-menu-item index="1-3" @click='classify($event)'>儿童</el-menu-item>
                                        </el-menu-item-group>
                                    </el-submenu>
                            </el-submenu>
                            <el-menu-item index="2">
                                <i class="el-icon-menu"></i>
                                <span slot="title" @click='power'>权限管理</span>
                            </el-menu-item>
                            <el-menu-item index="3">
                                <i class="el-icon-setting"></i>
                                <span slot="title" @click='order'>订单管理</span>
                            </el-menu-item>
                            <el-menu-item index="4">
                                <i class="el-icon-news"></i>
                                <span slot="title">库存管理</span>
                            </el-menu-item>
                            <el-menu-item index="5">
                                <i class="el-icon-info"></i>
                                <span slot="title" @click='client'>客户管理</span>
                            </el-menu-item>
                        </el-menu>
                    </el-col>
                </el-row>
            </div>
            <div class="home-right">
                <div class="home-right-top">
                    <div class="form-inline">
                        <div class="form-group">
                            <select name="">
                                <option value="关键字">关键字</option>
                                <option value="类型">类型</option>
                                <option value="颜色">类型</option>
                            </select>
                            <input type="text" class="form-control" id="exampleInputName2" placeholder="搜索内容">
                            <input type="button" value="搜索" class="btn" @click='seek($event)' />
                        </div>
                    </div>
                </div>
                <div class="home-right-center">
                    <router-view></router-view>
                </div>
                <div class="home-right-bottom"></div>
            </div>
        </div>
  </div>
</template>
<script>
    import './home.scss'
    import spinner from '../spinner/spinner.vue'
    // import datagrid from '../datagrid/datagrid.vue'
    import http from '../../utils/reqAjax.js'
    export default{
        name: 'home',
        data:function(){
            return{
                kind:'',
                username:sessionStorage.getItem("username"),
                seekword:'',
                type:'',
                position:sessionStorage.getItem("position")
            }
        },
        components:{
            spinner:spinner
        },
        methods:{
            login:function(){
                this.$router.push({name:'login'});
            },
            exit:function(){
                this.$router.push({name:'login'});
            },
            classify:function(e){
                this.kind = e.$slots.default[0].text;
                this.$router.push({name:'goods'});
                var params = {
                    api:'getcommodity',
                    kind:this.kind
                }
                this.$store.dispatch('goods',params)
                // this.$store.commit('bb',params)
            },
            power:function(){
                this.$router.push({name: 'power'});
                var params1 = {
                    api:'htmanage',
                    kind:''
                }
                this.$store.dispatch('goods',params1)
            },

            all:function(){
                var params1 = {
                    api:'getall',
                    kind:''
                }
                this.$router.push({name:'allgoods'});
                this.$store.dispatch('goods',params1)

            },
            addgoods:function(){
                this.$router.push({name:'addgoods'});
            },
            seek:function(e){

                this.seekword = e.path[1].childNodes[2].value;
                this.type = e.path[1].childNodes[0].value;
                var params = {
                    api:'seek',
                    kind: this.seekword

                }
                this.$store.dispatch('goods',params)

            },
            order:function(){
                // var params = {
                //     api:'htorder',
                //     data:"yyyy-MM-dd"
                // }

                this.$router.push({name:'order'});
                // this.$store.dispatch('order',params)
            },
            client:function(){
                this.$router.push({name:'client'});
            }
        },
        mounted:function(){
            // console.log(this.position)
        }
    }
</script>