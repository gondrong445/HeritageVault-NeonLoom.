<script>
  import { ambilSemuaKarya, donasiKeKarya } from '../../lib/api.js';
  let semuaKarya = [];
  let jumlahDonasi = 15;

  onMount(async () => {
    semuaKarya = await ambilSemuaKarya();
  });

  async function handleDonate(karyaId) {
    const success = await donasiKeKarya(karyaId, jumlahDonasi);
    if (success) {
      alert('Terima kasih atas donasi Anda!');
    }
  }
</script>

<main class="p-10 relative z-10">
  <h1 class="text-3xl md:text-4xl mb-6 font-bold text-white text-center">Dukung Pengrajin Lokal</h1>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
    {#each semuaKarya as karya}
      <div class="card">
        <div class="relative">
          <img src="placeholder.jpg" alt={karya.judul} class="h-48 w-full object-cover rounded-t-lg" />
          <div class="absolute top-2 right-2 bg-neon-blue text-white px-2 py-1 rounded text-sm">
            {karya.daerah}
          </div>
        </div>
        <div class="p-4">
          <h2 class="text-xl font-bold">{karya.judul}</h2>
          <p class="text-gray-400 mt-2">Total Donasi: {karya.totalDonasi} ICP</p>
          <button class="btn-primary mt-4 w-full" on:click={() => handleDonate(karya.id)}>
            Dukung (Rp15K/bulan)
          </button>
        </div>
      </div>
    {/each}
  </div>
</main>
