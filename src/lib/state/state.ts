import { writable } from 'svelte/store'

export const walletAddress = writable<string>('')
export const connectedNetwork = writable<string>('Base')