import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final dynamic product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF8F3F7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    product['image'] ?? 'https://example.com/placeholder.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Product Title
              Text(
                product['title'] ?? 'Mulberry Clutch',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              SizedBox(height: 8),

              // Subtitle
              Text(
                '( With solo loop )',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 24),

              // Colors Section
              Text(
                'Colors',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),

              // Color Options
              Row(
                children: [
                  _buildColorOption('Chalk Pink', Color(0xFFE8C7C8), false),
                  SizedBox(width: 12),
                  _buildColorOption('Royal Gray', Color(0xFF8E8E93), true),
                  SizedBox(width: 12),
                  _buildColorOption('Eucalyptus', Color(0xFF7FA089), false),
                ],
              ),
              SizedBox(height: 24),

              // Tab Buttons
              Row(
                children: [
                  _buildTabButton('Details', true),
                  SizedBox(width: 16),
                  _buildTabButton('Reviews', false),
                ],
              ),
              SizedBox(height: 16),

              // Description
              Text(
                'Call it a treasure chest or a mini portable world, handbags are indispensable in daily life',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 24),

              // Price and Add to Cart Button
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      '\$799',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6C63FF),
                        minimumSize: Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorOption(String label, Color color, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Color(0xFF6C63FF) : Colors.grey[300]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Color(0xFF6C63FF) : Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, bool isSelected) {
    return TextButton(
      onPressed: () {},
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4),
              width: 20,
              height: 2,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}
