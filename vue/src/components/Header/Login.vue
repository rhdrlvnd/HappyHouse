<template>
  <div class="col-md-1 mr-4">
    <b-button class="btn btn-light" v-b-modal.modal-login>로그인</b-button>

    <!-- 페이지 내에서 모달로 얻은 입력값 보여주기-->

    <!-- <div v-if="submittedNames.length === 0">--</div> -->
    <!-- <ul v-else class="mb-0 pl-3">
        <li v-for="(name, index) in submittedNames" :key = "index">{{ name }}</li>
      </ul> -->

    <b-modal
      id="modal-login"
      ref="modal"
      title="로그인"
      @show="resetModal"
      @hidden="resetModal"
      @ok="login"
    >
      <form ref="form" @submit.stop.prevent="handleSubmit">
        <b-form-group
          label="아이디"
          label-for="input-id"
          invalid-feedback="아이디를 입력해주세요"
        >
          <b-form-input
            id="input-id"
            v-model="user.user_id"
            type="id"
            required
          ></b-form-input
        ></b-form-group>

        <b-form-group
          label="비밀번호"
          label-for="input-password"
          invalid-feedback="비밀번호를 입력해주세요"
        >
          <b-form-input
            id="input-password"
            v-model="user.user_password"
            type="password"
            required
          ></b-form-input>
        </b-form-group>
      </form>
    </b-modal>
  </div>
</template>
        
        <script>
export default {
  data() {
    return {
      user: {
        user_id: "",
        user_password: "",
      },
      message: "",
    };
  },
  methods: {
    login: function () {
      // LOGIN 액션 실행
      // 서버와 통신(axios)을 해 토큰값을 얻어야 하므로 Actions를 호출.
      // 다른 곳에서도 사용해야 하므로 store
      console.log(this.user.user_id);
      this.$store
        .dispatch("LOGIN", this.user)
        .then(() => this.$router.replace(`/`))
        //.then(() => this.$router.replace(`/${this.nextRoute}`))
        .catch(({ message }) => (this.msg = message));
    },
    checkFormValidity() {
      const valid = this.$refs.form.checkValidity();
      this.formState = valid;
      return valid;
    },
    resetModal() {
      this.user.user_id = "";
      this.user.user_password = "";
    },

    handleOk(bvModalEvt) {
      // Prevent modal from closing
      bvModalEvt.preventDefault();
      // Trigger submit handler
      this.handleSubmit();
    },
    handleSubmit() {
      // Exit when the form isn't valid
      if (!this.checkFormValidity()) {
        return;
      }
      // Hide the modal manually
      this.$nextTick(() => {
        this.$bvModal.hide("modal-login");
      });
    },
  },
};
</script>