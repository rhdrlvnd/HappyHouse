
<template>
  <div class="app">
    <SearchLocationBtn />
    <br />
    <SearchAptBtn />
    <hr align="center" style="border: solid 2px #34314c; width: 80%" />
    <br />
    <h4>지금 인기 있는 매물들을 확인해보세요!</h4>
    <br />
    <RankedFavApt />
  </div>
</template>

<script>
// @ is an alias to /src

import SearchAptBtn from "@/components/Home/SearchAptBtn.vue";
import SearchLocationBtn from "@/components/Home/SearchLocationBtn.vue";
import RankedFavApt from "@/components/RankedFavApt.vue";

export default {
  name: "app",
  components: {
    SearchAptBtn,
    SearchLocationBtn,
    RankedFavApt,
  },
};
</script>
