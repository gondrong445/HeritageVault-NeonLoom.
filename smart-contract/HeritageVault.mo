import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Time "mo:base/Time";
import Principal "mo:base/Principal";
import Blob "mo:base/Blob";
import Buffer "mo:base/Buffer";

actor HeritageVault {
  type KaryaBatik = {
    id: Nat;
    judul: Text;
    cerita: Text;
    gambar: Blob;
    daerah: Text;
    pembuat: Principal;
    dibuatPada: Time.Time;
    sudahTerverifikasi: Bool;
    totalDonasi: Nat;
  };

  stable var semuaKarya : [KaryaBatik] = [];
  stable var idBerikutnya : Nat = 0;

  // Fungsi buat upload karya baru
  public shared (msg) func unggahKarya(
    judul: Text,
    cerita: Text,
    gambar: Blob,
    daerah: Text
  ) : async Nat {
    let pembuat = msg.caller;
    let karyaBaru = {
      id = idBerikutnya;
      judul = judul;
      cerita = cerita;
      gambar = gambar;
      daerah = daerah;
      pembuat = pembuat;
      dibuatPada = Time.now();
      sudahTerverifikasi = false;
      totalDonasi = 0;
    };
    semuaKarya := Buffer.toArray(Buffer.fromArray(semuaKarya) |> Buffer.append(_, Buffer.fromArray([karyaBaru])));
    idBerikutnya += 1;
    return karyaBaru.id;
  };

  // Fungsi buat verifikasi karya, khusus admin
  public shared (msg) func verifikasiKarya(id: Nat) : async Bool {
    assert (msg.caller == Principal.fromText("r7inp-6aaaa-aaaaa-aaabq-cai")); // Ganti sama ID admin
    semuaKarya := Buffer.toArray(Buffer.fromArray(semuaKarya) |> Buffer.map(_, func (karya) {
      if (karya.id == id) { { karya with sudahTerverifikasi = true } } else { karya }
    }));
    return true;
  };

  // Fungsi buat donasi ke pengrajin
  public func donasiKeKarya(id: Nat, jumlah: Nat) : async Bool {
    semuaKarya := Buffer.toArray(Buffer.fromArray(semuaKarya) |> Buffer.map(_, func (karya) {
      if (karya.id == id) { { karya with totalDonasi = karya.totalDonasi + jumlah } } else { karya }
    }));
    return true;
  };

  // Ambil semua karya buat ditampilin di galeri
  public query func ambilSemuaKarya() : async [KaryaBatik] {
    return semuaKarya;
  };

  // Ambil satu karya berdasarkan ID
  public query func ambilKarya(id: Nat) : async ?KaryaBatik {
    for (karya in semuaKarya.vals()) {
      if (karya.id == id) {
        return ?karya;
      }
    };
    return null;
  };
};
