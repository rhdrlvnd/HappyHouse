<template>
  <table
    class="table table-hover"
    style="width: 80%; margin-left: auto; margin-right: auto"
  >
    <thead>
      <tr>
        <th>아파트명</th>
        <th>위치</th>
        <th>평수</th>
        <th>찜 개수</th>
      </tr>
    </thead>
    <tbody id="searchResult">
      <tr
        v-for="(rank, index) in $store.state.ranks"
        :key="index"
        :apts="$store.state.ranks"
      >
        <td>
          <b>{{ rank.aptName }}</b>
        </td>
        <td>{{ rank.dong }}</td>
        <td>{{ rank.area }}</td>
        <td style="color: red">{{ rank.favorite }}</td>
      </tr>
    </tbody>
  </table>
</template>
<script>
export default {
  data() {
    return {};
  },
  computed: {
    selected: function () {
      return this.$store.state.ranks;
    },
  },
  watch: {
    selected: function () {
      this.$store.dispatch("GETRANK").then(() => {});
    },
  },
  created() {
    this.$store.dispatch("GETRANK").then(() => {});
  },
};
</script>
<style>
table {
  width: 80%;
}
.button {
  background-color: white;
  border: 2px solid #ff7473;
  padding: 1px 3px;
  text-align: center;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}

.button:hover {
  background-color: #ff7473;
  color: white;
}
</style>