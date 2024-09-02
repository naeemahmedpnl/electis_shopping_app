import 'package:electis_shopping_app/screens/cart_screen.dart';
import 'package:electis_shopping_app/screens/home_page.dart';
import 'package:electis_shopping_app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    FeedsPage(),
    LikesPage(),
    CartPage(),
    ProfilePage(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  
    if (index == 3) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => ShopCartBottomSheet(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}



//feeds_page.dart
class FeedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lightbulb, size: 80, color: Colors.white,),
          const SizedBox(height: 20),
          Text('Feeds Page', style: AppTextTheme.getDarkTextTheme(context).titleLarge),
          const SizedBox(height: 20),
          const Text('Here are your latest feeds and updates.'),
        ],
      ),
    );
  }
}



//likes_page.dart
class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite, size: 80, color: Colors.white,),
          const SizedBox(height: 20),
          const Text('Likes Page', style: TextStyle(fontSize: 24, color: Colors.white)),
          const SizedBox(height: 20),
          Text('Items you\'ve liked will appear here.', style: AppTextTheme.getDarkTextTheme(context).bodyLarge),
        ],
      ),
    );
  }
}



//cart_page.dart
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         const Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.white,),
            const SizedBox(height: 20),
            const Text('Cart Page', style: TextStyle(fontSize: 24, color: Colors.white)),
            const SizedBox(height: 20),
            Text('Items you\'ve liked will appear here.', style: AppTextTheme.getDarkTextTheme(context).bodyLarge),
       ],
      ),
    );
  }
} 


//profile_page.dart
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.person, size: 80, color: Colors.white,),
          const SizedBox(height: 20),
          Text('Profile Page', style: AppTextTheme.getDarkTextTheme(context).titleLarge),
          const SizedBox(height: 20),
          Text('Welcome to your profile page!', style: AppTextTheme.getDarkTextTheme(context).titleLarge,),
        ],
      ),
    );
  }
}
