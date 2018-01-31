<template>
    <div class="client">
       <!--  <datagrid api="user" :filterCols='filterCols' :kind='kind' limit='11'></datagrid> -->
    </div>
</template>
<script>
    import datagrid from '../datagrid/datagrid.vue'
    import spinner from '../spinner/spinner.vue'
    export default{
        data:function(){
            return{
                kind:'男士',
                filterCols:['user']
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