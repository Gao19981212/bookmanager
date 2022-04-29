<template>
  <div class="login_bg">
    <transition
      appear
      name="animate__animated animate__bounce"
      enter-active-class="animate__bounceInRight"
    >
      <div class="box">
        <div class="board">
          <div class="login_font">
            <div>欢迎注册</div>
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
                  class="login_input"
                  prefix-icon="Avatar"
                  type="text"
                  autocomplete="off"
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
                  autocomplete="off"
                ></el-input>
              </el-form-item>
              <el-form-item
                label=""
                prop="nextpwd"
              >
                <el-input
                  v-model="form.nextpwd"
                  prefix-icon="Lock"
                  placeholder="确认密码"
                  class="login_input"
                  show-password
                  type="password"
                  autocomplete="off"
                ></el-input>
              </el-form-item>
              <el-form-item>
                <el-button
                  type="primary"
                  round
                  @click="enterLogin"
                >注册</el-button>
              </el-form-item>
            </el-form>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  data() {
    // 此处自定义校验手机号码js逻辑
    var vailpwd = (rule, value, callback) => {
      if (value != this.form.password) {
        return callback(new Error("两次密码输入不一致"));
      } else {
        callback();
      }
    };
    return {
      rules: {
        name: [
          {
            required: true,
            message: "用户名不能为空！",
            trigger: "blur",
          },
          {
            min: 3,
            max: 8,
            message: "长度为3到8位",
          },
        ],
        password: [
          {
            required: true,
            message: "密码不能为空",
            trigger: "blur",
          },
        ],
        nextpwd: [
          // {
          //   required: true,
          //   message: "确认密码不能",
          //   trigger: "blur",
          // },
          {
            required: true,
            validator: vailpwd,
            trigger: "blur",
          },
        ],
      },
      form: {},
    };
  },

  components: {},

  computed: {},

  mounted() {},
  created() {},
  methods: {
    enterLogin() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          this.$axios({
            method: "post",
            url: "/api/user/adduser",
            contentType: "application/json;charset=UTF-8",
            data: this.form,
          })
            .then((res) => {
              if (res.data.code == "0") {
                this.$message.success("注册成功");
                this.$router
                  .replace({
                    path: "/login",
                  })
                  .catch((err) => {
                    console.log(err);
                  });
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
.board {
  background: #2980b9;
}
</style>