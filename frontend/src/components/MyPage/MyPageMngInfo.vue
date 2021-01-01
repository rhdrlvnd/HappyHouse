<template>
  <div>
    <h2>내 정보 관리</h2>
    <br />
    <MyInfoForm />
    <b-button
      class="updateMyInfo"
      v-if="getAccessToken"
      href="/myPageMngInfo/update"
      >내 정보 수정</b-button
    >
    <b-button class="deleteMyInfo" v-if="getAccessToken">회원 탈퇴</b-button>
  </div>
</template>


<script>
import MyInfoForm from "@/components/MyPage/MyInfoForm.vue";

//mapGetters 등록
import { mapGetters } from "vuex";

export default {
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
  components: { MyInfoForm },
};
</script>