<template>
  <div>
    <h2>이름으로 아파트 검색하기</h2>
    <h5>직접 찾고싶은 아파트 이름을 입력하세요.</h5>
    <div class="container">
      <SearchAptBtn />
      <hr align="center" style="width: 80%" />
    </div>
    <div style="overflow: hidden; width: 100%; height: 300px">
      <div style="overflow: auto; width: 100%; height: 100%">
        <Main />
        <TableSearchName />
      </div>
    </div>
    <Map />
  </div>
</template>

<script>
import SearchAptBtn from "@/components/SearchAptBtn.vue";
import Main from "@/components/Main.vue";
import TableSearchName from "@/components/TableSearchName.vue";
import Map from "@/components/Map.vue";

export default {
  components: {
    SearchAptBtn,
    Main,
    TableSearchName,
    Map,
  },
};
</script>