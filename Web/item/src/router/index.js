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
    path: '/searbook',
    name: 'searbook',
    meta: {
      title: "检索图书",
    },
    component: () => import("../views/Readpage/Search.vue"),
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
      {
        path: '/bbw',
        name: "3-1",
        meta: {
          title: "图书借阅",
        },
        component: () => import("../views/cirmanager/Bookborrowing.vue")
      },
      {
        path: '/brn',
        name: "3-2",
        meta: {
          title: "图书归还",
        },
        component: () => import("../views/cirmanager/Bookreturn.vue")
      },
      {
        path: '/crd',
        name: "3-3",
        meta: {
          title: "查询记录",
        },
        component: () => import("../views/cirmanager/Circulationrecord.vue")
      },
    ]
  }

];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
