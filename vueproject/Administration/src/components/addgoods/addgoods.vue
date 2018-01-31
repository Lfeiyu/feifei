<template>
    <div class="allGoods">
        <div class="search clearfix">
        </div>
        <div id="add_good">
            <el-form ref="form" :model="sizeForm" label-width="80px" size="large" class='clearfix'>
                    <el-form-item label="商品描述" class="cc">
                        <el-input v-model="sizeForm.title" class="shuru"></el-input>
                    </el-form-item>

                    <el-form-item label="品牌" class="cc">
                        <el-select v-model="sizeForm.brand" placeholder="请选择商品类型">
                            <el-option label="MO&CO" value="MO&CO"></el-option>
                            <el-option label="TOPSHOP" value="TOPSHOP"></el-option>
                            <el-option label="GUCCI" value="GUCCI"></el-option>
                        </el-select>
                    </el-form-item>

                <el-form-item label="商品类型" class="cc">
                    <el-select v-model="sizeForm.type" placeholder="请选择商品类型">
                        <el-option label="男士" value="男士"></el-option>
                        <el-option label="女士" value="女士"></el-option>
                        <el-option label="儿童" value="儿童"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="商品颜色" class="cc">
                    <el-select v-model="sizeForm.color" placeholder="请选择商品颜色">
                        <el-option label="白色" value="白色"></el-option>
                        <el-option label="黑色" value="黑色"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="尺寸" class="cc">
                    <el-select v-model="sizeForm.size" placeholder="请选择商品颜色">
                        <el-option label="s" value="s"></el-option>
                        <el-option label="m" value="m"></el-option>
                        <el-option label="L" value="L"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="预售价" class="cc">
                    <el-input v-model="sizeForm.saleprice" class="shuru"></el-input>
                </el-form-item>
                <el-form-item label="数量" class="cc">
                    <el-input v-model="sizeForm.qty" class="shuru"></el-input>
                </el-form-item>
                <el-form-item label="价钱" class="cc">
                    <el-input v-model="sizeForm.price" class="shuru"></el-input>
                </el-form-item>
                <el-form-item label="进货量" class="cc">
                    <el-input v-model="sizeForm.surplus" class="shuru"></el-input>
                </el-form-item>
                <el-form-item label="添加时间" class="cc">
                    <el-col :span="9">
                        <el-date-picker type="date" placeholder="选择日期" v-model="sizeForm.date1" style="width: 50%;">
                        </el-date-picker>
                    </el-col>
                    <el-col class="line" :span="4">---</el-col>
                    <el-col :span="9">
                        <el-time-picker type="fixed-time" placeholder="选择时间" v-model="sizeForm.date2" style="width: 50%;">
                        </el-time-picker>
                    </el-col>
                </el-form-item>
                <el-form-item size="large" class="cc">
                    <el-button type="primary" @click="onSubmit">立即添加</el-button>
                    <el-button>取消</el-button>
                </el-form-item>
            </el-form>
        </div>
   </div>
</template>
<script>
import './addgoods.scss'
  export default {
    data() {
        return {
            sizeForm:this.$store.state.addgoods
        };
    },
    methods: {
        onSubmit(){
            var now = this.sizeForm.date2;
            var date2 = new Date(now);
            this.sizeForm.date = date2.toLocaleString();
            var self = this;
            var params = {
                api:'htgoodsadd',
                data:this.sizeForm,
                self:self

            }
            this.$store.dispatch('refresh', params);
        }

    },
    mounted:function(){
    }
  };
</script>

<style>
</style>