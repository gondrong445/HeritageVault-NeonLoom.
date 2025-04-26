# HeritageVault-ICP

## Tentang Proyek Ini
HeritageVault adalah platform buat melestarikan budaya Nusantara, khususnya batik, pake teknologi blockchain Internet Computer (ICP). Ide ini muncul pas saya ikut hackathon dan kepikiran buat bantu pengrajin batik biar karya mereka bisa dikenal dunia. Proyek ini bener-bener dari nol, dan lumayan bikin pusing belajar Motoko sama Svelte barengan, tapi hasilnya lumayan lah!

## Fitur
- **Upload Karya**: Unggah batik dan jadikan NFT.
- **Verifikasi Keaslian**: Admin bisa verifikasi karya pake smart contract.
- **Dukung Pengrajin**: Donasi ICP buat pengrajin (simulasi Rp15K/bulan).
- **Galeri 3D/AR**: Lihat karya dalam galeri atau AR pake kamera.
- **Internet Identity**: Login aman tanpa password.

## Teknologi
- **Frontend**: SvelteKit + TailwindCSS
- **Smart Contract**: Motoko (ICP)
- **Auth**: Internet Identity
- **AR Viewer**: AR.js
- **Penyimpanan**: File disimpan di canister ICP

## Cara Jalanin Proyek
1. Clone repo ini:
   
   ```bash
   
   git clone <repo-url>
   cd heritagevault-icp
   
Masuk ke folder frontend dan install dependensi:

  '''bash

    dfx start --background
    dfx deploy

Start frontend:

    '''bash


    npm run dev

Buka di browser: http://localhost:3000


Deploy ke Mainnet

Kalau mau ke ICP Mainnet:

- Pastikan wallet ICP-mu ada cycles.



-Update dfx.json sama canister ID-mu.



Deploy:

bash


dfx deploy --network ic



Struktur Proyek

heritagevault-icp/
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── lib/
│   │   ├── routes/
│   │   └── app.css
├── smart-contract/
│   └── HeritageVault.mo
├── README.md
├── dfx.json
└── package.json







