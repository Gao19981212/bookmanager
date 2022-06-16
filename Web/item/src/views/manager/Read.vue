<!--  -->
<template>
  <div>
    <div class="user_div">
      <div class="add_div">
        <el-button type="primary" @click="add()">新增</el-button>
      </div>
      <div class="user_add">
        <div>
          <el-input v-model="searchtxt" placeholder="请输入查询的用户名" style="width: 300px" @keypress="load" />
        </div>
        <div>
          <el-button type="primary" style="margin-left: 15px" @click="load">查询</el-button>
        </div>
      </div>
    </div>
    <el-table :data="tableData" stripe border style="width: 98%; margin: 0 auto"
      :header-cell-style="{ background: '#F0F8FF', color: '#1E90FF' }">
      <el-table-column prop="key" label="序号" />
      <el-table-column prop="name" label="用户名" />
      <el-table-column prop="password" label="密码" />
      <el-table-column prop="nick" label="姓名" />
      <el-table-column label="电话" prop="tel"></el-table-column>
      <el-table-column prop="age" label="年龄" />
      <el-table-column prop="sex" label="性别" />
      <el-table-column prop="user_types.type_name" label="类型">
      </el-table-column>
      <el-table-column fixed="right" label="操作" width="120">
        <template #default="scope">
          <el-button type="primary" @click="update(scope.row)" :icon="Edit" circle style="background: #426ab3">
          </el-button>
          <el-popconfirm title="确定删除?" @confirm="del(scope.row.id)">
            <template #reference>
              <el-button type="danger" style="background: #d64f44; margin-left: 15px" :icon="Delete" circle></el-button>
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div class="Read_page">
      <el-pagination :total="total" :current-page="current" :page-size="pagesize" @size-change="handleSizeChange"
        @current-change="handleCurrentChange" layout="total, sizes, prev, pager, next, jumper">
      </el-pagination>
    </div>
    <el-dialog v-model="dialogVisible" :title="title" width="28%">
      <div style="width: 80%; margin: 0 auto">
        <el-form :model="form" label-width="80px">
          <el-form-item label="用户名:">
            <el-input v-model="form.name" placeholder="请输入用户名"></el-input>
          </el-form-item>
          <el-form-item label="密码:">
            <el-input v-model="form.password" placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item label="姓名:">
            <el-input v-model="form.nick" placeholder="请输入姓名"></el-input>
          </el-form-item>
          <el-form-item label="电话:">
            <el-input v-model="form.tel" placeholder="请输入电话"></el-input>
          </el-form-item>
          <el-form-item label="性别:">
            <el-radio-group v-model="form.sex">
              <el-radio label="男">男</el-radio>
              <el-radio label="女">女</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="年龄:">
            <el-input v-model.number="form.age" placeholder="请输入年龄" type="number"></el-input>
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
import { onMounted, reactive, shallowRef, toRefs } from "vue";
import { addinfo, updateinfo, loaddata, deldata } from "../../request/read";
import { ElMessage } from 'element-plus'
import { useRoute } from 'vue-router';
export default {
  setup() {
    const route = useRoute();
    const state = reactive({
      tableData: [],
      layoutwidth: 0,
      searchtxt: "",
      Edit: shallowRef(Edit),
      Delete: shallowRef(Delete),
      current: 0,
      pagesize: 0,
      total: 0,
      dialogVisible: false,
      form: {},
      title: "新增",
    })
    function add() {
      state.dialogVisible = true;
      state.form = {};
      state.title = "新增";
    }
    //接收路由参数
    function loadroute() {
      state.current = Number(route.query.current);
      state.pagesize = Number(route.query.pagesize);
    }
    //加载表格
    function load() {
      const data = {
        pageNum: state.current,
        pagesize: state.pagesize,
        search: state.searchtxt,
      }
      loaddata(data).then((res) => {
        // console.log(res.data);
        state.tableData = res.data.data.records;
        for (var i = 0; i < res.data.data.records.length; i++) {
          state.tableData[i]["key"] = i + 1;
        }
        state.total = res.data.data.total;
      })
        .catch((err) => {
          console.log("error:", err);
        });
    }

    //新增
    function addmethod() {
      addinfo(state.form).then((res) => {
        // console.log(res);
        if (res.data.code == "0") {
          state.form = {};
          state.dialogVisible = false;
          load();
          ElMessage.success("新增成功！");
        } else {
          ElMessage.error(res.data.msg);
        }
      })
        .catch((err) => {
          console.log(err);
        });
    }
    //修改
    function updatemethod() {
      updateinfo(state.form).then((res) => {
        // console.log(res);
        if (res.data.code == "0") {
          state.dialogVisible = false;
          load();
          ElMessage.success("编辑成功！");
        } else {
          ElMessage.error(res.data.msg);
        }
      })
        .catch((err) => {
          console.log(err);
        });
    }
    //判断是新增还是修改
    function addsure() {
      if (state.title == "新增") {
        addmethod();
      } else {
        updatemethod();
      }
    }
    //删除
    function del(id) {
      deldata(id).then((res) => {
        // console.log(res);
        if (res.data.code == "0") {
          load();
          ElMessage.success("删除成功！");
        } else {
          ElMessage.error(res.data.msg);
        }
      })
        .catch((err) => {
          console.log(err);
        });
    }
    //显示页数
    function handleSizeChange(pagesize) {
      state.pagesize = pagesize;
      load();
    }
    //显示第几页
    function handleCurrentChange(current) {
      state.current = current;
      load();
    }
    function update(row) {
      row.type = String(row.type);
      state.form = row;
      state.title = "编辑";
      state.dialogVisible = true;
    }
    onMounted(() => {
      loadroute();
      load();
    })
    return {
      ...toRefs(state),
      load,
      add,
      addsure,
      handleSizeChange,
      handleCurrentChange,
      del,
      update,

    }
  }
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