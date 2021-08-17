<template>
	<view class="wrap">
		<u-form :model="model" :rules="rules" ref="uForm" :errorType="errorType">
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="姓名" prop="name">
				<u-input :border="border" placeholder="请输入姓名" v-model="model.name" type="text"></u-input>
			</u-form-item>
			<u-form-item :label-style="labelStyle"  :label-position="labelPosition" label="身份证号" prop="id_card">
				<u-input :border="border" placeholder="请输入身份证号" v-model="model.id_card" type="text"></u-input>
			</u-form-item>
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="居住地址" prop="living">
				<u-input type="textarea" :border="border" placeholder="请填写现居住地址" v-model="model.living" :height="150" />
			</u-form-item>
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="居住地所属社区" prop="community_lable">
				<u-input :border="border" type="select" :select-open="selectShow" v-model="model.community_lable" placeholder="请选择居住地所属社区" @click="selectShow = true"></u-input>
			</u-form-item>
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="接种时间" prop="vaccination_time">
				<u-input :border="border" type="select" :select-open="vaccinationTimeShow" v-model="model.vaccination_time" placeholder="请选择接种时间" @click="vaccinationTimeShow = true"></u-input>
			</u-form-item>
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="接种剂次" prop="dosage_lable">
				<u-input :border="border" type="select" :select-open="dosageShow" v-model="model.dosage_lable" placeholder="请选择接种剂次" @click="dosageShow = true"></u-input>
			</u-form-item>
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="手机号码" prop="mobile">
				<u-input :border="border" placeholder="请输入手机号" v-model="model.mobile" type="number"></u-input>
			</u-form-item>
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="验证码" prop="code">
				<u-input :border="border" placeholder="请输入验证码" v-model="model.code" type="text"></u-input>
				<u-button slot="right" type="success" size="mini" @click="getCode">{{codeTips}}</u-button>
			</u-form-item>
		</u-form>
		<u-button @click="submit" type="success" class="u-margin-top-80 u-margin-bottom-80">提交</u-button>
		<!-- 居住地所属社区 -->
		<u-select mode="single-column" :default-value="selectDefault" :list="selectList" v-model="selectShow" @confirm="selectConfirm"></u-select>
		<!-- 接种时间 -->
		<u-picker :params="params" title="接种时间" :start-year="2018" :end-year="2030" mode="time" v-model="vaccinationTimeShow" @confirm="vaccinationTimeConfirm"></u-picker>
		<!-- 接种剂次 -->
		<u-select mode="single-column" :default-value="dosageDefault" :list="dosageList" v-model="dosageShow" @confirm="dosageConfirm"></u-select>
		<!-- 验证码 -->
		<u-verification-code seconds="60" ref="uCode" @change="codeChange"></u-verification-code>
		<!-- 弹窗 -->
		<u-toast ref="uToast" />
	</view>
</template>

