<!--  -->
<template>
  <div class="index_num">
    <div class="read_num">
      <div class="icon">
        <el-icon :size="70"><avatar /></el-icon>
      </div>
      <div class="info">
        <div>读者人数</div>
        <div>{{num.readNum}}人</div>
      </div>
    </div>
    <div class="read_num booknum">
      <div class="icon">
       <el-icon :size="70"><collection /></el-icon>
      </div>
      <div class="info">
        <div>馆藏总量</div>
        <div>{{num.bookNum}}册</div>
      </div>
    </div>
     <div class="read_num lendnum">
      <div class="icon">
       <el-icon :size="70"><zoom-out /></el-icon>
      </div>
      <div class="info">
        <div>累计借阅</div>
        <div>{{num.lendNum}}本</div>
      </div>
    </div>
     <div class="read_num backnum">
      <div class="icon">
        <el-icon :size="70"><zoom-in /></el-icon>
      </div>
      <div class="info">
        <div>累计归还</div>
        <div>{{num.backNum}}本</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      num: {},
    };
  },
  created() {
    this.load();
  },
  methods: {
    load(){
  this.$axios({
        method: "get",
        url: "/api/record/circulation",
        contentType: "application/json;charset=UTF-8",
      })
        .then((res) => {
            console.log(res); 
            this.num=res.data.data;
         
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
<style lang='less'>
.index_num {
  display: flex;
  flex-flow: row wrap;
 margin: 15px;
 height: 320px;
}
.read_num {
  width: 390px;
  height: 139px;
  margin-left: 25px;
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
      height: 30px;
    }
  }
}
.booknum{
  background-color: #D9534F;
  border-color: #D9534F;
}
.lendnum{
    background-color: #428bca;
  border-color: #428bca;
}
.backnum{
  background-color: #1d2939;
  border-color: #1d2939;
}
</style>