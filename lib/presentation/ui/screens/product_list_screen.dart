import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/constants.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          "Category Name",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (context, index) {
            return  FittedBox(
              child: ProductCard(image: '', title: '', price: '', rating: 0, onTap: () {
               // Get.to(()=>const ProductDetailsScreen(productData: " ",),transition: PageChangingAnimation.sendTransition,duration: PageChangingAnimation.duration);
              },),
            );
          },
        ),
      ),
    );
  }
}
