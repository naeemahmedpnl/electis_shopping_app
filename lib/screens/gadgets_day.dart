import 'dart:math';

import 'package:electis_shopping_app/styles/app_colors.dart';
import 'package:electis_shopping_app/styles/app_text_styles.dart';
// import 'package:electis_shopping_app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class GadgetDayScreen extends StatefulWidget {
  const GadgetDayScreen({Key? key}) : super(key: key);

  @override
  _GadgetDayScreenState createState() => _GadgetDayScreenState();
}

class _GadgetDayScreenState extends State<GadgetDayScreen> with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;


// Init State Method
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildAnimatedAppBar(),
            _buildCategories(),
            Expanded(
              child: _buildProductGrid(),
            ),
          ],
        ),
      ),
    );
  }

// Animated AppBar
  Widget _buildAnimatedAppBar() {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              const Expanded(
                child: Text(
                  'Gadget Day',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  
 // Categrories
 Widget _buildCategories() {
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.4, curve: Curves.easeOut),
        )),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.2, 0.4, curve: Curves.easeOut),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: _buildCategorie()),
                const SizedBox(width: 16), // Add some spacing
                const Icon(Icons.tune, color: Colors.white),
              ],
            ),
          ),
        ),
      );
    },
  );
}

 Widget _buildCategorie() {
  final categories = [
    'Latest',
    'Popular',
    'Top Deals',
  ];

  return SizedBox(
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ChoiceChip(
            label: Text(
              categories[index],
              style: TextStyle(
                color: _selectedCategoryIndex == index ? Colors.white : Colors.grey,
                fontWeight: _selectedCategoryIndex == index ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            selected: _selectedCategoryIndex == index,
            selectedColor: AppColors.primary,
            backgroundColor: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide.none,
            ),
            onSelected: (isSelected) {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
          ),
        );
      },
    ),
  );
}

// Product Grid
Widget _buildProductGrid() {
  final products = [
    {'name': 'Marshall Action 3', 'price': 'RP 5.400.000', 'rating': 4.8, 'image': 'assets/images/marshall.png', 'isNew': false},
    {'name': 'Meta Vision Ultra', 'price': 'RP 8.600.000', 'rating': 0.0, 'image': 'assets/images/vr.png', 'isNew': true},
    {'name': 'Sony Alpha 9 Mark III', 'price': 'RP 24.500.000', 'rating': 4.6, 'image': 'assets/images/cameraa.png', 'isNew': true},
    {'name': 'Edifiers Headphone', 'price': 'RP 24.500.000', 'rating': 4.5, 'image': 'assets/images/headphone.png', 'isNew': false},
    {'name': 'Mini Sport Earphone', 'price': 'RP 749.000', 'rating': 4.5, 'image': 'assets/images/airpods.png', 'isNew': false},
  ];

  return GridView.builder(
    padding: const EdgeInsets.all(16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.75,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final startInterval = 0.4 + (index * 0.1);
      final endInterval = min(0.7 + (index * 0.1), 1.0); // Clamp endInterval to max 1.0

      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Interval(startInterval, endInterval, curve: Curves.easeOut),
            )),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(startInterval, endInterval, curve: Curves.easeOut),
                ),
              ),
              child: _buildProductCard(products[index]),
            ),
          );
        },
      );
    },
  );
}

// Product Card
  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (product['rating'] > 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color:Color.fromARGB(255, 194, 194, 194),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            product['rating'].toString(),
                            style: AppTextTheme.getLightTextTheme(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (product['isNew'])
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 241, 241),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Text(
                        'NEW',
                        style: AppTextTheme.getLightTextTheme(context).labelMedium,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product['price'],
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}