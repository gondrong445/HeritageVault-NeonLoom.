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

<main class="p-10">
  <h1 class="text-3xl mb-6 font-bold text-white">Dukung Pengrajin Lokal</h1>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
    {#each semuaKarya as karya}
      <div class="bg-gray-800 rounded shadow p-4 text-white">
        <img src="placeholder.jpg" alt={karya.judul} class="h-48 w-full object-cover rounded" />
        <h2 class="text-xl font-bold mt-2">{karya.judul}</h2>
        <p class="text-gray-400">Daerah: {karya.daerah}</p>
        <p class="text-gray-400">Total Donasi: {karya.totalDonasi} ICP</p>
        <button class="btn-primary mt-4" on:click={() => handleDonate(karya.id)}>
          Dukung (Rp15K/bulan)
        </button>
      </div>
    {/each}
  </div>
</main>
