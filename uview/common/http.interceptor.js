const install = (Vue, vm) => {
	Vue.prototype.$u.http.setConfig({
		baseUrl: 'https://p1.crowtoken.com',
		loadingText: '努力加载中~',
		loadingTime: 800,
	});
}

export default {
	install
}