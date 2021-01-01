<template>
  <div class="row" id="searchWordBtn">
    <div class="col mr-sm-11">
      <b-form-input
        v-model="searchWords"
        type="search"
        id="search"
        name="search"
        placeholder="Search"
      >
      </b-form-input>
    </div>
    <div class="col-md-1">
      <b-button @click="search" class="btn btn-success" type="submit"
        >검색</b-button
      >
    </div>
  </div>
</template>