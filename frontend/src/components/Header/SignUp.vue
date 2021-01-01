<template>
  <div>
    <b-button class="btn btn-light" v-b-modal.modal-sign-up>회원가입</b-button>

    <!-- 페이지 내에서 모달로 얻은 입력값 보여주기-->

    <!-- <div v-if="submittedNames.length === 0">--</div>
      <ul v-else class="mb-0 pl-3">
        <li v-for="(name, index) in submittedNames" :key = "index">{{ name }}</li>
      </ul> -->

    <b-modal
      id="modal-sign-up"
      ref="modal"
      title="회원가입"
      @show="resetModal"
      @hidden="resetModal"
      @ok="handleOk"
    >
      <form ref="form" @submit="handleSubmit">
        <b-form-group
          :state="formState"
          label="아이디"
          label-for="input-id"
          invalid-feedback="올바르지 않은 아이디입니다."
        >
          <b-form-input
            id="input-id"
            v-model="user.user_id"
            :state="formState"
            type="id"
            required
          ></b-form-input
        ></b-form-group>

        <b-form-group
          :state="formState"
          label="비밀번호"
          label-for="input-password"
          invalid-feedback="올바르지 않은 비밀번호입니다."
        >
          <b-form-input
            id="input-password"
            v-model="user.user_password"
            :state="formState"
            type="password"
            required
          ></b-form-input>
          <b-form-input
            id="check-input-password"
            v-model="password"
            :state="formState"
            type="password"
            required
            placeholder="비밀번호 재입력"
          ></b-form-input
        ></b-form-group>

        <b-form-group
          :state="formState"
          label="이름"
          label-for="input-name"
          invalid-feedback="입력하신 이름을 확인해주세요."
        >
          <b-form-input
            id="input-name"
            v-model="user.user_name"
            :state="formState"
            type="text"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group
          :state="formState"
          label="이메일"
          label-for="input-email"
          invalid-feedback="유효하지 않은 이메일입니다."
        >
          <b-form-input
            id="input-emial"
            v-model="user.user_email"
            :state="formState"
            type="email"
            required
          ></b-form-input
        ></b-form-group>
        <b-form-group
          :state="formState"
          label="Phone"
          label-for="input-phone"
          invalid-feedback="유효하지 않은 전화번호입니다."
        >
          <b-form-input
            id="input-phone"
            v-model="user.phone"
            :state="formState"
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
      password: "",
      user: {
        user_id: "",
        user_password: "",
        user_email: "",
        phone: "",
        user_name: "",
      },
      formState: null,
      submittedNames: [],
    };
  },
  methods: {
    checkFormValidity() {
      const valid = this.$refs.form.checkValidity();
      this.formState = valid;
      return valid;
    },
    resetModal() {
      this.name = "";
      this.formState = null;
    },
    handleOk(bvModalEvt) {
      // Prevent modal from closing
      bvModalEvt.preventDefault();
      // Trigger submit handler
      this.handleSubmit();
    },
    handleSubmit() {
      // Exit when the form isn't valid
      this.$store
        .dispatch("REGIST", this.user)
        .then(() => this.$router.replace(`/`))
        //.then(() => this.$router.replace(`/${this.nextRoute}`))
        .catch(({ message }) => (this.msg = message));

      if (!this.checkFormValidity()) {
        return;
      }
      // Push the name to submitted names
      this.submittedNames.push(this.name);
      // Hide the modal manually
      this.$nextTick(() => {
        this.$bvModal.hide("modal-sign-up");
      });
    },
  },
};
</script>