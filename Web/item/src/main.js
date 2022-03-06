import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import ElementPlus from "element-plus";
import 'element-plus/dist/index.css';
import * as ElIconModules from '@element-plus/icons'
import locale from 'element-plus/lib/locale/lang/zh-cn'
import "../src/assets/css/common.css";
import { ElIcon } from '@element-plus/icons-vue';

import axios from 'axios';
const app = createApp(App)
app.config.globalProperties.$axios = axios
// 统一注册el-icon图标
for (let iconName in ElIconModules) {
  app.component(iconName, ElIconModules[iconName])
}
router.beforeEach((to, form, next) => {
  if (to.meta.title) {
    document.title = to.meta.title;
  }
  next();
})
app.use(store).use(router).use(ElementPlus, { locale }).mount("#app");
