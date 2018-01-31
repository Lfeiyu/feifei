<template>
    <div id="search">
        <div class="search_t">
            <div class="search_t_l">
                <i class="el-icon-search"></i>
                <input type="text" placeholder="搜索商品、品牌、货号" v-model="goSearch" @input="getPro" @blur="goHide" />
                <ul class="search_b_b">
                    <li v-for="(val,index) in products" :key="index">{{val.title}}</li>
                </ul>
            </div>
            <a href="javascript:history.go(-1)">取消</a>
        </div>
        <div class="search_b">
            <h2>热门搜索</h2>
            <a href="#">男士腰带</a>
            <a href="#">小白鞋</a>
            <a href="#">水桶包</a>
            <a href="#">必备小黑裙</a>
        </div>
    </div>
</template>
<script>
    import '../../sass/search.scss';
    import http from '../../utils/reqAjax.js';
    export default{
        data(){
            return{
                goSearch:'',
                products:[]
            }
        },
        methods:{
            getPro:function(){
                document.querySelector('.search_t_l ul').style.display = 'block';
                this.goSearch = this.goSearch.trim();
                if(this.goSearch){
                    var url = 'seach?keyword='+this.goSearch;
                    http.get({url:url}).then(res=>{
                        var data = res.data.data.results.splice(0,5);
                        if(res.data.status){
                            this.products = data;
                        }
                    })
                }
            },
            goHide:function(){
                document.querySelector('.search_t_l ul').style.display = 'none';
            }
        }
    }
</script>