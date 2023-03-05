<script lang='ts'>
    import { onMount } from 'svelte'
    import { ethers, BrowserProvider } from 'ethers'
    import { networkName, connectedNetwork } from '$lib/state/state'

    let isExpanded = false
    function expandNetworks() {
        isExpanded = !isExpanded
    }

    onMount(async () => {
      //@ts-ignore
      const provider = new BrowserProvider(window.ethereum, "any")
      const walletNetwork = await provider.getNetwork()

    if (walletNetwork.chainId == BigInt(84531)) {
      connectedNetwork.set(84531);
      networkName.set('Base')
      }
    if (walletNetwork.chainId == BigInt(80001)) {
      connectedNetwork.set(80001);
      networkName.set('Polygon')
    }
    })
    async function changeNetwork(network:string) {
        if (network == 'Base') {
            let chainId = 84531;
            networkName.set(network)
            //@ts-ignore
            if (typeof window != "undefined" && typeof window.ethereum != "undefined") {

                try {
                  /* MetaMask is installed */
                  //@ts-ignore
                  const provider = new BrowserProvider(window.ethereum, "any")

                  const walletNetwork = await provider.getNetwork()

                  if (walletNetwork.chainId == BigInt(84531)) connectedNetwork.set(84531);
                  if (walletNetwork.chainId == BigInt(80001)) connectedNetwork.set(80001);

                  if (walletNetwork.chainId !== BigInt(84531) && network == 'Base') { // if network Base
                    try {
                        provider.send('wallet_switchEthereumChain', [
                          { chainId: `0x${chainId.toString(16)}` }
                        ]);
                      } catch (error:any) {
                        if (error.code === 4902)
                          try {
                            provider.send('wallet_addEthereumChain', [
                              {
                                chainId: `0x${chainId.toString(16)}`,
                                chainName: "Base Goerli",
                                nativeCurrency: "ETH",
                                rpcUrls: ['https://goerli.base.org'],
                                blockExplorerUrls: ['https://goerli.basescan.org']
                              }
                            ]);
                          } catch (error) {
                            console.log('Error Setting Network', error);
                          }
                      }
                  }
                //   setWalletAddress(accounts[0]);
                //   setUserAddress(accounts[0]);
                //   console.log(accounts[0]);
                } catch (err) {
                    if (err instanceof Error)
                    console.error(err.message);
                }
          
                
              } else {
                /* MetaMask is not installed */
                console.log("Please install MetaMask");
              }
        } if (network == 'Polygon') {
            networkName.set(network)
            //@ts-ignore
            if (typeof window != "undefined" && typeof window.ethereum != "undefined") {
                let chainId = 80001
                try {
                  /* MetaMask is installed */
                  //@ts-ignore
                  const provider = new BrowserProvider(window.ethereum, "any")

                  const walletNetwork = await provider.getNetwork()
                  if (walletNetwork.chainId !== BigInt(80001) && network == 'Polygon') { // if network Base
                    try {
                        provider.send('wallet_switchEthereumChain', [
                          { chainId: `0x${chainId.toString(16)}` }
                        ]);
                      } catch (error:any) {
                        if (error.code === 4902)
                          try {
                            provider.send('wallet_addEthereumChain', [
                              {
                                chainId: `0x${chainId.toString(16)}`,
                                chainName: "Polygon Mumbai",
                                nativeCurrency: "MATIC",
                                rpcUrls: ['https://rpc-mumbai.maticvigil.com/'],
                                blockExplorerUrls: ['hhttps://polygonscan.com']
                              }
                            ]);
                          } catch (error) {
                            console.log('Error Setting Network', error);
                          }
                      }
                  }
                //   setWalletAddress(provider[0]);
                //   setUserAddress(provider[0]);
                //   console.log(provider[0]);
                } catch (err) {
                    if (err instanceof Error)
                    console.error(err.message);
                }
          
                
              } else {
                /* MetaMask is not installed */
                console.log("Please install MetaMask");
              }
        }
    }


</script>

<div class='min-w-[150px] relative'>
    <button on:click={()=>expandNetworks()} class=' w-full px-2 py-2 
    border rounded-lg border-[#DDDBE6] flex flex-wrap gap-2 font-bold justify-between items-center hover:scale-[1.1] transition'>
        <div class="flex gap-2 items-center">
            <img src={$networkName == 'Base' ? './coinbase-logo.svg' : $networkName == 'Polygon' ? './polygon-logo.png' : ''} alt='dsfdsfds' class='w-5 h-5 mt-0.5'/>
            <span>{$networkName}</span>
        </div>
        <img alt='carrot' src='./carrot.svg' class='w-3 h-3'/>
    </button>
    {#if isExpanded}
    <div class='animate-fade-in-up absolute flex w-full flex-column 
    border border-[#dddBe6] rounded-lg flex-wrap  mt-2 z-20'>
        <div class='flex w-full gap-2 font-bold rounded-lg'>
            <ul class="w-full">
                
                <li class="border-b border-[#dddBe6] w-full ">
                    <button on:click={(e)=>changeNetwork('Base')} class='w-full'>
                        <span class="transition flex gap-2 px-2 py-2 cursor-pointer">
                            <img src='./coinbase-logo.svg' alt='coinbase' class='w-5 h-5 mt-0.5'/>
                            <span>Base</span>
                        </span>
                    </button>
                </li>

                <!-- svelte-ignore a11y-click-events-have-key-events -->
                <li on:click={(e)=>changeNetwork('Polygon')} class="border-b border-[#dddBe6] w-full ">
                     <span class="flex gap-2 px-2 py-2 cursor-pointer">

                        <img src='./polygon-logo.png' class='w-5 h-5 mt-0.5' alt='polygon-logo'/>
                        <span>Polygon</span>
                    </span>
                </li>
                <!-- <li onClick={(e)=>expandNetworks} class="w-full hover:cursor-not-allowed opacity-50">
                     <span class="flex gap-2 px-2 py-2 cursor-pointer">
                        <img src='./bnb-logo.png' class='w-5 h-5 mt-0.5'></img>
                        <span>BNB</span>
                    </span>
                </li> -->
            </ul>
        </div>
    </div>
    {/if}
</div>