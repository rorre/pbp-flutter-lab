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
   - `Spacer`: Widget untuk memberi spasi secara *greedy*

3. Fungsi dari `setState()`
   Fungsi dari `setState()` adalah untuk mengganti nilai dari variable class. Variable yang dapat terdampak adalah segala variable yang ada di class tersebut yang tidak bersifat `const` atau `final`.

4. `const` vs `final`
   Secara penggunaan mereka merupakan hal yang sama, yaitu variable yang tidak dapat dirubah (immutable). Namun, `const` memiliki perbedaan bahwa `const` bersifat immutable sejak *compile-time*, sehingga object yang merupakan `const` adalah *deeply immutable*, di mana setiap atribut tidak dapat diganti sama sekali

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
