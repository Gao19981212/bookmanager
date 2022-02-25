<!--  -->
<template>
  <div>
      <header>
          <nav><Head></Head></nav>
      </header>
      <aside>
           <Left></Left>
      </aside>
      <article>
          <router-view></router-view>
      </article>
  </div>
</template>

<script>
import Head from"../components/HeadMenu.vue";
import Left from "../components/Left.Menu.vue";
export default {
  data () {
    return {
    };
  },

  components: {
      Head,
      Left,
  },

  computed: {},

  mounted() {
      
  },

  methods: {}
}

</script>
<style lang='less'>
</style>