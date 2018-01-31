<template>
    <div id="Head">
        <div class="head_l" v-show="goToBack==1 || selectGender==1">
            <a href="javascript:history.go(-1)" v-show="goToBack==1"><i class="el-icon-arrow-left"></i></a>
            <a href="#/scrollHide" v-show="selectGender==1"><i class="el-icon-shangpin-other"></i></a>
        </div>
        <span>{{headMes}}</span>
        <div class="head_r">
            <a href="#/search" v-show="goSearch!=1"><i class="el-icon-search" @touchstart="show"></i></a>
            <a href="#/home" v-show="goHome==1"><i class="el-icon-shangpin-shouye"></i></a>
            <a href="#" v-show="goCar!=1">
                <i class="el-icon-goods" @click="GotoCar"></i>
                <i v-show="Storage.getItem('proNum')">{{Storage.getItem('proNum')}}</i>
            </a>
        </div>
    </div>
</template>
<script>
    import '../../sass/head.scss';
    export default{
        data(){
            return{
                Storage:window.sessionStorage
            }
        },
        props:['goToBack','headMes','selectGender','goHome','goCar','goSearch'],
        methods:{
            show:function(){
                this.Storage.setItem('name','');
                console.log(this.Storage.getItem('name'));
            },
            GotoCar:function(){
                if(window.sessionStorage.getItem('id')){
                    this.$router.push({name:'car'});
                }else{
                    this.$router.push({name:'login'});
                }
            }
        }
    }
</script>