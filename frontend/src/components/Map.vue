<template>
  <div style="margin-left: 144px; margin-right: 144px">
    <div id="map"></div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      map: null,
      markers: [],
    };
  },
  mounted() {
    window.kakao && window.kakao.maps
      ? this.initMap()
      : this.addKakaoMapScript();
  },
  methods: {
    addKakaoMapScript() {
      //const script = document.createElement("script");
      /* global kakao */
      console.log("addKakaoMap");
      for (var j in this.markers) {
        this.markers[j].setMap(null);
      }
      this.markers = [];
      for (var i in this.$store.state.apts) {
        console.log(
          "lat : " +
            this.$store.state.apts[i].lat +
            " lng : " +
            this.$store.state.apts[i].lng
        );
        var markerPosition = new kakao.maps.LatLng(
          this.$store.state.apts[i].lat,
          this.$store.state.apts[i].lng
        );
        var marker = new kakao.maps.Marker({
          position: markerPosition,
        });
        this.markers.push(marker);
        marker.setMap(this.map);
      }
      // script.onload = () => kakao.maps.load(this.initMap);
      // script.src =
      //   "http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=5cf76fc2db32edb271c3c520a07446f4";
      // document.head.appendChild(script);
    },
    initMap() {
      var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
      var options = {
        //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(37.50158010983366, 127.03963237349735), //지도의 중심좌표.
        level: 10, //지도의 레벨(확대, 축소 정도)
      };
      this.map = new kakao.maps.Map(container, options); // 지도를 생성합니다

      // 마커가 표시될 위치입니다
      for (var i in this.$store.state.apts) {
        console.log(
          "lat : " +
            this.$store.state.apts[i].lat +
            " lng : " +
            this.$store.state.apts[i].lng
        );
        var markerPosition = new kakao.maps.LatLng(
          this.$store.state.apts[i].lat,
          this.$store.state.apts[i].lng
        );
        var marker = new kakao.maps.Marker({
          position: markerPosition,
        });
        marker.setMap(this.map);
      }
      return this.map;
    },
  },
  computed: {
    selected: function () {
      return this.$store.state.apts;
    },
  },
  watch: {
    selected: function () {
      this.addKakaoMapScript();
    },
  },
};
</script>

<style>
#map {
  width: 100%;
  height: 400px;
}
</style>