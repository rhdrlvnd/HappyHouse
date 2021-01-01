<template>
  <div>
    <h2>정보 수정</h2>
    <br />
    <UpdateMyInfoForm />
    <b-button class="updateMyInfo" type="submit" v-if="getAccessToken"
      >내 정보 수정</b-button
    >
    <b-button id="backToList" href="/myPageMngInfo" v-if="getAccessToken"
      >돌아가기</b-button
    >
  </div>
</template>


<script>
import UpdateMyInfoForm from "@/components/MyPage/UpdateMyInfoForm.vue";

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
  components: { UpdateMyInfoForm },
};
</script>