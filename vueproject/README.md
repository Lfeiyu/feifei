H1707第六组vue项目---尚品网

##项目开发组
	组长：龙飞宇
	组员：周会军，冯志伟，韦职丽，林青璇	
##任务分配：
	龙飞宇：数据库，客户端和后台管理系统的后台接口
	周会军：登录注册页面，个人中心
	冯志伟：后台管理系统，客户端列表和详情的后台接口
	韦职丽；品牌页，分类页有列表详情页，购物车及订单页面
	林青璇：首页，推荐页
##项目结构
	Clientapp---客户端app
	api----后台接口
	Administration ---后台管理系统

##项目应用
	vue + node.js + mysql

# project

> A Vue.js project

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build
```

For detailed explanation on how things work, consult the [docs for vue-loader](http://vuejs.github.io/vue-loader).


文件夹 PATH 列表
卷序列号为 CE2F-63AD
C:.
│  .gitignore
│  h1707_6_spw.sql
│  README.md
│  tree.txt
│  尚品网需求分析.xmind
│  
├─Administration
│  │  .babelrc
│  │  .editorconfig
│  │  .gitignore
│  │  index.html
│  │  package-lock.json
│  │  package.json
│  │  README.md
│  │  tree.txt
│  │  webpack.config.js
│  │  
│  ├─dist
│  │      2fad952a20fbbcfd1bf2ebb210dccf7a.woff
│  │      448c34a56d699c29117adc64c43affeb.woff2
│  │      6f0a76321d30f3c8120915e57f7bd77e.ttf
│  │      89889688147bd7575d6327160d64e760.svg
│  │      build.js
│  │      build.js.map
│  │      e18bbf611f2a2e43afc071aa2f4e1512.ttf
│  │      f4769f9bdb7466be65088239c12046d1.eot
│  │      fa2772327f55d8198301fdb8bcfc8158.woff
│  │      glyphicons-halflings-regular.svg
│  │      time1.jpg
│  │      
│  └─src
│      │  App.vue
│      │  main.js
│      │  
│      ├─assets
│      │  │  logo.png
│      │  │  time1.jpg
│      │  │  
│      │  └─lib
│      │      │  jquery-3.2.1.min.js
│      │      │  
│      │      └─bootstrap
│      │          ├─css
│      │          │      bootstrap-theme.css
│      │          │      bootstrap-theme.css.map
│      │          │      bootstrap-theme.min.css
│      │          │      bootstrap-theme.min.css.map
│      │          │      bootstrap.css
│      │          │      bootstrap.css.map
│      │          │      bootstrap.min.css
│      │          │      bootstrap.min.css.map
│      │          │      
│      │          ├─fonts
│      │          │      glyphicons-halflings-regular.eot
│      │          │      glyphicons-halflings-regular.svg
│      │          │      glyphicons-halflings-regular.ttf
│      │          │      glyphicons-halflings-regular.woff
│      │          │      glyphicons-halflings-regular.woff2
│      │          │      
│      │          └─js
│      │                  bootstrap.js
│      │                  bootstrap.min.js
│      │                  npm.js
│      │                  
│      ├─components
│      │  ├─addgoods
│      │  │      addgoods.js
│      │  │      addgoods.scss
│      │  │      addgoods.vue
│      │  │      
│      │  ├─allgoods
│      │  │      allgoods.scss
│      │  │      allgoods.vue
│      │  │      
│      │  ├─client
│      │  │      client.vue
│      │  │      
│      │  ├─datagrid
│      │  │      datagrid.js
│      │  │      datagrid.scss
│      │  │      datagrid.vue
│      │  │      
│      │  ├─Dialog
│      │  │      dialog.scss
│      │  │      dialog.vue
│      │  │      
│      │  ├─goods
│      │  │      goods.js
│      │  │      goods.vue
│      │  │      
│      │  ├─home
│      │  │      home.scss
│      │  │      home.vue
│      │  │      
│      │  ├─LoginComponent
│      │  │      login.scss
│      │  │      login.vue
│      │  │      
│      │  ├─order
│      │  │      order.scss
│      │  │      order.vue
│      │  │      
│      │  ├─power
│      │  │      power.vue
│      │  │      
│      │  ├─RegComponent
│      │  │      reg.scss
│      │  │      reg.vue
│      │  │      
│      │  ├─seek
│      │  │      seek.scss
│      │  │      seek.vue
│      │  │      
│      │  └─spinner
│      │          spinner.scss
│      │          spinner.vue
│      │          
│      ├─routers
│      │      index.js
│      │      
│      ├─sass
│      │      base.scss
│      │      
│      ├─utils
│      │      reqAjax.js
│      │      
│      └─vuex
│              store.js
│              
├─api
│  │  package-lock.json
│  │  package.json
│  │  
│  └─src
│      │  server.js
│      │  
│      ├─db
│      │      db.js
│      │      
│      └─router
│              cart.js
│              customers.js
│              htlist.js
│              htorder.js
│              htuser.js
│              index.js
│              list.js
│              management.js
│              order.js
│              reglogin.js
│              
└─Clientapp
    │  .babelrc
    │  .editorconfig
    │  .gitignore
    │  index.html
    │  list.txt
    │  package-lock.json
    │  package.json
    │  README.md
    │  webpack.config.js
    │  
    ├─dist
    │      2fad952a20fbbcfd1bf2ebb210dccf7a.woff
    │      6f0a76321d30f3c8120915e57f7bd77e.ttf
    │      79dc0071d72774cde81e284fadc5562c.svg
    │      back.png
    │      build.js
    │      build.js.map
    │      de0d746a7dcde464069751c211767d45.ttf
    │      df2b98c3653b7577b8ed49ecf19e28fe.eot
    │      home1.jpg
    │      home2.gif
    │      homeLike1.jpg
    │      homeLike2.jpg
    │      homeLike3.jpg
    │      homeLike4.jpg
    │      homeLike5.jpg
    │      homeLike6.jpg
    │      homeLike7.jpg
    │      honest.png
    │      iconfont.svg
    │      loading.gif
    │      mine_big.png
    │      mine_main.png
    │      recommendFang1.jpg
    │      recommendFang2.jpg
    │      recommendFang3.jpg
    │      recommendFang4.jpg
    │      recommendImg1.jpg
    │      recommendImg2.jpg
    │      recommendImg3.jpg
    │      recommendImg4.jpg
    │      recommendImg5.jpg
    │      recommendImg6.jpg
    │      recommendImg7.jpg
    │      recommendMan.jpg
    │      recommendNew.jpg
    │      recommendType.jpg
    │      recommendType1.jpg
    │      recommendType10.jpg
    │      recommendType11.jpg
    │      recommendType12.jpg
    │      recommendType2.jpg
    │      recommendType3.jpg
    │      recommendType4.jpg
    │      recommendType5.jpg
    │      recommendType6.jpg
    │      recommendType7.jpg
    │      recommendType8.jpg
    │      recommendType9.jpg
    │      
    └─src
        │  App.vue
        │  main.js
        │  
        ├─assets
        │  │  logo.png
        │  │  
        │  ├─css
        │  │      animate.css
        │  │      
        │  ├─font-icon11
        │  │      demo.css
        │  │      demo_fontclass.html
        │  │      demo_symbol.html
        │  │      demo_unicode.html
        │  │      iconfont.css
        │  │      iconfont.eot
        │  │      iconfont.js
        │  │      iconfont.svg
        │  │      iconfont.ttf
        │  │      iconfont.woff
        │  │     
        │  │          
        │  └─lib
        │      └─bootstrap
        │          ├─css
        │          │      bootstrap-theme.css
        │          │      bootstrap-theme.css.map
        │          │      bootstrap-theme.min.css
        │          │      bootstrap-theme.min.css.map
        │          │      bootstrap.css
        │          │      bootstrap.css.map
        │          │      bootstrap.min.css
        │          │      bootstrap.min.css.map
        │          │      
        │          ├─fonts
        │          │      glyphicons-halflings-regular.eot
        │          │      glyphicons-halflings-regular.svg
        │          │      glyphicons-halflings-regular.ttf
        │          │      glyphicons-halflings-regular.woff
        │          │      glyphicons-halflings-regular.woff2
        │          │      
        │          └─js
        │                  bootstrap.js
        │                  bootstrap.min.js
        │                  npm.js
        │                  
        ├─components
        │  ├─address
        │  │      address.vue
        │  │      
        │  ├─brand
        │  │      brand.scss
        │  │      brand.vue
        │  │      children.vue
        │  │      comme.scss
        │  │      man.vue
        │  │      wom.vue
        │  │      
        │  ├─cart
        │  │      car.scss
        │  │      car.vue
        │  │      
        │  ├─categroys
        │  │      categroy.scss
        │  │      categroy.vue
        │  │      child.vue
        │  │      girl.vue
        │  │      nan.vue
        │  │      same.scss
        │  │      
        │  ├─details
        │  │      details.scss
        │  │      details.vue
        │  │      
        │  ├─discountCoupon
        │  │      discountCoupon.vue
        │  │      
        │  ├─explainInfo
        │  │      afterSale.vue
        │  │      billExplain.vue
        │  │      honest.vue
        │  │      returnCare.vue
        │  │      returnExplain.vue
        │  │      returnPrice.vue
        │  │      returnProduct.vue
        │  │      
        │  ├─findpassword
        │  │      findpassword.vue
        │  │      
        │  ├─foot
        │  │      foot.vue
        │  │      
        │  ├─goods
        │  │      good.vue
        │  │      goods.scss
        │  │      
        │  ├─head
        │  │      head.vue
        │  │      
        │  ├─home
        │  │      home.scss
        │  │      home.vue
        │  │      
        │  ├─identify
        │  │      identify.vue
        │  │      
        │  ├─login
        │  │      login.vue
        │  │      
        │  ├─message
        │  │      message.vue
        │  │      
        │  ├─mine
        │  │      mine.vue
        │  │      
        │  ├─myOrder
        │  │      myOrder.vue
        │  │      
        │  ├─orders
        │  │      order.scss
        │  │      order.vue
        │  │      
        │  ├─pay
        │  │      pay.scss
        │  │      pay.vue
        │  │      
        │  ├─paymentMethods
        │  │      discountCouponPay.scss
        │  │      discountCouponPay.vue
        │  │      onlinePay.scss
        │  │      onlinePay.vue
        │  │      payMethod.vue
        │  │      
        │  ├─recommend
        │  │      re.js
        │  │      recommend.scss
        │  │      recommend.vue
        │  │      
        │  ├─reg
        │  │      reg.vue
        │  │      
        │  ├─scrollHide
        │  │      scrollHide.vue
        │  │      
        │  ├─search
        │  │      search.vue
        │  │      
        │  ├─service
        │  │      deliveryExplain.vue
        │  │      payMethod.vue
        │  │      service.vue
        │  │      userSafe.vue
        │  │      
        │  ├─setting
        │  │      setting.vue
        │  │      
        │  └─wishCatalog
        │          wishCatalog.vue
        │          
        ├─routers
        │      index.js
        │      
        ├─sass
        │      address.scss
        │      afterSale.scss
        │      base.scss
        │      billExplain.scss
        │      discountCoupon.scss
        │      findpassword.scss
        │      foot.scss
        │      head.scss
        │      honest.scss
        │      login.scss
        │      message.scss
        │      mine.scss
        │      myOrder.scss
        │      reg.scss
        │      returnCare.scss
        │      returnExplain.scss
        │      returnPrice.scss
        │      returnProduct.scss
        │      scrollHide.scss
        │      search.scss
        │      service.scss
        │      setting.scss
        │      spinner.scss
        │      wishCatalog.scss
        │      
        ├─utils
        │      getRem.js
        │      reqAjax.js
        │      
        └─vuex
                common.js
                store.js
                
###########V1.0.0 版本内容更新