<script setup lang="ts">
import { ref, onMounted } from 'vue'
import ToastNotification from '@/components/ToastNotification.vue'

const toastRef = ref<InstanceType<typeof ToastNotification>>()

onMounted(() => {
  console.log('[Ambitions-Notify] NUI mounted and listening for messages')

  window.addEventListener('message', (event) => {
    console.log('[Ambitions-Notify] Received message:', event.data)
    const { action, data } = event.data

    if (action === 'showNotification') {
      console.log('[Ambitions-Notify] Showing notification:', data)
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
