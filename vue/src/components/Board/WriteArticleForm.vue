<template>
  <div>
    <b-form @submit="onSubmit" @reset="onReset">
      <b-container fluid>
        <b-row>
          <b-col sm="2">
            <label for="title">제목</label>
          </b-col>
          <b-col sm="10">
            <b-form-input
              v-model="form.title"
              name="title"
              id="title"
              required
            ></b-form-input>
          </b-col>
        </b-row>

        <b-row class="mt-2">
          <b-col sm="2">
            <label for="content">내용</label>
          </b-col>
          <b-col sm="10">
            <b-form-textarea
              id="content"
              v-model="form.content"
              rows="15"
              no-auto-shrink
              required
            ></b-form-textarea>
          </b-col>
        </b-row>
      </b-container>

      <b-button type="reset" style="margin-top: 10px; margin-left: 10px"
        >초기화</b-button
      >
      <b-button id="writeArticle" type="submit">글 등록하기</b-button>
      <br />
      <b-button id="backToList" href="/board">목록으로 돌아가기</b-button>
    </b-form>
  </div>
</template>

<script>
export default {
  data() {
    //변수 생성
    return {
      form: {
        title: "",
        content: "",
      },
    };
  },
  methods: {
    onSubmit(evt) {
      evt.preventDefault();
      // alert(JSON.stringify(this.form));

      // Exit when the form isn't valid
      this.$store
        .dispatch("WRITE", this.form)
        .then(() => this.$router.replace(`/board`))
        //.then(() => this.$router.replace(`/${this.nextRoute}`))
        .catch(({ message }) => (this.msg = message));
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.form.title = "";
      this.form.content = "";
    },
  },
};
</script>