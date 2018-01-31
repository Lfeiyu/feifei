<template>
    <div id="login">
        <myHead goToBack="1" headMes="登录"></myHead>
        <div class="login_c">
            <div class="uname">
                <i class="el-icon-shangpin-wode"></i>
                <input type="text" name="username" placeholder="请输入手机号/邮箱" v-model="uname" />
            </div>
            <div class="psw">
                <i class="el-icon-shangpin-mima"></i>
                <input :type="password" name="password" placeholder="请输入登录密码" v-model="upsw" />
                <i :class="canSee" @touchstart.stop="changeShow"></i>
            </div>
            <button @touchend="goLogin" v-if="uname&&upsw">登录</button>
            <button disabled :class="grey" v-else>登录</button>
            <p class="animated fadeIn" v-show="show">{{hintMsg}}</p>
            <div class="change">
                <a href="#/reg">注册账号</a>
                <a href="#/message">短信登录</a>
                <a href="#/findpassword">忘记密码？</a>
            </div>
        </div>
        <div v-show="myShow==true">
            <div class="dk-spinner-mask"></div>
            <div class="dk-spinner dk-spinner-three-bounce">
                <div class="dk-bounce1"></div>
                <div class="dk-bounce2"></div>
                <div class="dk-bounce3"></div>
            </div>
        </div>
    </div>
</template>
<script>
    import '../../sass/login.scss';
    import myHead from '../head/head.vue';
    import http from '../../utils/reqAjax.js';
    export default{
        components:{
            myHead
        },
        data(){
            return{
                uname:'',
                upsw:'',
                grey:'grey',
                hintMsg:'',
                password:'password',
                show:false,
                myShow:false,
                Storage:window.sessionStorage,
                canSee:'el-icon-shangpin-buxianshimima'
            }
        },
        mounted(){
            document.querySelector('[name=username]').focus();
        },
        methods:{
            goLogin:function(){
                this.uname = this.uname.trim();
                this.upsw = this.upsw.trim();
                var reg1 = /^1[34578]\d{9}$/;
                var reg2 = /^[a-z][\da-z\-]{5,17}@[\da-z\-]{2,}(\.[a-z]{2,}){1,2}$/i;
                if(!reg1.test(this.uname) && !reg2.test(this.uname)){
                    this.hintMsg = '请输入正确的手机号或邮箱';
                    this.show = true;
                }else{
                    this.myShow = true;
                    http.post({url:'login',params:{username:this.uname,password:this.upsw}}).then(response => {
                        this.myShow = false;
                        if(response.data == 'no'){console.log(response);
                            this.hintMsg = '您输入的用户名或密码有误';
                            this.show = true;
                        }else{
                            this.hintMsg = '';
                            this.Storage.setItem('id',response.data);
                            this.Storage.setItem('name',this.uname);
                            this.$router.replace({path:'/mine'});
                        }
                    });
                }
            },
            changeShow:function(){
                if(this.password=='password'){
                    this.password = 'text';
                }else{
                    this.password = 'password';
                }
                if(this.canSee=='el-icon-shangpin-buxianshimima'){
                    this.canSee = 'el-icon-view'
                }else{
                    this.canSee = 'el-icon-shangpin-buxianshimima'
                }
            }
        }
    }
</script>