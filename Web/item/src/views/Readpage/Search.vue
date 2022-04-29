<template>

  <div>

    <Head @searchclick="accept"></Head>
    <div>
      <div
        v-if="searchtxt != ''"
        class="sea_txt"
      >
        <div> {{ select }}：<span>《{{ searchtxt }}》</span></div>
        <div>
          共{{ bookList.length }}册
        </div>
      </div>
      <transition
        appear
        name="animate__animated animate__bounce"
        enter-active-class="animate__backInLeft"
      >
        <div
          class="car"
          v-if="searchtxt == ''"
        >
          <el-carousel
            trigger="hover"
            height="15vw"
            v-if="bookurl[0]"
          >
            <el-carousel-item
              v-for="item in bookurl"
              :key="item"
            >
              <div class="sel_item">
                <div>
                  <img
                    :src="pic(item.bookPic)"
                    @click="enterDtail(item.bookId)"
                  >
                </div>
                <div class="sel_content">
                  <div>
                    <b>书名：</b><span style="color: #102b6a">{{ item.bookTitle }}</span>
                  </div>
                  <div><b>作者：</b>{{ item.bookAuthor }}</div>
                  <div><b>简介：</b>{{ item.bookContent }}</div>
                </div>
              </div>
            </el-carousel-item>
          </el-carousel>
        </div>
      </transition>
      <div class="pb_divi">
        <div></div>
        <div>{{searchtxt==''?'推荐读物':'检索信息'}}</div>
      </div>
      <div>
        <transition
          appear
          name="animate__animated animate__bounce"
          enter-active-class="animate__backInRight"
        >
          <div class="pb_div">
            <div
              v-for="(item, index) in bookList"
              :key="index"
              @click="enterDtail(item.bookId)"
              class="picbox"
            >
              <div class="sea_boopic">
                <img
                  referrerpolicy="no-referrer"
                  :src="pic(item.bookPic)"
                />

              </div>
              <div class="sea_content">
                <div>{{ item.bookTitle }}</div>
                <div>{{ item.bookAuthor }}</div>
              </div>
            </div>
            <div class="tj_page">
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
        </transition>
        <br>
      </div>
    </div>
  </div>
</template>

<script>
import Head from "../../components/ReadSearch/ReadHead.vue";
import merge from "webpack-merge";
export default {
  data() {
    return {
      current: 0,
      pagesize: 0,
      total: 0,
      bookList: [],
      bookurl: [],
      searchtxt: "",
      select: "",
      typename: "",
    };
  },

  components: {
    Head,
  },
  computed() {},
  computed: {},
  mounted() {
    this.init();
    this.load();
    this.picload();
    this.pd();
  },
  methods: {
    pd() {
      var width = document.body.clientWidth;
      if (width <= 480) {
        this.current = 1;
        this.pagesize = 6;
        this.load();
      }
    },
    pic(val) {
      let url = "/api" + val;
      return url;
    },
    accept(data1, data2) {
      this.searchtxt = data1;
      this.select = data2;
      if (data1 == "") {
        this.load();
        this.$router.push({
          query: merge(this.$route.query, { searchtxt: "", select: "" }),
        });
      } else {
        this.queryload(data1, data2);
      }
    },
    queryload(search, searchtype) {
      this.$axios
        .get("/api/book/pageshow", {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            Accept: "application/json",
          },
          params: {
            current: this.current,
            pagesize: this.pagesize,
            search,
            searchtype,
            status: 999,
            booktype: 999,
          },
        })
        .then((res) => {
          // console.log(res);
          this.bookList = res.data.data.records;
          this.total = res.data.data.total;
        })
        .catch((err) => {
          console.log("error:", err);
        });
    },
    enterDtail(id) {
      this.$router.push({
        path: "/Detailbook",
        query: {
          id,
        },
      });
    },
    picload() {
      this.$axios({
        method: "get",
        url: "/api/book/hotbook",
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
          this.bookurl = res.data.data.filter((item, index) => {
            return index <= 5;
          });
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
      if (this.$route.query.searchtxt != null) {
        this.searchtxt = this.$route.query.searchtxt;
        this.select = this.$route.query.select;
      }
    },
    load() {
      this.$axios
        .get("/api/bindinfo/recommend", {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            Accept: "application/json",
          },
          params: {
            current: this.current,
            pagesize: this.pagesize,
            name: sessionStorage.getItem("name"),
          },
        })
        .then((res) => {
          if (res.data.data.records != "") {
            this.bookList = [];
            for (var i = 0; i < res.data.data.records.length; i++) {
              this.bookList.push(res.data.data.records[i].bookList);
            }
            this.total = res.data.data.total;
          } else {
            this.queryload("","");
          }
        })
        .catch((err) => {
          console.log("error:", err);
        });
    },
  },
};
</script>
<style lang='less' scoped>
.tj_page {
  width: 40vw;
  display: flex;
  justify-content: center;
  flex-flow: row wrap;
  margin: 0 auto;
  margin-top: 1vw;
  font-size: 1vw;
}
.sea_txt {
  color: #555;
  width: 40vw;
  margin: 0 auto;
  display: flex;
  flex-flow: row nowrap;
  height: 2vw;
  line-height: 2vw;
  letter-spacing: 2px;
  color: #2c3e50;
  div:first-child {
    font-weight: 700;
    font-size: 1vw;

    span {
      color: #2980b9;
    }
  }
  div:last-child {
    margin-left: 1vw;
    color: #555;
  }
}
.pb_divi {
  width: 40vw;
  display: flex;
  flex-flow: row nowrap;
  height: 1vw;
  margin: 1vw auto;
  div:first-child {
    background: #d35400;
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
.pb_div {
  width: 40vw;
  height: auto;
  margin-top: 1vw;
  background: #fff;
  border-radius: 5px;
  box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px,
    rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
  padding: 1vw;
  display: flex;
  flex-flow: row wrap;
  margin: 0 auto;
  .picbox {
    width: 6.5vw;
    margin-left: 0.9vw;
    margin-bottom: 1vw;
    cursor: pointer;
    .sea_content {
      text-align: center;
      div:nth-child(1) {
        color: #2a5caa;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
      div:nth-child(2) {
        font-size: 0.7vw;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
    }
    .sea_boopic {
      border: 1px solid #ecf0f1;
      img {
        width: 100%;
        height: 10vw;
        background-size: cover;
        vertical-align: bottom;
      }
    }
  }
}
.car {
  width: 40vw;
  margin: 2vw auto;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
  .sel_item {
    display: flex;
    flex-flow: row nowrap;
    padding: 0.5vw;
    img {
      width: 11vw;
      height: 14vw;
      background-size: cover;
      border: 1px solid #ecf0f1;
    }
    .sel_content {
      margin-left: 0.5vw;
      div {
        margin-bottom: 0.5vw;
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
}
.el-carousel__item {
  background: #ffff;
}
</style>