import { rules } from '../../../.eslintrc';

<!--  -->
<template>
  <div class="login_bg">
    <div class="login_div">
      <div class="login_content">
        <div class="login_font">
          <span>欢迎登录</span>
        </div>
        <el-form :model="form" :rules="rules" ref="form">
          <el-form-item label="" prop="name">
            <el-input
              v-model="form.name"
              placeholder="请输入学号"
              clearable
              prefix-icon="Avatar"
              type="text"
            />
          </el-form-item>
          <el-form-item label="" prop="password">
            <el-input
              v-model="form.password"
              prefix-icon="Lock"
              placeholder="请输入密码"
              show-password
              type="password"
            ></el-input>
          </el-form-item>
          <el-form-item label="" prop="type">
            <el-select
              v-model="form.type"
              class="m-2"
              placeholder="请选择类型"
              size="default"
            >
              <el-option label="管理员" :value="1"></el-option>
              <el-option label="读者" :value="2"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="">
            <el-button type="primary" round @click="enterIndex">登录</el-button>
          </el-form-item>
        </el-form>
        <div class="letter">
          <span>
            <el-checkbox
              label="记住我"
              border
              v-model="login_check"
              :checked="login_check"
              size="large"
            ></el-checkbox>
          </span>
          <div class="a_btn">
            <span>忘记密码</span>
            <span>|</span>
            <span @click="register()">新用户注册</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {},
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

  mounted() {},
  created() {
    this.load();
  },
  methods: {
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
      this.login_check = localStorage.getItem("checklogin");
      this.form.name = localStorage.getItem("name");
      this.form.password = localStorage.getItem("pwd");
      this.form.type = localStorage.getItem("select_user");
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
                this.$message.success("登录成功");
                this.remember();
                this.$router
                  .replace({
                    path: "/index",
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
<style lang='less'>
.login_bg {
  background: url("../../assets/img/bg.jpeg");
  background-size: cover;
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}
.login_div {
  width: 500px;
  height: 480px;
  background: #ecf5ff;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
}
.login_content {
  display: flex;
  flex-flow: column nowrap;
  align-items: center;
  justify-content: center;
  height: 480px;
  .el-input__inner {
    width: 350px;
  }
  .el-input__inner:focus {
    border-color: #adadad;
  }
  .el-icon {
    color: #555;
  }
  .letter {
    margin-bottom: 25px;
  }
  button {
    width: 350px;
  }
}
.login_font {
  margin-bottom: 30px;
  span {
    font-weight: 700;
    color: #545454;
    font-size: 25px;
    float: left;
    line-height: 35px;
  }
  .el-image {
    width: 35px;
    height: 35px;
    margin-left: 5px;
  }
}
.a_btn {
  display: inline-block;
  margin-left: 80px;
  span {
    font-size: 14px;
    color: #2a5caa;
    margin-left: 10px;
    cursor: pointer;
  }
}
</style>