<script>
export default {
	data() {
		let that = this;
		return {
			model: {
				name: '',
				sex: '',
				id_card: '',
				living: '',
				community: '',
				community_lable: '',
				vaccination_time: '',
				dosage: '',
				dosage_lable: '',
				mobile: '',
				code: '',
				code_id:'',
			},
			border: true,
			check: false,
			
			selectShow: false,
			vaccinationTimeShow: false,
			dosageShow: false,
			
			labelPosition: 'top',
			labelStyle: {
				fontWeight: 'bold',
			},
			codeTips: '',
			errorType: ['message','border'],

			selectList: [],
			selectDefault: [0],
			
			dosageList: [
				{
					label:'第1剂',
					value: 1,
					extra: 1,
				}
				,{
					label:'第2剂',
					value: 2,
					extra: 2,
				}
				,{
					label:'第3剂',
					value: 3,
					extra: 3,
				}
			],
			dosageDefault: [0],
			
			params: {
				year: true,
				month: true,
				day: true,
				hour: true,
				minute: true
			},
			rules: {
				name: [
					{
						required: true,
						message: '请输入姓名',
						trigger: 'blur' ,
					},
					{
						min: 2,
						max: 5,
						message: '姓名长度在2到5个字符',
						trigger: ['blur'],
					},
					{
						validator: (rule, value, callback) => {
							return this.$u.test.chinese(value);
						},
						message: '姓名必须为中文',
						trigger: ['blur'],
					},
				],
				id_card: [
					{
						validator: (rule, value, callback) => {
							return this.$u.test.idCard(value);
						},
						message: '身份证号格式不正确',
						trigger: ['change','blur'],
					}
				],
				living: [
					{
						required: true,
						message: '请填写现居住地址',
						trigger: ['change','blur'],
					},
				],
				vaccination_time: [
					{
						required: true,
						message: '请选择接种时间',
						trigger: ['change','blur'],
					},
				],
				community_lable: [
					{
						required: true,
						message: '请选择居住地所属社区',
						trigger: ['change','blur'],
					},
				],
				dosage_lable: [
					{
						required: true,
						message: '请选择接种剂次',
						trigger: ['change','blur'],
					},
				],
				mobile: [
					{
						validator: (rule, value, callback) => {
							return this.$u.test.mobile(value);
						},
						message: '手机号码格式不正确',
						trigger: ['blur'],
					},
				],
				code: [
					{
						validator: (rule, value, callback) => {
							return this.$u.test.code(value, 6);
						},
						message: '请填写6位验证码',
						trigger: ['blur'],
					},
				],
			},
		};
	},
	onLoad() {
		
	},
	computed: {

	},
	onReady() {
		this.getCommunityFunc()
		this.$refs.uForm.setRules(this.rules)
	},
	methods: {
		submit() {
			this.$refs.uForm.validate(valid => {
				if (valid) {
					console.log('验证成功');
					this.$u.api.saveForm2(this.model).then(res => {
						console.log(res);
						if (res.code == 1) {
							this.$refs.uToast.show({
								title: '提交成功',
								type: 'success',
								url: 'pages/index/index',
							})
							return;
						}
						this.$refs.uToast.show({
							title: '提交失败：' + res.msg,
							type: 'default',
						})
					})
				} else {
					console.log('验证失败');
				}
			});
		},
		// 接种时间回调
		vaccinationTimeConfirm(e) {
			this.model.vaccination_time = e.year + '-' + e.month + '-' + e.day + ' ' + e.hour + ':' + e.minute
		},
		// 选择接种剂次回调
		dosageConfirm(e) {
			this.model.dosage = '';
			e.map((val, index) => {
				this.model.dosage_lable = val.label;
				this.model.dosage = val.value;
				this.dosageDefault = [val.extra]
			})
		},
		// 选择社区回调
		selectConfirm(e) {
			this.model.community = '';
			e.map((val, index) => {
				this.model.community_lable = val.label;
				this.model.community = val.value;
				this.selectDefault = [val.extra]
			})
		},
		// 验证码倒计时改变
		codeChange(text) {
			this.codeTips = text;
		},
		// 获取验证码
		getCode() {
			if(this.$refs.uCode.canGetCode) {
				// 模拟向后端请求验证码
				uni.showLoading({
					title: '正在获取验证码',
					mask: true
				})
				setTimeout(() => {
					uni.hideLoading();
					// 这里此提示会被this.start()方法中的提示覆盖
					this.$u.toast('模拟验证码已发送');
					// 通知验证码组件内部开始倒计时
					this.$refs.uCode.start();
				}, 1500);
			} else {
				this.$u.toast('倒计时结束后再发送');
			}
		},
		async getCommunityFunc(){
			const {
				code,
				data
			} = await this.$u.api.getCommunityList()
			if (code == 1) {
				this.selectList = data
			}
		},
	}
};
</script>

<style scoped lang="scss">
.wrap {
	padding: 30rpx;
}

.agreement {
	display: flex;
	align-items: center;
	margin: 40rpx 0;

	.agreement-text {
		padding-left: 8rpx;
		color: $u-tips-color;
	}
}
</style>
