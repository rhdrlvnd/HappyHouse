<template>
  <center>
    <div class="container row col-lg-6">
      <div class="col-4">
        <select
          class="form-control"
          v-model="selectsido"
          v-on:change="sidoChange"
          id="selectsido"
          name="sellist1"
        >
          <option value="0">선택</option>
          <option v-for="sido in sidos" v-bind:key="sido.sidoCode">
            {{ sido.sidoName }}
          </option>
        </select>
      </div>
      <div class="col-4">
        <select
          class="form-control"
          v-model="selectgugun"
          v-on:change="gugunChange"
          id="gugun"
          name="sellist2"
        >
          <option value="0">선택</option>
          <option v-for="gugun in guguns" v-bind:key="gugun.gugunName">
            {{ gugun.gugunName }}
          </option>
        </select>
      </div>
      <div class="col-4">
        <select
          class="form-control"
          v-model="selectdong"
          v-on:change="dongChange"
          id="dong"
          name="sellist3"
        >
          <option value="0">선택</option>
          <option v-for="dong in dongs" v-bind:key="dong.dong">
            {{ dong.dong }}
          </option>
        </select>
      </div>
    </div>
  </center>
</template>
<script>
// import axios from "axios";
export default {
  data() {
    return {
      selectsido: "선택",
      selectgugun: "선택",
      selectdong: "선택",
      sidos: [{ sidoCode: 0, sidoName: "선택" }],
      guguns: [{ gugunCode: 0, gugunName: "선택" }],
      dongs: [{ code: 0, dong: "선택" }],
    };
  },
  methods: {
    sidoChange: function () {
      this.$store.state.selectsido = this.sidos.findIndex(
        (i) => i.sidoName == this.selectsido
      );
      this.$store.dispatch("GETGUGUN").then(() => {
        this.guguns = this.$store.state.gugun;
      });
    },
    gugunChange: function () {
      this.$store.state.selectgugun = this.guguns.findIndex(
        (i) => i.gugunName == this.selectgugun
      );
      this.$store.dispatch("GETDONG").then(() => {
        this.dongs = this.$store.state.dong;
      });
    },
    dongChange: function () {
      this.$store.state.selectdong = this.dongs.findIndex(
        (i) => i.dong == this.selectdong
      );
      console.log(this.$store.state.selectdong["dong"]);
      ("$EventBus.$emit('click-icon')");
    },
  },
  created() {
    this.$store.dispatch("GETSIDO").then(() => {
      this.sidos = this.$store.state.sido;
    });
  },
};
</script>