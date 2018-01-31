<template>
    <footer id="foot">
        <div>
            <a href="#/home" :class="homePage">
                <i class="el-icon-shangpin-shouye"></i>
                <span>首页</span>
            </a>
        </div>
        <div>
            <a href="#/girl" :class="categoryPage">
                <i class="el-icon-shangpin-fenlei"></i>
                <span>分类</span>
            </a>
        </div>
        <div>
            <a href="#/recommend" :class="recommendPage">
                <span>TOPSHOP</span>
            </a>
        </div>
        <div>
            <a href="#/wom" :class="brandPage">
                <i class="el-icon-shangpin-pinpai"></i>
                <span>品牌</span>
            </a>
        </div>
        <div>
            <a href="#/mine" :class="minePage">
                <i class="el-icon-shangpin-wode"></i>
                <span>我的</span>
            </a>
        </div>
    </footer>
</template>
<script>
    import '../../sass/foot.scss';
    export default{
        props:['minePage','homePage','categoryPage','brandPage','recommendPage']
    }
</script>