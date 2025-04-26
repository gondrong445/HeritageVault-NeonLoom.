<script>
  import { initAuth, login, logout, isAuthenticated } from '../lib/auth.js';
  import { onMount } from 'svelte';
  let authenticated = false;

  onMount(async () => {
    await initAuth();
    authenticated = await isAuthenticated();
  });

  // Buat partikel secara dinamis
  let particles = Array.from({ length: 20 }).map(() => ({
    top: `${Math.random() * 100}vh`,
    left: `${Math.random() * 100}vw`,
    delay: `${Math.random() * 10}s`
  }));
</script>

<div class="min-h-screen bg-gradient-to-b from-gray-900 to-black text-white relative">
  <div class="particle-bg">
    {#each particles as particle}
      <div
        class="particle"
        style="top: {particle.top}; left: {particle.left}; animation-delay: {particle.delay};"
      ></div>
    {/each}
  </div>
  <nav class="p-4 flex justify-between items-center relative z-10">
    <a href="/" class="text-2xl font-bold">HeritageVault</a>
    <div>
      {#if authenticated}
        <button class="btn-primary" on:click={logout}>Logout</button>
      {:else}
        <button class="btn-primary" on:click={login}>Login</button>
      {/if}
    </div>
  </nav>
  <slot />
  <footer class="p-4 text-center relative z-10">
    <p>© 2025 HeritageVault. Melestarikan Budaya Nusantara.</p>
  </footer>
</div>
