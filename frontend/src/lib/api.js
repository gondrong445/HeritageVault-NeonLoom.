import { createActor } from "../../../../declarations/HeritageVault"; // Ganti path sesuai struktur

const vault = createActor("HeritageVault");

export async function unggahKarya(judul, cerita, gambar, daerah) {
  return await vault.unggahKarya(judul, cerita, gambar, daerah);
}

export async function verifikasiKarya(id) {
  return await vault.verifikasiKarya(id);
}

export async function donasiKeKarya(id, jumlah) {
  return await vault.donasiKeKarya(id, jumlah);
}

export async function ambilSemuaKarya() {
  return await vault.ambilSemuaKarya();
}

export async function ambilKarya(id) {
  return await vault.ambilKarya(id);
}
