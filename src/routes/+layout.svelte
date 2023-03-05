<script>
  import '../app.css';
  import Navbar from '$lib/reusable/Navbar.svelte';
</script>

<div
  class="bg-gray-100 font-varela min-h-screen h-full w-screen text-primaryText"
>
  <Navbar />
  <div class="w-screen p-8 h-full flex justify-center gap-8">
    <slot />
  </div>
</div>
