import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Icon(Icons.shop,size: 32.0,color: AppColors.primaryColor,),
          ),
          const SizedBox(height: 8.0,),
          const Text("Electronics",style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 0.4,
            color: AppColors.primaryColor,
          ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}