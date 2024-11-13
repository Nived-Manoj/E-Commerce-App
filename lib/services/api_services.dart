import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String _baseUrl = 'https://fakestoreapi.com/products';

  // Get
  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> products = jsonDecode(response.body);
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error fetching products: $error');
    }
  }

  //Post
  Future<void> createProduct(String title, double price, String description,
      String category, String image) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'price': price,
          'description': description,
          'category': category,
          'image': image,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Product created successfully');
      } else {
        throw Exception('Failed to create product');
      }
    } catch (error) {
      throw Exception('Error creating product: $error');
    }
  }
}
