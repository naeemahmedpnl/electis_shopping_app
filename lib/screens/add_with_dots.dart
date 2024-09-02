import 'package:electis_shopping_app/screens/widgets/add_items.dart';
import 'package:flutter/material.dart';

class AdWithDots extends StatefulWidget { 
  @override
  _AdWithDotsState createState() => _AdWithDotsState();
}

class _AdWithDotsState extends State<AdWithDots> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<Widget> adItems = [
    AdItem(
      color: const Color(0xFFD7C3F2), // Light purple color
      imageUrl: 'assets/images/sony.png', // Replace with your image path
      title: 'Try Bold \nExperience',
      subtitle: 'Sony think differents.',
      discount: 'Discount 40%',
    ),
    AdItem(
      color: Colors.blueAccent,
      imageUrl: 'assets/images/sony.png', // Another image path
      title: 'Bright \nConnectivity',
      subtitle: 'Enlighten your world.',
      discount: 'Discount 30%',
    ),
    AdItem(
      color: Colors.greenAccent,
      imageUrl: 'assets/images/sony.png', // Another image path
      title: 'Next-Level \nSound',
      subtitle: 'Experience the difference.',
      discount: 'Discount 50%',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 180.0,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: adItems.length,
            itemBuilder: (context, index) {
              return adItems[index];
            },
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(adItems.length, (index) {
            return Container(
              width: 9.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
