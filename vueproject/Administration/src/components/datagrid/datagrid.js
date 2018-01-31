import http from '../../utils/reqAjax.js'
const state = {
    dataset: [],
    pagecount: 0,
    page: 1,
    limit:11,
    api:'',
    kind:'',
    date: function(_date){
        var date = new Date(_date);
        var y = date.getFullYear();
        var M = date.getMonth() + 1;
        var d = date.getDate();
        return `${y}-${M}-${d}`;
    }

}
const mutations = {
    //事件
    //分类
    good:function(data,daya2){
        if(daya2.kind!=state.kind){
            state.page = 1;
        }
        state.api = daya2.api;
        state.kind = daya2.kind;
        state.dataset = daya2.dataset
        state.pagecount = Math.ceil(daya2.rowscount/state.limit);
    },
    // order:function(data,daya2){
    //     // if(daya2.kind!=state.kind){
    //     //     state.page = 1;
    //     // }
    //     console.log(daya2)
    //     state.api = daya2.api;
    //     // state.kind = daya2.kind;
    //     state.dataset = daya2.dataset
    //     state.pagecount = Math.ceil(daya2.rowscount/state.limit);
    // }

}

const actions = {
    goods(context, _params){
        console.log(_params)
        var url = _params.api + '?keyword='+ _params.kind + '&limit='+state.limit + '&page='+state.page;
        http.get({url: url}).then(res => {
            var params = {
                api:_params.api,
                kind:_params.kind,
                dataset:res.data.data.results[0],
                rowscount:res.data.data.results[1][0]['rowscount']
            }
            context.commit('good',params)
        })
    }
    // order(context, _params){
    //     var url = _params.api + '?date='+ _params.date + '&limit='+state.limit + '&page='+state.page;
    //     http.get({url: url}).then(res => {
    //         console.log(res)
    //         var params = {
    //             api:_params.api,
    //             dataset:res.data.data.results[0],
    //             rowscount:res.data.data.results[1][0]['rowscount']
    //         }
    //         context.commit('order',params)
    //     })
    // }
}
export default{
    state,
    mutations,
    actions
}