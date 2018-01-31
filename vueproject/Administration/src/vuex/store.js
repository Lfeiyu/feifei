import Vue from 'vue';
import Vuex from 'vuex';
import datagrid from '../components/datagrid/datagrid.js'
import addgoods from '../components/addgoods/addgoods.js'
import goods from '../components/goods/goods.js'
Vue.use(Vuex);

const store = new Vuex.Store({
    modules: {
        datagrid,
        addgoods,
        goods
    }
})
export default store;
