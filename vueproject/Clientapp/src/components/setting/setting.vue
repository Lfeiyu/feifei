<template>
    <div id="setting">
        <myHead goToBack="1" headMes="设置"></myHead>
        <div class="setting_c">
            <ul>
                <li><a href="#">修改密码<i class="el-icon-arrow-right"></i></a></li>
                <li><a href="#">手机<i class="el-icon-arrow-right"></i></a></li>
                <li><a href="#">邮箱<i class="el-icon-arrow-right"></i></a></li>
            </ul>
            <button @touchstart="quitLogin">退出登录</button>
        </div>
    </div>
</template>
<script>
    import myHead from '../head/head.vue';
    import '../../sass/setting.scss';
    export default{
        components:{
            myHead
        },
        data(){
            return{
                Storage:window.sessionStorage
            }
        },
        methods:{
            quitLogin:function(){
                this.Storage.setItem('name','');
                this.Storage.setItem('id','');
                this.Storage.setItem('proNum',0);
                this.$router.replace({path:'/login'});
            }
        }
    }
</script>