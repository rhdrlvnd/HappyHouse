<template>
  <div id="app">
    <Header />
    <b-container fluid class="bv-example-row">
      <b-row class="mb-3"> </b-row>
    </b-container>
    <!-- 3. 보여주기 -->
    <router-view />
  </div>
</template>

<script>
//1. 사용할 컴포넌트 불러오기.
import Header from '@/components/Header.vue';

export default {
  name: 'App',
  components: {
    // ES6 : property shorthand
    // Header: Header == Header
    //2. 컴포넌트 등록하기.
    Header,
  },
  data() {
    return {};
  },
  methods: {},
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
