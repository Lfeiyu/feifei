<template>
    <div class="login">
        <div class="form-horizontal">
            <h3>后台管理系统</h3>
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">用户名：</label>
                <div class="col-sm-10">
                    <i class="glyphicon glyphicon-user"></i>
                    <input type="text" class="form-control" id="username" v-model = 'username' @blur = 'lose'placeholder="请输入用户名">
                </div>

            </div>
            <p class="user" v-text='user'></p>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">密码：</label>
                <div class="col-sm-10">
                    <i class="glyphicon glyphicon-lock"></i>
                    <input type="password"  class="form-control" id="password" v-model = 'password' placeholder="请输入密码">
                    <span></span>
                </div>
            </div>
            <div class="form-group">
                <p class='position' >
                    职位：<label @click.stop='check($event)'><input type="radio" name="position" value="经理">经理</label><label @click.stop='check($event)'><input type="radio" name="position" value="员工">员工</label>
                </p>
            </div>
            <p class="pass"></p>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default btn-login" @click='login'>登录</button>
                    <button type="button" class="btn btn-default btn-clear" @click='clear'>清空</button>
                     <button type="button" class="btn btn-default" @click='reg'>去注册</button>
                </div>
            </div>
        </div>
        <spinner v-show="show"></spinner>
    </div>
</template>
<script>
    //引入样式或vue
    import './login.scss'
    import spinner from '../spinner/spinner.vue'
    import http from '../../utils/reqAjax.js'
    export default{
        data:function(){
            return {
                username: '',
                password:'',
                user:'',
                show:false,
                position:'',
            }
        },
        components:{
            spinner:spinner
        },
        methods:{
            check:function(e){
                this.position = e.path[0].value;
            },
            lose:function(){
                var url = 'htverify?username='+this.username;
                http.get({url:url}).then(res=>{
                    if(res.data == 'yes'){
                        this.user='用户未被注册';
                        return false;
                    }else{
                        this.user='';
                    }
                })
            },
            login:function(){
                if(this.username == ''||this.password == ''||this.position==''){
                    this.$alert('用户名或密码或职位不能为空', {
                        confirmButtonText: '确定',
                        callback: action => {
                        }
                    });
                    return false;
                }
                if(!/^[^\s]{5,19}$/.test(this.password)){
                    this.$alert('请设置五位以上的密码', {
                        confirmButtonText: '确定',
                        callback: action => {
                        }
                    });
                    return false;
                }
                this.show = true;
                http.post({'url':'htlogin','params':{username:this.username,password:this.password,position:this.position}}).then(res=>{
                    this.show = false;
                    if(res.data=='no'){
                        this.$alert('输入用户名或密码或职位有误', {
                            confirmButtonText: '确定',
                            callback: action => {
                            }
                        });
                    }else{
                        window.sessionStorage.setItem("username",this.username);
                        window.sessionStorage.setItem("position",this.position);
                        this.$router.push({name:'allgoods'});
                    }
                })
            },
            clear:function(){
                this.username = '';
                this.password = '';
                this.user = '';
            },
            reg:function(){
                this.$router.push({name:'reg'})
            },

        },
        mounted:function(){

        }
    }
</script>