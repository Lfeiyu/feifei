<template>
    <ul @touchstart="changePage">
        <li data-cate="女士">
            <i class="el-icon-shangpin-xingbie-nv"></i>
            选购女士商品
            <input type="radio" checked name="gender" />
        </li>
        <li data-cate="男士">
            <i class="el-icon-shangpin-xingbie-nan"></i>
            选购男士商品
            <input type="radio" name="gender" />
        </li>
        <li data-cate="儿童">
            <i class="el-icon-shangpin-yingyuanxinxiertongpiao"></i>
            选购儿童商品
            <input type="radio" name="gender" />
        </li>
    </ul>
</template>
<script>
    import '../../sass/scrollHide.scss';
    export default{
        data(){
            return{
                
            }
        },
        methods:{
            changePage:function(e){
                if(e.target.nodeName.toLowerCase() == 'li'){
                    this.$router.push({name:'goods',params:{userId:e.target.dataset.cate}});
                }
            }
        }
    }
</script>