<template>
  <div>
    <b-form-group>
      <b-form-radio-group
        id="propertyType"
        :options="options"
        buttons
        button-variant="outline-primary"
        size="medium"
        name="propertyType"
      ></b-form-radio-group>
    </b-form-group>
  </div>
</template>

<script>
export default {
  data() {
    return {
      options: [
        { text: "아파트", value: "아파트" },
        { text: "주택", value: "주택" },
      ],
    };
  },
};
</script>
