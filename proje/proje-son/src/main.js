import Vue from 'vue'
import App from './App.vue'
import { BootstrapVue } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import './db/db.js'
import moment from 'moment-timezone'

moment.tz.setDefault('Europe/Istanbul')
//import '../../node/index.js';

// Install BootstrapVue
Vue.use(BootstrapVue)

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
