<template>
  <div style="width: 80%; margin-left: auto; margin-right: auto">
    <br />
    <h2>글 상세보기</h2>
    <br />
    <DetailArticleForm />
  </div>
</template>

<script>
import DetailArticleForm from "@/components/Board/DetailArticleForm.vue";

export default {
  components: {
    DetailArticleForm,
  },
};
</script>