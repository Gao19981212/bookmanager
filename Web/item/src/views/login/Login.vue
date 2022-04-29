<template>
  <div class="login_bg">
    <transition
      appear
      name="animate__animated animate__bounce"
      enter-active-class="animate__backInDown"
    >
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
            <el-form
              :model="form"
              :rules="rules"
              ref="form"
            >
              <el-form-item
                label=""
                prop="name"
              >
                <el-input
                  v-model="form.name"
                  placeholder="请输入学号"
                  clearable
                  prefix-icon="Avatar"
                  class="login_input"
                  type="text"
                />
              </el-form-item>
              <el-form-item
                label=""
                prop="password"
              >
                <el-input
                  v-model="form.password"
                  prefix-icon="Lock"
                  placeholder="请输入密码"
                  class="login_input"
                  show-password
                  type="password"
                ></el-input>
              </el-form-item>
              <el-form-item prop="type">
                <el-select
                  v-model="form.type"
                  placeholder="请选择类型"
                  size="default"
                  class="select"
                >
                  <el-option
                    label="管理员"
                    :value="1"
                  ></el-option>
                  <el-option
                    label="读者"
                    :value="2"
                  ></el-option>
                </el-select>
              </el-form-item>
              <el-form-item>
                <el-button
                  type="primary"
                  round
                  @click="enterIndex"
                >登录</el-button>
              </el-form-item>
            </el-form>
            <div class="letter">
              <div>
                <el-checkbox
                  label="记住我"
                  v-model="login_check"
                  :checked="login_check"
                  size="large"
                ></el-checkbox>
              </div>
              <div class="a_btn">
                <!-- <span class="select">忘记密码</span>
                <span class="select">|</span> -->
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
export default {
  data() {
    return {
      form: {
        name: "",
        password: "",
        type: null,
      },
      login_check: false,
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
      },
    };
  },

  components: {},

  computed: {},

  mounted() {
    this.pd();
  },
  created() {
    this.load();
  },
  methods: {
    pd() {
      var width = document.body.clientWidth;
      if (width <= 480) {
        this.form.type = 2;
      }
    },
    register() {
      this.$router.push({
        path: "/register",
      });
    },
    remember() {
      if (this.login_check == true) {
        localStorage.setItem("name", this.form.name);
        localStorage.setItem("pwd", this.form.password);
        localStorage.setItem("checklogin", this.login_check);
        localStorage.setItem("select_user", this.form.type);
      } else {
        localStorage.removeItem("name");
        localStorage.removeItem("pwd");
        localStorage.removeItem("checklogin");
        localStorage.removeItem("select_user");
      }
    },
    load() {
      this.login_check = Boolean(localStorage.getItem("checklogin"));
      this.form.name = localStorage.getItem("name");
      this.form.password = localStorage.getItem("pwd");
      if (localStorage.getItem("select_user") != null) {
        this.form.type = Number(localStorage.getItem("select_user"));
      }
    },
    enterIndex() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          this.$axios({
            method: "post",
            url: "/api/user/login",
            contentType: "application/json;charset=UTF-8",
            data: this.form,
          })
            .then((res) => {
              if (res.data.code == "0") {
                sessionStorage.setItem("nick", res.data.data.nick);
                sessionStorage.setItem("name", res.data.data.name);
                this.$message.success("登录成功");
                this.remember();
                if (this.form.type == 1) {
                  this.$router
                    .replace({
                      path: "/index",
                    })
                    .catch((err) => {
                      console.log(err);
                    });
                } else {
                  this.$router
                    .replace({
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
      });
    },
  },
};
</script>
<style lang='less' scoped>
@import url("../../assets/css/loginstyle.less");
</style>