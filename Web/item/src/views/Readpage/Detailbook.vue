<template>
  <div>

    <Head
      @searchclick="accept"
      @collclick="loadstatu"
    ></Head>
    <div class="bread">
      <el-breadcrumb separator="> >">
        <el-breadcrumb-item
          v-for="(item, index) in bread"
          :key="index"
          @click="backindex(item)"
        >{{ item }}</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="pb_divi">
      <div></div>
      <div>详细信息</div>
    </div>
    <el-dialog
      v-model="dialogVisible"
      title="评价"
      width="300px"
      draggable
    >
      <div style="width: 150px; margin: 0 auto">
        <el-rate
          v-model="changerate"
          :max="5"
          show-score
          score-template="{value} 分"
        ></el-rate>
      </div>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button
            type="primary"
            @click="writerate()"
          >确定</el-button>
        </span>
      </template>
    </el-dialog>
     <transition
        appear
        name="animate__animated animate__bounce"
        enter-active-class="animate__backInUp"
      >
    <div class="de_div">
      <div class="de_box">
        <h3>{{ Deform.bookTitle }}</h3>
        <div class="de_img">
          <el-image
            :src="pic(Deform.bookPic)"
            fit="cover"
          ></el-image>
        </div>
        <div class="de_content">
          <div>
            作者：<span style="color: #009ad6">{{ Deform.bookAuthor }}</span>
          </div>
          <div>
            出版社：<span>{{ Deform.bookPublisher }}</span>
          </div>
          <div>
            出版年：<span>{{ Deform.bookYear }}</span>
          </div>
          <div>
            出版地：<span>{{ Deform.bookPlace }}</span>
          </div>
          <div>
            定价：<span>{{ Deform.bookPrice }}元</span>
          </div>
          <div>
            类型：<span>{{ type.typename }}</span>
          </div>
          <div>
            馆藏信息：<span style="color: #6f60aa">{{ Deform.bookShelf }}</span>
          </div>
          <div>
            状态：<span :class="status.statusname == '在馆' ? 'su_status' : 'err_status'">{{ status.statusname }}</span>
          </div>
        </div>
        <div class="rate">
          <div>
            <el-button
              type="primary"
              :icon="Reading"
              @click="Collection()"
            >{{
              btntitle
            }}</el-button>
          </div>
          <div>
            <el-rate
              v-model="rate"
              :max="5"
              :disabled="true"
              show-score
              score-template="{value} 分"
            ></el-rate>
          </div>
          <div>
            <el-button
              type="primary"
              style="background: #f47920; border-color: #f47920"
              @click="open()"
            >评价</el-button>
          </div>
        </div>
        <div style="clear: both"></div>
        <div>
          <el-divider
            content-position="left"
            class="txt"
          >内容简介</el-divider>
          <div class="de_txt">
            {{ Deform.bookContent }}
          </div>
        </div>
        <div>
          <el-divider
            content-position="left"
            class="connect"
          >相关读物</el-divider>
          <div class="depb_div">
            <div
              v-for="(item, index) in tjbook"
              :key="index"
              style="margin-left: 15px; cursor: pointer"
              @click="enterDtail(item.bookId)"
            >
              <div class="sea_boopic">
                <el-image
                  fit="cover"
                  :src="pic(item.bookPic)"
                ></el-image>
              </div>
              <div class="sea_content">
                <div>{{ item.bookTitle }}</div>
                <div>{{ item.bookAuthor }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
     </transition>
  </div>
</template>

<script>
import { Reading } from "@element-plus/icons-vue";
import { markRaw } from "vue";
import Head from "../../components/ReadSearch/ReadHead.vue";
export default {
  data() {
    return {
      Deform: {},
      bread: ["首页"],
      rate: 0,
      tjbook: [],
      searchtxt: "",
      select: "",
      Reading,
      type: {},
      status: {},
      bindid: 0,
      Isbind: 0,
      btntitle: "加入个人书架",
      dialogVisible: false,
      changerate: 0,
    };
  },

  components: {
    Head,
    Reading: markRaw(Reading),
  },

  computed: {},

  mounted() {},
  created() {
    this.enterDtail(this.$route.query.id);
  },

  mounted() {},
  methods: {
    pic(val) {
      let url = "/api" + val;
      return url;
    },
    loadstatu(bb) {
      this.load(bb);
    },
    open() {
      this.dialogVisible = true;
    },
    writerate() {
      this.$axios({
        method: "put",
        url: "/api/bindinfo/rate",
        contentType: "application/json;charset=UTF-8",
        data: {
          id: this.bindid,
          bookRate: this.changerate,
        },
      })
        .then((res) => {
          //   console.log(res);
          this.dialogVisible = false;
          this.$message.success(res.data.data);
          this.load(this.Deform.barcode);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    //刷新状态
    load(barcode) {
      this.$axios({
        method: "get",
        url: "/api/bindinfo/show",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          Accept: "application/json",
        },
        params: {
          barcode,
          name: localStorage.getItem("name"),
        },
      })
        .then((res) => {
          //   console.log(res);
          this.bindid = res.data.data.id;
          this.Isbind = res.data.data.isBind;
          this.rate = res.data.data.bookRate;
          if (res.data.data.isBind == 1) {
            this.btntitle = "加入个人书架";
          } else {
            this.btntitle = "取消收藏";
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    //评分和收藏
    Collection() {
      this.Isbind == 1 ? (this.Isbind = 2) : (this.Isbind = 1);
      this.$axios({
        method: "put",
        url: "/api/bindinfo/collect",
        contentType: "application/json;charset=UTF-8",
        data: {
          id: this.bindid,
          isBind: this.Isbind,
          bookRate: this.rate,
        },
      })
        .then((res) => {
          //   console.log(res);

          if (res.data.code == "0") {
            this.$message.success(res.data.data);
          } else {
            this.$message.warning(res.data.msg);
          }
          this.load(this.Deform.barcode);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    //返回首页
    backindex(val) {
      if (val == "首页") {
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
    },
    //查询相关读物
    tjload(id) {
      this.$axios
        .get("/api/book/pageshow", {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            Accept: "application/json",
          },
          params: {
            current: 1,
            pagesize: 6,
            search: "",
            searchtype: "",
            status: 999,
            booktype: id,
          },
        })
        .then((res) => {
          // console.log(res);
          this.tjbook = res.data.data.records;
        })
        .catch((err) => {
          console.log("error:", err);
        });
    },
    enterDtail(id) {
      this.$axios({
        method: "get",
        url: "/api/book/Detailbook",
        contentType: "application/json;charset=UTF-8",
        params: {
          name: sessionStorage.getItem("name"),
          id,
        },
      })
        .then((res) => {
          //   console.log(res);
          this.Deform = res.data.data;
          this.type = res.data.data.bke;
          this.status = res.data.data.sts;
          this.load(this.Deform.barcode);
          this.bread = ["首页"];
          this.bread.push(this.Deform.bookTitle);
          this.tjload(this.Deform.bke.id);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    accept(data1, data2) {
      this.searchtxt = data1;
      this.select = data2;
      this.$router
        .replace({
          path: "/searbook",
          query: {
            current: 1,
            pagesize: 10,
            searchtxt: this.searchtxt,
            select: this.select,
          },
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
<style lang='less' scoped>
.pb_divi {
  width: 40vw;
  display: flex;
  flex-flow: row nowrap;
  height: 1vw;
  margin: 1vw auto;
  padding-left: 5px;
  div:first-child {
    background: #16a085;
    color: #333;
    width: 10px;
    height: 20px;
    border-radius: 10px;
  }
  div:last-child {
    font-weight: 700;
    font-size: 0.7vw;
    margin-left: 0.5vw;
    line-height: 20px;
  }
}
.bread {
  width: 40vw;
  margin: 1vw auto;
  /deep/ .el-breadcrumb__inner {
    font-size: 0.8vw;
    color: #2c3e50;
    font-weight: 800;
    cursor: pointer;
  }
}
.de_div {
  width: 40vw;
  margin: 1vw auto;
  background: #fff;
  border-radius: 5px;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px,
    rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
  padding: 1vw;
  .de_box {
    margin: 1vw;
  }
  .rate {
    width: 14vw;
    float: left;
    padding-top: 2vw;
    padding-left: 2vw;
    /deep/ .el-rate__icon {
      //评分图标大小
      font-size: 1.5vw;
    }
    button {
      background: #1d953f;
      border-color: #1d953f;
    }
    div {
      margin-bottom: 0.5vw;
    }
  }
  .su_status {
    color: #1d953f;
  }
  .err_status {
    color: #ed1941;
  }

  h3 {
    text-align: left;
    margin-bottom: 0.7vw;
    font-size: 1.5vw;
  }
  .de_img {
    float: left;
    .el-image {
      width: 7vw;
      height: 10vw;
    }
  }
  .de_content {
    padding-right: 1.2vw;
    width: auto;
    margin-left: 10px;
    float: left;
    color: #555;
    border-right: 1px solid #d3d7d4;
    font-size: 0.8vw;
    div {
      margin-bottom: 0.25vw;
      text-overflow: ellipsis;
      overflow: hidden;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 1;
    }
  }
  .de_txt {
    height: 10.5vw;
    border: 3px dotted #555;
    padding: 0.5vw;
    color: #72777b;
    font-size: 0.7vw;
    text-indent: 1.4vw;
    text-overflow: ellipsis;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 8;
  }
}

.txt {
  margin:1.5vw 0vw;
  /deep/.el-divider__text {
    background: #e67e22;
    color: #fff;
  }
}
.connect {
    margin:1.5vw 0vw;
  /deep/.el-divider__text {
    background: #3498db;
    color: #fff;
  }
}
.depb_div {
  width: 36vw;
  height: auto;
  display: flex;
  flex-flow: row wrap;

  .sea_content {
    width: 6vw;
    text-align: center;

    div:nth-child(1) {
      color: #2a5caa;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    div:nth-child(2) {
      font-size: 0.6vw;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  }
  .sea_boopic {
    .el-image {
      width: 100%;
      height: 8.8vw;
    }
  }
}
</style>