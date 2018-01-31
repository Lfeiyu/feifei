import Vue from 'vue';
import VueRouter from 'vue-router';
import ElementUI from 'element-ui';
import '../../node_modules/element-ui/lib/theme-chalk/index.css'
Vue.use(VueRouter);
Vue.use(ElementUI);
Vue.use(VueScroller);
Vue.use(VueLazyLoad,{
    error:'../../img/error.png',
    loading:require('../img/loading.gif'),
    preLoad: 1,
    attempt: 1
})
// 引入路由文件;
import VueScroller from 'vue-scroller'
import VueLazyLoad from 'vue-lazyload'

import home from '../components/home/home.vue';
import recommend from '../components/recommend/recommend.vue';


// import head from '../components/head/head.vue';
import mine from '../components/mine/mine.vue';
import reg from '../components/reg/reg.vue';
import login from '../components/login/login.vue';
import message from '../components/message/message.vue';
import findpassword from '../components/findpassword/findpassword.vue';
import search from '../components/search/search.vue';
import wishCatalog from '../components/wishCatalog/wishCatalog.vue';
import myOrder from '../components/myOrder/myOrder.vue';
import discountCoupon from '../components/discountCoupon/discountCoupon.vue';
import service from '../components/service/service.vue';
import payMethod from '../components/service/payMethod.vue';
import deliveryExplain from '../components/service/deliveryExplain.vue';
import userSafe from '../components/service/userSafe.vue';
import address from '../components/address/address.vue';
import setting from '../components/setting/setting.vue';
import billExplain from '../components/explainInfo/billExplain.vue';
import returnProduct from '../components/explainInfo/returnProduct.vue';
import returnExplain from '../components/explainInfo/returnExplain.vue';
import returnCare from '../components/explainInfo/returnCare.vue';
import returnPrice from '../components/explainInfo/returnPrice.vue';
import afterSale from '../components/explainInfo/afterSale.vue';
import honest from '../components/explainInfo/honest.vue';
import onlinePay from '../components/paymentMethods/onlinePay.vue';
import discountCouponPay from '../components/paymentMethods/discountCouponPay.vue';
import scrollHide from '../components/scrollHide/scrollHide.vue';


import details from '../components/details/details.vue';
import goods from '../components/goods/good.vue';
import car from '../components/cart/car.vue';
import brand from '../components/brand/brand.vue';
import wom from '../components/brand/wom.vue';
import man from '../components/brand/man.vue';
import children from '../components/brand/children.vue';
import categorys from '../components/categroys/categroy.vue';
import girl from '../components/categroys/girl.vue';
import nan from '../components/categroys/nan.vue';
import child from '../components/categroys/child.vue';
import order from '../components/orders/order.vue';
import pay from '../components/pay/pay.vue';

var router = new VueRouter({
    routes:[
         {
            path:'/',
            name:'home',
            component:home
        },
        {
            path:'/home',
            name:'home',
            component:home
        },

        {
            path:'/recommend',
            name:'recommend',
            component:recommend
        },
        {
            path:'/search',
            name:'search',
            component:search
        },
        {
            path:'/pay',
            name:'pay',
            component:pay
        },
        {
            path:'/mine',
            name:'mine',
            component:mine
        },
        {
            path:'/reg',
            name:'reg',
            component:reg
        },
        {
            path:'/login',
            name:'login',
            component:login
        },
        {
            path:'/message',
            name:'message',
            component:message
        },
        {
            path:'/findpassword',
            name:'findpassword',
            component:findpassword
        },
        {
            path:'/wishCatalog',
            name:'wishCatalog',
            component:wishCatalog
        },
        {
            path:'/myOrder',
            name:'myOrder',
            component:myOrder
        },
        {
            path:'/discountCoupon',
            name:'discountCoupon',
            component:discountCoupon
        },
        {
            path:'/service',
            name:'service',
            component:service,
            children:[
                {path:'payMethod',
                name:'payMethod',
                component:payMethod},
                {path:'deliveryExplain',
                name:'deliveryExplain',
                component:deliveryExplain},
                {path:'userSafe',
                name:'userSafe',
                component:userSafe}
            ]
        },
        {
            path:'/address',
            name:'address',
            component:address
        },
        {
            path:'/setting',
            name:'setting',
            component:setting
        },
        {
            path:'/billExplain',
            name:'billExplain',
            component:billExplain
        },
        {
            path:'/returnProduct',
            name:'returnProduct',
            component:returnProduct
        },
        {
            path:'/returnExplain',
            name:'returnExplain',
            component:returnExplain
        },
        {
            path:'/returnCare',
            name:'returnCare',
            component:returnCare
        },
        {
            path:'/returnPrice',
            name:'returnPrice',
            component:returnPrice
        },
        {
            path:'/afterSale',
            name:'afterSale',
            component:afterSale
        },
        {
            path:'/honest',
            name:'honest',
            component:honest
        },
        {
            path:'/onlinePay',
            name:'onlinePay',
            component:onlinePay
        },
        {
            path:'/discountCouponPay',
            name:'discountCouponPay',
            component:discountCouponPay
        },
        {
            path:'/scrollHide',
            name:'scrollHide',
            component:scrollHide
        },
        {
            path:'/',
            name:'home',
            component:home
        },
        {
            path:'/goods',
            name:'goods',
            component:goods
        },
        {
            path:'/details',
            name:'details',
            component:details
        },
        {
            path:'/car',
            name:'car',
            component:car
        },
        {
            path:'/brand',
            name:'brand',
            component:brand,
            children:[
                {
                    path:'/wom',
                    name:'wom',
                    component:wom
                },
                {
                    path:'/man',
                    name:'man',
                    component:man
                },
                {
                    path:'/children',
                    name:'children',
                    component:children
                }
            ]
        },
        {
            path:'/categorys',
            name:'categorys',
            component:categorys,
            children:[
                {
                    path:'/girl',
                    name:'girl',
                    component:girl
                },
                {
                    path:'/nan',
                    name:'nan',
                    component:nan
                },
                {
                    path:'/child',
                    name:'child',
                    component:child
                }
            ]
        },
        {
            path:'/order',
            name:'order',
            component:order
        }
    ]
})
export default router;
