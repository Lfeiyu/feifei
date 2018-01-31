<template>
	<div class="box">
		<ul class="categroy" v-if='categroy.length>0'>
			<li v-for="item in categroy">
				<router-link to="goods">{{item}}</router-link>
			</li>
		</ul>
		<ul class="zm" v-if='categroy.length>0'>
			<li  v-for="item in zm"  @click="$router.push({name:'recommend'})">
				<a href="#">{{item}}</a>
				<span></span>
			</li>
		</ul>
	</div>
</template>
<script>
	import './comme.scss'
	export default{
		data(){
			return {
				categroy:['FDJLJGL','SUBGO','JFDLSJFLJFIEJ','EKDFKKFK','AALFJFRJ','GOOSE','FDFSKFIKTK','FDKFDF','TIFIWJ'],
				zm:['Cogngjio','Bgjicig','Comging','Dengp','Expenxe','Fafhing','Ggomge','Hnud','Isoin','Jeon','Kense','Lolan','Mean','Nsn','Osoe','Pande','Quesion','Rose','Spring','Ttels','Unicod','Vocode','Wand','Strilde','Yange','Zooz']
			}
		}
	}
</script>