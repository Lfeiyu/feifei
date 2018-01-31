<template>
    <div id="message">
        <myHead headMes="找回密码" goToBack="1"></myHead>
        <div class="message_c">
            <div class="phone">
                <i class="el-icon-shangpin-wode"></i>
                <input type="text" name="uphone" placeholder="请输入手机号" v-model="uphone" />
            </div>
            <div class="yanZ">
                <i class="el-icon-shangpin-code"></i>
                <input type="text" name="uyanZ" placeholder="请输入图形验证码" v-model="uyanZ" />
                <div class="code" @click="refreshCode">
                    <identify :identifyCode="identifyCode"></identify>
                </div>
            </div>
            <button v-if="uphone&&uyanZ" @touchstart="goMessage">下一步</button>
            <button disabled :class="grey" v-else>下一步</button>
            <p class="animated fadeIn" v-show="show">{{hintMsg}}</p>
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
    import '../../sass/message.scss';
    import myHead from '../head/head.vue';
    import identify from '../identify/identify.vue';
    import http from '../../utils/reqAjax.js';
    export default{
        components:{
            myHead:myHead,
            identify:identify
        },
        data() {
            return {
              identifyCodes: "1234567890",
              identifyCode: "",
              grey:'grey',
              uphone:'',
              uyanZ:'',
              hintMsg:'',
              Storage:window.sessionStorage,
              show:false,
              myShow:false
            };
        },
        mounted() {
            document.querySelector('[name=uphone]').focus();
            this.identifyCode = "";
            this.makeCode(this.identifyCodes, 4);
        },
        methods: {
            randomNum(min, max) {
              return Math.floor(Math.random() * (max - min) + min);
            },
            refreshCode() {
              this.identifyCode = "";
              this.makeCode(this.identifyCodes, 4);
            },
            makeCode(o, l) {
              for (let i = 0; i < l; i++) {
                this.identifyCode += this.identifyCodes[
                  this.randomNum(0, this.identifyCodes.length)
                ];
              }
            },
            goMessage:function(){
                this.uphone = this.uphone.trim();
                this.uyanZ = this.uyanZ.trim();
                var reg1 = /^1[34578]\d{9}$/;
                var reg2 = /^[a-z][\da-z\-]{5,17}@[\da-z\-]{2,}(\.[a-z]{2,}){1,2}$/i;
                if(!reg1.test(this.uphone) && !reg2.test(this.uphone)){
                    this.hintMsg = '请输入正确的手机号或邮箱';
                    this.show = true;
                }else if(this.uyanZ != this.identifyCode){
                    this.hintMsg = '您输入的验证码有误';
                    this.show = true;
                }else{
                    this.myShow = true;
                    var url = 'verify?username='+this.uphone;
                    http.get({url:url}).then(response => {
                        this.myShow = false;
                        if(response.data == 'yes'){console.log(response);
                            this.hintMsg = '您输入的用户名不存在';
                            this.show = true;
                        }else if(response.data == 'no'){
                            this.hintMsg = '';
                            this.Storage.setItem('name',this.uphone);
                            this.$router.replace({path:'/mine'});
                        }
                    });
                }
            }
        }
    }
</script>