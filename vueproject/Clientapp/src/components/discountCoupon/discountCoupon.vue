<template>
    <div id="discountCoupon">
        <myHead goToBack="1" headMes="卡券"></myHead>
        <div class="cont_c">
            <div class="cont_c_t" @touchstart.stop="changeColor">
                <span class="active">优惠券</span>
                <span>礼品卡</span>
            </div>
            <div class="cont_c_b">{{content}}</div>
        </div>
    </div>
</template>
<script>
    import myHead from '../head/head.vue';
    import '../../sass/discountCoupon.scss';
    export default{
        components:{
            myHead
        },
        data(){
            return{
                content:'暂无优惠券'
            }
        },
        methods:{
            changeColor:function(e){
                var spans = document.querySelectorAll('.cont_c span');
                var len = spans.length;
                for(var i=0;i<len;i++){
                    spans[i].classList.remove('active');
                }
                e.target.classList.add('active');
                this.content = '暂无'+e.target.innerText;
            }
        }
    }
</script>