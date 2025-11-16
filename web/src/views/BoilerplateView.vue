<script setup lang="ts">
import { ref } from 'vue'
import NotificationView from './NotificationView.vue'

const toastRef = ref<InstanceType<typeof NotificationView>>()

const testNotification = (type: 'success' | 'error' | 'info' | 'warning') => {
  const messages = {
    success: {
      title: 'Success - Your very long operation has been completed successfully without any errors',
      desc: 'This is a very long description to test how the notification handles longer text content. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    },
    error: { title: 'Error Notification', desc: 'Something went wrong, please try again.' },
    info: { title: 'Information', desc: 'This is an informational message for you.' },
    warning: { title: 'Warning Alert', desc: 'Please be careful with this action.' }
  }

  window.postMessage({
    action: 'showNotification',
    data: {
      type,
      message: messages[type].title,
      description: messages[type].desc,
      duration: 4000,
      position: 'top-right'
    }
  }, '*')
}

const testDebugNotification = () => {
  window.postMessage({
    action: 'showNotification',
    data: {
      type: 'debug',
      message: 'Debug Notification',
      description: 'This is a debug notification for development.',
      duration: 4000,
      position: 'top-right'
    }
  }, '*')
}
</script>

<template>
  <div
    class="fixed inset-0 w-full h-full bg-contain bg-center bg-no-repeat bg-gray-900 sm:bg-contain md:bg-cover lg:bg-cover xl:bg-cover 2xl:bg-cover bg-[url('/boilerplate-background.jpg')] transition-all duration-300"
  >
    <div class="absolute inset-0 bg-black/30 backdrop-blur-sm"></div>

    <div class="relative z-10 w-full h-full flex items-center justify-center p-6">
      <v-card class="bg-slate-900/95 backdrop-blur-xl border-2 border-slate-700/50 shadow-2xl" max-width="700" rounded="xl">
        <div class="bg-gradient-to-r from-blue-600 to-purple-600 px-8 py-6 rounded-t-xl">
          <h1 class="text-3xl font-bold text-white text-center tracking-tight">
            Ambitions Notify
          </h1>
          <p class="text-blue-100 text-center text-sm mt-1">
            Notification System Testing Environment
          </p>
        </div>

        <v-card-text class="px-8 py-6">
          <div class="mb-8">
            <h2 class="text-lg font-semibold text-black mb-4 flex items-center gap-2">
              <span class="w-1 h-6 bg-blue-500 rounded"></span>
              Standard Notifications
            </h2>
            <div class="grid grid-cols-2 gap-3">
              <v-btn
                color="success"
                size="large"
                variant="elevated"
                @click="testNotification('success')"
              >
                <template #prepend>
                  <span class="text-lg">✓</span>
                </template>
                Success
              </v-btn>

              <v-btn
                color="error"
                size="large"
                variant="elevated"
                @click="testNotification('error')"
              >
                <template #prepend>
                  <span class="text-lg">✕</span>
                </template>
                Error
              </v-btn>

              <v-btn
                color="warning"
                size="large"
                variant="elevated"
                @click="testNotification('warning')"
              >
                <template #prepend>
                  <span class="text-lg">⚠</span>
                </template>
                Warning
              </v-btn>

              <v-btn
                color="info"
                size="large"
                variant="elevated"
                @click="testNotification('info')"
              >
                <template #prepend>
                  <span class="text-lg">ℹ</span>
                </template>
                Info
              </v-btn>

              <v-btn
                color="purple"
                size="large"
                variant="elevated"
                @click="testDebugNotification"
                class="col-span-2"
              >
                <template #prepend>
                  <span class="text-lg">🐛</span>
                </template>
                Debug
              </v-btn>
            </div>
          </div>
        </v-card-text>

        <div class="px-8 py-4 bg-slate-800/50 rounded-b-xl">
          <p class="text-xs text-black text-center">
            Ambitions Framework • Notification System v1.0.0
          </p>
        </div>
      </v-card>
    </div>

    <NotificationView ref="toastRef" />
  </div>
</template>
