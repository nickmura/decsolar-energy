<script lang="ts">
  import { onDestroy, onMount } from 'svelte';
  import { slide } from 'svelte/transition';
  import {
    ethers,
    Contract,
    BrowserProvider,
    formatEther,
    parseEther,
    type BigNumberish,
  } from 'ethers';
  import {
    walletAddress,
    connectedNetwork,
    totalStaked,
    cooldownPeriod,
    claimPerMonth,
    totalClaimable,
    p2p,
    P2PTokenContractBaseGoerli,
    P2PStakingContractBaseGoerli,
    P2PTokenContractMumbai,
    P2PStakingContractMumbai,
    stakeTransactionId,
    transactionErrorHandling,
  } from '$lib/state/state';

  import P2PTokenABI from '$lib/abi/P2PToken.json';
  import StakingABI from '$lib/abi/Staking.json';

  let currentP2PStaked = 0;
  let currentP2PRewards = 0;

  const updater: {
    provider?: BrowserProvider;
    callback: () => unknown;
  } = {
    provider: undefined,
    callback: () => {
      if ($walletAddress) {
        getP2PBalance();
        getUser($walletAddress);
      }
    },
  };
  walletAddress.subscribe((address) => {
    if (address && window.ethereum) {
      if (!updater.provider) {
        updater.provider = new BrowserProvider(window.ethereum, 'any');
        updater.provider.on('block', updater.callback);
      } else {
        updater.callback();
      }
    }
  });
  onDestroy(() => {
    if (updater.provider) {
      updater.provider.off('block', updater.callback);
    }
  });

  let P2PStaked: number | string | bigint;
  $: P2PStaked = 0;

  let P2PBalance: BigNumberish;
  $: P2PBalance = 0n;

  async function getP2PBalance() {
    //@ts-ignore
    const provider = new BrowserProvider(window.ethereum, 'any');
    const P2PBase = new Contract(
      P2PTokenContractBaseGoerli,
      P2PTokenABI,
      provider
    );
    const P2PMumbai = new Contract(
      P2PTokenContractMumbai,
      P2PTokenABI,
      provider
    );

    const chainId = await provider.getNetwork();
    console.log($connectedNetwork, $walletAddress);
    if ($connectedNetwork == 80001) {
      P2PBalance = await P2PMumbai.balanceOf($walletAddress);
    } else {
      P2PBalance = await P2PBase.balanceOf($walletAddress);
      console.log(P2PBalance);
    }
  }

  let isOpen = false;
  function toggleDrawer() {
    console.log(isOpen);
    isOpen = !isOpen;
  }

  async function stakeP2P(stake: number | string | bigint) {
    console.log(stake);
    if ($connectedNetwork === 80001) {
      try {
        //@ts-ignore
        const provider = new BrowserProvider(window.ethereum, 'any');
        const signer = await provider.getSigner();

        const contract = new Contract(
          P2PStakingContractMumbai,
          StakingABI,
          signer
        );
        console.log(BigInt(stake));
        const txStake = await contract.stake(stake);
        await txStake.wait();

        stakeTransactionId.set(txStake.hash);
      } catch (error) {
        if (error instanceof Error) console.log(error);
        if (error instanceof Error)
          if (error.message.includes('User denied transaction signature.')) {
            transactionErrorHandling.set('');
          }
      }
    } else if ($connectedNetwork === 84531) {
      try {
        //@ts-ignore
        const provider = new BrowserProvider(window.ethereum, 'any');
        const signer = await provider.getSigner();
        const contract = new ethers.Contract(
          P2PStakingContractBaseGoerli,
          StakingABI,
          signer
        );

        const txStake = await contract.stake(stake);
        await txStake.wait();

        stakeTransactionId.set(txStake.hash);
      } catch (error) {
        if (error instanceof Error)
          if (error.message.includes('User denied transaction signature.')) {
            transactionErrorHandling.set('');
          }
        if (error instanceof Error) console.log(error.message);
      }
    }
  }

  async function withdrawStake(
    initial: number | string | bigint,
    reward: number | string | bigint
  ) {
    // console.log(stake)
    try {
      //@ts-ignore
      const provider = new BrowserProvider(window.ethereum, 'any');
      const signer = await provider.getSigner();
      const contract = new ethers.Contract(
        P2PStakingContractMumbai,
        StakingABI,
        signer
      );
      console.log(initial, reward);
      const txWithdraw = await contract.withdrawTest(initial, reward);
      await txWithdraw.wait();
    } catch (error) {
      console.log(error);
    }
  }
  async function claimRewards() {
    //@ts-ignore
    const provider = new BrowserProvider(window.ethereum, 'any');
    const signer = await provider.getSigner();
    const contract = new ethers.Contract(
      P2PStakingContractMumbai,
      StakingABI,
      signer
    );
  }
  async function getUser(user: string) {
    //@ts-ignore

    const provider = new BrowserProvider(window.ethereum, 'any');
    const signer = await provider.getSigner();
    const contract = new ethers.Contract(
      P2PStakingContractMumbai,
      StakingABI,
      signer
    );

    const txGetUser = await contract.getUserTest(user);
    currentP2PStaked = txGetUser.balance;
    currentP2PRewards = txGetUser.reward;
    console.log(formatEther(txGetUser.balance), formatEther(txGetUser.reward));
  }
