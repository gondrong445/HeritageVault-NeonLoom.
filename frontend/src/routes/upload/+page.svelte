<script>
  import { unggahKarya } from '../../lib/api.js';
  let judul = '';
  let cerita = '';
  let daerah = '';
  let file = null;
  let progress = 0; // 0: Upload, 1: Minting, 2: Success

  async function handleFileChange(event) {
    file = event.target.files[0];
  }

  async function handleUpload() {
    if (!file) {
      alert('Silakan pilih file gambar!');
      return;
    }
    if (file.size > 2 * 1024 * 1024) {
      alert('File terlalu besar, maksimal 2MB ya!');
      return;
    }
    progress = 1;
    const reader = new FileReader();
    reader.readAsArrayBuffer(file);
    reader.onload = async () => {
      const buffer = reader.result;
      const blob = new Uint8Array(buffer);
      const id = await unggahKarya(judul, cerita, blob, daerah);
      progress = 2;
      alert(`Karya berhasil diunggah dengan ID ${id}`);
    };
  }
</script>

<main class="p-10 max-w-xl mx-auto relative z-10">
  <h1 class="text-3xl md:text-4xl mb-6 font-bold text-white text-center">Unggah Karya</h1>
  <div class="bg-gray-800 p-8 rounded-lg border border-neon-blue shadow-xl">
    <div class="mb-6">
      <label class="block text-sm mb-2">Judul Karya</label>
      <input class="input" placeholder="Judul Karya" bind:value={judul} />
    </div>
    <div class="mb-6">
      <label class="block text-sm mb-2">Ceritakan tentang karya ini</label>
      <textarea class="input" rows="4" placeholder="Ceritakan tentang karya ini" bind:value={cerita}></textarea>
    </div>
    <div class="mb-6">
      <label class="block text-sm mb-2">Daerah Asal</label>
      <input class="input" placeholder="Daerah Asal, misal: Yogyakarta" bind:value={daerah} />
    </div>
    <div class="mb-6">
      <label class="block text-sm mb-2">Unggah Gambar</label>
      <div class="border-2 border-dashed border-neon-blue rounded-lg p-6 text-center">
        <input type="file" accept="image/*" on:change={handleFileChange} class="input" />
        <p class="text-gray-400 text-sm mt-2">Tarik dan lepas file di sini atau klik untuk memilih</p>
      </div>
    </div>
    <button class="btn-primary w-full" on:click={handleUpload}>Mint NFT</button>
  </div>
  {#if progress > 0}
    <div class="mt-6 max-w-md mx-auto">
      <div class="flex justify-between mb-2">
        <span class={progress >= 0 ? 'text-neon-blue' : 'text-gray-500'}>Upload</span>
        <span class={progress >= 1 ? 'text-neon-blue' : 'text-gray-500'}>Minting</span>
        <span class={progress >= 2 ? 'text-neon-blue' : 'text-gray-500'}>Success</span>
      </div>
      <div class="w-full bg-gray-700 rounded-full h-2">
        <div class="bg-neon-blue h-2 rounded-full transition-all duration-500" style="width: {progress * 50}%"></div>
      </div>
    </div>
  {/if}
</main>
