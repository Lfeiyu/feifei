<template>
    <div class="goods_class">
        <table class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th v-for="(value, key) in $store.state.datagrid.dataset[0]" v-if="filterCols.indexOf(key)> -1">{{key}}
                    <th>编辑</th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in $store.state.datagrid.dataset">
                    <td v-for="(value, key) in item"  v-if="filterCols.indexOf(key) >-1">
                        <span>{{item[key]}}</span>
                    </td>
                    <td>
                        <span @click.prevent="deleteRow($event,index,$store.state.datagrid.dataset)">删除</span>
                        <span v-if="$route.name!='power'" @click.prevent="deleteRow($event,index,$store.state.datagrid.dataset)">修改</span>
                        <span v-else @click.prevent="deleteRow($event,index,$store.state.datagrid.dataset)">修改权限</span>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="page">
            <ul  class="pagination" @click='fy($event)'>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item" v-for="p in $store.state.datagrid.pagecount"><a class="page-link" href="#">{{p}}</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </div>
        <dialog1 ref = 'showDialog'></dialog1>
    </div>
</template>

<script>
    import http from '../../utils/reqAjax.js'
    import './datagrid.scss'
    import dialog1 from '../Dialog/dialog.vue'
    export default {
        data: function(){
            return {
                // dataset:[],
                // pagecount: 0,
                // page: 1,
                app:'',
                Cols:[],
                cent:[],
                seekword:'',
                position:sessionStorage.getItem("position")
            }
        },
        beforeMount(){
            var self = this;
            var params = {
                data: {
                    date: '2018-1-30',
                }
            }
            this.$store.dispatch('goods', params);
        },
        props: ['api', 'filterCols'],
        methods:{
            //删除与修改请求
            deleteRow:function(e,index,rows){
                // console.log(e,index,rows)
                var text = e.path[0].innerText;
                var id = rows[index].id;

                if(text =='修改'){
                    console.log(this.$route.name)
                    if(this.$route.name=='power'){
                        console.log(55)
                    }else{

                        var datatile =[];
                        var url = this.app + 'htgoodsselect?goodsid='+id ;
                        console.log(url)
                        http.get({url: url}).then(res => {
                            datatile = res.data.data.results[0];
                            this.$refs.showDialog.showTable(datatile,this.$store.state.datagrid.kind);

                        })
                    }
                }else if(text =='删除'){
                    // console.log(this.position)
                    // if(this.position=='员工')
                    var url = this.app + 'htgoodsdel?goodsid='+id;
                    http.get({url: url}).then(res => {
                        console.log(res.data.status)
                        if(res.data.status==true){
                            this.$alert('确定删除吗', {
                                confirmButtonText: '确定',
                                callback: action => {
                                    rows.splice(index, 1);
                                }
                            });
                        }
                    })
                }
            },
            seek:function(cc){
                // this.kind = cc;
                var params1 = {
                    api:'seek',
                    page:this.$store.state.datagrid.page,
                    kind:cc
                }
                this.$store.dispatch('goods',params1)
            },
            fy:function(e){
                if(e.target.tagName == 'A' && !isNaN(e.target.innerText)){
                    this.$store.state.datagrid.page = e.target.innerText;
                    var params1 = {
                        api:this.$store.state.datagrid.api,
                        page:this.$store.state.datagrid.page,
                        kind:this.$store.state.datagrid.kind
                    }
                    this.$store.dispatch('goods',params1)
                }
            }
        },
        components:{
            dialog1:dialog1
        },
        mounted(){
            this.Cols = this.filterCols ? this.filterCols: [];
            // var url = this.api + '?keyword='+ this.kind + '&limit='+this.limit + '&page='+this.page;
            // http.get({url: url}).then(res =>{
            //         this.dataset = res.data.data.results[0];
            //         var rowscount = res.data.data.results[1][0]['rowscount'];
            //         this.pagecount = Math.ceil(rowscount/this.limit);
            // })
            // if(this.$route.name =='seek'){
            // }else if(this.$route.name =='goods'){
            //     var url = this.api + '?keyword='+ this.kind + '&limit='+this.limit + '&page='+this.page;
            //     http.get({url: url}).then(res =>{
            //         this.dataset = res.data.data.results[0];
            //         var rowscount = res.data.data.results[1][0]['rowscount'];
            //         this.pagecount = Math.ceil(rowscount/this.limit);
            //     })

            // }else{
            //     var url = this.api  + '?limit='+this.limit + '&page='+this.page;
            //     http.get({url: url}).then(res =>{
            //         this.dataset = res.data.data.results[0];
            //         var rowscount = res.data.data.results[1][0]['rowscount'];
            //         this.pagecount = Math.ceil(rowscount/this.limit);
            //     })
            // }
        }
    }
</script>