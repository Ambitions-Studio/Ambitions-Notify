export type ToastType = 'success' | 'error' | 'info' | 'warning' | 'loading' | 'promise' | 'default'

export type ToastPosition =
  | 'top-left'
  | 'top-center'
  | 'top-right'
  | 'bottom-left'
  | 'bottom-center'
  | 'bottom-right'

export interface ToastAction {
  label: string
  onClick: () => void
}

export interface ToastConfig {
  type?: ToastType
  message: string
  description?: string
  duration?: number
  position?: ToastPosition
  action?: ToastAction
  closable?: boolean
  icon?: string
  important?: boolean
  promise?: {
    loading: string
    success: string
    error: string
    promise: Promise<any>
  }
}
