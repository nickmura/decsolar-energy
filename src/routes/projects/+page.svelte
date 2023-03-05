<script lang="ts">
  import ProjectCard from '$lib/reusable/ProjectCard.svelte';

  interface Pages {
    name: string;
    url: string;
  }

  let menu: Pages[] = [
    { name: 'Hospital of Baranquilla', url: '/projectdesc' },
  ];
</script>

<div class="max-w-[1600px] w-max gap-4 flex flex-col">
  <h1 class="text-4xl font-semibold">Projects</h1>
  <div class="text-xl border-b-gray-300 px-4">
    <button>All</button>
    <button>Available</button>
    <button>Completed</button>
  </div>
  <div class="flex items-center justify-center flex-wrap gap-8 w-full">
    <ProjectCard />
    <ProjectCard />
    <ProjectCard />
    <ProjectCard />
    <ProjectCard />
    <ProjectCard />
  </div>
</div>
