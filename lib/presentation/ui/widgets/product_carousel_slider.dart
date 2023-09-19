import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class ProductCarouselSliderWidget extends StatefulWidget {
  const ProductCarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<ProductCarouselSliderWidget> createState() => _ProductCarouselSliderWidgetState();
}

class _ProductCarouselSliderWidgetState extends State<ProductCarouselSliderWidget> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  List<Map<String,String>> cardItems =[
    {"img":"assets/images/card_demo.png"},
    {"img":"assets/images/card_demo.png"},
    {"img":"assets/images/card_demo.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 260.0,
              autoPlay: true,
             //  enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 1.0,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page,_){
                _selectedSlider.value = page;
              }
          ),
          items: cardItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                   width: MediaQuery.of(context).size.width,
                    //margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:  BoxDecoration(
                        color: Colors.grey.shade300,
                    ),
                   // child: Image.asset(item["img"]?? '')
                );
              },
            );
          }).toList(),
        ),

       Positioned(
         bottom: 10,
         left: 0,
         right: 0,
         child:  ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context,value,_){
         List<Widget>list =[];
         for(int i = 0;i<3;i++){
           list.add( Container(
             height: 14,
             width: 14,
             margin: const EdgeInsets.symmetric(horizontal: 4.0),
             decoration: BoxDecoration(
               // border: Border.all(color: Colors.grey),
               borderRadius: BorderRadius.circular(16.0),
               color: value == i ? AppColors.primaryColor : Colors.white,
             ),
           ));
         }
         return Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: list,
         );
       }),)
      ],
    );
  }
}