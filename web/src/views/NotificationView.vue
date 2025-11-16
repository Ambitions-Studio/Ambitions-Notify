<script setup lang="ts">
import { ref, onMounted } from 'vue'
import ToastNotification from '@/components/ToastNotification.vue'

const toastRef = ref<InstanceType<typeof ToastNotification>>()

onMounted(() => {
  window.addEventListener('message', (event) => {
    const { action, data } = event.data

    if (action === 'showNotification') {
      toastRef.value?.showToast({
        type: data.type,
        message: data.message,
        description: data.description,
        duration: data.duration,
        position: data.position
      })
    }
  })
})
</script>

<template>
  <ToastNotification ref="toastRef" />
</template>
