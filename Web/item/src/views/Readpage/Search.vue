<template>
  <div>
    <div>
      <div class="exit_info">
        <el-dropdown size="large ">
          <span class="el-dropdown-link">
            {{ name }}
            <el-icon class="el-icon--right">
              <arrow-down />
            </el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item>个人中心</el-dropdown-item>
              <el-dropdown-item divided @click="backLogin"
                >退出系统</el-dropdown-item
              >
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
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
          <el-button :icon="Search" @click="load()">搜索</el-button>
        </template>
      </el-input>
      <div class="tips">
        搜索关键词：
        <div v-for="(item, index) in bookinfo" :key="index">
          <span
            :class="index == ex ? 'tispan' : 'notispan'"
            @click="clicktxt(item, index)"
            >{{ item }}</span
          >
          <span v-if="index != 5">、</span>
        </div>
      </div>
      、
    </div>
    <div class="car">
      <el-carousel :interval="4000" type="card" height="200px" trigger="click" class="car">
        <el-carousel-item v-for="item in bookurl" :key="item">
          <el-image style="height:200px;" fit="cover" :src="item.bookPic"></el-image>
        </el-carousel-item>
      </el-carousel>
    </div>

    <el-divider content-position="left" class="pb_divi">热门读物</el-divider>
    <div>
      <div class="pb_div">
        <!-- <div><el-image></el-image></div> -->
        <div v-for="item in bookList" style="margin-left: 15px">
          <div class="sea_boopic">
            <el-image fit="cover" :src="item.bookPic"></el-image>
          </div>
          <div class="sea_content">
            <div>{{ item.bookTitle }}</div>
            <div>{{ item.bookAuthor }}</div>
          </div>
        </div>
      </div>
      <div class="book_page">
        <el-pagination
          :total="total"
          :current-page="current"
          :page-size="pagesize"
          :page-sizes="[10]"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          hide-on-single-page
          layout="total, sizes, prev, pager, next, jumper"
        >
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import { Search, Edit, Delete } from "@element-plus/icons-vue";
import { markRaw } from "vue";
export default {
  data() {
    return {
      Search: Search,
      name: sessionStorage.getItem("nick"),
      bookinfo: ["书名", "作者", "条码号", "索书号", "出版年", "ISBN"],
      ex: -1,
      select: "",
      searchtxt: "",
      current: 0,
      pagesize: 0,
      total: 0,
      bookList: [],
      bookurl:[],
    };
  },

  components: {
    Search: markRaw(Search),
  },

  computed: {},

  created() {
    this.init();
    this.load();
 
  },
  mounted() {
       this.picload();
    this.$refs.input.focus();
  },
  methods: {
    picload(){
    this.$axios({
        method: "get",
        url: "/api/book/hotbook",
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
            // console.log(res);
          this.bookurl=res.data.data;
        
          
        })
        .catch((err) => {
          console.log(err);
        });
    },
    handleSizeChange(pagesize) {
      this.pagesize = Number(pagesize);
      this.load();
    },
    handleCurrentChange(current) {
      this.current = Number(current);
      this.load();
    },
    init() {
      this.current = Number(this.$route.query.current);
      this.pagesize = Number(this.$route.query.pagesize);
    },
    load() {
      this.$axios
        .get("/api/book/pageshow", {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            Accept: "application/json",
          },
          params: {
            current: this.current,
            pagesize: this.pagesize,
            search: this.searchtxt,
            searchtype: this.select,
            status: 999,
            booktype: 999,
          },
        })
        .then((res) => {
          // console.log(res);
          this.bookList = res.data.data.records;
          console.log(this.bookList);

          this.total = res.data.data.total;
        })
        .catch((err) => {
          console.log("error:", err);
        });
    },
    //获取搜索类型
    clicktxt(item, index) {
      this.select = item;
      this.ex = index;
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
<style lang='less'>
body {
  background: #fffaf4;
}
.pb_divi {
  width: 700px;
  margin: 0 auto;
  margin-bottom: 30px;
}
.pb_div {
  width: 660px;
  height: 500px;
  display: flex;
  flex-flow: row wrap;
  margin: 0 auto;
}
.sea_content {
  width: 115px;
  text-align: center;
  text-overflow: ellipsis;
  overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  div:nth-child(1) {
    color: #2a5caa;
  }
  div:nth-child(2) {
    font-size: 14px;
  }
}
.sea_boopic {
  .el-image {
    width: 115px;
    height: 170px;
  }
}
.car{
 width: 1000px;
  margin: 0 auto;
  // .el-carousel__item{
  //   width: 200px;
  //   height: 100px;
  // }
  
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
.exit_info {
  width: 120px;
  position: absolute;
  top: 20px;
  right: 0;
  .el-dropdown {
    // line-height: 50px;
    font-weight: 700;
    font-size: 16px;
    color: #1d953f;
    letter-spacing: 2px;
  }
}
.search_logo {
  width: 30%;
  // border: 1px solid #f58220;
  height: 50px;
  text-align: center;
  font-size: 35px;
  font-weight: 700;
  margin: 0 auto;
  margin-top: 20px;
  background-image: -webkit-linear-gradient(left, #fdd819, #e80505);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.search_input {
  width: 600px;
  margin: 0 auto;
  margin-top: 20px;
  .tips {
    margin: 10px;
    // font-family: "黑体";
    font-weight: 700;
    color: #181d4b;
    display: flex;
    flex-flow: row;
    .notispan {
      color: #426ab3;
      cursor: pointer;
      letter-spacing: 2px;
      font-weight: normal;
    }
    .tispan {
      color: #c63c26;
      cursor: pointer;
      letter-spacing: 2px;
      font-weight: normal;
    }
  }
  .el-input__inner {
    border: 3px solid #f58220 !important;
  }
  .el-input-group__append {
    border: 0px !important;
    .el-button {
      width: 100px;
      height: 40px;
      background: #f58220 !important;
      border: 3px solid #f58220 !important;
      border-radius: 0px 10px 10px 0px !important;
      // margin-bottom: -9px !important;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      font-size: 20px;
      letter-spacing: 1px;
      span:hover {
        color: #fff3ee;
      }
    }
    .el-button:hover {
      color: #fff3ee;
    }
    .el-icon {
      font-size: 25px;
      color: #fff;
    }
  }
}
</style>