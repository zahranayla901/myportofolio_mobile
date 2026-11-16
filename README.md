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