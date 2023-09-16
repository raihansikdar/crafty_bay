import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            //margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Icon(Icons.shop,size: 48.0,color: AppColors.primaryColor,),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text("Electronics",style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 0.4,
            color: AppColors.primaryColor,
            overflow: TextOverflow.ellipsis,
          ),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}