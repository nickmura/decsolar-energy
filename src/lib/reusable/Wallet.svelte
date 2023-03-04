<script>
    import { onMount } from 'svelte';
    import { ethers, BrowserProvider } from 'ethers';
    import { walletAddress } from "$lib/state/state";

    onMount(async () => {
        //@ts-ignore
        const provider = new BrowserProvider(window.ethereum, "any")
        const accounts = await provider.send("eth_accounts", [])
        walletAddress.set(accounts[0])
    })

    async function connectMetamask() {
        const baseChainID = 84531
            // @ts-ignore
            if (typeof window != "undefined" && typeof window.ethereum != "undefined" && window.ethereum) {

            try {
                /* MetaMask is installed */
                //@ts-ignore
                const provider = new BrowserProvider(window.ethereum, "any")
                const accounts = await provider.send("eth_requestAccounts", [])
                const network = await provider.getNetwork();
                walletAddress.set(accounts[0])
                if (network.chainId !== BigInt(84531)) { // if network Base
                await provider.send('wallet_switchEthereumChain', [{ chainId: `0x${baseChainID.toString(16)}` }])
                }

            } catch (err) {
                if (err instanceof Error)
                console.error(err.message);
            }

            
            } else {
            /* MetaMask is not installed */
            console.log("Please install MetaMask");
            }
    }
</script>


<div>
        {#if !$walletAddress}
            <button on:click={connectMetamask} class='text-white px-2 py-2 w-56  flex items-center gap-3 rounded-lg bg-[#0052fe] hover:scale-[1.05] transition' name="Create Account">
                <img src='/img/metamask.svg' alt="metamask" class='w-[35px] h-[35px]'/>
                <span>Connect Metamask</span>   
            </button> 
        {:else}
            <button class='text-white px-2 py-2 w-48 flex items-center gap-3 rounded-lg bg-[#0052fe] hover:scale-[1.05] transition' name="Create Account">
                <img src='/img/metamask.svg' alt="metamask" class='w-[35px] h-[35px]'/>
                <span>{$walletAddress.substring(0,8)}...{$walletAddress.substring(36,40)}</span>
            </button> 
        {/if}
</div>