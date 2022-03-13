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
    </div>

    <div class="bread" v-if="ctrDetail == true">
      <el-divider content-position="center">详细信息</el-divider>
      <el-breadcrumb separator=">>">
        <el-breadcrumb-item
          v-for="(item, index) in bread"
          :key="index"
          @click="backindex(item)"
          >{{ item }}</el-breadcrumb-item
        >
      </el-breadcrumb>
    </div>
    <div class="de_div" v-if="ctrDetail == true">
      <div v-for="(item, index) in Deform" :key="index">
        <h3>{{ item.bookTitle }}</h3>
        <div class="de_img">
          <el-image :src="item.bookPic" fit="cover"></el-image>
        </div>
        <div class="de_content">
          <div>
            作者：<span style="color: #009ad6">{{ item.bookAuthor }}</span>
          </div>
          <div>
            出版社：<span>{{ item.bookPublisher }}</span>
          </div>
          <div>
            出版年：<span>{{ item.bookYear }}</span>
          </div>
          <div>
            出版地：<span>{{ item.bookPlace }}</span>
          </div>
          <div>
            定价：<span>{{ item.bookPrice }}元</span>
          </div>
          <div>
            类型：<span>{{ item.bke.typename }}</span>
          </div>
          <div>
            馆藏信息：<span style="color: #6f60aa">{{ item.bookShelf }}</span>
          </div>
          <div>
            状态：<span
              :class="
                item.sts.statusname == '在馆' ? 'su_status' : 'err_status'
              "
              >{{ item.sts.statusname }}</span
            >
          </div>
        </div>
        <div class="rate">
          <div>
            <el-button type="primary" :icon="Reading">加入个人书架</el-button>
          </div>
          <div>
            <el-rate
              v-model="rate"
              :max="5"
              size="default"
              allow-half
              show-score
              score-template="{value} 分"
            ></el-rate>
          </div>
          <div>
            <el-button
              type="primary"
              style="background: #f47920; border-color: #f47920"
              >评价</el-button
            >
          </div>
        </div>
        <div style="clear: both"></div>
        <div>
          <el-divider content-position="left">内容简介</el-divider>
          <div class="de_txt">
            {{ item.bookContent }}
          </div>
        </div>
      </div>
    </div>
    <div v-if="ctrDetail != true">
      <div class="car">
        <el-carousel
          :interval="4000"
          type="card"
          height="300px;"
          trigger="hover"
          class="car"
        >
          <el-carousel-item v-for="item in bookurl" :key="item">
            <div @click="enterDtail(item.bookId)" class="sel_item">
              <div>
                <el-image :src="item.bookPic"></el-image>
              </div>
              <div class="sel_content">
                <div>
                  <b>书名：</b
                  ><span style="color: #102b6a">{{ item.bookTitle }}</span>
                </div>
                <div><b>作者：</b>{{ item.bookAuthor }}</div>
                <div><b>简介：</b>{{ item.bookContent }}</div>
              </div>
            </div>
          </el-carousel-item>
        </el-carousel>
      </div>

      <el-divider content-position="left" class="pb_divi">热门读物</el-divider>
      <div>
        <div class="pb_div">
          <div
            v-for="(item, index) in bookList"
            :key="index"
            style="margin-left: 15px; cursor: pointer"
            @click="enterDtail(item.bookId)"
          >
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
  </div>
</template>

<script>
import { Search, Reading } from "@element-plus/icons-vue";
import { markRaw } from "vue";
export default {
  data() {
    return {
      Search: Search,
      Reading,
      name: sessionStorage.getItem("nick"),
      bookinfo: ["书名", "作者", "条码号", "索书号", "出版年", "ISBN"],
      ex: -1,
      select: "",
      searchtxt: "",
      current: 0,
      pagesize: 0,
      total: 0,
      bookList: [],
      bookurl: [],
      ctrDetail: false,
      Deform: [],
      bread: ["首页"],
      rate: "",
    };
  },

  components: {
    Search: markRaw(Search),
    Reading: markRaw(Reading),
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
    backindex(val) {
      val == "首页" ? (this.ctrDetail = false) : (this.ctrDetail = true);
    },
    enterDtail(id) {
      this.$axios({
        method: "get",
        url: "/api/book/Detailbook",
        contentType: "application/json;charset=UTF-8",
        params: {
          id,
        },
      })
        .then((res) => {
          console.log(res);
          this.ctrDetail = true;
          this.Deform = res.data.data;
          this.bread = ["首页"];
          this.bread.push(res.data.data[0].bookTitle);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    picload() {
      this.$axios({
        method: "get",
        url: "/api/book/hotbook",
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
          // console.log(res);
          this.bookurl = res.data.data;
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
.rate {
  width: 200px;
  float: left;
  margin: 20px;
  button {
    background: #1d953f;
    border-color: #1d953f;
  }
  div {
    margin-bottom: 10px;
  }
}
.su_status {
  color: #1d953f;
}
.err_status {
  color: #ed1941;
}
.bread {
  width: 600px;
  margin: 0 auto;
  margin-top: 20px;
  .el-breadcrumb__inner {
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
  }
}
.de_div {
  width: 600px;
  margin: 0 auto;
  margin-top: 30px;
  h3 {
    text-align: left;
    margin-bottom: 10px;
    font-size: 26px;
  }
  .de_img {
    float: left;
    .el-image {
      width: 135px;
      height: 200px;
    }
  }
  .de_content {
    padding-right: 30px;
    width: 210px;

    margin-left: 10px;
    float: left;
    color: #555;
    border-right: 1px solid #d3d7d4;
    div {
      margin-bottom: 4px;
      text-overflow: ellipsis;
      overflow: hidden;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 1;
    }
  }
  .de_txt {
    height: 200px;
    border: 3px dotted #555;
    padding: 10px;
    color: #72777b;
    font-size: 14px;
    text-indent: 28px;
    text-overflow: ellipsis;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 8;
  }
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
.car {
  width: 1000px;
  margin: 0 auto;
  .el-image {
    width: 220px;
    height: 280px;
    // margin: 10px;
  }
  .sel_item {
    display: flex;
    flex-flow: row nowrap;
    padding: 10px;
    .sel_content {
      margin-left: 10px;
      div {
        margin-bottom: 10px;
      }
      div:nth-child(3) {
        text-overflow: ellipsis;
        overflow: hidden;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 5;
      }
    }
  }

  // .el-carousel__item{
  //   width: 200px;
  //   height: 100px;
  // }
}

.el-carousel__item:nth-child(2n) {
  // background-color: #99a9bf;
  background: #e0e0e0;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #f0f0f0;
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
  width: 600px;
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