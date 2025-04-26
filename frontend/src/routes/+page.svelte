<script>
  import { onMount } from 'svelte';

  onMount(() => {
    // Animasi saat masuk halaman
    const heroElements = document.querySelectorAll('.hero-anim');
    heroElements.forEach((el, idx) => {
      el.style.opacity = '0';
      el.style.transform = 'translateY(20px)';
      setTimeout(() => {
        el.style.transition = 'all 0.5s ease';
        el.style.opacity = '1';
        el.style.transform = 'translateY(0)';
      }, idx * 200);
    });
  });
</script>

<main class="min-h-screen bg-gradient-to-r from-purple-600 to-indigo-700 flex items-center justify-center text-white relative">
  <div class="text-center space-y-6 z-10">
    <h1 class="text-5xl md:text-6xl font-bold hero-anim">HeritageVault ICP</h1>
    <p class="text-lg md:text-xl hero-anim">Mengabadikan Karya Budaya Nusantara di Blockchain.</p>
    <div class="space-x-4 hero-anim">
      <a href="/upload" class="btn-primary">Unggah Karya</a>
      <a href="/gallery" class="btn-primary">Lihat Galeri</a>
    </div>
    <div class="mt-12 max-w-2xl mx-auto hero-anim">
      <h2 class="text-2xl font-semibold">Kenapa HeritageVault?</h2>
      <p class="mt-2">
        Saya terinspirasi dari pengrajin batik di kampung halaman yang sering kesulitan memasarkan karya mereka. Dengan teknologi blockchain, kita bisa memastikan keaslian karya mereka dan memberikan dukungan langsung lewat ICP. Yuk, bantu lestarikan budaya kita!
      </p>
    </div>
    <!-- Value Proposition -->
    <div class="mt-16 grid grid-cols-1 md:grid-cols-3 gap-8 max-w-5xl mx-auto">
      <div class="card">
        <h3 class="text-xl font-bold mb-2">Unggah Karya</h3>
        <p>Upload karya batikmu ke canister NFT dengan mudah.</p>
      </div>
      <div class="card">
        <h3 class="text-xl font-bold mb-2">Verifikasi Keaslian</h3>
        <p>Cek otentikasi karya menggunakan smart contract.</p>
      </div>
      <div class="card">
        <h3 class="text-xl font-bold mb-2">Dukung Pengrajin</h3>
        <p>Langganan dukungan ICP untuk pengrajin lokal.</p>
      </div>
    </div>
  </div>
  <div class="absolute inset-0 opacity-20 bg-[url('/batik-pattern.png')] bg-repeat animate-slow-scroll"></div>
</main>

<style>
  .animate-slow-scroll {
    animation: slow-scroll 20s linear infinite;
  }

  @keyframes slow-scroll {
    0% { background-position: 0 0; }
    100% { background-position: 0 200px; }
  }
</style>
