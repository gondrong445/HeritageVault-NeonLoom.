<script>
  import { ambilKarya, verifikasiKarya } from '../../lib/api.js';
  let karyaId = '';
  let karya = null;
  let isAdmin = false; // Ganti dengan logika autentikasi admin

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

<main class="p-10 max-w-xl mx-auto">
  <h1 class="text-3xl mb-6 font-bold text-white">Verifikasi Karya</h1>
  <div class="mb-4">
    <input class="input" placeholder="Masukkan ID Karya" bind:value={karyaId} />
    <button class="btn-primary mt-2" on:click={handleSearch}>Cari</button>
  </div>

  {#if karya}
    <div class="bg-gray-800 rounded shadow p-4">
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
        <button class="btn-primary mt-4" on:click={handleVerify}>Verifikasi Sekarang</button>
      {/if}
      <a href={`/gallery/${karya.id}`} class="block mt-2 text-neon-blue">Lihat NFT</a>
    </div>
  {/if}
</main>
