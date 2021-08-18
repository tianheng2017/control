import Vue from 'vue'
import App from './App'
import store from '@/store';
import httpInterceptor from '@/common/http.interceptor.js'
import httpApi from '@/common/http.api.js'

Vue.config.productionTip = false

App.mpType = 'app'

// 引入全局uView
import uView from 'uview-ui'
Vue.use(uView);

let vuexStore = require("@/store/$u.mixin.js");
Vue.mixin(vuexStore);

const app = new Vue({
	store,
    ...App
})

Vue.use(httpInterceptor, app)
Vue.use(httpApi, app)

app.$mount()