<script>
  import { ambilSemuaKarya } from '../../lib/api.js';
  let semuaKarya = [];
  let showAR = false;
  let selectedKarya = null;
  let filterDaerah = '';

  onMount(async () => {
    semuaKarya = await ambilSemuaKarya();
  });

  function openAR(karya) {
    selectedKarya = karya;
    showAR = true;
  }

  $: karyaTampil = filterDaerah
    ? semuaKarya.filter(karya => karya.daerah.toLowerCase().includes(filterDaerah.toLowerCase()))
    : semuaKarya;
</script>

<main class="p-10 relative z-10">
  <h1 class="text-3xl md:text-4xl mb-6 font-bold text-white text-center">Galeri Karya Nusantara</h1>
  <div class="max-w-md mx-auto mb-8">
    <input class="input" placeholder="Filter berdasarkan daerah" bind:value={filterDaerah} />
  </div>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
    {#each karyaTampil as karya}
      <div class="card">
        <img src="placeholder.jpg" alt={karya.judul} class="h-48 w-full object-cover rounded-t-lg" />
        <div class="p-4">
          <h2 class="text-xl font-bold">{karya.judul}</h2>
          <p class="text-gray-400">{karya.daerah}</p>
          {#if karya.sudahTerverifikasi}
            <span class="text-green-600 font-bold">Terverifikasi</span>
          {:else}
            <span class="text-red-600">Belum Terverifikasi</span>
          {/if}
          <button class="btn-primary mt-4 w-full" on:click={() => openAR(karya)}>Lihat dalam AR</button>
        </div>
      </div>
    {/each}
  </div>

  {#if showAR}
    <div class="fixed inset-0 bg-black flex items-center justify-center z-50">
      <a-scene embedded arjs="trackingMethod: best;">
        <a-marker preset="hiro">
          <a-image src="placeholder.jpg" width="1" height="1"></a-image>
        </a-marker>
        <a-entity camera></a-entity>
      </a-scene>
      <button class="absolute top-4 right-4 text-white bg-neon-blue px-4 py-2 rounded" on:click={() => (showAR = false)}>Tutup</button>
    </div>
  {/if}
</main>
