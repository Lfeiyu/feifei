<template>
    <div class="goods">
        <datagrid :filterCols='filterCols'  limit='11' :goodskind='kind' ></datagrid>
    </div>
</template>
<script>
    import datagrid from '../datagrid/datagrid.vue'
    import spinner from '../spinner/spinner.vue'
    export default{
        data:function(){
            return{
                kind:this.$route.params.key,
                filterCols:['brand','color','price','saleprice','saleqty','type','title']
            }
        },
        components:{
            spinner:spinner,
            datagrid:datagrid
        },
        methods:{

        },
        mounted:function(){
            var params = {
                api:'getcommodity',
                kind:'男士'
            }
            this.$store.dispatch('goods',params)

        }
    }
</script>