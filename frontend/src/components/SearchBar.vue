<template>
  <b-row>
    <b-col align="left">
      <input type="text" v-model="dongCode" @keypress.enter="sendDongCode" />
      <button @click="sendDongCode">검색</button>
    </b-col>
  </b-row>
</template>

<script>
export default {
  name: 'SearchBar',
  data() {
    return {
      dongCode: '',
    };
  },
  methods: {
    sendDongCode: function() {
      // console.log(event.target.value);
      console.log(this.dongCode);
      this.$emit('send-dong-code', this.dongCode);
    },
  },
};
</script>

<style></style>
