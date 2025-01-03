import 'dart:convert';
import 'package:http/http.dart' as http;

class CartService {
  final String baseCartUrl = 'https://fakestoreapi.com/carts';
  final String baseProductUrl = 'https://fakestoreapi.com/products';

  Future<List<dynamic>> getCarts() async {
    final uri = Uri.parse(baseCartUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch carts: ${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> getProductById(int productId) async {
    final uri = Uri.parse('$baseProductUrl/$productId');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch product: ${response.reasonPhrase}');
    }
  }
}
