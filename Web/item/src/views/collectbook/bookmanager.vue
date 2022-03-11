<!--  -->
<template>
  <div>
    <div>
      <div class="book_add">
        <el-button type="primary" @click="add()">新增</el-button>
      </div>
    </div>
    <div class="bookbtn">
      <div class="book_search">
        <el-input v-model="searchtxt" placeholder="请输入要查询的内容">
          <template #prepend>
            <el-select
              v-model="select"
              placeholder="请选择"
              style="width: 90px; text-align: center"
            >
              <el-option label="全部" value="全部"></el-option>
              <el-option label="条码号" value="条码号"></el-option>
              <el-option label="书名" value="书名"></el-option>
              <el-option label="作者" value="作者"></el-option>
            </el-select>
          </template>
          <template #append>
            <el-button type="primary" :icon="Search"></el-button>
          </template>
        </el-input>
      </div>
      <div style="margin-left: 15px">
        <el-form>
          <el-form-item label="图书类别:">
            <el-select
              v-model="selecttype"
              placeholder="请选择"
              style="width: 180px"
            >
              <el-option label="全部" :value="999"></el-option>
              <el-option
                v-for="(item, index) in book_type"
                :key="index"
                :label="item.typename"
                :value="item.id"
              >
              </el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>
      <div style="margin-left: 15px">
        <el-form>
          <el-form-item label="图书状态:">
            <el-select
              v-model="selectstatus"
              placeholder="请选择"
              style="width: 180px"
            >
              <el-option label="全部" :value="999"></el-option>
              <el-option
                v-for="(item, index) in status_arry"
                :key="index"
                :label="item.statusname"
                :value="item.statusId"
              >
              </el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>
      <div style="margin-left: 15px">
        <el-button type="primary" @click="query">查询</el-button>
      </div>
    </div>
    <el-table
      :data="data"
      style="width: 98%; margin: 0 auto"
      stripe
      border
      :header-cell-style="{ background: '#F0F8FF', color: '#1E90FF' }"
    >
      <el-table-column label="序号" prop="key" fixed="left"></el-table-column>
      <el-table-column label="封面">
        <template #default="scope">
          <el-image
            fit="cover"
            :src="imgurl(scope.row.bookPic)"
            style="width: 50px; height: 50px"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column label="条码" prop="barcode"></el-table-column>
      <el-table-column label="书名" prop="bookTitle"></el-table-column>
      <el-table-column label="作者" prop="bookAuthor"></el-table-column>
      <el-table-column label="定价" prop="bookPrice"></el-table-column>
      <el-table-column label="ISBN" prop="bookIsbn"></el-table-column>
      <el-table-column label="索书号" prop="bookNum"></el-table-column>
      <el-table-column label="出版地" prop="bookPlace"></el-table-column>
      <el-table-column label="出版社" prop="bookPublisher"></el-table-column>
      <el-table-column label="出版年" prop="bookYear"></el-table-column>
      <el-table-column label="架位号" prop="bookShelf"></el-table-column>
      <el-table-column label="类别" prop="bke.typename"></el-table-column>
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
          <el-popconfirm title="确定删除?" @confirm="del(scope.row.bookId)">
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
    <div class="book_page">
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
    <el-dialog v-model="dialogVisible" :title="title" width="50%">
      <div style="width: 95%; margin: 0 auto">
        <el-form :model="form" label-width="80px">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="条码号:">
                <el-input
                  v-model="form.barcode"
                  placeholder="请输入条码号"
                ></el-input> </el-form-item
            ></el-col>
            <el-col :span="12">
              <el-form-item label="索书号:">
                <el-input
                  v-model="form.bookNum"
                  placeholder="请输入索书号"
                ></el-input> </el-form-item
            ></el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="书名:">
                <el-input
                  v-model="form.bookTitle"
                  placeholder="请输入书名"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="作者:">
                <el-input
                  v-model="form.bookAuthor"
                  placeholder="请输入作者"
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="出版社:">
                <el-input
                  v-model="form.bookPublisher"
                  placeholder="请输入出版社"
                ></el-input> </el-form-item
            ></el-col>
            <el-col :span="12">
              <el-form-item label="价格:">
                <el-input
                  v-model.number="form.bookPrice"
                  placeholder="请输入价格"
                  type="number"
                ></el-input> </el-form-item
            ></el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="架位号:">
                <el-input
                  v-model="form.bookShelf"
                  placeholder="请输入架位号"
                  type="text"
                ></el-input> </el-form-item
            ></el-col>
            <el-col :span="12"
              ><el-form-item label="标准编码:">
                <el-input
                  v-model="form.bookIsbn"
                  placeholder="请输入标准编码"
                ></el-input> </el-form-item
            ></el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="出版年:">
                <el-input
                  v-model="form.bookYear"
                  placeholder="请输入出版年"
                ></el-input> </el-form-item
            ></el-col>
            <el-col :span="12">
              <el-form-item label="出版地:">
                <el-input
                  v-model="form.bookPlace"
                  placeholder="请输入出版年"
                ></el-input> </el-form-item
            ></el-col>
          </el-row>
          <el-form-item label="类别:">
            <el-select v-model="form.bookType" placeholder="请选择">
              <el-option
                v-for="(item, index) in book_type"
                :key="index"
                :label="item.typename"
                :value="item.id"
              >
              </el-option>
            </el-select>
          </el-form-item>
          <el-row>
            <el-col :span="12">
              <el-form-item label="上传封面:">
                <el-upload
                  class="avatar-uploader"
                  action="http://localhost:9090/files/upload"
                  method="post"
                  ref="up_load"
                  show-file-list
                  :multiple="false"
                  :limit="1"
                  :show-file-list="false"
                  :on-success="handleAvatarSuccess"
                  :on-error="error"
                >
                  <img v-if="imageUrl" :src="imageUrl" class="avatar" />
                  <el-icon v-else class="avatar-uploader-icon"
                    ><plus
                  /></el-icon>
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="简介">
                <el-input
                  v-model="form.bookContent"
                  placeholder="请输入简介内容"
                  show-word-limit
                  type="textarea"
                  class="areatxt"
                />
              </el-form-item>
            </el-col>
          </el-row>
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
import { Search, Edit, Delete } from "@element-plus/icons-vue";
import { markRaw } from "vue";
export default {
  data() {
    return {
      data: [],
      searchtxt: "",
      select: "全部",
      Search,
      Edit,
      Delete,
      title: "新增",
      form: {},
      dialogVisible: false,
      book_type: [],
      status_arry: [],
      selecttype: 999,
      selectstatus: 999,
      current: 0,
      pagesize: 0,
      total: 0,
      imageUrl: "",
    };
  },

  components: {
    Search: markRaw(Search),
    Edit: markRaw(Edit),
    Delete: markRaw(Delete),
  },
  created() {
    this.getrouter();
    this.pagedata();
    this.showtype();
    this.showstatus();
  },
  computed: {},
  methods: {
    imgurl(val) {   
      return val;
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt5M = file.size / 1024 / 1024 < 5;
      if (!isJPG) {
        this.$message.error("上传的格式不正确！");
      }
      if (!isLt5M) {
        this.$message.error("上传的图片不能超过5M");
      }
      return isJPG && isLt5M;
    },
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.form.bookPic = res.data;
      this.$refs['up_load'].clearFiles();
      this.pagedata();
    },
    error(error) {
      console.log(error);
    },
    update(row) {
      this.form = row;
      this.title = "编辑";
      this.imageUrl=row.bookPic;
      this.dialogVisible = true;
    },
    del(id) {
      this.$axios({
        method: "delete",
        url: "/api/book/del/" + id,
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
          console.log(res);
          if (res.data.code == "0") {
            this.pagedata();
            this.$message.success("删除成功！");
          } else {
            this.$message.error("删除失败！");
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    query() {
      this.pagedata();
    },
    //接受路由参数
    getrouter() {
      this.current = Number(this.$route.query.current);
      this.pagesize = Number(this.$route.query.pagesize);
    },
    //显示数据
    pagedata() {
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
            status: this.selectstatus,
            booktype: this.selecttype,
          },
        })
        .then((res) => {
          // console.log(res);
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
    //显示类别
    showtype() {
      this.$axios({
        method: "get",
        url: "/api/booktype/query",
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
          //   console.log(res);
          this.book_type = res.data.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    //显示状态
    showstatus() {
      this.$axios({
        method: "get",
        url: "/api/status/query",
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
          //   console.log(res);
          this.status_arry = res.data.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    add() {
      this.form = {};
     this.imageUrl="";
      this.dialogVisible = true;
    },
    updatemethods() {
      this.$axios({
        method: "put",
        url: "/api/book/update",
        contentType: "application/json;charset=UTF-8",
        data: this.form,
      })
        .then((res) => {
          console.log(res);
          if (res.data.code == "0") {
            this.dialogVisible = false;
            this.pagedata();
            this.$message.success("编辑成功！");
          } else {
            this.$message.error(res.data.msg);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    addmethods() {
      this.$axios({
        method: "post",
        url: "/api/book/bookdata",
        contentType: "application/json;charset=UTF-8",
        data: this.form,
      })
        .then((res) => {
          console.log(res);
          if (res.data.code == "0") {
            this.pagedata();
            this.form = {};
            this.imageUrl="";
            this.dialogVisible = false;
            this.$message.success("新增成功！");
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
        this.addmethods();
      } else {
        this.updatemethods();
      }
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
<style lang="less">
.bookbtn {
  display: flex;
  flex-flow: row nowrap;
  margin-left: 1%;
  .book_search {
    width: 400px;
    .el-input-group__append {
      text-align: center;
    }
  }
}

.book_add {
  margin: 1%;
  button {
    background: #778899;
    border-color: #778899;
  }
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
.areatxt {
  .el-textarea__inner {
    min-height: 178px !important;
  }
}
</style>