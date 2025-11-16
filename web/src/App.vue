<script setup lang="ts">
import BoilerplateView from './views/BoilerplateView.vue'
import NotificationView from './views/NotificationView.vue'

const isDevelopment = import.meta.env.DEV
</script>

<template>
  <VApp>
    <BoilerplateView v-if="isDevelopment" />
    <NotificationView v-else />
  </VApp>
</template>
