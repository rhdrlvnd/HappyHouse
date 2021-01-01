<template>
  <div>
    <b-form>
      <b-container fluid>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="user_id"><b>아이디</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.user_id"
              name="user_id"
              id="user_id"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>

        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="user_password"><b>비밀번호</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.user_password"
              name="user_password"
              id="user_password"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="user_email"><b>이메일</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.user_email"
              name="user_email"
              id="user_email"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="user_name"><b>이름</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.user_name"
              name="user_name"
              id="user_name"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="phone"><b>연락처</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.phone"
              name="phone"
              id="phone"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
      </b-container>
    </b-form>
  </div>
</template>

<script>
export default {
  data() {
    //변수 생성
    return {
      form: {
        user_id: "",
        user_password: "",
        user_email: "",
        user_name: "",
        phone: "",
      },
    };
  },
  methods: {
    // fnList() {
    //   //리스트 화면으로 이동 함수
    //   this.$router.push({ path: "./list", query: this.body });
    // },
    // fnAddProc() {
    //   //등록 프로세스
    //   if (!this.title) {
    //     //제목이 없다면 값을 입력하라고 알려준다.
    //     alert("제목을 입력해 주세요");
    //     this.$refs.title.focus(); //방식으로 선택자를 찾는다.
    //     return;
    //   }

    //   this.form = {
    //     //backend로 전송될 POST 데이터
    //     title: this.title,
    //     content: this.content,
    //   };

    //   this.$axios
    //     .post("http://localhost:3000/api/board", this.form)
    //     .then((res) => {
    //       if (res.data.success) {
    //         alert("등록되었습니다.");
    //         this.fnList();
    //       } else {
    //         alert("실행중 실패했습니다.\n다시 이용해 주세요");
    //       }
    //     })
    //     .catch((err) => {
    //       console.log(err);
    //     });
    // },
    onSubmit(evt) {
      evt.preventDefault();
      alert(JSON.stringify(this.form));
    },
  },
};
</script>