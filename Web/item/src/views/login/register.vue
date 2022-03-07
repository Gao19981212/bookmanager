import { rules } from '../../../.eslintrc';

<!--  -->
<template>
  <div class="register_bg">
    <div class="register_div">
      <div class="register_content">
        <div class="register_font">
          <span>欢迎注册</span>
        </div>
        <el-form :model="form" :rules="rules" ref="form">
          <el-form-item label="" prop="name">
            <el-input
              v-model="form.name"
              placeholder="请输入学号"
              clearable
              prefix-icon="Avatar"
              type="text"
              autocomplete="off"
            />
          </el-form-item>
          <el-form-item label="" prop="password">
            <el-input
              v-model="form.password"
              prefix-icon="Lock"
              placeholder="请输入密码"
              show-password
              type="password"
              autocomplete="off"
            ></el-input>
          </el-form-item>
          <el-form-item label="" prop="nextpwd">
            <el-input
              v-model="form.nextpwd"
              prefix-icon="Lock"
              placeholder="输入确认密码"
              show-password
              type="password"
              autocomplete="off"
            ></el-input>
          </el-form-item>
        </el-form>
        <div>
          <el-button type="primary" round @click="enterLogin">注册</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    // 此处自定义校验手机号码js逻辑 
    var vailpwd = (rule, value, callback) => {
      if (value!=this.form.password) {
        return callback(new Error("两次密码输入不一致"))
      }     
    }
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
            message:"长度为3到8位"
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
           validator: vailpwd,
            trigger: "blur"
          }
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
<style lang='less'>
.register_bg {
  background: url("../../assets/img/register.jpg");
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
.register_div {
  width: 500px;
  height: 480px;
  background: #ecf5ff;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
}
.register_content {
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
  .el-form {
    .el-form-item {
      margin-bottom: 25px;
    }
  }
  button {
    width: 350px;
  }
}
.register_font {
  margin-bottom: 30px;
  span {
    font-weight: 700;
    color: #545454;
    font-size: 25px;
  }
}
</style>