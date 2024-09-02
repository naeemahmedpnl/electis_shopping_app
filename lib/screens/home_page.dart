import 'package:electis_shopping_app/screens/add_with_dots.dart';
import 'package:electis_shopping_app/screens/gadgets_day.dart';
import 'package:electis_shopping_app/screens/widgets/product_card.dart';
import 'package:electis_shopping_app/screens/widgets/search_field.dart';
import 'package:electis_shopping_app/screens/widgets/slide_down_menu.dart';
import 'package:electis_shopping_app/styles/app_colors.dart';
import 'package:electis_shopping_app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  bool _isMenuVisible = false;

  // Toggle menu visibility
  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 20.0;

    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  SearchField(onMenuPressed: _toggleMenu),
                  const SizedBox(height: 20),
                  _buildCategories(horizontalPadding),
                  const SizedBox(height: 15),
                  AdWithDots(),
                  const SizedBox(height: 20),
                  _buildSectionHeader('Electis Choice', horizontalPadding),
                  const SizedBox(height: 20),
                  const ProductCard(),
                  const SizedBox(height: 20),
                  _buildWorldShoppingBanner(horizontalPadding),
                  const SizedBox(height: 15),
                  _buildGadgetDaySection(horizontalPadding),
                  const SizedBox(height: 10),
                  _buildSectionHeader('Electis Choice', horizontalPadding),
                  const SizedBox(height: 20),
                  const ProductCard(),
                ],
              ),
            ),
          ),
          SlideDownMenu(
            isVisible: _isMenuVisible,
            onClose: _toggleMenu,
          ),
        ],
      ),
    );
  }

  
// Build category chips
  Widget _buildCategories(double horizontalPadding) {
    final categories = ['Promo', 'Best Deals', 'Windy Basic', 'Special', 'Brands'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategoryChip(categories[index], index),
        ),
      ),
    );
  }

  // Build individual category chip
  Widget _buildCategoryChip(String label, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(
          label,
          style: AppTextTheme.getDarkTextTheme(context).bodyMedium,
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
            _selectedCategoryIndex = isSelected ? index : _selectedCategoryIndex;
          });
        },
      ),
    );
  }

  // Build section header with "Show all" button
  Widget _buildSectionHeader(String title, double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextTheme.getDarkTextTheme(context).headlineSmall,
          ),
          _buildShowAllButton(),
        ],
      ),
    );
  }

  // Build "Show all" button
  Widget _buildShowAllButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const GadgetDayScreen()));
      },
      child: Text(
        'Show all',
        style: AppTextTheme.getDarkTextTheme(context).bodySmall?.copyWith(color: Colors.grey),
      ),
    );
  }

  // Build World Shopping banner
  Widget _buildWorldShoppingBanner(double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 91, 170, 94),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'World Shopping',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Discounts & free shipping.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.arrow_outward_outlined,
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build Gadget Day section
  Widget _buildGadgetDaySection(double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 65, 65, 65),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Gadget Day',
                    style: AppTextTheme.getDarkTextTheme(context).headlineSmall,
                  ),
                ],
              ),
              _buildShowAllButton(),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildGadgetDayCard(),
                const SizedBox(width: 16),
                _buildGadgetDayCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build color option for Gadget Day card
  Widget _buildColorOption(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  // Build Gadget Day card
  Widget _buildGadgetDayCard() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 110,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 65, 65, 65),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/marshall.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SPEAKER',
                    style: AppTextTheme.getDarkTextTheme(context).labelMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Marshall Action 3',
                    style: AppTextTheme.getDarkTextTheme(context).titleMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'RP 5.400.000',
                    style: AppTextTheme.getDarkTextTheme(context).titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildColorOption(Colors.brown),
                      const SizedBox(width: 8),
                      _buildColorOption(Colors.white),
                      const SizedBox(width: 8),
                      _buildColorOption(Colors.black),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}