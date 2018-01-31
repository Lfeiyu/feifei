<template>
    <div class="allgoods">
        <datagrid :filterCols='filterCols'  limit='11'></datagrid>
    </div>
</template>
<script>
    import datagrid from '../datagrid/datagrid.vue'
    import spinner from '../spinner/spinner.vue'
    export default{
        data:function(){
            return{
                filterCols:['brand','color','price','saleprice','saleqty','type','size','surplus','title']
            }
        },
        components:{
            spinner:spinner,
            datagrid:datagrid
        },
        mounted:function(){
            var params1 = {
                    api:'getall',
                    kind:''
            }
            this.$store.dispatch('goods',params1)
        }
    }
</script>