<template>
  <div>
    <h2>매물 등록하기</h2>
    <div class="mt-3" style="font-size: 17px">
      등록할 매물의 유형을 선택하세요.
    </div>
    <RegistAptTypeForm />
    <div class="container">
      <Selector />
      <br />
      <div style="overflow: hidden; width: 100%; height: 150px">
        <div style="overflow: auto; width: 100%; height: 100%">
          <SelectedAptTable />
        </div>
      </div>
      <hr align="center" style="width: 80%" />
    </div>
    <RegistAptForm />
  </div>
</template>

<script>
import Selector from "@/components/Selector.vue";
import RegistAptTypeForm from "@/components/RegistApt/RegistAptTypeForm.vue";
import SelectedAptTable from "@/components/RegistApt/SelectedAptTable.vue";
import RegistAptForm from "@/components/RegistApt/RegistAptForm.vue";
export default {
  data() {
    return {
      options: [
        { text: "아파트", value: "아파트" },
        { text: "주택", value: "주택" },
      ],
    };
  },
  components: {
    Selector,
    RegistAptTypeForm,
    SelectedAptTable,
    RegistAptForm,
  },
};

// var frm = new FormData();
// var photoFile = document.getElementById("photo");
// frm.append("photo", photoFile.files[0]);
// axios
//   .post("https://domain/form-post-url", frm, {
//     headers: {
//       "Content-Type": "multipart/form-data",
//     },
//   })
//   .then((response) => {
//     // 응답 처리
//   })
//   .catch((error) => {
//     // 예외 처리
//   });
</script>
