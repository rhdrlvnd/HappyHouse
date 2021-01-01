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
      <b-button id="writeArticle" type="submit">글 수정하기</b-button>
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
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.form.title = "";
      this.form.content = "";
    },
  },
};
</script>