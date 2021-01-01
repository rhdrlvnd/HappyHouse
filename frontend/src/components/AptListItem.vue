<template>
  <div style="margin: 10px;" @click="selectApt">
    <img src="@/assets/apt.png" class="img-list" alt="" />[{{ apt.일련번호 }}]
    {{ apt.아파트 }}
  </div>
</template>

<script>
export default {
  name: 'AptListItem',
  props: {
    apt: Object,
  },
  methods: {
    selectApt: function() {
      this.$emit('select-apt', this.apt);
    },
  },
};
</script>

<style>
.img-list {
  width: 50px;
}
</style>
