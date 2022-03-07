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
    path: '/register',
    name: 'register',
    meta: {
      title: "注册",
    },
    component: () => import("../views/login/register.vue"),
  },
  {
    path: '/index',
    name: 'index',
    meta: {
      title: "主页",
    },
    component: () => import("../views/frame.vue"),
    children: [{
      path: '/index',
      name: "home",
      component: () => import("../views/Home.vue")
    },
    {
      path: '/read',
      name: "1-3",
      meta: {
        title: "读者管理",
      },
      component: () => import("../views/manager/Read.vue")
    },
    {
      path: '/books',
      name: "2-1",
      meta: {
        title: "图书管理",
      },
      component: () => import("../views/collectbook/bookmanager.vue")
    },
    ]
  }

];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
