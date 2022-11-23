# Lab 7

1. Stateless vs Stateful Widget
   Stateless widget adalah widget yang memiliki isi yang stasis (tidak berubah), sedangkan stateful widget adalah widget yang memiliki isi yang dinamis, yaitu state yang dapat berubah kapanpun sesuai dengan perintah program.

2. Widget yang digunakan

   - `MaterialApp`: Widget untuk membuat aplikasi material
   - `Scaffold`: Widget untuk mengimplementasikan layout Material Design
   - `AppBar`: Widget untuk bar yang ada di atas layar
   - `Center`: Widget untuk meletakkan child widget di tengah-tengah parent
   - `Column`: Widget untuk menaruh widget children di suatu kolom (dari atas ke bawah)
   - `Text`: Widget untuk menaruh teks
   - `Padding`: Widget untuk memberi spasi di sekitar child widget
   - `Row`: Widget untuk menaruh widget children di suatu baris (dari kiri ke kanan)
   - `FloatingActionButton`: Widget untuk menampilkan button lingkaran yang melayang
   - `Spacer`: Widget untuk memberi spasi secara _greedy_

3. Fungsi dari `setState()`
   Fungsi dari `setState()` adalah untuk mengganti nilai dari variable class. Variable yang dapat terdampak adalah segala variable yang ada di class tersebut yang tidak bersifat `const` atau `final`.

4. `const` vs `final`
   Secara penggunaan mereka merupakan hal yang sama, yaitu variable yang tidak dapat dirubah (immutable). Namun, `const` memiliki perbedaan bahwa `const` bersifat immutable sejak _compile-time_, sehingga object yang merupakan `const` adalah _deeply immutable_, di mana setiap atribut tidak dapat diganti sama sekali

5. Mengimplementasikan checklist
   - Membuat app dengan `flutter create counter_7`
   - Mengganti atribut `floatingActionButton` dengan dua FAB yang ditaruh dalam suatu Row
   - Set `onPressed` FAB minus ke `decrementCounter()`
   - Melakukan render genap atau ganjil menggunakan ternary dan mengganti warna dengan `style`
   - Menggunakan conditional rendering untuk menghilangkan tombol `-` apabila nilai 0

# Lab 8

1. `Navigator.push` vs `Navigator.pushReplacement`
   Pada `Navigator.pushReplacement`, route yang sebelumnya ditampilkan akan dibuang, sedangkan pada `Navigator.push` route sebelumnya akan tetap tersimpan di Stack.

2. Widget yang dipakai

   - Form: Untuk mengumpulkan elemen-elemen form
   - TextInput: Untuk teks input field
   - DropdownButtonFormField: Membuat dropdown untuk memilih opsi yang ada
   - TextButton: Menampilkan tombol yang bisa diklik dengan teks
   - Card: Widget untuk menampilkan kumpulan data pada suatu rounded corner dan elevasi

3. Event di Flutter

   - onPressed
   - onChange
   - onSaved
   - onTap

4. Cara kerja `Navigator`
   Navigator berfungsi dengan menyimpan stack dari route-route yang digunakan app. Di mana route tersebut merupakan widget yang berupa page baru. Terdapat method `push` untuk berpindah ke route yang ditentukan dengan builder yang diberikan, yang menghasilkan widget page yang dituju. Serta `pop` atau back button yang berguna untuk kembali ke page sebelumnya.
5. Cara implementasi
   1. Memindahkan drawer ke satu file sendiri dengan komponen sendiri
   2. Membuat page add budget pada file `add.dart`
   3. Menyimpan data di `model.dart` dan melakukan handle logic app state
   4. Membuat page show budget pada file `listing.dart` yang mengambil data dari model yang telah dibuat

# Lab 9

## Apakah bisa tanpa Model? Apakah lebih baik?

Ya, output dari `jsonDecode` berupa `Map[str, dynamic]` sehingga bisa memproses data melalui objek tersebut. Tidak lebih baik sebab kita tidak tahu value dari item-item tersebut apa (`dynamic`).

## Widget yang digunakan

- `Card`: Widget untuk membuat suatu rounded corner box dengan elevasi
- `Spacer`: Widget untuk memakan empty space dan memberi jarak antar widget
- `Expanded`: Widget untuk memperbesar widget child sepanjang axis dari Row/Column
- `Checkbox`: Widget untuk membuat checkbox
- `FutureBuilder`: Widget untuk melakukan update child berdasarkan hasil future yang diberikan
- `ListView`: Widget untuk membangun suatu kumpulan anakan widget berdasarkan jumlah item.

## Mekanisme pengambilan data

Menggunakan library `http`, flutter akan melakukan HTTP request ke server, dan server Django akan me-_resolve path_ dan memanggil _views_ yang sesuai. Setelah itu, server akan mengirim kembali _response_ ke flutter, di mana response tersebut berada di `response.bodyBytes`. Program lalu me-decode _bytes_ yang diterima dan melakukan _deserialization_ menggunakan `jsonDecode`. Hasil dari `jsonDecode` ini lalu digunakan untuk menginisialisasi model yang telah dibuat.

## Implementasi checklist

- Menambahkan `ListTile` yang mengarah ke page listing pada Drawer.
- Membuat model `WatchList` di `model/watchlist.dart` yang digenerate dari response JSON endpoint.
- Menambahkan dependency `http` untuk melakukan fetch data.
- Membuat function fetcher ke endpoint JSON (`model/fetcher.dart`)
- Membuat page list baru di `watchlist/listing.dart`.
  - Melakukan fetch dan menampilkan data dengan `FutureBuilder`
  - Me-_generate_ list card menggunakan `ListView`
- Membuat page detail baru di `watchlist/detail.dart`
  - Page menerima data dari menu listing agar tidak perlu melakukan request lagi
  - Menampilkan data sesuai dengan spesifikasi yang ada di soal
