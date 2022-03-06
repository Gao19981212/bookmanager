<!--  -->
<template>
  <div>
    <div class="user_div">
      <div class="add_div">
        <el-button type="primary" @click="add()">新增</el-button>
      </div>
      <div class="user_add">
        <div>
          <el-input
            v-model="searchtxt"
            placeholder="请输入查询的用户名"
            style="width: 300px"
          />
        </div>
        <div>
          <el-button type="primary" style="margin-left: 15px" @click="load"
            >查询</el-button
          >
        </div>
      </div>
    </div>
    <el-table
      :data="tableData"
      stripe
      border
      style="width: 98%; margin: 0 auto"
      :header-cell-style="{ background: '#F0F8FF', color: '#1E90FF' }"
    >
      <el-table-column prop="key" label="序号" />
      <el-table-column prop="name" label="用户名" />
      <el-table-column prop="password" label="密码" />
      <el-table-column prop="nick" label="姓名" />
      <el-table-column prop="age" label="年龄" />
      <el-table-column prop="sex" label="性别" />
      <el-table-column prop="user_types.type_name" label="类型">
      </el-table-column>
      <el-table-column fixed="right" label="操作" width="120">
        <template #default="scope">
          <el-button
            type="primary"
            @click="update(scope.row)"
            :icon="Edit"
            circle
            style="background: #426ab3"
          >
          </el-button>
          <el-popconfirm title="确定删除?" @confirm="del(scope.row.id)">
            <template #reference>
              <el-button
                type="danger"
                style="background: #d64f44; margin-left: 15px"
                :icon="Delete"
                circle
              ></el-button>
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div class="Read_page">
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
    <el-dialog v-model="dialogVisible" :title="title" width="28%">
      <div style="width: 80%; margin: 0 auto">
        <el-form :model="form" label-width="80px">
          <el-form-item label="用户名:">
            <el-input v-model="form.name" placeholder="请输入用户名"></el-input>
          </el-form-item>
          <el-form-item label="密码:">
            <el-input
              v-model="form.password"
              placeholder="请输入密码"
            ></el-input>
          </el-form-item>
          <el-form-item label="姓名:">
            <el-input v-model="form.nick" placeholder="请输入姓名"></el-input>
          </el-form-item>
          <el-form-item label="性别:">
            <el-radio-group v-model="form.sex">
              <el-radio label="男">男</el-radio>
              <el-radio label="女">女</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="年龄:">
            <el-input
              v-model.number="form.age"
              placeholder="请输入年龄"
              type="number"
            ></el-input>
          </el-form-item>
          <el-form-item label="类型:">
            <el-select v-model="form.type" placeholder="请选择">
              <el-option label="管理员" value="1"> </el-option>
              <el-option label="读者" value="2"> </el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="addsure()">确定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>
<script>
import { Edit, Delete } from "@element-plus/icons-vue";
import { markRaw } from "vue";
export default {
  data() {
    return {
      tableData: [],
      layoutwidth: 0,
      searchtxt: "",
      Edit,
      Delete,
      current: 0,
      pagesize: 0,
      total: 0,
      dialogVisible: false,
      form: {},
      title: "新增",
    };
  },

  components: {
    Edit: markRaw(Edit),
    Delete: markRaw(Delete),
  },

  computed: {},
  created() {
    this.indexrouter();
    this.load();
  },
  mounted() {},

  methods: {
    add() {
      this.dialogVisible = true;
    },
    addmethod() {
      this.$axios({
        method: "post",
        url: "/api/user/adduser",
        contentType: "application/json;charset=UTF-8",
        data: this.form,
      })
        .then((res) => {
          console.log(res);
          if (res.data.code == "0") {
            this.form = {};
            this.dialogVisible = false;
            this.load();
            this.$message.success("新增成功！");
          } else {
            this.$message.error(res.data.msg);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    updatemethod() {
      this.$axios({
        method: "put",
        url: "/api/user/update",
        contentType: "application/json;charset=UTF-8",
        data: this.form,
      })
        .then((res) => {
          console.log(res);
          if (res.data.code == "0") {
            this.dialogVisible = false;
            this.load();
            this.$message.success("编辑成功！");
          } else {
            this.$message.error(res.data.msg);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    addsure() {
      if (this.title == "新增") {
        this.addmethod();
      } else {
        this.updatemethod();
      }
    },
    indexrouter() {
      this.current = Number(this.$route.query.current);
      this.pagesize = Number(this.$route.query.pagesize);
    },
    del(id) {
      // console.log(id);
      this.$axios({
        method: "delete",
        url: "/api/user/del/" + id,
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
          // console.log(res);
          if (res.data.code == "0") {
            this.load();
            this.$message.success("删除成功！");
          } else {
            this.$message.error("删除失败！");
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    update(row) {
      row.type = String(row.type);
      this.form = row;
      this.title = "编辑";
      this.dialogVisible = true;
    },
    load() {
      this.$axios
        .get("/api/user/pageshow", {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            Accept: "application/json",
          },
          params: {
            pageNum: this.current,
            pagesize: this.pagesize,
            search: this.searchtxt,
          },
        })
        .then((res) => {
          // console.log(res.data);
          this.tableData = res.data.data.records;
          for (var i = 0; i < res.data.data.records.length; i++) {
            this.tableData[i]["key"] = i + 1;
          }
          this.total = res.data.data.total;
        })
        .catch((err) => {
          console.log("error:", err);
        });
    },
    handleSizeChange(pagesize) {
      this.pagesize = pagesize;
      this.load();
    },
    handleCurrentChange(current) {
      this.current = current;
      this.load();
    },
  },
};
</script>
<style lang='less'>
.user_div {
  display: flex;
  flex-flow: column nowrap;
  .add_div {
    margin: 15px 0px 15px 1%;
    button {
      background: #778899;
      border-color: #778899;
    }
  }
  .user_add {
    display: flex;
    flex-flow: row nowrap;
    margin-left: 1%;
    margin-bottom: 15px;
    button {
      background: #6495ed;
      border-color: #6495ed;
    }
    // margin: 10px 0px;
  }
}
.Read_page {
  width: 700px;
  margin: 0 auto;
  margin-top: 20px;
}
</style>