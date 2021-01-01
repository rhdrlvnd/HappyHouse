<template>
  <div style="width: 80%; margin-left: auto; margin-right: auto">
    <br />
    <h2>글 수정하기</h2>
    <br />
    <UpdateArticleForm />
  </div>
</template>

<script>
import UpdateArticleForm from "@/components/Board/UpdateArticleForm.vue";

export default {
  components: {
    UpdateArticleForm,
  },
};
</script>