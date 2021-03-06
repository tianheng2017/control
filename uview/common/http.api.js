const install = (Vue, vm) => {
	
	//获取社区信息
	let getCommunityList = (params = {}) => vm.$u.get('/api/community/getCommunityList');
	
	// 返沙人员信息填报
	let saveForm1 = (params = {}) => vm.$u.post('/api/index/form1', params);
	
	// 疫苗接种人员信息填报
	let saveForm2 = (params = {}) => vm.$u.post('/api/index/form2', params);
	
	vm.$u.api = {
		getCommunityList,
		saveForm1,
		saveForm2,
	};
}

export default {
	install
}