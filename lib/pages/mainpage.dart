import 'package:flutter/material.dart';
import 'package:menu_restoran1/items/button.dart';
import 'package:menu_restoran1/models/dummy_data.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan'),
      ),
      body: ListView.builder(
        itemCount: restourantMenuList
            .length, // Ubah sesuai jumlah kolom yang diinginkan
        itemBuilder: (context, index) {
          final RestourantMenu menu = restourantMenuList[index];
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
                      child: Image.network(menu.image, fit: BoxFit.fill),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          menu.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(menu.category),
                        Text(menu.description,
                            overflow: TextOverflow.ellipsis),
                        Text(menu.price),// Sesuaikan sesuai kebutuhan
                        Row(
                          children: <Widget>[
                            SizedBox(height: 15),
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
