<script lang="ts">
  import ProjectCard from './ProjectCard.svelte';
  import { ethers, BrowserProvider, formatEther, formatUnits } from 'ethers'
  interface Pages {
    name: string;
    url: string;
    imgUrl: string;
    location: string;
    cost: { dollars: string; p2p: string };
    apr: string;
    date: string;
    completed: string;
  }

  let menu: Pages[] = [
    {
      name: 'Hospital of Baranquilla',
      url: '/projects/hospital',
      imgUrl: '/img/solarBaranquilla.jpg',
      location: 'Branquilla, Colombia',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
    {
      name: 'University of Cape Town',
      url: '/projectdesc',
      imgUrl: '/img/solarCapeTown.jpg',
      location: 'Cape Town, South Africa',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
    {
      name: 'Texas Bitcoin Mining',
      url: '/projectdesc',
      imgUrl: '/img/solarBTCTexas.jpg',
      location: 'Houston, Texas',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
    {
      name: ' Pembroke Pines School',
      url: '/projectdesc',
      imgUrl: '/img/solarSchoolPembrokePines.jpg',
      location: 'Pembroke Pines, Florida',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
    {
      name: 'Hospital of Baranquilla',
      url: '/projectdesc',
      imgUrl: '/img/solarBaranquilla.jpg',
      location: 'Branquilla, Colombia',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
    {
      name: 'Hospital of Baranquilla',
      url: '/projectdesc',
      imgUrl: '/img/solarBaranquilla.jpg',
      location: 'Branquilla, Colombia',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
    {
      name: 'Hospital of Baranquilla',
      url: '/projectdesc',
      imgUrl: '/img/solarBaranquilla.jpg',
      location: 'Branquilla, Colombia',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
    {
      name: 'Hospital of Baranquilla',
      url: '/projectdesc',
      imgUrl: '/img/solarBaranquilla.jpg',
      location: 'Branquilla, Colombia',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
    {
      name: 'Hospital of Baranquilla',
      url: '/projectdesc',
      imgUrl: '/img/solarBaranquilla.jpg',
      location: 'Branquilla, Colombia',
      cost: { dollars: '400,000', p2p: '800,000' },
      apr: '15.2%',
      date: '15/06/23',
      completed: '30.2%',
    },
  ];
  

  async function fundingProgress() {

  }
</script>

<div class="max-w-[1600px] w-max gap-4 flex flex-col">
  <h1 class="text-4xl font-semibold">Projects</h1>
  <div class="text-xl text-secondaryText font-semibold flex w-full mb-4">
    <button class="px-8 border-b-2 border-gray-300 pb-4">All</button>
    <button class="px-8 border-b-2 text-brandGreen border-brandGreen pb-4"
      >Available</button
    >
    <button class="px-8 border-b-2 border-gray-300 pb-4">Completed</button>
    <div class="w-full border-b-2 border-gray-300 pb-4" />
  </div>
  <div class="flex items-center justify-center flex-wrap gap-8 w-full">
    {#each menu as item}
      <ProjectCard {...item} />
    {/each}
  </div>
</div>
