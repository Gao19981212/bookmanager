<!--  -->
<template>
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
      <el-menu-item index="1-1">类别管理</el-menu-item>
      <el-menu-item index="1-2">部门管理</el-menu-item>
      <el-menu-item index="1-3">读者管理</el-menu-item>
    </el-sub-menu>
    <el-sub-menu index="2">
      <template #title>
        <el-icon><reading /></el-icon>
        <span>典藏管理</span>
      </template>
      <el-menu-item index="2-1">图书管理</el-menu-item>
    </el-sub-menu>
    <el-sub-menu index="3">
      <template #title>
        <el-icon><promotion /></el-icon>
        <span>流通管理</span>
      </template>
      <el-menu-item index="3-1">流通信息检索</el-menu-item>
      <el-menu-item index="3-2">图书赔偿</el-menu-item>
      <el-menu-item index="3-3">到馆记录</el-menu-item>
    </el-sub-menu>
  </el-menu>
</template>
<script>
export default {
  data() {
    return {
      isCollapse: false,
      active: "",
      urlpic: require("../assets/img/用户头像-男.png"),
    };
  },
  components: {},

  computed: {},

  mounted() {
    //  this.active= this.$route.name;
  },

  methods: {},
};
</script>
<style lang='less'>
// .big {

//   background: #46485f;
// }
.left_menu {
  width: 200px;
  min-height: calc(100vh - 50px);
  .el-sub-menu__title:hover {
    background: #181d4b !important;
    outline: none !important;
    color: #d9ffff !important;
  }
}
// .left_menu {
//   // border-right: 0px;

//   .el-sub-menu__title:hover {
//     background: #181d4b !important;
//     outline: none !important;
//     color: #d9ffff !important;
//   }
// }

// .left_div {
//   height: 70px;
//   background: #46485f;
//   border: 0;
// }

// .logo {
//   height: 50px;
//   background: #46485f;
//   border: 0;
//   color: #fff;
//   font-size: 18px;
//   text-align: center;
//   font-weight: 700;
//   line-height: 50px;
// }
</style>