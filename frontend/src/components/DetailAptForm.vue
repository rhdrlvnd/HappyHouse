<template>
  <div>
    <b-form>
      <b-container fluid>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="aptName"><b>아파트 이름</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.aptName"
              name="aptName"
              id="aptName"
              placeholder="경희궁 파크팰리스"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>

        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="dong"><b>법정동</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.dong"
              name="dong"
              id="dong"
              placeholder="내수동"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="code"><b>지역 코드</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.code"
              name="code"
              id="code"
              placeholder="11110"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="jibun"><b>지번</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.jibun"
              name="jibun"
              id="jibun"
              placeholder="95"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="buildYear"><b>건설년도</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.buildYear"
              name="buildYear"
              id="buildYear"
              placeholder="2003"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="dealAmout"><b>거래금액</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.dealAmout"
              name="dealAmout"
              id="dealAmout"
              placeholder="117,000"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="dealDate"><b>등록일자</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.dealDate"
              name="dealDate"
              id="dealDate"
              placeholder="2019.6.9"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="area"><b>평</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.area"
              name="area"
              id="area"
              placeholder="117.29"
            ></b-form-input>
          </b-col>
          <b-col sm="3"></b-col>
        </b-row>
        <b-row class="mt-2">
          <b-col sm="3"></b-col>
          <b-col sm="3" class="aptInfo">
            <label for="floor"><b>층</b></label>
          </b-col>
          <b-col sm="3">
            <b-form-input
              class="form-control-plaintext"
              type="text"
              v-model="form.floor"
              name="floor"
              id="floor"
              placeholder="9층"
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
        aptName: "",
        dong: "",
        code: "",
        jibun: "",
        buildYear: "",
        dealAmount: "",
        dealDate: "",
        area: "",
        floor: "",
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