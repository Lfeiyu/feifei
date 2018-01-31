<template>
    <div id="dialog">
    <el-dialog title="商品信息" :visible.sync="dialogFormVisible">
      <el-form :model="form" class="clearfix">
        <el-form-item label="id" :label-width="formLabelWidth">
          <el-input v-model="form.id" auto-complete="off"></el-input>
        </el-form-item>
         <el-form-item label="brand" :label-width="formLabelWidth">
          <el-input v-model="form.brand" auto-complete="off"></el-input>
        </el-form-item>
         <el-form-item label="title" :label-width="formLabelWidth">
          <el-input v-model="form.title" auto-complete="off"></el-input>
        </el-form-item>
         <el-form-item label="imgurl" :label-width="formLabelWidth">
          <el-input v-model="form.imgurl" auto-complete="off"></el-input>
        </el-form-item>
         <el-form-item label="price" :label-width="formLabelWidth">
          <el-input v-model="form.price" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="saleprice" :label-width="formLabelWidth">
          <el-input v-model="form.saleprice" auto-complete="off"></el-input>
        </el-form-item>
         <el-form-item label="color" :label-width="formLabelWidth">
          <el-input v-model="form.color" auto-complete="off"></el-input>
        </el-form-item>
         <el-form-item label="qty" :label-width="formLabelWidth">
          <el-input v-model="form.qty" auto-complete="off"></el-input>
        </el-form-item>
         </el-form-item>
         <el-form-item label="saleqty" :label-width="formLabelWidth">
          <el-input v-model="form.saleqty" auto-complete="off"></el-input>
        </el-form-item>
         </el-form-item>
         <el-form-item label="size" :label-width="formLabelWidth">
          <el-input v-model="form.size" auto-complete="off"></el-input>
        </el-form-item>
         </el-form-item>
         <el-form-item label="saleqty" :label-width="formLabelWidth">
          <el-input v-model="form.saleqty" auto-complete="off"></el-input>
        </el-form-item>
         </el-form-item>
        <el-form-item label="size" :label-width="formLabelWidth">
          <el-input v-model="form.size" auto-complete="off"></el-input>
        </el-form-item>

         <el-form-item label="type" :label-width="formLabelWidth">
          <el-input v-model="form.type" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="surplus" :label-width="formLabelWidth">
          <el-input v-model="form.surplus" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="date" :label-width="formLabelWidth">
              <el-col :span="9">
                  <el-date-picker type="date" placeholder="选择日期" v-model="form.date1" style="width: 100%;">
                  </el-date-picker>
              </el-col>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary"  @click='queding'>确 定</el-button>
      </div>
    </el-dialog>

    </div>
</template>
<script>
import http from '../../utils/reqAjax.js'
import './dialog.scss'
  export default {
    data() {
      return {
        gridData: [],
        cc:{},
        api:'',

        dialogFormVisible: false,
        formValidate:{},
        form: {
            date1:'',
            date2:'',
            id:'',
            brand:'',
            title:'',
            imgurl:'',
            price:'',
            saleprice:'',
            color:'',
            qty:'',
            saleqty:'',
            size:'',
            type:'',
            surplus:'',
            date:'',

            delivery: false,
            resource: '',
            desc: '',
            kinds:''
        },

        formLabelWidth: '120px'
      };
    },
    methods:{
        showTable(aa,bb){
          console.log(bb)
            this.gridData = aa;
            for(var i  in aa){
                this.cc = i;
            }
            this.form.date1 = aa.date;
            this.form.id = aa.id;
            this.form.brand = aa.brand;
            this.form.title = aa.title;
            this.form.imgurl = aa.imgurl;
            this.form.price = aa.price;
            this.form.saleprice = aa.saleprice;
            this.form.color = aa.color; 
            this.form.qty = aa.qty;
            this.form.saleqty = aa.saleqty;
            this.form.size = aa.size;
            this.form.type = aa.type;
            this.form.surplus = aa.surplus;
            // this.form.date1= lo;
            this.dialogFormVisible = true;
            this.kinds = bb;
        },
        queding:function(){
            var now = this.form.date1;
            var date2 = new Date(now);
            this.form.date = date2.toLocaleString();
            
            var shangpin = this.form;
            var _params = {
                api:this.$store.state.datagrid.api,
                kind:this.kinds
            }
            http.post({url:'htgoodsupdate','params':this.form}).then(res => {
                this.dialogFormVisible = false;
                this.$store.dispatch('goods',_params)


            })

        }

    }
  };
</script>
