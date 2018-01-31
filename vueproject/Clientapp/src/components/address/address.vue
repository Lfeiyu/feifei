<template>
    <div id="address">
        <myHead goToBack="1" headMes="我的收货地址"></myHead>
        <div class="address_c">
            <div class="cont_t" v-show="Storage.getItem('address')">
                <p>{{address}}11111</p>
                <span @touchstart.stop="deleteAddress">&times;</span>
            </div>
            <div class="cont_b">
                <p>新增地址</p>
            </div>
        </div>
    </div>
</template>
<script>
    import myHead from '../head/head.vue';
    import '../../sass/address.scss';
    export default{
        components:{
            myHead
        },
        data(){
            return{
                Storage:window.localStorage,
                address:''
            }
        },
        methods:{
            deleteAddress:function(e){
                var current = e.target.parentNode;
                current.parentNode.removeChild(current);
            }
        }
    }
</script>