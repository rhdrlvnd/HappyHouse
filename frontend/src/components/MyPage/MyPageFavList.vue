<template>
  <div style="width: 80%; margin-left: auto; margin-right: auto">
    <h2>내가 찜한 매물 확인하기</h2>
    <br />
    <FavListForm />
  </div>
</template>


<script>
import FavListForm from "@/components/MyPage/FavListForm.vue";

export default {
  components: { FavListForm },
};
</script>
