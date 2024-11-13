import 'package:e_com_app/services/api_services.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final ProductService _productService = ProductService();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  final _focusNode = FocusNode();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  Future<void> _createProduct() async {
    if (_formKey.currentState!.validate()) {
      double? price = double.tryParse(_priceController.text);
      if (price == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid price')),
        );
        return;
      }

      await _productService.createProduct(
        _titleController.text,
        price,
        _descriptionController.text,
        _categoryController.text,
        _imageController.text,
      );

      // Clear inputs
      _titleController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _categoryController.clear();
      _imageController.clear();

      FocusScope.of(context).requestFocus(_focusNode);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product created successfully')),
      );
    }
  }

  Widget _buildSpacing() {
    return SizedBox(height: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assett/icons/Backbutton.png")),
        title: Text('Add New Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter a title' : null,
                ),
                _buildSpacing(),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Product Price',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter a price' : null,
                ),
                _buildSpacing(),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Product Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter a description' : null,
                ),
                _buildSpacing(),
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    labelText: 'Product Category',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter a category' : null,
                ),
                _buildSpacing(),
                TextFormField(
                  controller: _imageController,
                  decoration: InputDecoration(
                    labelText: 'Product Image Url',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an image URL' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _createProduct,
                  child: Text('Create Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
