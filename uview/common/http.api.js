const install = (Vue, vm) => {
	
	// 返沙人员信息填报
	let save_form1 = (params = {}) => vm.$u.post('/api/index/form1', params);
	
	vm.$u.api = {save_form1};
}

export default {
	install
}