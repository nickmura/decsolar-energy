import type { Network } from 'ethers'
import { writable } from 'svelte/store'

export const walletAddress = writable<string>('')
export const networkName = writable<string>('Base') // For network component bar
export const connectedNetwork = writable<Number | bigint | number>()

export const stakeTransactionId = writable<string>()
export const transactionErrorHandling = writable<string>()

export const totalStaked = writable<number>(0)
export const cooldownPeriod = writable<number>(0)
export const claimPerMonth = writable<number>(0)
export const totalClaimable = writable<number>(0)



export const P2PTokenHolder = '0xf13c1929d8EF80FFD1eE6f72BD18CfCb1F4eea74';


export const P2PTokenContractBaseGoerli = '0xcebd8b951D1cEF1A3Acb45156A5b11B6DDE4D549';
export const P2PStakingContractBaseGoerli = '0xF31541d828f7Fc15426A9e7E3Ea498271fF43C70';
export const P2PInvestingContractBaseGoerli = '0x5742712745D4f95b7ADd54B95C37a0461b788e3a';

export const P2PTokenContractMumbai = '0xDD8Bf6F0F52Ec51786457E50D33dBb664fef9430';
export const P2PStakingContractMumbai = '0x2D4dB3F34BeeE8B5BF884B165B7C58f1617Cb119';
export const P2PInvestingContractMumbai = '0x5DDaA32df163CFa211Ced91912FCF2cA51D2F67D';



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