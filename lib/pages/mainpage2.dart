import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:menu_restoran1/items/button.dart';
import 'package:menu_restoran1/models/product.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    String apiURL =
        'https://script.googleusercontent.com/macros/echo?user_content_key=w2hR-x2B0JsBK-H0jz3ohfPp4oxky1exy7bc-dRymOD-_WAaw9t_s3h5xweUrNgw72enxeg0sxbf5b7UcDfNqgl9SJW1Mqtpm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnP9IHiZ7A4r3w9z-whMSyOOaY36wsIEICbC5rebHdS0xd47WgxZuQ9bsNnQRhLIZ8VQRFxKtuxxiLQgzEyFlTxhmruJxQs9dsA&lib=MHnPWirBEAKlpV_H2f_C6evFD2aiL34Mg';
    
    var response = await http.get(Uri.parse(apiURL));
    
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Product> products = [];
      for (var item in jsonData['data']) {
        Product product = Product(
          id: item['id'],
          name: item['name'],
          description: item['description'],
          image: item['image'],
          price: item['price'],
        );
        products.add(product);
      }
      return products;
    } else {
      throw Exception('Failed to load products from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
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
                            child: Image.network('${product.image}'),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${product.name}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${product.description}'),
                              Text('${product.price}'),
                              Row(
                                children: <Widget>[
                                  MyButton(),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
