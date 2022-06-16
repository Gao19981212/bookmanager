
<!--  -->
<template>
  <div class="head_menu">

    <div class="menu_icon">
      <el-icon color="#5B5B5B" :size="32" @click="ISshow">
        <fold />
      </el-icon>
    </div>
    <div class="index" @click="backindex" :class="{ indexactive: Isactive }">
      <el-icon color="#5B5B5B" :size="20">
        <home-filled />
      </el-icon>
      <span>主页</span>
    </div>
    <div style="flex: 1"></div>
    <div class="mess_info">
      <el-dropdown>
        <span class="el-dropdown-link">
          {{ name }}
          <el-icon class="el-icon--right">
            <arrow-down />
          </el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item divided @click="backLogin">退出系统</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
import { reactive, toRefs } from 'vue-demi';
import { useRouter } from 'vue-router';
import { useStore } from "vuex"
export default {
  setup() {
    const router = useRouter();
    const store = useStore();
    const state = reactive({
      Isactive: false,
      name: localStorage.getItem("nick"),
    })
    function backindex() {
      state.Isactive = true;
      router.replace({
        path: "/index",
      }).catch((err) => {
        console.log(err);
      });
    }
    function ISshow() {
      store.commit('changemenu', !store.state.ctrisCollapse);
    }
    function backLogin() {
      localStorage.clear();
      router.replace({
        path: "/login",
      })
        .catch((err) => {
          console.log(err);
        });
    }
    return {
      ...toRefs(state),
      backindex,
      ISshow,
      backLogin,
    }
  },
  // data() {
  //   return {
  //     ctrisCollapse: false,
  //     name: localStorage.getItem("nick"),
  //     Isactive: false,
  //   };
  // },

  // components: {},

  // computed: {},

  // mounted() { },
  // methods: {
  //   backindex() {
  //     this.Isactive = true;
  //     this.$router
  //       .replace({
  //         path: "/index",
  //       })
  //       .catch((err) => {
  //         console.log(err);
  //       });
  //   },
  //   ISshow() {
  //     this.ctrisCollapse = !this.ctrisCollapse;
  //     VueEvent.emit("menuchange", this.ctrisCollapse);
  //   },
  //   backLogin() {
  //     localStorage.clear();
  //     this.$router
  //       .replace({
  //         path: "/login",
  //       })
  //       .catch((err) => {
  //         console.log(err);
  //       });
  //   },
  // },
};
</script>
<style lang='less' scoped>
.head_menu {
  height: 50px;
  line-height: 50px;
  display: flex;
  flex-flow: row nowrap;
  background: #fff;
  box-shadow: 0 2px 4px #00000014;
}

.mess_info {
  width: 100px;

  .el-dropdown {
    line-height: 50px;
    color: #5b5b5b;
  }
}

.menu_icon {
  display: flex;
  align-items: center;

  .el-icon {
    cursor: pointer;
  }
}

.index {
  margin-left: 20px;
  width: 80px;
  display: flex;
  align-items: center;
  justify-content: center;
  // border: 1px solid red;
  text-align: center;

  span {
    cursor: pointer;
    color: #5b5b5b;
    font-weight: 700;
  }
}

.indexactive {
  border-bottom: 3px inset #5b5b5b;
}
</style>