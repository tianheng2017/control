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
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="接种时间" prop="arrival_time">
				<u-input :border="border" type="select" :select-open="arrivalTimeShow" v-model="model.arrival_time" placeholder="请选择接种时间" @click="arrivalTimeShow = true"></u-input>
			</u-form-item>
			<u-form-item :label-style="labelStyle" :label-position="labelPosition" label="接种剂次" prop="community_lable">
				<u-input :border="border" type="select" :select-open="selectShow" v-model="model.community_lable" placeholder="请选择接种剂次" @click="selectShow = true"></u-input>
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
		
		<u-action-sheet :list="actionSheetList" v-model="actionSheetShow" @click="actionSheetCallback"></u-action-sheet>
		<u-select mode="single-column" :default-value="selectDefault" :list="selectList" v-model="selectShow" @confirm="selectConfirm"></u-select>
		<u-picker title="到达时间" :start-year="2018" :end-year="2030" mode="time" v-model="arrivalTimeShow" @confirm="arrivalTimeConfirm"></u-picker>
		<u-picker title="最近一次核酸检测时间" :start-year="2018" :end-year="2030" mode="time" v-model="checkTimeShow" @confirm="checkTimeConfirm"></u-picker>
		<u-verification-code seconds="60" ref="uCode" @change="codeChange"></u-verification-code>
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
				domicile: '',
				employer: '',
				buy_way: '',
				arrival_time: '',
				departure: '',
				check_time: '',
				check_result: 0,
				community: '',
				image: '',
				mobile: '',
				code: '',
				code_id:'',
				community_lable: '',
			},
			radio: '阴性',
			border: true,
			check: false,
			actionSheetShow: false,
			arrivalTimeShow: false,
			checkTimeShow: false,
			selectShow: false,
			radioCheckWidth: 'auto',
			radioCheckWrap: false,
			labelPosition: 'top',
			labelStyle: {
				fontWeight: 'bold',
			},
			codeTips: '',
			errorType: ['message','border'],
			buy_way_placeholder: '例：2021年8月14日19点58分从四川省成都市乘坐火车（车次：G25067车厢4F出发）于2021年8月14日24:00到达，而后乘坐私家车到达沙雅县X小区X号楼X单元X楼X户',
			upload_url: this.$u.http.config.baseUrl + '/api/common/upload',
			upload_lists: [],
			actionSheetList: [
				{
					text: '男'
				},
				{
					text: '女'
				},
			],
			selectList: [],
			selectDefault: [0],
			radioList: [
				{
					name: '阴性',
					checked: true,
				},
				{
					name: '阳性',
					checked: false,
				},
			],
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
						trigger: ['change','blur'],
					},
					{
						validator: (rule, value, callback) => {
							return this.$u.test.chinese(value);
						},
						message: '姓名必须为中文',
						trigger: ['change','blur'],
					},
				],
				sex: [
					{
						required: true,
						message: '请选择居住地所在社区',
						trigger: ['change','blur'],
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
				domicile: [
					{
						required: true,
						message: '请填写户籍所在地',
						trigger: ['change','blur'],
					},
				],
				employer: [
					{
						required: true,
						message: '请填写工作单位',
						trigger: ['change','blur'],
					},
				],
				buy_way: [
					{
						required: true,
						message: '请填写出发地、途径地及时间',
						trigger: ['change','blur'],
					},
				],
				arrival_time: [
					{
						required: true,
						message: '请选择到达时间',
						trigger: ['change','blur'],
					},
				],
				departure: [
					{
						required: true,
						message: '请填写出发地',
						trigger: ['change','blur'],
					},
				],
				check_time: [
					{
						required: true,
						message: '请选择最后一次核酸检测时间',
						trigger: ['change','blur'],
					},
				],
				community: [
					{
						required: true,
						message: '请选择居住地所在社区',
						trigger: ['change','blur'],
					},
				],
				mobile: [
					{
						validator: (rule, value, callback) => {
							return this.$u.test.mobile(value);
						},
						message: '请正确手机号码',
						trigger: ['change','blur'],
					},
				],
				code: [
					{
						validator: (rule, value, callback) => {
							return this.$u.test.code(value, 6);
						},
						message: '请填写验证码',
						trigger: ['change','blur'],
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
		this.upload_lists = this.$refs.uUpload.lists
	},
	methods: {
		submit() {
			this.$refs.uForm.validate(valid => {
				if (valid) {
					console.log('验证成功');
					this.$u.api.saveForm1(this.model).then(res => {
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
		// 点击actionSheet回调
		actionSheetCallback(index) {
			uni.hideKeyboard();
			this.model.sex_lable = this.actionSheetList[index].text;
			this.model.sex = index;
		},
		// 到沙时间回调
		arrivalTimeConfirm(e) {
			this.model.arrival_time = e.year + '-' + e.month + '-' + e.day
		},
		// 最近一次核酸检测时间回调
		checkTimeConfirm(e) {
			this.model.check_time = e.year + '-' + e.month + '-' + e.day
		},
		// 最近一次核酸检测结果回调
		radioChange(index) {
			this.model.check_result = index
		},
		// 选择社区回调
		selectConfirm(e) {
			this.model.community = '';
			e.map((val, index) => {
				console.log(index)
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
		//上传成功事件
		uploadSuccess(data, index, lists, name){
			const res = JSON.parse(data.data)
			if (res.code == 1) {
				this.model.image = res.data.url
			}
		}
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
