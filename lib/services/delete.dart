import 'package:http/http.dart' as http;

class DeleteService {
  final String _baseUrl = 'https://fakestoreapi.com/products';

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
}
