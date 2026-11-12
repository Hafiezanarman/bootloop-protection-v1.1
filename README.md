# Bootloop Protection (Magisk)

Modul universal berbasis shell: tidak memakai library native, ABI, merek, atau path partisi vendor tertentu. Ditujukan untuk perangkat Android yang menjalankan Magisk 20.4 atau lebih baru. ZIP menyertakan installer Magisk untuk pemasangan dari aplikasi Magisk dan custom recovery.

Modul menghitung boot yang tidak mencapai `sys.boot_completed=1`. Pada percobaan ketiga, modul membuat penanda `disable` untuk semua modul Magisk yang aktif, termasuk modul perlindungan ini, kecuali dirinya sendiri. Dengan modul lain dinonaktifkan, Android dapat boot agar masalahnya bisa diperbaiki. Penghitung direset setelah Android mencapai boot complete dan bertahan 60 detik.

Modul tidak menghapus modul atau mengubah partisi sistem. Aktifkan kembali modul lain satu per satu setelah mengetahui penyebab masalah. Jika perangkat tidak pernah mencapai tahap Magisk `post-fs-data`, skrip ini tidak dapat berjalan.

## Instalasi

Flash `bootloop-protection-v1.1.zip` di Magisk → Modules → Install from storage, lalu reboot. Untuk pemasangan melalui custom recovery, recovery harus dapat membuka kunci/dekripsi `/data` dan Magisk harus terpasang. Setelah pemulihan, semua modul tetap nonaktif sampai kamu mengaktifkannya kembali secara manual.

Reset penghitung secara manual dari root shell:

```sh
echo 0 > /data/adb/bootloop-protection/failed_boots
```
