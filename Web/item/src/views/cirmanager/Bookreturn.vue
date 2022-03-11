<!--  -->
<template>
  <div>
    <div class="bbn_div">
      <div class="back_input">     
        <div>条码号：</div>
        <div>
          <el-input
            ref="code"
            v-model="barcode"
            placeholder="请输入条码"
            style="width: 300px"         
            @keyup.enter.native="inputcode"
          ></el-input>
        </div>
      </div>
      <div>
        <el-descriptions
          style="width: 98%; margin: 0 auto"
          title="学生信息"
          :column="2"
          size="default"
          border
        >
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                <el-icon><briefcase /></el-icon>
                借阅证号
              </div>
            </template>
            <el-tag size="small"> {{ form.name }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                <el-icon><avatar /></el-icon>
                姓名
              </div>
            </template>
            {{ form.nick }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                <el-icon><iphone /></el-icon>
                电话
              </div>
            </template>
            {{ form.tel }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                <el-icon><male /></el-icon>
                性别
              </div>
            </template>
            {{ form.sex }}
          </el-descriptions-item>
        </el-descriptions>
      </div>
    </div>
    <div>
      <el-table
        :data="data"
        style="width: 98%; margin: 0 auto"
        stripe
        border
         :header-cell-style="{ background: '#FFEEDD', color: '#EA7500' }"
      >
        <el-table-column label="序号" prop="key" fixed="left"></el-table-column>
        <el-table-column label="条码" prop="barcode"></el-table-column>
        <el-table-column label="书名" prop="bookTitle"></el-table-column>
        <el-table-column label="作者" prop="bookAuthor"></el-table-column>
        <el-table-column label="架位号" prop="bookShelf"></el-table-column>
        <el-table-column label="类别" prop="bke.typename"></el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      barcode: "",
      data: [],
      form: {},
    };
  },

  components: {},

  computed: {},

  methods: {
    inputcode(){
       this.$axios({
        method: "put",
        url: "/api/book/backbook",
        contentType: "application/json;charset=UTF-8",
        data: {         
          barcode: this.barcode,
        },
      })
        .then((res) => {
          // console.log(res);
          if(res.data.code=="0"){
            this.form=res.data.data[0].user;
            this.data=res.data.data;
             for (var i = 0; i < res.data.data.length; i++) {
              this.data[i]["key"] = i + 1;
            }
            this.$message.success("还书成功！");
          }
          else{
            this.$message.error(res.data.msg);
          }        
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
<style lang='less'>
.back_input {
  margin: 15px;
  display: flex;
  flex-flow: row wrap;
  line-height: 32px;
  justify-content: center;
}

.bbn_div {
  margin-top: 100px;
}
</style>