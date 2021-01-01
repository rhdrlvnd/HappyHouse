<template>
  <div style="width: 80%; margin-left: auto; margin-right: auto">
    <br />
    <h2>글 작성하기</h2>
    <br />
    <WriteArticleForm />
  </div>
</template>

<script>
import WriteArticleForm from "@/components/Board/WriteArticleForm.vue";

export default {
  components: {
    WriteArticleForm,
  },
};
</script>