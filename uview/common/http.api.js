let form1_url = '/api/index/form1';

const install = (Vue, vm) => {
	let save_form1 = (params = {}) => vm.$u.post(form1_url, params);
	vm.$u.api = {save_form1};
}

export default {
	install
}