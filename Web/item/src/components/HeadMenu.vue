<!--  -->
<template>
  <div class="head_menu">
    <div class="logo">Library System</div>
    <div class="menu_icon">
      <el-icon color="#fff" :size="32"><fold/></el-icon>
    </div>
    <div style="flex: 1"></div>
    <div class="mess_info">
      <el-dropdown>
        <span class="el-dropdown-link">
          管理员
          <el-icon class="el-icon--right">
            <arrow-down />
          </el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item>个人中心</el-dropdown-item>
            <el-dropdown-item divided>退出系统</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },

  components: {},

  computed: {},

  mounted() {},

  methods: {},
};
</script>
<style lang='less'>
.head_menu {
  height: 50px;
  line-height: 50px;
  display: flex;
  flex-flow: row nowrap;
  background: #46485f;
}
.logo {
  width: 200px;
  height: 50px;
  color: #fff;
  font-size: 18px;
  text-align: center;
  font-weight: 700;
}
.mess_info {
  width: 100px;
  .el-dropdown {
    line-height: 50px;
    color: #fff;
  }
}
.menu_icon{
   display: flex;
   align-items: center;
 .el-icon{
   cursor: pointer;
 }
}
</style>