</script>

<div class="bg-white w-[600px] z-50 px-5 shadow-lg rounded-xl">
  <div class="">
    <div class="flex  py-5  gap-9 ">
      <h2 class="text-[1.500em] leading-[148%] text-[#333333]">
        Stake {p2p.title}
      </h2>
      <span
        class="bg-[#DEFFD8] flex items-center justify-center rounded-[21px] py-1 px-3"
      >
        <span class="text-skin-green hover:scale-[1.05] transition"
          >Buy {p2p.title} with FIAT</span
        >
      </span>
    </div>
    <hr class="h-[3px] w-full px-3 bg-black opacity-30" />
  </div>
  <div class="py-8 z-50 flex gap-3">
    <div class="basis-[56%] border-r border-slate-400/40 pr-2">
      <div class="logo items-center gap-3 flex ">
        <img src="/img/moneda-dec-final 3.svg" alt="moneda" />
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
          <span class="block text-xs text-skin-muted font-bold ">
            {Number(formatEther(P2PBalance)).toLocaleString()} P2P
          </span>
        </li>
      </ul>

      <div class="w-full py-4 flex justify-center mt-4">
        <button
          name="Stake"
          on:click={toggleDrawer}
          class="rounded-2xl px-2 py-2 border bg-[#23b102] 
          text-white w-full hover:scale-[1.05] transition">Stake P2P</button
        >
      </div>
    </div>

    <div class="basis-[55%] text-center ">
      <div class="flex flex-col gap-2">
        <h2 class="text-lg text-skin-lightDark">Staked {p2p.title}</h2>
        <h2 class="text-2xl text-[#666666]">
          {Number(formatEther(currentP2PStaked)).toLocaleString()} P2P
        </h2>
        <p class="text-[#333333] text-base">Cooldown Period</p>
        <h4 class="text-xs text-skin-muted">
          {currentP2PRewards ? 'Lock period ended' : ''}
        </h4>
        <button
          on:click={(e) => withdrawStake(currentP2PStaked, currentP2PRewards)}
          class="py-2 px-3 rounded-[5px] border border-skin-green text-skin-green hover:scale-[1.05] transition"
        >
          Unstake and Claim
        </button>
      </div>
      <hr class="h-[3px] w-full my-6 px-3 bg-black opacity-30" />
      <div class="flex flex-col gap-2">
        <h2 class="text-lg text-skin-lightDark">Claimable {p2p.title}</h2>
        <h2 class="text-2xl text-[#666666]">
          {Number(formatEther(currentP2PRewards)).toLocaleString()}
        </h2>
        <p class="text-[#333333] text-base">Length of stake</p>
        <h4 class="text-xs text-skin-muted">
          {currentP2PRewards ? '21 days' : 'N/A'}
        </h4>
        <button
          on:click={claimRewards}
          class="py-2 px-3 rounded-[5px] border border-skin-green text-skin-green hover:scale-[1.05] transition"
        >
          Claim {p2p.title}
        </button>
      </div>
    </div>
  </div>
  {#if isOpen}
    <!-- svelte-ignore a11y-click-events-have-key-events -->
    <div
      class="absolute top-0 left-0 w-screen min-h-screen flex items-center justify-center bg-gray-500/20 rounded-xl"
      on:click|self={toggleDrawer}
    >
      <div class="bg-white rounded-xl p-4 w-80 bg-slate-50 shadow-xl">
        <div class="w-full">
          <div class="flex justify-between">
            <div class="text-md font-bold mb-4 font-bold">Stake P2P</div>
            <div class="text-md font-bold mb-4 text-gray-500 italic">
              Current APR: 15.9%
            </div>
          </div>
          <input
            bind:value={P2PStaked}
            type="range"
            min={0}
            max={Number(formatEther(P2PBalance))}
            class="w-full"
          />

          <!-- <input type='number' bind:value={P2PStaked} min=0 max={Number(formatEther(P2PBalance))} class='font-bold'/>Amount to Stake: {Number(P2PStaked).toLocaleString('us')} P2P -->
          <div class="flex flex-row mr-2">
            Amount: <input
              type="number"
              bind:value={P2PStaked}
              min="0"
              max={Number(formatEther(P2PBalance))}
              class="w-fit flex 
                    font-bold w-16 max-w-32 outline-none active:appearance-none [appearance:textfield] no-spinner ml-2 mr-2"
            />{P2PStaked ? 'P2P' : ''}
          </div>
          <div class="text-[10px] text-gray-800 italic">
            Balance Staked: {(
              (Number(P2PStaked) / Number(formatEther(P2PBalance))) *
              100
            ).toFixed(1)}%
          </div>
          <div class="mt-2  flex justify-center mt-4">Staking Period</div>
          <div class="flex flex-row justify-center gap-6">
            <div class="flex flex-col mt-4">
              <input
                type="radio"
                name="staking"
                class=""
                value="21"
                checked
              /><label class="" for="21">21d</label>
            </div>

            <div class="flex flex-col mt-4 opacity-50">
              <input type="radio" name="staking" class="" value="90" /><label
                class=""
                for="90">90d</label
              >
            </div>
            <div class="flex flex-col mt-4 opacity-50">
              <input type="radio" name="staking" class="" value="180" /><label
                class=""
                for="180">180d</label
              >
            </div>
            <div class="flex flex-col mt-4 opacity-50">
              <input type="radio" name="staking" class="" value="365" /><label
                class=""
                for="365">365d</label
              >
            </div>
          </div>
          {#if P2PStaked}
            <div class="flex flex-col mt-4" transition:slide>
              <hr class="w-full h-[3px] bg-grey-900 mt-4" />
              <div class="flex flex-wrap">
                Total Stake: <div class="font-bold ml-2">
                  {Number(P2PStaked).toLocaleString()} P2P
                </div>
              </div>
              <div class="flex flex-wrap">
                Current APY/APR: <div class="font-bold ml-2">15.9%</div>
              </div>
              <div class="flex flex-wrap">
                ROI After 1 year: <div class="font-bold ml-2">
                  {(Number(P2PStaked) * 1.159).toLocaleString()} P2P
                </div>
              </div>
              <div class="flex flex-wrap">
                Lock in Period: <div class="font-bold ml-2">21 days</div>
              </div>
            </div>

            <div class="flex justify-center mt-2">
              <button
                on:click={(e) => stakeP2P(parseEther(String(P2PStaked)))}
                class="w-full px-3 py-3 bg-[#23b102] rounded-xl hover:scale-[1.05] 
                    transition font-bold text-white">Stake your P2P</button
              >
            </div>
          {/if}
        </div>
      </div>
    </div>
  {/if}
</div>

<style>
</style>
