import 'package:electis_shopping_app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';


class AdItem extends StatelessWidget {
  final Color color;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String discount;

  AdItem({
    required this.color,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 180,
            bottom: 0.0,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
                height: 150.0,
                width: 180.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    title,
                    style: AppTextTheme.getLightTextTheme(context).headlineMedium
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 120,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        discount,
                        style: AppTextTheme.getDarkTextTheme(context).bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}