<!--  -->
<template>
  <div>
    <header>
      <nav><Head></Head></nav>
    </header>
    <div style="display: flex;">
      <aside style="width:200px;">
        <Left></Left>
      </aside>    
        <router-view style="flex: 1"></router-view>    
    </div>
  </div>
</template>

<script>
import Head from "../components/HeadMenu.vue";
import Left from "../components/Left.Menu.vue";
export default {
  data() {
    return {};
  },

  components: {
    Head,
    Left,
  },

  computed: {},

  mounted() {},

  methods: {},
};
</script>
<style lang='less'>
</style>