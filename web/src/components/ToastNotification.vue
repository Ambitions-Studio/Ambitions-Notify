<script setup lang="ts">
import { ref } from 'vue'
import { toast } from 'vuetify-sonner'
import type { ToastConfig, ToastPosition } from '@/types/toast'

const currentPosition = ref<ToastPosition>('top-right')

const showToast = (config: ToastConfig) => {
  const {
    type = 'default',
    message,
    description,
    duration,
    position = 'top-right',
  } = config

  if (position) {
    currentPosition.value = position
  }

  const options: any = {
    description,
    duration,
    closeButton: false,
  }

  switch (type) {
    case 'success':
      toast.success(message, options)
      break
    case 'error':
      toast.error(message, options)
      break
    case 'info':
      toast.info(message, options)
      break
    case 'warning':
      toast.warning(message, options)
      break
    default:
      toast(message, options)
  }
}

defineExpose({
  showToast,
})
</script>

<template>
  <VSonner
    :position="currentPosition"
    :theme="'dark'"
    :expand="true"
    :rich-colors="true"
    :close-button="false"
  />
</template>
