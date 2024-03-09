import 'dart:convert';
import 'package:http/http.dart' as http;

// Definisikan model Product
class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });
}

// Fungsi untuk terhubung ke API dan mengambil data produk
Future<List<Product>> connectToAPI() async {
  // URL API
  String apiURL = 'https://script.googleusercontent.com/macros/echo?user_content_key=w2hR-x2B0JsBK-H0jz3ohfPp4oxky1exy7bc-dRymOD-_WAaw9t_s3h5xweUrNgw72enxeg0sxbf5b7UcDfNqgl9SJW1Mqtpm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnP9IHiZ7A4r3w9z-whMSyOOaY36wsIEICbC5rebHdS0xd47WgxZuQ9bsNnQRhLIZ8VQRFxKtuxxiLQgzEyFlTxhmruJxQs9dsA&lib=MHnPWirBEAKlpV_H2f_C6evFD2aiL34Mg';
  
  // Kirim permintaan HTTP GET ke API
  var response = await http.get(Uri.parse(apiURL));
  
  // Periksa status kode respon
  if (response.statusCode == 200) {
    // Dekode data JSON dari respons
    var jsonData = json.decode(response.body);
    // Inisialisasi list untuk menyimpan produk
    List<Product> products = [];
    // Iterasi melalui data JSON dan buat objek Product untuk setiap item
    for (var item in jsonData['data']) {
      Product product = Product(
        id: item['id'],
        name: item['name'],
        description: item['description'],
        image: item['image'],
        price: item['price'],
      );
      // Tambahkan produk ke dalam list
      products.add(product);
    }
    // Kembalikan list produk
    return products;
  } else {
    // Jika gagal mendapatkan data, lempar Exception
    throw Exception('Failed to load products from API');
  }
}
