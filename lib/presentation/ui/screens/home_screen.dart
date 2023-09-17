import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay/presentation/ui/utility/constants.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_section_title.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(AssetsPath.craftybayLogoNavSVG),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person,
              onTap: (){},
            ),
            const SizedBox(width: 8.0,),
            CircularIconButton(
              icon: Icons.call,
              onTap: (){},
            ),
            const SizedBox(width: 8.0,),
            CircularIconButton(
              icon: Icons.notifications_active_outlined,
              onTap: (){},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
             TextField(
               decoration: InputDecoration(
                 filled: true,
                 fillColor: Colors.grey.shade200,
                 prefixIcon: const Icon(Icons.search),
                 hintText: "Search",
                 hintStyle: const TextStyle(color:Colors.grey),
                 border: const OutlineInputBorder(
                   borderSide: BorderSide.none,
                 ),
                 focusedBorder:  const OutlineInputBorder(
                   borderSide: BorderSide.none,
                 ),
                 enabledBorder:  const OutlineInputBorder(
                   borderSide: BorderSide.none,
                 ),
               ),
             ),
              const SizedBox(height:16.0),
              const CarouselSliderWidget(),
              SectionHeader(
                title: 'All Category',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                 // Get.to(()=> const CategoriesListScreen(),transition: PageChangingAnimation.sendTransition,duration: PageChangingAnimation.duration);
                },
              ),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CategoryCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 16.0,
                    );
                  },
                ),
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to(()=>const ProductListScreen(),transition: PageChangingAnimation.sendTransition,duration:PageChangingAnimation.duration);
                },
              ),
              SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 16.0,
                    );
                  },
                ),
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to(()=>const ProductListScreen(),transition: PageChangingAnimation.sendTransition,duration:PageChangingAnimation.duration);
                },
              ),
              SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 16.0,
                    );
                  },
                ),
              ),
              SectionHeader(
                title: 'New',
                onTap: () {
                  Get.to(()=>const ProductListScreen(),transition: PageChangingAnimation.sendTransition,duration:PageChangingAnimation.duration);
                },
              ),
              SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 16.0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










