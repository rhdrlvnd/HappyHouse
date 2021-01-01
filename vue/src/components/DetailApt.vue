<template>
  <div>
    <h2>매물 상세정보</h2>
    <br />
    <DetailAptForm />
    <b-button id="writeArticle" @click="showMsgBoxTwo">찜 하기</b-button>
    <b-button id="backToList" href="javascript:history.back();">확인</b-button>
  </div>
</template>

<script>
import DetailAptForm from "@/components/DetailAptForm.vue";

export default {
  data() {
    return {
      boxOne: "",
      boxTwo: "",
      message: "",
    };
  },
  components: {
    DetailAptForm,
  },
  methods: {
    showMsgBoxTwo() {
      this.boxTwo = "";
      this.$bvModal
        .msgBoxConfirm("이 매물을 찜 하시겠습니까?", {
          title: "찜 확인",
          size: "sm",
          buttonSize: "sm",
          okVariant: "danger",
          okTitle: "YES",
          cancelTitle: "NO",
          footerClass: "p-2",
          hideHeaderClose: false,
          centered: true,
        })
        .then((value) => {
          console.log(value);
          if (value) {
            this.$store
              .dispatch("FAVORITE")
              .then(() => this.$router.replace(`/`))
              //.then(() => this.$router.replace(`/${this.nextRoute}`))
              .catch(({ message }) => (this.msg = message));
            console.log(value);
          }
          this.boxTwo = value;
        })
        .catch(({ message }) => (this.msg = message));
    },
  },
};
</script>