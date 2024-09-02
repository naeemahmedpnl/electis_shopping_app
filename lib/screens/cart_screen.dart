import 'package:electis_shopping_app/styles/app_colors.dart';
import 'package:electis_shopping_app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ShopCartBottomSheet extends StatefulWidget {
  @override
  _ShopCartBottomSheetState createState() => _ShopCartBottomSheetState();
}

class _ShopCartBottomSheetState extends State<ShopCartBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E), 
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shop Cart',
                style: AppTextTheme.getDarkTextTheme(context).headlineSmall,
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildGadgetDayCard(),
          const SizedBox(height: 8),
          _buildGadgetDayCard(),
          const SizedBox(height: 8),
          _buildGadgetDayCard(),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Center(
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



//widget for the cart item
  Widget _buildCartItem(String itemName, String itemPrice) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color:  Colors.grey[800],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Container(
              width: 100,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Icon(Icons.image, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                itemPrice,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }


//widget for the gadget day card
Widget _buildGadgetDayCard() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 48, 48, 48),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100, // Set a fixed width for the image container
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



//widget for the color option
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
}