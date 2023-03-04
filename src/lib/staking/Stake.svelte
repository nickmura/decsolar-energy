<script lang='ts'>

import { onMount } from "svelte";
import { ethers, Contract, BrowserProvider, formatEther, type BigNumberish } from "ethers";
import { 
  walletAddress, 
  totalStaked, 
  cooldownPeriod, 
  claimPerMonth,
  totalClaimable, 
  p2p,
  P2PTokenContractBaseGoerli,
  P2PStakingContractBaseGoerli,
  P2PTokenContractMumbai,
  P2PStakingContractMumbai
} from "$lib/state/state";



import { Modal, modalStore } from '@skeletonlabs/skeleton';
import type { ModalSettings, ModalComponent } from '@skeletonlabs/skeleton';


let P2PStaked:number | string = 0

onMount(() => {
  // getP2PBalance()
})
import ERC20ABI from '$lib/abi/ERC20.json'
import P2PTokenABI from '$lib/abi/P2PToken.json'
import StakingABI from '$lib/abi/P2PToken.json'


walletAddress.subscribe(address => {
  if ($walletAddress) getP2PBalance()
})

let P2PBalance:BigNumberish = 0n

async function getP2PBalance() {
  //@ts-ignore
  const provider = new BrowserProvider(window.ethereum, "any")
  const P2P = await new Contract(P2PTokenContractBaseGoerli, P2PTokenABI, provider);
  P2PBalance = await P2P.balanceOf($walletAddress)
}


let isOpen = false
function toggleDrawer() {
  console.log(isOpen)
  isOpen = !isOpen
}



</script>

<div class="bg-skin-white w-[600px] z-50 px-5 shadow-lg rounded-[6px]">
    <div class="">
      <div class="flex  py-5  gap-9 ">
        <h2 class="text-[1.500em] leading-[148%] text-[#333333]">
          Stake {p2p.title}
        </h2>
        <span class="bg-[#DEFFD8] flex items-center justify-center rounded-[21px] py-1 px-3">
          <span class="text-skin-green hover:scale-[1.05] transition">Buy {p2p.title} with FIAT</span>
        </span>
      </div>
      <hr class="h-[3px] w-full px-3 bg-black opacity-30" />
    </div>
    <div class="py-8 z-50 flex gap-3">
      <div class="basis-[45%] border-r border-slate-400 pr-2">
        <div class="logo items-center gap-3 flex ">
          <img src='/img/moneda-dec-final 3.svg' alt="moneda" />
          <h2 class="text-[18px]">{p2p.title}</h2>
        </div>
        <ul class="flex w-full flex-col gap-3 mt-6">
          <li class="flex gap-10 justify-between">
            <span class="block text-xs ">Staking APR</span>
            <span class="block text-xs text-skin-muted ">
              {p2p.StakingAPR}
            </span>
          </li>
          <li class="flex gap-10 justify-between mt-3">
            <span class="block text-xs">Max Slashing</span>
            <span class="block text-xs text-skin-muted ">
              {p2p.MaxSlashing}
            </span>
          </li>
          <li class="flex gap-10 justify-between mt-3">
            <span class="block text-xs">Wallet Balance</span>
            <span class="block text-xs text-skin-muted ">
              {formatEther(P2PBalance)} P2P 
            </span>
          </li>
        </ul>

        <div class="w-full py-4 flex justify-center mt-4">
          <button name="Stake" on:click={toggleDrawer} class='rounded-2xl px-2 py-2 border bg-[#23b102] 
          text-white w-full hover:scale-[1.05] transition'>Stake P2P</button>
        </div>
      </div>

      <div class="basis-[55%] text-center ">
        <div class="flex flex-col gap-2">
          <h2 class="text-lg text-skin-lightDark">Staked {p2p.title}</h2>
          <h2 class="text-2xl text-[#666666]">{$totalStaked}</h2>
          <p class="text-[#333333] text-base">Cooldown Period</p>
          <h4 class="text-xs text-skin-muted">{$cooldownPeriod}</h4>
          <button class="py-2 px-3 rounded-[5px] border border-skin-green text-skin-green hover:scale-[1.05] transition">
            Cooldown to Unstake
          </button>
        </div>
        <hr class="h-[3px] w-full my-6 px-3 bg-black opacity-30" />
        <div class="flex flex-col gap-2">
          <h2 class="text-lg text-skin-lightDark">Claimable {p2p.title}</h2>
          <h2 class="text-2xl text-[#666666]">{$totalClaimable}</h2>
          <p class="text-[#333333] text-base">{p2p.title} per month</p>
          <h4 class="text-xs text-skin-muted">{$claimPerMonth}</h4>
          <button class="py-2 px-3 rounded-[5px] border border-skin-green text-skin-green hover:scale-[1.05] transition">
            Claim {p2p.title}
          </button>
        </div>
      </div>
    </div>
    {#if !isOpen}
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <div class="absolute top-0 left-0 w-screen min-h-screen flex items-center justify-center bg-gray-500/20 rounded-xl" on:click|self={toggleDrawer}>
          <div class="bg-white rounded-xl p-4 w-80 h-56 bg-slate-50 shadow-xl">
            <div class='justify-center w-full'>
              <div class='text-md font-bold mb-4 font-bold'>Stake P2P</div>
              <input bind:value={P2PStaked} type='range' min={0} max={Number(formatEther(P2PBalance))} class='w-full'>
              <div class='text-[10px] text-gray-800 italic'>Percent Staked: { ((Number(P2PStaked) / Number(formatEther(P2PBalance))) * 100).toFixed(1)}%</div>
              <!-- <input type='number' bind:value={P2PStaked} min=0 max={Number(formatEther(P2PBalance))} class='font-bold'/>Amount to Stake: {Number(P2PStaked).toLocaleString('us')} P2P -->
              <div class='flex flex-row mr-2'>To Be Staked: <input type='number' bind:value={P2PStaked} min='0' max={Number(formatEther(P2PBalance))} class='w-fit flex 
                    font-bold outline-none active:appearance-none [appearance:textfield] no-spinner ml-2 mr-2' /> P2P</div>
              <input type='radio' class='mt-4'/>
            </div>
          </div>
        </div>
    {/if}
  </div>

  <style>


  </style>