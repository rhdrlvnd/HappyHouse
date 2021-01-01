<template>
  <div>
    <center>
      <div class="row" style="width: 80%">
        <div class="col mr-sm-11">
          <b-form-input
            v-model="aptName"
            type="search"
            name="aptName"
            id="aptName"
            placeholder="ex) 현대아파트"
          ></b-form-input>
        </div>
        <div class="col-md-1">
          <b-button class="searchAptBtn" type="submit" @click="getApt">
            검색
          </b-button>
        </div>
      </div>
    </center>
  </div>
</template>
<script>
export default {
  data() {
    return {
      aptName: "",
      apts: [],
    };
  },
  methods: {
    getApt() {
      this.$store.state.aptName = this.aptName;
      this.$store.dispatch("SEARCHNAME").then(() => {
        this.apts = this.$store.state.apts;
      });
    },
  },
};
</script>