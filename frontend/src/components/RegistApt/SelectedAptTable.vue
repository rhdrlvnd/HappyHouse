<template>
  <table
    class="table table-hover"
    style="width: 80%; margin-left: auto; margin-right: auto"
  >
    <thead>
      <tr>
        <th>법정동</th>
        <th>아파트이름</th>
        <th>지번</th>
        <th>지역코드</th>
        <th>실거래가</th>
      </tr>
    </thead>
    <tbody id="searchResult">
      <tr
        v-for="(apt, index) in $store.state.apts"
        :key="index"
        :apts="$store.state.apts"
        @click="detailApt(apt)"
      >
        <td>{{ apt.dong }}</td>
        <td>{{ apt.aptName }}</td>
        <td>{{ apt.jibun }}</td>
        <td>{{ apt.code }}</td>
        <td>{{ apt.dealAmount }}</td>
      </tr>
    </tbody>
  </table>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {},
  computed: {
    selected: function () {
      return this.$store.state.selectdong;
    },
  },
  watch: {
    selected: function () {
      this.$store.dispatch("SEARCHDONG").then(() => {});
    },
  },
};
</script>