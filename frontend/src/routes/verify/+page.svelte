<script>
  import { ambilKarya, verifikasiKarya } from '../../lib/api.js';
  let karyaId = '';
  let karya = null;
  let isAdmin = false;

  async function handleSearch() {
    const result = await ambilKarya(parseInt(karyaId));
    karya = result || null;
  }

  async function handleVerify() {
    if (!isAdmin) {
      alert('Hanya admin yang bisa memverifikasi karya.');
      return;
    }
    const success = await verifikasiKarya(parseInt(karyaId));
    if (success) {
      alert('Karya berhasil diverifikasi!');
      handleSearch();
    }
  }
</script>

<main class="p-10 max-w-xl mx-auto relative z-10">
  <h1 class="text-3xl md:text-4xl mb-6 font-bold text-white text-center">Verifikasi Karya</h1>
  <div class="bg-gray-800 p-6 rounded-lg border border-neon-blue shadow-xl mb-8">
    <input class="input" placeholder="Masukkan ID Karya" bind:value={karyaId} />
    <button class="btn-primary w-full" on:click={handleSearch}>Cari</button>
  </div>

  {#if karya}
    <div class="card">
      <h2 class="text-xl font-bold">{karya.judul}</h2>
      <p class="text-gray-400">Daerah: {karya.daerah}</p>
      <p class="text-gray-400">Hash: {karya.id}</p>
      <p>Status: 
        {#if karya.sudahTerverifikasi}
          <span class="text-green-600 font-bold">Terverifikasi</span>
        {:else}
          <span class="text-red-600">Belum Terverifikasi</span>
        {/if}
      </p>
      {#if isAdmin && !karya.sudahTerverifikasi}
        <button class="btn-primary mt-4 w-full" on:click={handleVerify}>Verifikasi Sekarang</button>
      {/if}
      <a href={`/gallery/${karya.id}`} class="block mt-2 text-neon-blue text-center">Lihat NFT</a>
    </div>
  {/if}
</main>
