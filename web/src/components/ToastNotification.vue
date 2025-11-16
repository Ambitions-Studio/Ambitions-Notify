<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

interface Notification {
  id: number
  type: 'success' | 'error' | 'info' | 'warning' | 'debug'
  message: string
  description?: string
  duration: number
  position: string
  progress: number
}

const notifications = ref<Notification[]>([])
let notificationId = 0

const showToast = (config: any) => {
  const id = ++notificationId
  const duration = config.duration || 4000

  const notification: Notification = {
    id,
    type: config.type,
    message: config.message,
    description: config.description,
    duration,
    position: config.position || 'top-right',
    progress: 100
  }

  notifications.value.push(notification)

  const startTime = Date.now()

  const updateProgress = () => {
    const now = Date.now()
    const elapsed = now - startTime

    if (elapsed >= duration) {
      removeNotification(id)
      return
    }

    const remaining = duration - elapsed
    const progress = (remaining / duration) * 100

    const notif = notifications.value.find(n => n.id === id)
    if (notif) {
      notif.progress = progress
      requestAnimationFrame(updateProgress)
    }
  }

  requestAnimationFrame(updateProgress)
}

const removeNotification = (id: number) => {
  const index = notifications.value.findIndex(n => n.id === id)
  if (index !== -1) {
    notifications.value.splice(index, 1)
  }
}

const getPositionClass = (position: string) => {
  const positions: Record<string, string> = {
    'top-left': 'left-4',
    'top-center': 'left-1/2 -translate-x-1/2',
    'top-right': 'right-4',
    'middle-left': 'left-4',
    'middle-center': 'left-1/2 -translate-x-1/2',
    'middle-right': 'right-4',
    'bottom-left': 'left-4',
    'bottom-center': 'left-1/2 -translate-x-1/2',
    'bottom-right': 'right-4'
  }
  return positions[position] || positions['top-right']
}

const getNotificationOffset = (notification: Notification, index: number) => {
  const samePositionNotifs = notifications.value.filter(
    (n, i) => n.position === notification.position && i < index
  )

  const offset = samePositionNotifs.length * 100

  if (notification.position.startsWith('top-')) {
    return { top: `${16 + offset}px` }
  } else if (notification.position.startsWith('bottom-')) {
    return { bottom: `${16 + offset}px` }
  } else {
    return { top: `calc(50% - ${offset / 2}px)`, transform: 'translateY(-50%)' }
  }
}

const getBorderColor = (type: string) => {
  const colors: Record<string, string> = {
    'success': 'border-green-500',
    'error': 'border-red-500',
    'info': 'border-blue-500',
    'warning': 'border-orange-500',
    'debug': 'border-purple-500'
  }
  return colors[type] || 'border-gray-500'
}

const getProgressColor = (notification: Notification) => {
  const colors: Record<string, string> = {
    'success': '#22c55e',
    'error': '#ef4444',
    'info': '#3b82f6',
    'warning': '#fb923c',
    'debug': '#a855f7'
  }
  return colors[notification.type] || '#6b7280'
}

defineExpose({
  showToast,
})
</script>

<template>
  <div
    v-for="(notification, index) in notifications"
    :key="notification.id"
    :class="[
      'fixed z-50 flex flex-col bg-slate-800 border-2 rounded-lg overflow-hidden min-w-80 max-w-md shadow-lg',
      'animate-in slide-in-from-top-2 fade-in duration-300 transition-all',
      getPositionClass(notification.position),
      getBorderColor(notification.type)
    ]"
    :style="getNotificationOffset(notification, index)"
  >
    <div class="p-4 pb-2">
      <div class="text-white font-semibold text-sm">
        {{ notification.message }}
      </div>
      <div v-if="notification.description" class="text-slate-300 text-xs mt-1">
        {{ notification.description }}
      </div>
    </div>

    <div class="w-full h-1 bg-slate-900 relative overflow-hidden">
      <div
        class="h-full transition-all duration-75 ease-linear absolute top-0 left-0"
        :style="{
          width: notification.progress + '%',
          backgroundColor: getProgressColor(notification)
        }"
      ></div>
    </div>
  </div>
</template>
