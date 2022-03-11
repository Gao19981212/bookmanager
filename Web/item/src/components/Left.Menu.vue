<!--  -->
<template>
<div>
  <el-menu
    class="left_menu"
    :default-active="active"
    background-color="#46485f"
    active-text-color="#dea32c"
    text-color="#fff"
    :unique-opened="true"
    :collapse="isCollapse"
  >
    <el-sub-menu index="1">
      <template #title>
        <el-icon><avatar /></el-icon>
        <span>读者管理</span>
      </template>
      <el-menu-item index="1-3" @click="enterRead">用户管理</el-menu-item>
    </el-sub-menu>
    <el-sub-menu index="2">
      <template #title>
        <el-icon><reading /></el-icon>
        <span>典藏管理</span>
      </template>
      <el-menu-item index="2-1" @click="enterbook">图书管理</el-menu-item>
    </el-sub-menu>
    <el-sub-menu index="3">
      <template #title>
        <el-icon><promotion /></el-icon>
        <span>流通管理</span>
      </template>
      <el-menu-item index="3-1" @click="enterLend">图书借阅</el-menu-item>
      <el-menu-item index="3-2" @click="enterback">图书归还</el-menu-item>
      <el-menu-item index="3-3" @click="enterinfo">流通信息检索</el-menu-item>
    </el-sub-menu>
  </el-menu>
  </div>
</template>
<script>
import VueEvent from "../assets/js/event";
export default {
  data() {
    return {
      isCollapse:false,
      active: "",
      urlpic: require("../assets/img/用户头像-男.png"),
    };
  },
  components: {},

  computed: {},
  created() {  
    VueEvent.on("menuchange", (value) => {      
      this.isCollapse=value 
    });
  },
  mounted() {
    this.active = this.$route.name;
    // localStorage.removeItem("isCollapse");
  },
  methods: {
    enterinfo() {
      this.$router
        .replace({
          path: "/crd",
          query: {
            current: 1,
            pagesize: 10,
          },
        })
        .catch((err) => {
          console.log(err);
        });
    },
    enterback() {
      this.$router
        .replace({
          path: "/brn",
        })
        .catch((err) => {
          console.log(err);
        });
    },
    enterLend() {
      this.$router
        .replace({
          path: "/bbw",
        })
        .catch((err) => {
          console.log(err);
        });
    },
    enterbook() {
      this.$router
        .replace({
          path: "/books",
          query: {
            current: 1,
            pagesize: 10,
          },
        })
        .catch((err) => {
          console.log(err);
        });
    },
    enterRead() {
      this.$router
        .replace({
          path: "/read",
          query: {
            current: 1,
            pagesize: 10,
          },
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
<style lang='less'>
.left_menu {
  min-height: calc(100vh - 50px);
  .el-sub-menu__title:hover {
    background: #181d4b !important;
    outline: none !important;
    color: #d9ffff !important;
  }
  
}
 .left_menu:not(.el-menu--collapse) {
   width: 200px;
  }
</style>