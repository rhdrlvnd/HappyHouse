<template>
  <div>
    <table class="table table-hover">
      <thead>
        <tr>
          <th>#No</th>
          <th>아파트이름</th>
          <th>동</th>
          <th>평수</th>
          <th>층</th>
          <th>실거래가</th>
        </tr>
      </thead>
      <tbody>
        <!-- v-for="fav in favlist" :key="fav.deal_no" -->
        <tr
          style="cursor: pointer"
          v-for="(fav, index) in $store.state.favs"
          :key="index"
          :favapt="$store.state.favs"
        >
          <td>{{ fav.aptName }}</td>
          <td>{{ fav.dong }}</td>
          <td>{{ fav.area }}</td>
          <td>{{ fav.floor }}</td>
          <td>{{ fav.dealAmount }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>


 <script>
export default {
  data() {
    return {};
  },
  methods: {},
  computed: {
    selected: function () {
      return this.$store.state.favs;
    },
  },

  created() {
    this.$store.dispatch("GETFAVLIST").then(() => {});
  },
};
</script>