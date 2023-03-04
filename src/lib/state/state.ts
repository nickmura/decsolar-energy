import { writable } from 'svelte/store'

export const walletAddress = writable<string>('')
export const connectedNetwork = writable<string>('Base')

export const totalStaked = writable<number>(0)
export const cooldownPeriod = writable<number>(0)
export const claimPerMonth = writable<number>(0)
export const totalClaimable = writable<number>(0)


export const p2p = { 

    title: 'P2P',
    StakingAPR: '15.9%',
    MaxSlashing: '30.00%',
    WalletBalance: '0',
    CooldownToUnstake: {
      totalStaked: 220,
      CooldownPeriod: '10d',
    },
    Claim: {
      totalClaimble: 10,
      cliamPerMonth: 20,
    }
  }