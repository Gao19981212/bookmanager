<!--  -->
<template>
  <div>

    <el-menu :style="{ height: sw + 'px' }" class="left_menu" background-color="#46485f" active-text-color="#dea32c"
      text-color="#fff" :unique-opened="true" :collapse="this.$store.state.ctrisCollapse" router
      :default-active="active">
      <div class="logo">后台管理系统</div>
      <el-sub-menu index="1">
        <template #title>
          <el-icon>
            <avatar />
          </el-icon>
          <span>读者管理</span>
        </template>
        <el-menu-item index="1-3" :route="{ name: '1-3', query: { current: 1, pagesize: 10 } }">用户管理</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="2">
        <template #title>
          <el-icon>
            <reading />
          </el-icon>
          <span>典藏管理</span>
        </template>
        <el-menu-item index="2-1" :route="{ name: '2-1', query: { current: 1, pagesize: 10 } }">图书管理</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="3">
        <template #title>
          <el-icon>
            <promotion />
          </el-icon>
          <span>流通管理</span>
        </template>
        <el-menu-item index="3-1" :route="{ name: '3-1' }">图书借阅</el-menu-item>
        <el-menu-item index="3-2" :route="{ name: '3-2' }">图书归还</el-menu-item>
        <el-menu-item index="3-3" :route="{ name: '3-3', query: { current: 1, pagesize: 10 } }">流通信息检索</el-menu-item>
      </el-sub-menu>

    </el-menu>
  </div>
</template>
<script>
import { onMounted, reactive, toRefs } from 'vue-demi';
import { useRoute } from 'vue-router';
export default {
  setup() {
    const route = useRoute;
    const state = reactive({
      active: "",
      sw: undefined,
    })
    function menuheight() {
      state.sw = document.body.clientHeight;
      window.onscroll = () => {
        state.sw = document.body.scrollHeight;
        return (() => {
          state.sw = document.body.scrollHeight;
          console.log(state.sw);

        })();
      };
    }
    onMounted(() => {
      menuheight();
      state.active = route.name;
    })
    return {
      ...toRefs(state),
    }
  },
};
</script>
<style lang='less' scoped>
.logo {
  width: 100%;
  height: 50px;
  color: #5b5b5b;
  background: #fff;
  font-size: 23px;
  letter-spacing: 3px;
  text-align: center;
  font-weight: 700;
  line-height: 50px;

}

.left_menu {
  height: calc(100vh - 50px);
  border: none !important;

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