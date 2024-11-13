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

  // Delete
  Future<void> deleteProduct(int id) async {
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/$id'));
      print(response.body);
      if (response.statusCode == 200) {
        print('Product deleted successfully');
      } else {
        throw Exception('Failed to delete product');
      }
    } catch (error) {
      throw Exception('Error deleting product: $error');
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
      if (response.statusCode == 201) {
        print('Product created successfully');
      } else {
        throw Exception('Failed to create product');
      }
    } catch (error) {
      throw Exception('Error creating product: $error');
    }
  }
}
