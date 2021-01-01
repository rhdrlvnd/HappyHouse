<template>
  <div class="Header">
    <b-navbar class="narbar navbar-expand-sm bg-light">
      <b-navbar-brand href="/">Happy House</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <!-- <router-link to="/apt">아파트정보</router-link> -->
          <router-link to="/searchLocation" class="nav-link"
            >위치 검색</router-link
          >
          <router-link to="/searchApt" class="nav-link">이름 검색</router-link>
          <router-link to="/board" class="nav-link">자유게시판</router-link>
          <!-- v-if="checkREToken" -->
          <div class="checkRE">
            <router-link to="/registApt" class="nav-link"
              >매물 등록하기</router-link
            >
          </div>
        </b-navbar-nav>
      </b-collapse>
      <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <!-- <div class="col-md-3 ml-auto"> -->
        <div class="col-md-3 ml-auto">
          <b-navbar-nav class="checkLogin" v-if="getAccessToken">
            <MyPage />
            <Logout />
          </b-navbar-nav>

          <b-navbar-nav class="checkLogin" v-else>
            <SignUp />
            <Login />
          </b-navbar-nav>
        </div>
      </div>
    </b-navbar>
  </div>
</template>

<script>
import Vue from "vue";
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";

import Login from "@/components/Header/Login.vue";
import SignUp from "@/components/Header/SignUp.vue";
import MyPage from "@/components/Header/MyPage.vue";
import Logout from "@/components/Header/Logout.vue";

import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);

//mapGetters 등록
import { mapGetters } from "vuex";

export default {
  name: "Header",
  components: { SignUp, Login, Logout, MyPage },
  data() {
    return {
      isLogin: false,
    };
  },
  // getAccessToken : 서버에서 토큰을 얻어온다
  computed: {
    ...mapGetters(["getAccessToken", "getUserId", "getUserName"]),
    ...mapGetters(["checkREToken", "getUserRole"]),
  },
  methods: {
    onClickLogout() {
      this.$store
        .dispatch("LOGOUT")
        .then(() => this.$router.replace("/").catch(() => {}));
    },
  },
};
</script>

<style src="@/assets/styles/style.css"></style>
