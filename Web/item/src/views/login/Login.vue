import router from '../../router';
<!--  -->
<template>
  <div class="login_bg">
    <div class="login_div">
      <div class="login_content">
        <div class="login_font letter">
          <span>登录</span
          ><el-image
            :src="require('../../assets/img/图书.png')"
            fit="cover"
          ></el-image>
        </div>
        <div class="letter">
          <el-input
            v-model="Sno"
            placeholder="请输入学号"
            clearable
            prefix-icon="Avatar"         
            type="text"
          />
        </div>
        <div class="letter">
          <el-input
            v-model="pwd"
            prefix-icon="Lock"
            placeholder="请输入密码"         
            show-password
            type="password"
          ></el-input>
        </div>
        <div class="letter">
          <el-button type="primary" round @click="enterIndex">登录</el-button>
        </div>
        <div class="letter">
          <span>
            <el-checkbox
              v-model="login_check"
              label="记住我"
              size="large"
              border
            ></el-checkbox
          ></span>
          <div class="a_btn">
            <span>忘记密码</span>
            <span>|</span>
            <span>新用户注册</span>
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
      Sno: "",
      pwd: "",
      login_check: false,
    };
  },

  components: {},

  computed: {},

  mounted() {},

  methods: {
    enterIndex(){
      this.$router.replace({
            path:"/index",

      }).catch((err)=>{
         console.log(err);
         
      })        
    }
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
  padding-top: 80px;
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
    margin-top: 25px;
  }
  button {
    width: 350px;
  }
}
.login_font {
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