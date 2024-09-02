import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildProductCard(
                            imageUrl: 'assets/images/cameraa.png',
                            title: 'Sony Alpha 9 Mark III',
                            subtitle: 'Body Only',
                            price: 'RP 24.500.000',
                            rating: 4.9,
                          ),
                          const SizedBox(width: 5),
                          _buildProductCard(
                            imageUrl: 'assets/images/headphone.png',
                            title: 'Edifiers Headphone',
                            subtitle: 'Ultra Wear',
                            price: 'RP 3.200.000',
                            rating: 4.8,
                            isNew: true,
                          ),
                          const SizedBox(width: 5),
                          _buildProductCard(
                            imageUrl: 'assets/images/airpods.png',
                            title: 'Mini Sport Earphone',
                            subtitle: 'Earphone',
                            price: 'RP 5.000.000',
                            rating: 4.7,
                          ),
                          _buildProductCard(
                            imageUrl: 'assets/images/marshall.png',
                            title: 'Sony Alpha 9 Mark III',
                            subtitle: 'Body Only',
                            price: 'RP 5.400.000',
                            rating: 4.9,
                          ),
                          _buildProductCard(
                            imageUrl: 'assets/images/vr.png',
                            title: 'Sony Alpha 9 Mark III',
                            subtitle: 'Body Only',
                            price: 'RP 8.600.000',
                            rating: 4.9,
                          ),
                        ],
                      ),
                    ),
    );
  }

  Widget _buildProductCard({
    required String imageUrl,
    String? subtitle,
    required String title,
    required String price,
    required double rating,
    bool isNew = false,
  }) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 65, 65, 65),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (isNew)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 233, 222),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'NEW',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(136, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
