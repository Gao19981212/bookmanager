<!--  -->
<template>
  <div>
    <div class="select_radio">
      <el-radio-group v-model="radio" @change="queryradio">
        <el-radio-button label="全部"></el-radio-button>
        <el-radio-button label="已还"></el-radio-button>
        <el-radio-button label="未还"></el-radio-button>
      </el-radio-group>
    </div>
    <div class="search_div">
      <el-input v-model="searchtxt" placeholder="请输入要查询的内容" @keyup.native.enter="load()">
        <template #prepend>
          <el-select
            v-model="select"
            placeholder="请选择"
            style="width: 90px; text-align: center"
          >
            <el-option label="全部" value="全部"></el-option>
            <el-option label="条码号" value="条码号"></el-option>
            <el-option label="书名" value="书名"></el-option>
            <el-option label="学号" value="学号"></el-option>
            <el-option label="姓名" value="姓名"></el-option>
          </el-select>
        </template>
        <template #append>
          <el-button type="primary" :icon="Search" @click="load()"></el-button>
        </template>
      </el-input>
    </div>
    <div>
      <el-table
        :data="data"
        style="width: 98%; margin: 0 auto"
        stripe
        border
        :header-cell-style="{ background: '#FFEEDD', color: '#EA7500' }"
      >
        <el-table-column label="序号" prop="key" width="80"></el-table-column>
        <el-table-column label="学号" prop="name"></el-table-column>
        <el-table-column label="姓名" prop="nick"></el-table-column>
        <el-table-column label="性别" prop="sex"></el-table-column>
        <el-table-column label="电话" prop="tel"></el-table-column>
        <el-table-column label="书名" prop="bookTitle"></el-table-column>
        <el-table-column label="作者" prop="bookAuthor"></el-table-column>
        <el-table-column label="条码" prop="barcode"></el-table-column>
        <el-table-column
        width="200"
          label="借阅时间"
          prop="lendTime"
          :formatter="formatDate"
        >
        </el-table-column>
        <el-table-column  width="200" label="归还时间" prop="backTime"  :formatter="formatDate"></el-table-column>
        <el-table-column label="状态">
          <template #default="scope">
            <span v-html="showstate(scope.row.recordState)"></span>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="record_page">
      <el-pagination
        :total="total"
        :current-page="current"
        :page-size="pagesize"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        layout="total, sizes, prev, pager, next, jumper"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { Search, Edit, Delete } from "@element-plus/icons-vue";
import { markRaw } from "vue";
export default {
  data() {
    return {
      radio: "全部",
      data: [],
      Search,
      select: "全部",
      searchtxt: "",
      total: 0,
      current: 0,
      pagesize: 0,
    };
  },

  components: {
    Search: markRaw(Search),
  },

  created() {
    this.getrouter();
    this.load();
  },

  methods: {
queryradio(){
 this.load();
},
    formatDate(row, column) {
      // 获取单元格数据
      let data = row[column.property];
      if (data === null) {
        return "";
      }
      let dt = new Date(data);
      // console.log("dt"+dt);
      return (
        dt.getFullYear() +
        "-" +
        (dt.getMonth() + 1) +
        "-" +
        dt.getDate() +
        " " +
        dt.getHours() +
        ":" +
        dt.getMinutes() +
        ":" +
        dt.getSeconds()
      );
    },

    showstate(val) {
      if (val == 1) {
        return "<b style='color:#FF8000'>借阅中</b>";
      } else {
        return "<b style='color:#00DB00'>已归还</b>";
      }
    },
    //接受路由参数
    getrouter() {
      this.current = Number(this.$route.query.current);
      this.pagesize = Number(this.$route.query.pagesize);
    },
    load() {
      this.$axios
        .get("/api/record/querypage", {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            Accept: "application/json",
          },
          params: {
            current: this.current,
            pagesize: this.pagesize,
            search: this.searchtxt,
            searchtype: this.select,
            radio: this.radio,
          },
        })
        .then((res) => {
          console.log(res);
          this.data = res.data.data.records;

          for (var i = 0; i < res.data.data.records.length; i++) {
            this.data[i]["key"] = i + 1;
          }
          this.total = res.data.data.total;
        })
        .catch((err) => {
          console.log("error:", err);
        });
    },
    handleSizeChange(pagesize) {
      this.pagesize = Number(pagesize);
      this.pagedata();
    },
    handleCurrentChange(current) {
      this.current = Number(current);
      this.pagedata();
    },
  },
};
</script>
<style lang='less'>
.select_radio {
  margin: 1%;
}
.search_div {
  width: 400px;
  margin: 1%;
}
.record_page {
  width: 700px;
  margin: 0 auto;
  margin-top: 20px;
}
</style>