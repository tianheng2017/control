<template>
	<view class="content">
		<view class="button-demo">
			<u-button :ripple="true" :customStyle="customStyle" @click="toForm1">返沙人员信息填报</u-button>
		</view>
		<view class="button-demo">
			<u-button :ripple="true" :customStyle="customStyle" @click="toForm2">疫苗接种人员信息填报</u-button>
		</view>
		<view class="button-demo">
			<u-button :ripple="true" :customStyle="customStyle">购药人员自主填报</u-button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				customStyle: {
					width: '380rpx'
				},
			}
		},
		onLoad() {

		},
		methods: {
			toForm1(){
				setTimeout(() => {
					this.$u.route('pages/form1/form1')
				}, 500)
			},
			toForm2(){
				setTimeout(() => {
					this.$u.route('pages/form2/form2')
				}, 500)
			}
		}
	}
</script>

<style lang="scss" scoped>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		padding: 40rpx;
	}

	.button-demo {
		margin-top: 80rpx;
	}
	
	.link-demo {
		margin-top: 80rpx;
	}
</style>
