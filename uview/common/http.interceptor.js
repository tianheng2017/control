const install = (Vue, vm) => {
	Vue.prototype.$u.http.setConfig({
		baseUrl: 'https://crowtoken.com',
		loadingText: '努力加载中~',
		loadingTime: 800,
	});
}

export default {
	install
}