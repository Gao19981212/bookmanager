<!--  -->
<template>
  <div>
    <div class="exit_info">
      <el-dropdown size="large ">
        <span>
          {{ name }}
          <el-icon>
            <arrow-down />
          </el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="self">个人中心</el-dropdown-item>
            <el-dropdown-item @click="selfbook">个人书架</el-dropdown-item>
            <el-dropdown-item
              divided
              @click="backLogin"
            >退出系统</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
    <div class="search_logo">Library System</div>
    <div class="search_input">
      <el-input
        ref="input"
        v-model="searchtxt"
        placeholder="请输入要检索的内容"
        size="large"
        clearable
        @keyup.native.enter="load()"
      >
        <template #append>
          <el-button
            :icon="Search"
            @click="load()"
          >搜索</el-button>
        </template>
      </el-input>
      <div class="tips">
        搜索关键词：
        <div
          v-for="(item, index) in bookinfo"
          :key="index"
        >
          <span
            :class="index == ex ? 'tispan' : 'notispan'"
            @click="clicktxt(item, index)"
          >{{ item }}</span>
          <span
            v-if="index != 5"        
          >－</span>
        </div>
      </div>
    </div>
    <el-dialog
      v-model="dialogVisible"
      title="个人中心"
      width="600px"
      draggable
    >
      <el-form
        :model="form"
        style="width: 500px"
        label-width="80px"
      >
        <el-form-item label="密码">
          <el-input
            v-model="form.password"
            type="password"
            show-password
            placeholder="请输入新密码"
          ></el-input>
        </el-form-item>
        <el-form-item label="姓名">
          <el-input
            v-model="form.nick"
            type="text"
            placeholder="请输入姓名"
          ></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="form.sex">
            <el-radio label="男">男</el-radio>
            <el-radio label="女">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="年龄">
          <el-input
            v-model.number="form.age"
            type="text"
            placeholder="请输入姓名"
          ></el-input>
        </el-form-item>
        <el-form-item label="手机">
          <el-input
            v-model.number="form.tel"
            type="text"
            placeholder="请输入手机号"
          ></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button
            type="primary"
            @click="update()"
          >确定</el-button>
        </span>
      </template>
    </el-dialog>
    <el-dialog
      v-model="bookVisible"
      title="个人书架"
      width="1000px"
      draggable
    >
      <el-table
        :data="tableData"
        style="width: 90%; margin: 0 auto"
      >
        <el-table-column
          label="序号"
          prop="key"
          width="80"
          align="center"
        />
        <el-table-column
          label="封面"
          width="80"
          align="center"
        >
          <template #default="scope">
            <el-image
              fit="cover"
              :src="pic(scope.row.bookPic)"
              style="width: 50px"
            ></el-image>
          </template>
        </el-table-column>
        <el-table-column
          prop="bookTitle"
          label="书名"
        />
        <el-table-column
          prop="bookAuthor"
          label="作者"
          align="center"
        />
        <el-table-column
          prop="bookType"
          label="类型"
          align="center"
        />
        <el-table-column
          prop=""
          label="评分"
          width="200"
          align="center"
        >
          <template #default="scope">
            <el-rate
              v-model="scope.row.bookRate"
              :max="5"
              :disabled="true"
              show-score
              score-template="{value} 分"
              style="align-items: stretch"
            ></el-rate>
          </template>
        </el-table-column>
        <el-table-column
          label="取消收藏"
          align="center"
        >
          <template #default="scope">
            <el-button
              type="danger"
              :icon="Delete"
              circle
              @click="cancel(scope.row)"
            />
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script>
import { Search, Reading, Delete } from "@element-plus/icons-vue";
import { markRaw } from "vue";
export default {
  data() {
    return {
      name:localStorage.getItem("nick"),
      Search: Search,
      searchtxt: "",
      select: "",
      ex: -1,
      bookinfo: ["书名", "作者", "条码号", "索书号", "出版年", "ISBN"],
      dialogVisible: false,
      form: {
        password: "",
        nick: "",
        sex: "",
        age: 0,
        tel: "",
      },
      bookVisible: false,
      tableData: [],
      Delete,
    };
  },
  components: {
    Search: markRaw(Search),
    Delete: markRaw(Delete),
  },

  computed: {},

  mounted() {
    this.show();
    this.loadbind();
    this.$nextTick(() => {
      this.$refs.input.focus();
    });
  },
  methods: {
    pic(val) {
      let url = "/api" + val;
      return url;
    },
    //取消收藏
    cancel(record) {
      console.log(record);

      record.isBind = 1;
      this.$axios({
        method: "put",
        url: "/api/bindinfo/collect",
        contentType: "application/json;charset=UTF-8",
        data: record,
      })
        .then((res) => {
          //   console.log(res);
          if (res.data.code == "0") {
            this.$message.success(res.data.data);
          } else {
            this.$message.warning(res.data.msg);
          }
          this.loadbind();
          this.$emit("collclick", record.barcode);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    //个人中心
    selfbook() {
      this.bookVisible = true;
      this.loadbind();
    },
    //个人书架
    loadbind() {
      
      this.$axios({
        method: "get",
        url: "/api/bindinfo/bookmark",
        contentType: "application/json;charset=UTF-8",
        params: {
          name: localStorage.getItem("name"),
        },
      })
        .then((res) => {
          // console.log(res);
          this.tableData = res.data.data;
          for (var i = 0; i < res.data.data.length; i++) {
            this.tableData[i]["key"] = i + 1;
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    show() {
      this.$axios({
        method: "get",
        url: "/api/user/info",
        contentType: "application/json;charset=UTF-8",
        data: {
          name: localStorage.getItem("name"),
        },
      })
        .then((res) => {
          // console.log(res);
          this.form = res.data.data;
          this.name = this.form.nick;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    update() {
      this.$axios({
        method: "put",
        url: "/api/user/readupdate",
        contentType: "application/json;charset=UTF-8",
        data: this.form,
      })
        .then((res) => {
          // console.log(res);
          if (res.data.data != null) {
            this.$router
              .replace({
                path: "/login",
              })
              .catch((err) => {
                console.log(err);
              });
            this.$message.warning("密码已修改，请重新登录！");
          } else {
            this.dialogVisible = false;
            this.show();
            this.$message.success("修改成功！");
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    self() {
      this.dialogVisible = true;
    },
    //获取搜索类型
    clicktxt(item, index) {
      this.select = item;
      this.ex = index;
    },
    load() {
      this.$emit("searchclick", this.searchtxt, this.select);
    },
    //退出系统
    backLogin() {
      localStorage.removeItem("name");
      localStorage.removeItem("pwd");
      localStorage.removeItem("checklogin");
      localStorage.removeItem("select_user");
      this.$router
        .replace({
          path: "/login",
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
<style lang='less' scoped>
.exit_info {
  width: 120px;
  position: absolute;
  top: 20px;
  right: 0;
  .el-dropdown {
    font-weight: 700;
    font-size: 1vw;
    color: #1d953f;
    letter-spacing: 2px;
  }
}
.search_logo {
  width: 30vw;
  // border: 1px solid #f58220;
  height: 50px;
  text-align: center;
  font-size: 1.8vw;
  font-weight: 700;
  margin: 1vw auto;
  background-image: -webkit-linear-gradient(left, #fdd819, #e80505);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.search_input {
  width: 30vw;
  margin: 0 auto;
  .tips {
    padding: 0.5vw;
    font-weight: 700;
    display: flex;
    flex-flow: row;
    font-size: 0.9vw;
    span{
      margin-left: 0.2vw;
    }
    .notispan,
    .tispan {
      color: #2c3e50;
      cursor: pointer;
      letter-spacing: 2px;
      font-weight: normal;
      font-size: 0.8vw;
    }
    .tispan {
      color: #2980b9;
      font-weight: 700;
    }
  }
  /deep/ .el-input__inner {
    border: 3px solid #f58220 !important;
    border-right: none !important;
     height:2vw;
  }
  /deep/ .el-input-group__append {
    border: 0px !important;
    .el-button {
      width: 5.2vw;
      height:2vw;
      background: #f58220 !important;
      border: 3px solid #f58220 !important;
      border-radius: 0px 10px 10px 0px !important;
      // margin-bottom: -9px !important;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      font-size: 0.9vw;
      line-height: 40px;
      letter-spacing: 1px;
      span:hover {
        color: #fff3ee;
      }
    }
    .el-button:hover {
      color: #fff3ee;
    }
    .el-icon {
      font-size: 1vw;
      color: #fff;
    }
  }
}
</style>