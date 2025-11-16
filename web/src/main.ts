import './assets/main.css'

import { createApp } from 'vue'

import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import { VSonner } from 'vuetify-sonner'

import App from './App.vue'

const app = createApp(App)

const vuetify = createVuetify({
  components: {
    ...components,
    VSonner,
  },
  directives,
})

app.use(vuetify)

app.mount('#app')