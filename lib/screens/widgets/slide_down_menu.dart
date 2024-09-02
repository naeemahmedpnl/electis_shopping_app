import 'package:electis_shopping_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart'; // Replace with your actual import

class SlideDownMenu extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onClose;

  const SlideDownMenu({
    Key? key,
    required this.isVisible,
    required this.onClose,
  }) : super(key: key);

  @override
  _SlideDownMenuState createState() => _SlideDownMenuState();
}

class _SlideDownMenuState extends State<SlideDownMenu> {
  int _selectedContainerIndex = 1; 

  

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: widget.isVisible
          ? 0
          : -MediaQuery.of(context).size.height * 10, 
      left: 0,
      right: 0,
      curve: Curves.fastOutSlowIn,
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        color: Colors.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
                children: [
                  Row(
                    children: [
                      _buildInfoContainer(
                        context,
                        0,
                        "BALANCE",
                        "RP 2,500.00",
                      ),
                      const SizedBox(width: 5),
                      _buildInfoContainerWithIcon(
                        context,
                        1,
                        "Member",
                        "Platinum",
                        Icons.wine_bar_outlined,
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: widget.onClose,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Delivery Location",
                          style: AppTextTheme.getDarkTextTheme(context)
                              .headlineSmall),
                      const Spacer(),
                      Text("Manage",
                          style: AppTextTheme.getDarkTextTheme(context).bodySmall),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(95, 107, 107, 107)    ,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          _buildDeliveryContainer(context, 0, "Office"),
                          const SizedBox(height: 5),
                          _buildDeliveryContainer(context, 1, "Home"),
                          const SizedBox(height: 5),
                          _buildDeliveryContainer(context, 2, "Village"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
          ),
          ),
      ),
    );
  }

  Widget _buildInfoContainer(BuildContext context, int index, String title, String value) {
    return Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(95, 107, 107, 107),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: AppTextTheme.getDarkTextTheme(context).labelMedium),
              Text(value,
                  style: AppTextTheme.getDarkTextTheme(context).titleLarge),
            ],
          ),
        ),
    );
  }

  Widget _buildInfoContainerWithIcon(BuildContext context, int index, String title, String value, IconData icon) {
    return Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(95, 107, 107, 107)    
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: AppTextTheme.getDarkTextTheme(context).labelMedium),
              Row(
                children: [
                  Text(value,
                      style: AppTextTheme.getDarkTextTheme(context)
                          .titleLarge),
                  const SizedBox(width: 25),
                  Icon(icon, color: Colors.amber),
                ],
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildDeliveryContainer(BuildContext context, int index, String location) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedContainerIndex = index;
        });
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _selectedContainerIndex == index
              ? AppColors.secondaryColor
              : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(location,
                  style: _selectedContainerIndex == index?  AppTextTheme.getLightTextTheme(context).titleLarge :AppTextTheme.getDarkTextTheme(context).titleLarge),
              Text("Jl. Kebon Jeruk No. 5",
                  style: _selectedContainerIndex == index ?  AppTextTheme.getLightTextTheme(context).bodySmall : AppTextTheme.getDarkTextTheme(context).bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
