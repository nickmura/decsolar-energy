<script>
    //@ts-ignore
    import Navbar from '$lib/reusable/Navbar.svelte'
    

</script>





<div class="bg-white rounded-[10px]">
    <a href={`projects/hospital`}>
      <img
        class="max-h-[183px] rounded-xl object-cover h-[183px] aspect-video	 w-full"
        src=/img/product1.svg
        alt={'sd'}
      />
    </a>

    <div class=" p-5 ">
      <div class="flex items-center justify-between">
        <h2 class="text-[1.1em] font-manrope font-medium">
          <a href='/projects/hospital'>dsffgf</a>
        </h2>
        <span class="text-[1.1em] font-manrope font-normal text-skin-muted">
            Africa
        </span>
        <!-- {/* pregressbar */} -->
      </div>
      <div class="w-full my-3 bg-[#D3D3D3] rounded-full h-2 ">
        <div
          class={`bg-skin-green h-2 rounded-full`}
          style='width: 50%'
        ></div>
      </div>

      <!-- {/* data */} -->
      <ul class="flex gap-4">
        <li class="">
          <span class="text-[1em] block font-manrope font-normal">
            Project Cost
          </span>
          <span class="text-[0.8em text-skin-green font-manrope]">
            <span class="block">200$</span>
            or <span>200$</span>
          </span>
        </li>
        <li class="">
          <span class="text-[1em]  block font-manrope font-normal">
            APR
          </span>
          <span class="text-[1.3em] block font-manrope font-semibold text-skin-green">
            10
          </span>
        </li>
        <li class="">
          <span class="text-[1em] text-center block font-manrope font-normal">
            Date
          </span>
          <span class="text-[1.3em] text-center font-manrope font-semibold text-skin-green">
            {Date}
          </span>
        </li>
        <li class="">
          <span class="text-[1em] block font-manrope font-normal">
            %Completed
          </span>
          <span class="text-[1.3em] block text-center font-manrope font-semibold text-skin-green">
            
          </span>
        </li>
      </ul>
    </div>
  </div>

