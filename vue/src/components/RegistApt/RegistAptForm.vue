<template>
  <div>
    <b-form @submit="onSubmit">
      <b-container fluid>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="selectedAptName"><b>아파트 이름</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.aptName"
              name="selectedAptName"
              id="selectedAptName"
              disabled
              placeholder="서울역센트럴자이"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>

        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="dong"><b>위치</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.dong"
              name="dong"
              id="dong"
              disabled
              placeholder="만리동2가"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="code"><b>시군구코드</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.code"
              name="code"
              id="code"
              disabled
              placeholder="11140"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="area"><b>전용면적(㎡)</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control"
              type="text"
              v-model="form.area"
              name="area"
              id="area"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="floor"><b>층</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control"
              type="text"
              v-model="form.floor"
              name="floor"
              id="floor"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="registCategory">
            <label for="amount"><b>매매가(억)</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control"
              type="text"
              v-model="form.amount"
              name="amount"
              id="amount"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
      </b-container>
    </b-form>
    <UploadFiles />
    <b-button class="registerAptBtn" type="submit">매물 등록하기</b-button>
  </div>
</template>

<script>
import UploadFiles from "@/components/RegistApt/UploadFiles.vue";
export default {
  data() {
    //변수 생성
    return {
      form: {
        aptName: "",
        dong: "",
        code: "",
        area: "",
        floor: "",
        amount: "",
      },
    };
  },
  components: {
    UploadFiles,
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