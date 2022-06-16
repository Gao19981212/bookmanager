import { createStore } from "vuex";

export default createStore({
  state: {
    ctrisCollapse: false,
  },
  mutations: {
    changemenu(state, value) {
      state.ctrisCollapse = value;
    }
  },
  actions: {},
  modules: {},
});
