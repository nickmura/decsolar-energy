<script lang='ts'>



    import { onMount } from 'svelte';
    import { ethers, BrowserProvider, formatEther, formatUnits, type BigNumberish } from 'ethers';
    import { P2PInvestingContractBaseGoerli, P2PInvestingContractMumbai, P2PTokenContractBaseGoerli } from '$lib/state/state';
    import { connectedNetwork } from '$lib/state/state';
    // @ts-ignore
    import InvestingABI from '$lib/abi/Investment.json';
    import P2PTokenABI from '$lib/abi/P2PToken.json';

    let investment:BigNumberish
    let fundingGoal:BigNumberish
    let currentFunding:BigNumberish
    let progressFunding:BigNumberish

    onMount(() => {
        if (fundingGoal == undefined) fundingProgress();

    }) 
    async function fundingProgress() {
        
        if ($connectedNetwork == 80001) {
          console.log(800001)
          //@ts-ignore
          const provider = new BrowserProvider(window.ethereum, 'any');
          const signer = await provider.getSigner();
          const contract = new ethers.Contract(
          P2PInvestingContractMumbai,
          InvestingABI,
          signer);
          let fundingProgress = await contract.fundingProgress();
          fundingGoal = formatEther(BigInt(fundingProgress[0]));
          fundingProgress = formatEther(BigInt(fundingProgress[1]))
          progressFunding = (Number(fundingProgress) / Number(fundingGoal)) * 100
          console.log(fundingProgress);
        } else if ($connectedNetwork == 85341){

          //@ts-ignore
          const provider = new BrowserProvider(window.ethereum, 'any');
          const signer = await provider.getSigner();
          const contract = new ethers.Contract(
          P2PInvestingContractBaseGoerli,
          InvestingABI,
          signer);
          let fundingProgress = await contract.fundingProgress();
          fundingGoal = formatEther(BigInt(fundingProgress[0]));
          fundingProgress = formatEther(BigInt(fundingProgress[1]))
          progressFunding = (Number(fundingProgress) / Number(fundingGoal)) * 100
          console.log(fundingProgress);
          
        }

    } setTimeout(fundingProgress, 400);

    async function contribute(stake:BigInt) {
      console.log(stake)
      if ($connectedNetwork == 80001) {
          console.log(800001)
          //@ts-ignore
          const provider = new BrowserProvider(window.ethereum, 'any');
          const signer = await provider.getSigner();
          const contract = new ethers.Contract(
          P2PInvestingContractMumbai,
          InvestingABI,
          signer);
          let contribute = await contract.contribute(stake);

          console.log(contribute);
        } else if ($connectedNetwork == 85341){

          //@ts-ignore
          const provider = new BrowserProvider(window.ethereum, 'any');
          const signer = await provider.getSigner();
          const contract = new ethers.Contract(
          P2PInvestingContractBaseGoerli,
          InvestingABI,
          signer);
          let contribute = await contract.contribute(stake);

          console.log(contribute);
          
        }
    }
  </script>
  
  
  
  
  
  
  <div class="max-w-[1600px] w-full gap-4 flex flex-col">
    <h1 class="text-4xl font-semibold">Project</h1>
    <div class="text-xl text-secondaryText font-semibold flex w-full mb-4">
      <button class="px-8 border-b-2 text-brandGreen border-brandGreen pb-4"
        >Description</button
      >
      <button class="px-8 border-b-2 w-max border-gray-300 pb-4"
        >Technical Information</button
      >
      <button class="px-8 border-b-2 border-gray-300 pb-4"
        >Insurance Policy</button
      >
      <div class="flex-grow border-b-2 border-gray-300 pb-4" />
    </div>
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 w-full">
      <div
        class="flex flex-col gap-4 bg-white rounded-xl shadow lg:col-span-2 p-6"
      >
        <img
          src="/img/solarBaranquilla.jpg"
          alt=""
          class="w-full h-48 rounded-xl object-cover object-center"
        />
        <div class="w-full flex justify-between">
          <div>
            <h3 class="font-semibold">Panels</h3>
            <span class="block text-brandGreen font-semibold">2.496 </span>
          </div>
          <div>
            <h3 class="font-semibold">CO2 Avoided</h3>
            <span class="text-brandGreen font-semibold">23.987 ton</span>
          </div>
          <div>
            <h3 class="font-semibold">Trees Saved</h3>
            <span class="text-brandGreen font-semibold">344.118</span>
          </div>
          <div>
            <h3 class="font-semibold">Contract</h3>
            <span class="text-brandGreen font-semibold">30 Years</span>
          </div>
          <div>
            <h3 class="font-semibold">Energy Installed</h3>
            <span class="text-brandGreen font-semibold">1.38 KWP</span>
          </div>
          <div>
            <h3 class="font-semibold"># of Investors</h3>
            <span class="text-brandGreen font-semibold">{currentFunding ? 1 : 0}</span>
          </div>
        </div>
        <h2 class="text-xl">Description</h2>
        <p>
          To optimize the effectiveness of our solar farms and enhance quality of
          life for all stakeholders, we have decided to partner with a hospital in
          Baranquilla, Colombia. Our project will result in improved energy
          reliability.
        </p>
      </div>
      <div
        class="p-6 bg-white items-center rounded-xl shadow gap-4 flex flex-col"
      > 
        <div class="w-full flex justify-between">
          <div>
            <h3 class="font-semibold flex items-center gap-2">
              Cost of 1
              <img src="/img/p2pcoin.png" alt="" class="w-6 inline-block" />
            </h3>
            <span class="block text-brandGreen font-semibold">0.5 USD</span>
          </div>
          <div>
            <h3 class="font-semibold">APR</h3>
            <span class="text-brandGreen font-semibold">12.2%</span>
          </div>
          <div>
            <h3 class="font-semibold">Net Profit</h3>
            <span class="text-brandGreen font-semibold">14.7%</span>
          </div>
        </div>
  
        <div class="flex flex-col items-center gap-2">
          <h3 class="font-semibold text-lg">Contribution Progress</h3>
          <p>Funding Goal of Project</p>
          <div class=''><b>{fundingGoal ? Number(fundingGoal).toLocaleString() : ''} P2P</b></div>
          <progress
            max="100"

            value={progressFunding ? progressFunding : 0}
            class="w-full rounded-xl bg-gray-300 text-brandGreen"
          />
          <p class="font-semibold text-brandGreen">{progressFunding}% Financed</p>
        </div>
        <div class="flex justify-between w-full">
          <p>Start Of Installation:</p>
          <span class="font-semibold text-brandGreen">22/02/23</span>
        </div>
        <div class="flex justify-between w-full">
          <p>Estimated Start Of Operation:</p>
          <span class="font-semibold text-brandGreen">11/08/23</span>
        </div>
        <div class="flex justify-between w-full">
          <p>First Estimated Profitability:</p>
          <span class="font-semibold text-brandGreen">`15/09/23</span>
        </div>
        <input type='range' min='0' max={250000} bind:value={investment}>
        <div class=''>Invest: {investment ? investment.toLocaleString() : ''} P2P</div>
        <div class=''>Receive: {investment ?  (100 * ( Number(investment) / Number(fundingGoal))).toFixed(2) : ''}% equity</div>
        <button on:click={(e)=>contribute(BigInt(Number(investment) * (10 ** 18)))} class="p-4 rounded-lg bg-brandGreen text-white w-36"
          >Invest</button
        >
      </div>
      <div
        class="p-6 flex flex-col gap-4 bg-white rounded-xl shadow lg:col-span-2"
      >
        <div class="w-full flex justify-between">
          <div>
            <h3 class="font-semibold">Pre-Sale Discount</h3>
            <span class="block text-brandGreen font-semibold">0.00%</span>
          </div>
          <div>
            <h3 class="font-semibold">% Contributed</h3>
            <span class="text-brandGreen font-semibold">20%</span>
          </div>
          <div>
            <h3 class="font-semibold">Total Invested</h3>
            <span class="text-brandGreen font-semibold">{currentFunding ? currentFunding.toLocaleString() : '0'} P2P</span>
          </div>
          <div>
            <h3 class="font-semibold">APR</h3>
            <span class="text-brandGreen font-semibold">14.7%</span>
          </div>
        </div>
  
        <h2 class="text-xl">Projected Earnings</h2>
        <div class="w-full h-64 flex gap-2 my-2">
          <div class="flex h-full flex-col justify-between items-end">
            <span>$20000</span>
            <span>$10000</span>
            <span>$5000</span>
            <span>$1000</span>
            <span>$500</span>
            <span>$0</span>
          </div>
          <div class="flex h-full w-full items-end justify-around">
            <div class="flex flex-col items-center">
              <div class="w-5 h-48 bg-brandGreen rounded-3xl" />
              <span>1</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-56 bg-brandGreen rounded-3xl" />
              <span>2</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-60 bg-brandGreen rounded-3xl" />
              <span>3</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-48 bg-brandGreen rounded-3xl" />
              <span>4</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-56 bg-brandGreen rounded-3xl" />
              <span>5</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-60 bg-brandGreen rounded-3xl" />
              <span>6</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-48 bg-brandGreen rounded-3xl" />
              <span>7</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-56 bg-brandGreen rounded-3xl" />
              <span>8</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-60 bg-brandGreen rounded-3xl" />
              <span>9</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-48 bg-brandGreen rounded-3xl" />
              <span>10</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-56 bg-brandGreen rounded-3xl" />
              <span>11</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-60 bg-brandGreen rounded-3xl" />
              <span>12</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-48 bg-brandGreen rounded-3xl" />
              <span>13</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-56 bg-brandGreen rounded-3xl" />
              <span>14</span>
            </div>
            <div class="flex flex-col items-center">
              <div class="w-5 h-60 bg-brandGreen rounded-3xl" />
              <span>15</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  