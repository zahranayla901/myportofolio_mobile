# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Tugas 7
1. *Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!*
Widget tree adalah struktur hierarki yang menunjukkan hubungan antar-widget dalam Flutter. Parent merupakan widget induk yang membungkus widget lain, sedangkan child adalah widget yang berada di dalam parent. Contohnya, MaterialApp memiliki Scaffold sebagai child.

2. *Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!*
Widget yang digunakan antara lain MaterialApp untuk konfigurasi aplikasi, Scaffold untuk struktur halaman, AppBar untuk header, Text untuk menampilkan teks, Container untuk mengatur tampilan, Column dan Row untuk menyusun widget secara vertikal dan horizontal, Center untuk memposisikan widget di tengah, Image untuk menampilkan gambar, dan ElevatedButton untuk membuat tombol interaktif.

3. *Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!*
MaterialApp berfungsi mengatur konfigurasi utama aplikasi, seperti tema, navigasi, dan halaman awal. Widget ini digunakan sebagai root widget karena menjadi induk utama dari seluruh struktur aplikasi.

4. *Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?*
StatelessWidget tidak memiliki state internal yang berubah sehingga cocok untuk tampilan statis. Sementara itu, StatefulWidget memiliki state yang dapat berubah sehingga cocok untuk fitur interaktif seperti counter, checkbox, dan form input.

5. *Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?*
BuildContext adalah objek yang menunjukkan posisi widget dalam widget tree. Fungsinya untuk mengakses informasi dari widget lain, seperti tema melalui Theme.of(context) dan navigasi melalui Navigator.of(context). Objek ini digunakan sebagai parameter dalam metode build().

6. *Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?*
Hot reload menerapkan perubahan kode tanpa mengulang aplikasi dari awal sehingga state tetap dipertahankan. Hot restart menjalankan ulang aplikasi dan mereset state. Sementara itu, full restart diperlukan untuk perubahan konfigurasi native atau dependency yang membutuhkan proses build ulang.

AI Disclosure: Pengerjaan tugas 7 menggunakan bantuan AI berupa ChatGPT. Penggunaan AI ada pada cara membuat unit test di flutter dan mengaplikasikan gradient untuk background. Untuk kendala sendiri bukan pada AI, tetapi palette color yang diterapkan. Saya menerapkan palette  web design protofolio. Setelah dijalankan ternyata warnanya terlalu pigmented, sehingga saya harus membuat ulang pilihan warna gradient yang cocok.

Link prompt: https://chatgpt.com/share/6afaa992-ce70-83ec-b05c-e2ea4a8d35b7 

### Tugas 8
1. *Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.*
Navigator.push() digunakan untuk membuka halaman baru tanpa menghapus halaman sebelumnya, pushReplacement() membuka halaman baru sekaligus menggantikan halaman saat ini, sedangkan pop() menutup halaman dan kembali ke halaman sebelumnya. Formulir dibuka menggunakan push() dari kartu aksi agar pengguna dapat kembali ke halaman utama. Sementara itu, opsi Home pada drawer menggunakan navigasi untuk mengarahkan pengguna ke halaman utama dengan mengganti halaman yang sedang dibuka, sehingga pengguna tidak perlu melewati halaman-halaman sebelumnya untuk kembali ke Home.

2. *Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.*
Scaffold menjadi kerangka utama halaman, AppBar menampilkan bagian atas halaman, dan Drawer menyediakan menu navigasi. Ketiganya membantu menjaga struktur halaman tetap konsisten. Contohnya, warna utama portofolio digunakan pada AppBar dan tombol di beberapa halaman.

3. *Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.*
Tata letak formulir dibuat secara vertikal agar mudah dibaca dan diisi. SizedBox digunakan untuk memberikan jarak antar-input, sedangkan SingleChildScrollView memungkinkan halaman digulir ketika formulir tidak muat di layar, terutama saat keyboard muncul.

4. *Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.*
GlobalKey<FormState> digunakan untuk mengakses kondisi formulir, validator berisi aturan validasi input, dan validate() menjalankan seluruh validasi ketika tombol Simpan ditekan. Contohnya, nilai 20AB ditolak pada kolom tahun karena mengandung huruf. Pemilihan jenis input atau keyboard saja belum cukup karena tidak menjamin data yang dimasukkan selalu sesuai aturan, sehingga validasi tetap diperlukan.

AI Disclosure: Pengerjaan tugas 7 menggunakan bantuan AI berupa ChatGPT. Penggunaan AI dipakai dalam membantu memperjelas pemahaman untuk menjawab pertanyaan refleksi. 

Link Prompt: https://chatgpt.com/share/6b046807-80c0-83ec-8668-fae1605cd640 