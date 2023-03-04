<script>
    import Wallet from './Wallet.svelte'
    import Network from './Network.svelte'


    const Navbar = {
        
    }
</script>

<main>

    <header class="flex w-full  bg-white py-1 px-5 justify-between">
        <h2 class="text-4xl">Staking</h2>
        <div class="flex gap-2 items-center">
            <img src='./carrot.svg' class="text-[#111] w-[24px] h-[24px]" alt='carrot.svg'/>
            
            <Wallet/>
            <Network/>
        </div>
      </header>
</main>