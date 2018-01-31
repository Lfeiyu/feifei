<template>
    <div class="seek">
        <datagrid :filterCols='filterCols'></datagrid>
    </div>
</template>
<script>
    import datagrid from '../datagrid/datagrid.vue'
    import spinner from '../spinner/spinner.vue'
    export default{
        data:function(){
            return{
                filterCols:['brand','color','price','saleprice','saleqty','type','title']
            }
        },
        components:{
            spinner:spinner,
            datagrid:datagrid
        },
        mounted:function(){

        }
    }
</script>