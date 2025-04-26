<script>
  import { unggahKarya } from '../../lib/api.js';
  let judul = '';
  let cerita = '';
  let daerah = '';
  let file = null;
  let progress = 'Upload'; // Upload > Minting > Success

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
    progress = 'Minting';
    const reader = new FileReader();
    reader.readAsArrayBuffer(file);
    reader.onload = async () => {
      const buffer = reader.result;
      const blob = new Uint8Array(buffer);
      const id = await unggahKarya(judul, cerita, blob, daerah);
      progress = 'Success';
      alert(`Karya berhasil diunggah dengan ID ${id}`);
    };
  }
</script>

<main class="p-10 max-w-xl mx-auto">
  <h1 class="text-3xl mb-6 font-bold text-white">Unggah Karya</h1>
  <div class="bg-gray-800 p-6 rounded-lg border border-neon-blue">
    <input class="input" placeholder="Judul Karya" bind:value={judul} />
    <textarea class="input" placeholder="Ceritakan tentang karya ini" bind:value={cerita}></textarea>
    <input class="input" placeholder="Daerah Asal, misal: Yogyakarta" bind:value={daerah} />
    <input type="file" accept="image/*" on:change={handleFileChange} class="input" />
    <button class="btn-primary mt-4" on:click={handleUpload}>Mint NFT</button>
  </div>
  <div class="mt-6 flex justify-between max-w-md mx-auto">
    <span class={progress === 'Upload' ? 'text-neon-blue' : 'text-gray-500'}>Upload</span>
    <span class={progress === 'Minting' ? 'text-neon-blue' : 'text-gray-500'}>Minting</span>
    <span class={progress === 'Success' ? 'text-neon-blue' : 'text-gray-500'}>Success</span>
  </div>
</main>
