import http from '../../utils/reqAjax.js'
const state = {
    sizeForm: {
        name: '',
        type: '',
        brand:'',
        title:'',
        qty:'',
        color:'',
        surplus:'',
        price:'',
        date1: '',
        date2: '',
        size:'',
        saleprice:'',
        delivery: false,
        formLabelWidth: '120px',
        date:''
    }
}
const mutations = {
    //事件
    refresh(data1,data2){
        data1.brand='';
        data1.type='';
        data1.title='';
        data1.qty='';

        data1.color='';
        data1.surplus='';
        data1.price='';
        data1.price='';
        data1.date1='';
        data1.date2='';
        data1.size='';
        data1.saleprice='';
    }
}
const actions = {
    refresh(context, _params){
        // console.log(_params)
        http.post({url:_params.api,params:_params.data}).then(res=>{

            if(res.data == 'yes'){
                _params.self.$alert('添加成功', {
                    confirmButtonText: '确定',
                    callback: action => {
                        context.commit('refresh',res);
                    }
                });
        }
        })

    }
}
export default{
    state,
    mutations,
    actions
}