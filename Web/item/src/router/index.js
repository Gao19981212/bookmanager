import { createRouter, createWebHistory } from "vue-router";
const routes = [
  {
    path: '/',
    redirect: '/login',
  },
  {
    path: '/login',
    name: 'login',
    meta: {
      title: "登录",
    },
  component: () => import("../views/login/Login.vue"),
  },
  {
    path: '/index',
    name: 'index',
    meta: {
      title: "主页",
    },
  component: () => import("../views/frame.vue"),
  }

];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
