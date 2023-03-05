<script lang='ts'>

    import { onMount } from 'svelte';
    import { ethers, BrowserProvider, formatEther, formatUnits, type BigNumberish } from 'ethers';
    import { P2PInvestingContractBaseGoerli, P2PInvestingContractMumbai, P2PTokenContractBaseGoerli } from '$lib/state/state';
    import { connectedNetwork } from '$lib/state/state';
    // @ts-ignore
    import InvestingABI from '$lib/abi/Investment.json';
    import P2PTokenABI from '$lib/abi/P2PToken.json';

    async function viewBill() {
        
        if ($connectedNetwork == 80001) {
          console.log(800001)
          //@ts-ignore
          const provider = new BrowserProvider(window.ethereum, 'any');
          const signer = await provider.getSigner();
          const contract = new ethers.Contract(
          P2PInvestingContractMumbai,
          InvestingABI,
          signer);
          let viewBill = await contract.viewBill();
          // fundingGoal = formatEther(BigInt(viewBill[0]));
          // viewBill = formatEther(BigInt(viewBill[1]))
          // progressFunding = (Number(viewBill) / Number(fundingGoal)) * 100
          console.log(viewBill);
        } else if ($connectedNetwork == 85341){

          //@ts-ignore
          const provider = new BrowserProvider(window.ethereum, 'any');
          const signer = await provider.getSigner();
          const contract = new ethers.Contract(
          P2PInvestingContractBaseGoerli,
          InvestingABI,
          signer);
          let viewBill = await contract.viewBill();
          // fundingGoal = formatEther(BigInt(viewBill[0]));
          // viewBill = formatEther(BigInt(viewBill[1]))
          // progressFunding = (Number(viewBill) / Number(fundingGoal)) * 100
          console.log(viewBill);
          
        }

    } setTimeout(viewBill, 400);
</script>

<div class="max-w-[1600px] w-max gap-4 flex flex-col">
  <h1 class="text-4xl font-semibold">Pay Bill</h1>
  <div class="flex items-center justify-center flex-wrap gap-8 w-full">
    <div class="w-[46rem] bg-white rounded-xl shadow cursor-pointer">
      <img
        src="/img/solarBaranquilla.jpg"
        alt=""
        class="shadow h-64 w-full object-center object-cover rounded-xl scale-[1.01]"
      />
      <div class="w-full flex flex-col gap-6 p-4">
        <div class="flex w-full items-center justify-between">
          <h2 class="font-semibold text-xl">Hospital Of Baranquilla</h2>
          <p class="text-secondaryText">Baranquilla, Colombia</p>
        </div>
        <div class="flex flex-col gap-6">
          <div class="w-full flex justify-between">
            <p class="font-semibold">Total Usage Kwh</p>
            <span class="font-light">20,000 Kwh</span>
          </div>
          <div class="w-full flex justify-between">
            <p class="font-semibold">Cost per 1 kwh</p>
            <span class="font-light">$0.17</span>
          </div>
          <div class="h-1 w-full bg-gray-200" />
          <div class="w-full flex justify-between">
            <p class="font-semibold">Total Elecricity Bill Cost</p>
            <span class="font-light">$3400 USD</span>
          </div>
        </div>
        <div class="w-full flex justify-around">
          <button class="p-4 rounded-lg bg-brandGreen text-white w-36"
            >Pay in P2P</button
          >
          <button class="p-4 rounded-lg bg-brandGreen text-white w-36"
            >Pay in USD</button
          >
        </div>
      </div>
    </div>
  </div>
</div>
