<template>
  <div>
    <apt-list-item
      v-for="(apt, index) in aptlist"
      :key="index"
      :apt="apt"
      @select-apt="selectApt"
    />
  </div>
</template>

<script>
import AptListItem from '@/components/AptListItem.vue';

export default {
  name: 'AptList',
  components: {
    AptListItem,
  },
  props: {
    aptlist: Array,
  },
  methods: {
    selectApt: function(apt) {
      this.$emit('select-apt', apt);
    },
  },
};
</script>

<style></style>
