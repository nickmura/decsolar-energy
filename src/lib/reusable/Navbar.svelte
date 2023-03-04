<script lang='ts'>
    import Wallet from './Wallet.svelte'
    import Network from './Network.svelte'
    import { page } from '$app/stores'
    import { goto } from '$app/navigation'

	interface Pages {
		name: string,
		url: string,
	}
	let menu:Pages[] = [
		{ name: 'Staking', url: '/staking' },
		{ name: 'Projects', url: '/projects' },
		{ name: 'Swap', url: '/swap' },
		{ name: 'Invoices', url: '/invoices' },
		// { name: 'Whitepaper', url: '/#whitepaper' }
	];
    
  
</script>

<main>

    <header class="flex w-full  bg-white py-1 px-5 justify-between">
        <a href='/'><img src='/img/Logo.svg' alt='dec energy logo' class="text-4xl"/></a>
        <div class="flex gap-2 items-center">
            <div class="hidden lg:flex lg:items-center lg:gap-10">
                <ul class="flex items-center gap-6 ">
                    {#each menu as item}
                        <li>
                            {#if item.name == 'Whitepaper'}
                                <a href='./' class="text-lg opacity-50">{item.name}</a>
                            {:else if $page.routeId == '/join' && item.name == 'Games'} 
                                    <a href='./' class="text-lg ">{item.name}</a>
                            {:else}
                                <div class='hover:scale-[1.05] transition transition-200'>
                                    <a href={item.url} class="text-lg ">{item.name}</a>
                                </div>
                            {/if}
                        </li>
                    {/each}
                </ul>            
            <Wallet/>
            <Network/>
        </div>
      </header>
</main>