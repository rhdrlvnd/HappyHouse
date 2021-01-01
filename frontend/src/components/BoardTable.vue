<template>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>#No</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일시</th>
      </tr>
    </thead>
    <tbody>
      <tr
        v-for="(board, index) in $store.state.boards"
        :key="index"
        :articles="$store.state.boards"
      >
        <td>{{ board.boardNo }}</td>
        <td>
          <a href="javascript:;" @click="detailArticle"> {{ board.title }}</a>
        </td>
        <td>{{ board.userId }}</td>
        <td>
          {{ board.time.date.year }}.{{ board.time.date.month }}.{{
            board.time.date.day
          }}
        </td>
      </tr>
    </tbody>
  </table>
</template>

 <script>
export default {
  data() {
    return {};
  },
  methods: {
    detailTest() {
      this.$store.boaredNo = this.boardNo;
    },
  },
  computed: {
    selected: function () {
      return this.$store.state.boards;
    },
  },

  created() {
    this.$store.dispatch("GETBOARD").then(() => {});
  },
};
</script>

