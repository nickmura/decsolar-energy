<script lang="ts">
  import { goto } from '$app/navigation';

  export let imgUrl: string;
  export let name: string;
  export let url: string;
  export let location: string;
  export let cost: { dollars: string; p2p: string };
  export let apr: string;
  export let date: string;
  export let completed: string;
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<div
  class="w-[32rem] bg-white rounded-xl shadow cursor-pointer"
  on:click={() => goto(url)}
>
  <img
    src={imgUrl}
    alt=""
    class="shadow h-40 w-full object-center object-cover rounded-xl scale-[1.01]"
  />
  <div class="w-full flex flex-col gap-4 p-4">
    <div class="flex w-full items-center justify-between">
      <h2 class="font-semibold text-xl">{name}</h2>
      <p class="text-secondaryText">{location}</p>
    </div>
    <progress
      class="w-full rounded-xl bg-gray-300 text-brandGreen"
      max="100"
      min=0
      value="30"
    />
    <div class="w-full flex justify-between">
      <div>
        <h3 class="font-semibold">Project Cost</h3>
        <span class="block text-brandGreen font-semibold break-words w-32"
          >${cost.dollars} or {cost.p2p}
          <img src="/img/p2pcoin.png" alt="" class="w-6 inline-block" />
        </span>
      </div>
      <div>
        <h3 class="font-semibold">APR</h3>
        <span class="text-brandGreen font-semibold">{apr}</span>
      </div>
      <div>
        <h3 class="font-semibold">Date</h3>
        <span class="text-brandGreen font-semibold">{date}</span>
      </div>
      <div>
        <h3 class="font-semibold">% Completed</h3>
        <span class="text-brandGreen font-semibold">{completed}</span>
      </div>
    </div>
  </div>
</div>
