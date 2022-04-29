<!--  -->
<template>
  <div>

    <div style="display: flex;">
      <aside>
        <Left></Left>
      </aside>
      <div style="flex: 1">
        <header>
          <Head></Head>
        </header>
        <article>
          <router-view></router-view>
        </article>
      </div>
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
body {
  background: #f0f0f0;
  overflow: hidden;
}
.aside {
  width: 200px;
}
</style>