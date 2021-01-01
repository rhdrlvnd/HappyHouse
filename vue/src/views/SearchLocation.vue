<template>
  <div>
    <h2>위치로 아파트 검색하기</h2>
    <h5>희망하는 위치를 선택하여 아파트를 검색하세요.</h5>
    <div class="container">
      <Selector />
      <hr align="center" style="width: 80%" />
    </div>

    <div style="overflow: hidden; width: 100%; height: 300px">
      <div style="overflow: auto; width: 100%; height: 100%">
        <Main />
        <TableSearchLocation />
      </div>
    </div>

    <Map />
  </div>
</template>

<script>
// @ is an alias to /src
import Selector from "@/components/Selector.vue";
import Main from "@/components/Main.vue";
import TableSearchLocation from "@/components/TableSearchLocation.vue";
import Map from "@/components/Map.vue";

export default {
  components: {
    Selector,
    Main,
    TableSearchLocation,
    Map,
  },
};
</script>
