<template>
    <div id="reg">
        <myHead headMes="注册" goToBack="1"></myHead>
        <div class="reg_c">
            <div class="phone">
                <i class="el-icon-shangpin-wode"></i>
                <input type="text" name="uphone" placeholder="请输入常用手机号" v-model="uphone" />
            </div>
            <div class="psw">
                <i class="el-icon-shangpin-mima"></i>
                <input :type="password" name="password1" placeholder="请输入登录密码" v-model="upsw1" />
                <i :class="canSee" @touchstart.stop="changeShow"></i>
            </div>
            <div class="psw">
                <i class="el-icon-shangpin-mima"></i>
                <input :type="password" name="password2" placeholder="请再次输入登录密码" v-model="upsw2" />
                <i :class="canSee" @touchstart.stop="changeShow"></i>
            </div>
            <button v-if="uphone&&upsw1&&upsw2" @touchend.stop="goRegister">下一步</button>
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
    import '../../sass/reg.scss';
    import myHead from '../head/head.vue';
    import http from '../../utils/reqAjax.js';
    export default{
        components:{
            myHead
        },
        data() {
            return {
              grey:'grey',
              upsw1:'',
              upsw2:'',
              uphone:'',
              hintMsg:'',
              Storage:window.sessionStorage,
              password:'password',
              show:false,
              myShow:false,
              canSee:'el-icon-shangpin-buxianshimima'
            }
        },
        mounted() {
            document.querySelector('[name=uphone]').focus();
        },
        methods: {
            goRegister:function(){window.sessionStorage.setItem('id','');
              this.uphone = this.uphone.trim();
              this.upsw1 = this.upsw1.trim();
              this.upsw2 = this.upsw2.trim();
              var reg1 = /^1[34578]\d{9}$/;
              var reg2 = /^[a-z][\da-z\-]{5,17}@[\da-z\-]{2,}(\.[a-z]{2,}){1,2}$/i;
              var reg3 = /^[^\.\s]{6,18}$/i;
              if(!reg1.test(this.uphone) && !reg2.test(this.uphone)){
                  this.hintMsg = '请输入正确的手机号或邮箱';
                  this.show = true;
              }else if(!reg3.test(this.upsw1) || !reg3.test(this.upsw2)){
                  this.hintMsg = '您输入的密码格式不正确';
                  this.show = true;
              }else if(this.upsw1 != this.upsw2){
                  this.hintMsg = '您两次输入的密码不一致';
                  this.show = true;
              }else{
                  this.myShow = true;
                  var url = 'reg?username='+this.uphone +'&password='+this.upsw1;
                  http.get({url:url}).then(response => {
                      this.myShow = false;
                      if(response.data == 'yes'){
                          this.Storage.setItem('name',this.uphone);
                          this.Storage.setItem('proNum',0);
                          this.$router.replace({path:'/mine'});
                      }else if(response.data == 'no'){
                          this.hintMsg = '该用户名已被注册，请重新输入';
                          this.show = true;
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