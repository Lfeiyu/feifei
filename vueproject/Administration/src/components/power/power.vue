<template>
    <div class="power">
        <datagrid api="htmanage" :filterCols='filterCols'></datagrid>
    </div>
</template>
<script>
    import datagrid from '../datagrid/datagrid.vue'
    // import spinner from '../spinner/spinner.vue'
    export default{
        data:function(){
            return{
                //  date: function(_date){
                //         var date = new Date(_date);
                //         var y = date.getFullYear();
                //         var M = date.getMonth() + 1;
                //         var d = date.getDate();
                //         var hour =date.getHours();
                //         var min = date.getMinutes();
                //         var second = date.getSeconds();
                //         return `${y}-${M}-${d} ${hour}:${min}:${second}`
                // },
                filterCols:['status','username','date','position']
            }
        },
        components:{
            datagrid:datagrid
        },
        mounted:function(){

        }
    }
</script>