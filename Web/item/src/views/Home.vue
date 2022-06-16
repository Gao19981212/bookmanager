<!--  -->
<template>
  <transition
   appear
    name="animate__animated animate__bounce"
   enter-active-class="animate__backInDown"
  >
    <div class="index_num">
      <div class="read_num">
        <div class="icon">
          <el-icon :size="70">
            <avatar />
          </el-icon>
        </div>
        <div class="info">
          <div>读者人数</div>
          <div>{{num.readNum}}人</div>
        </div>
      </div>
      <div class="read_num booknum">
        <div class="icon">
          <el-icon :size="70">
            <collection />
          </el-icon>
        </div>
        <div class="info">
          <div>馆藏总量</div>
          <div>{{num.bookNum}}册</div>
        </div>
      </div>
      <div class="read_num lendnum">
        <div class="icon">
          <el-icon :size="70">
            <zoom-out />
          </el-icon>
        </div>
        <div class="info">
          <div>累计借阅</div>
          <div>{{num.lendNum}}本</div>
        </div>
      </div>
      <div class="read_num backnum">
        <div class="icon">
          <el-icon :size="70">
            <zoom-in />
          </el-icon>
        </div>
        <div class="info">
          <div>累计归还</div>
          <div>{{num.backNum}}本</div>
        </div>
      </div>
    </div>
  </transition>
    <transition
   appear
    name="animate__animated animate__bounce"
   enter-active-class="animate__fadeIn"
  >
  <div class="box">
    <div class="title"> 热门图书借阅排行榜</div>
    <el-table
      :data="boorank"
      size="small"
      :row-class-name="rowstyles"
      :header-cell-class-name="headercss"
    >
      <el-table-column
        label="排名"
        prop="key"
        width="70"
        align="center"
      ></el-table-column>
      <el-table-column
        label="封面"
        align="center"
        width="80"
      >
        <template #default="scope">
          <el-image
            fit="cover"
            :src="imgurl(scope.row.bookPic)"
            style="width: 50px; height: 50px;margin:0 auto"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column
        label="书名"
        prop="bookTitle"
        align="center"
        :show-overflow-tooltip="true"
      ></el-table-column>
      <el-table-column
        label="作者"
        prop="bookAuthor"
        align="center"
        :show-overflow-tooltip="true"
      ></el-table-column>
      <el-table-column
        label="馆藏地"
        prop="bookShelf"
        align="center"
      ></el-table-column>
      <el-table-column
        label="出版地"
        prop="bookPlace"
        align="center"
      ></el-table-column>

    </el-table>
  </div>
  </transition>
</template>

<script>
export default {
  data() {
    return {
      num: {},
      boorank: [],
    };
  },
  created() {
    this.load();
    this.rank();
  },
  methods: {
    //表头样式
    headercss({ row, column, rowIndex, columnIndex }) {
      return "headcss";
    },
    //表格斑马纹
    rowstyles({ row, rowIndex }) {
      if (rowIndex % 2 == 0) {
        return "trowcss";
      } else {
        return "orowcss";
      }
    },
    imgurl(val) {
      let url = "/api" + val;
      return url;
    },
    rank() {
      this.$axios({
        method: "get",
        url: "/api/book/hotbook",
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
          this.boorank = res.data.data;
          for (var i = 0; i < res.data.data.length; i++) {
            this.boorank[i]["key"] = i + 1;
          }
          // console.log(this.boorank);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    load() {
      this.$axios({
        method: "get",
        url: "/api/record/circulation",
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
          // console.log(res);
          this.num = res.data.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
<style lang='less' scoped>
/deep/ .headcss {
  background: #3498db !important;
  color: #ebf7fa;
  font-size: 16px;
  height: 40px;
}
.el-table {
  /deep/ .trowcss {
    background: #e5f1f4 !important;
  }
  .orowcss {
    background: #f8fbfc !important;
  }
}

.box {
  width: 35vw;
  margin-left: 1vw;
  .title {
    width: 35vw;
    height: 35px;
    background: #7f8c8d;
    color: #fff;
    line-height: 35px;
    padding-left: 15px;
  }
}
.index_num {
  display: flex;
  flex-flow: row wrap;
  padding: 1vw;
}
.read_num {
  width: 20vw;
  height: 7vw;
  margin-right: 1vw;
  background-color: #1caf9a;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
  border-color: #1caf9a;
  color: #fff;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  .icon {
    float: left;
  }
  .info {
    float: left;
    div {
      height: 1.5vw;
    }
  }
}
.booknum {
  background-color: #d9534f;
  border-color: #d9534f;
}
.lendnum {
  background-color: #428bca;
  border-color: #428bca;
}
.backnum {
  background-color: #1d2939;
  border-color: #1d2939;
}
</style>