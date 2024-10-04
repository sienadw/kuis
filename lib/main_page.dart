import 'package:flutter/material.dart';
import 'package:kuis/daftar_barang_dummy.dart';
import 'bantuan_page.dart';

class MainPage extends StatelessWidget {
  final String username;

  MainPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Center(
              child: Text(
                'Selamat Datang, $username !',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0), // Padding luar tombol
              child: Container(
                padding: EdgeInsets.all(16.0), // Padding di dalam tombol
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100], // Warna latar belakang tombol
                  borderRadius: BorderRadius.circular(12), // Membuat sudut rounded
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BantuanPage()),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        'Butuh Bantuan?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Warna teks
                        ),
                      ),
                      SizedBox(height: 5), // Spasi antara teks
                      Text(
                        'Klik untuk pergi ke halaman Panduan dan Dukungan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black, // Warna teks
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Menonaktifkan scroll di GridView
                shrinkWrap: true, // Membuat GridView sesuai dengan ukuran kontennya
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: supermarketItemList.length,
                itemBuilder: (context, index) {
                  final SupermarketItem item = supermarketItemList[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: 1, // Menjaga rasio gambar 1:1
                          child: Image.network(
                            item.imageUrls[0],
                            fit: BoxFit.cover, // Menyesuaikan gambar agar pas di dalam frame
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item.price,
                            style: TextStyle(
                              fontSize: 16, // Ukuran teks lebih besar untuk harga
                              fontWeight: FontWeight.bold, // Menebalkan teks harga
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
