import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  List<Map<String,String>> cardItems =[
    {"img":"assets/images/card_demo.png"},
    {"img":"assets/images/card_demo.png"},
    {"img":"assets/images/card_demo.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 0.8,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page,_){
                _selectedSlider.value = page;
              }
          ),
          items: cardItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  // width: double.infinity,
                   width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    // decoration: const BoxDecoration(
                    //     color: Colors.amber
                    // ),
                    child: Image.asset(item["img"]?? '')
                );
              },
            );
          }).toList(),
        ),

        ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context,value,_){
          List<Widget>list =[];
          for(int i = 0;i<3;i++){
            list.add( Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16.0),
                color: value == i ? AppColors.primaryColor : null,
              ),
            ));
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list,
          );
        })
      ],
    );
  }
}