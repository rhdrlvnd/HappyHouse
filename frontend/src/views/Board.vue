<template>
  <div class="container pt-3">
    <h2 class="text-center">자유게시판</h2>
    <br />
    <BoardTable />
    <WriteArticleBtn />
    <SearchWord />
  </div>
</template>

<script>
// @ is an alias to /src
import BoardTable from "@/components/BoardTable.vue";
import WriteArticleBtn from "@/components/Board/WriteArticleBtn.vue";
import SearchWord from "@/components/Board/SearchWord.vue";

export default {
  name: "Home",
  components: {
    BoardTable,
    WriteArticleBtn,
    SearchWord,
  },
};
</script>
