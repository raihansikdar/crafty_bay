import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/constants.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Wishlist",
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
                //  Get.to(()=>const ProductDetailsScreen(),transition: PageChangingAnimation.sendTransition,duration: PageChangingAnimation.duration);
                },),
              );
            },
          ),
        ),
      ),
    );
  }
}
