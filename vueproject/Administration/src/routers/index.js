import Vue from 'vue';
import VueRouter from 'vue-router';
import ElementUI from 'element-ui';
import '../../node_modules/element-ui/lib/theme-chalk/index.css'
Vue.use(VueRouter);
Vue.use(ElementUI);
// 引入路由文件;

import home from '../components/home/home.vue'
import login from '../components/LoginComponent/login.vue'
import reg from '../components/RegComponent/reg.vue'
import goods from '../components/goods/goods.vue'
import seek from '../components/seek/seek.vue'
import allgoods from '../components/allgoods/allgoods.vue'
import order from '../components/order/order.vue'
import client from '../components/client/client.vue'
import addgoods from '../components/addgoods/addgoods.vue'
import dialog from '../components/Dialog/dialog.vue'
import power from '../components/power/power.vue'
// import aa from '../components/aa.vue'
var router = new VueRouter({
    routes:[
        {
            path:'/',
            name:'login',
            component:login
        },
        {
            path:'/reg',
            name:'reg',
            component:reg
        },
        {
            path:'/home',
            name:'home',
            component:home,
            children: [
                {
                    path: '/goods',
                    name: 'goods',
                    component: goods
                }, 
                {
                    path: '/seek',
                    name: 'seek',
                    component: seek
                },
                {
                    path: '/allgoods',
                    name: 'allgoods',
                    component: allgoods
                },
                {
                    path: '/order',
                    name: 'order',
                    component: order
                },
                {
                    path: '/client',
                    name: 'client',
                    component: client
                },
                {
                    path: '/power',
                    name: 'power',
                    component:power
                },
                {
                    path: '/addgoods',
                    name: 'addgoods',
                    component: addgoods
                },
                {
                    path: '/dialog',
                    name: 'dialog',
                    component: dialog
                }
                // {
                //     path: '/aa',
                //     name: 'aa',
                //     component: aa
                // }
            ]
        }
    ]
})
export default router;
