<script>
  import { ambilSemuaKarya } from '../../lib/api.js';
  let semuaKarya = [];
  let showAR = false;
  let selectedKarya = null;

  onMount(async () => {
    semuaKarya = await ambilSemuaKarya();
  });

  function openAR(karya) {
    selectedKarya = karya;
    showAR = true;
  }
</script>

<main class="p-10">
  <h1 class="text-3xl mb-6 font-bold text-white">Galeri Karya</h1>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
    {#each semuaKarya as karya}
      <div class="bg-gray-800 rounded shadow p-4 text-white">
        <img src="placeholder.jpg" alt={karya.judul} class="h-48 w-full object-cover rounded" />
        <h2 class="text-xl font-bold mt-2">{karya.judul}</h2>
        <p class="text-gray-400">{karya.daerah}</p>
        {#if karya.sudahTerverifikasi}
          <span class="text-green-600 font-bold">Terverifikasi</span>
        {:else}
          <span class="text-red-600">Belum Terverifikasi</span>
        {/if}
        <button class="btn-primary mt-4" on:click={() => openAR(karya)}>Lihat dalam AR</button>
      </div>
    {/each}
  </div>

  {#if showAR}
    <div class="fixed inset-0 bg-black flex items-center justify-center">
      <a-scene embedded arjs="trackingMethod: best;">
        <a-marker preset="hiro">
          <a-image src="placeholder.jpg" width="1" height="1"></a-image>
        </a-marker>
        <a-entity camera></a-entity>
      </a-scene>
      <button class="absolute top-4 right-4 text-white" on:click={() => (showAR = false)}>Tutup</button>
    </div>
  {/if}
</main>
