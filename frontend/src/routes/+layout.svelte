<script>
  import { initAuth, login, logout, isAuthenticated } from '../lib/auth.js';
  import { onMount } from 'svelte';
  let authenticated = false;

  onMount(async () => {
    await initAuth();
    authenticated = await isAuthenticated();
  });
</script>

<div class="min-h-screen bg-gradient-to-b from-gray-900 to-black text-white">
  <nav class="p-4 flex justify-between items-center">
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
  <footer class="p-4 text-center">
    <p>© 2025 HeritageVault. Melestarikan Budaya Nusantara.</p>
  </footer>
</div>
