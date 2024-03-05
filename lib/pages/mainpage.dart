import 'package:flutter/material.dart';
import 'package:menu_restoran1/items/button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu Makanan'),
        ),
        body: ListView.builder(
          itemCount: 7, // Ubah sesuai jumlah kolom yang diinginkan
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey, // Ganti dengan warna gambar atau tambahkan Image.asset jika menggunakan gambar
                        // child: Image.asset('assets/image.png'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Nama Makanan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Deskripsi Makanan'),
                          Text('Harga: Rp 10.000'), // Ubah harga sesuai kebutuhan
                          Row(
                            children: <Widget>[
                              MyButton(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(), // Garis pemisah antar kolom
                ],
              ),
            );
          },
        ),
      );
  }
}