<template>
  <div class="login_bg">
    <transition appear name="animate__animated animate__bounce" enter-active-class="animate__backInDown">
      <div class="box">
        <div class="board">
          <div class="login_font">
            <div>欢迎登录</div>
            <div><img src="../../assets/img/图书.png"></div>
          </div>
          <div>
            <h4>高校图书管理系统</h4>
          </div>
        </div>
        <div class="login_div">
          <div class="login_content">
            <el-form :model="form" :rules="rules" ref="Reform" size="default">
              <el-form-item label="" prop="name">
                <el-input v-model="form.name" placeholder="请输入学号" clearable prefix-icon="Avatar" class="login_input"
                  type="text" />
              </el-form-item>
              <el-form-item label="" prop="password">
                <el-input v-model="form.password" prefix-icon="Lock" placeholder="请输入密码" class="login_input"
                  show-password type="password"></el-input>
              </el-form-item>
              <el-form-item prop="type">
                <el-select v-model="form.type" placeholder="请选择类型" size="default" class="select">
                  <el-option label="管理员" :value="1"></el-option>
                  <el-option label="读者" :value="2"></el-option>
                </el-select>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" round @click="enterIndex">登录</el-button>
              </el-form-item>
            </el-form>
            <div class="letter">
              <div>
                <el-checkbox label="记住我" v-model="logincheck" :checked="logincheck" size="large"></el-checkbox>
              </div>
              <div class="a_btn">
                <span @click="register()">新用户注册</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>
<script>
import { getCurrentInstance } from 'vue'
import { reactive, ref, toRef, toRefs, unref } from '@vue/reactivity';
import { onMounted } from 'vue-demi';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus'
import { login } from "../../request/login"
export default {
  name: "Login",
  setup(props, context) {
    const { appContext } = getCurrentInstance();
    const router = useRouter();
    const state = reactive({
      logincheck: false,
      form: {
        name: "",
        password: "",
        type: undefined,
      },
      rules: {
        name: [
          {
            required: true,
            message: "用户名不能为空！",
            trigger: "blur",
          },
        ],
        password: [
          {
            required: true,
            message: "密码不能为空！",
            trigger: "blur",
          },
        ],
        type: [
          {
            required: true,
            message: "用户类型不能为空！",
            trigger: "blur",
          },
        ],
      }
    })
    function register() {
      router.push({
        path: "/register",
      });
    }
    function remember() {
      if (state.logincheck) {
        localStorage.setItem("name", state.form.name);
        localStorage.setItem("pwd", state.form.password);
        localStorage.setItem("checklogin", state.logincheck);
        localStorage.setItem("select_user", state.form.type);
      } else {
        localStorage.clear();
      }
    }
    function load() {
      state.logincheck = Boolean(localStorage.getItem("checklogin"));
      state.form.name = localStorage.getItem("name");
      state.form.password = localStorage.getItem("pwd");
      if (localStorage.getItem("select_user") != null) {
        state.form.type = Number(localStorage.getItem("select_user"));
      }
    }
    let Reform = ref(null);
    const enterIndex = async () => {
      // 开始校验
      Reform.value.validate(valid => {
        if (valid) {
          login(state.form)
            .then((res) => {
              if (res.data.code == "0") {
                localStorage.setItem("nick", res.data.data.nick);
                localStorage.setItem("name", res.data.data.name);
                ElMessage.success("登录成功");
                remember();
                if (state.form.type == 1) {
                  router.replace({
                    path: "/index",
                  })
                    .catch((err) => {
                      console.log(err);
                    });
                } else {
                  router.replace({
                    path: "/searbook",
                    query: {
                      current: 1,
                      pagesize: 10,
                    },
                  })
                    .catch((err) => {
                      console.log(err);
                    });
                }
              } else {
                this.$message.error(res.data.msg);
              }
            })
            .catch((err) => {
              console.log(err);
            });
        }
      })
    };
    onMounted(() => {
      load();
    })
    return {
      ...toRefs(state),
      enterIndex,
      register,
      Reform
    }
  },
};
</script>
<style lang='less' scoped>
@import url("../../assets/css/loginstyle.less");
</style>