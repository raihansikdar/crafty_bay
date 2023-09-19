import 'package:crafty_bay/presentation/ui/screens/review_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay/presentation/ui/utility/constants.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  List<Color> colors =[
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.black,
  ];
  int _selectedSizeIndex = 0;
  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // extendBodyBehindAppBar: true,
     //  appBar: AppBar(
     //    leading: BackButton(),
     //    backgroundColor: Colors.transparent,
     //    elevation: 0,
     //  ),
      body: SafeArea(
        child: Column(
          children: [
           Expanded(
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   Stack(
                     children: [
                       const ProductCarouselSliderWidget(),
                       AppBar(
                         leading: const BackButton(
                             color: Colors.black54,
                         ),
                         title: const Text("Product Details",style: TextStyle(color: Colors.black54),),
                         backgroundColor: Colors.transparent,
                         elevation: 0,
                       ),
                     ],
                   ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child:  Text("Addidas Shoe HK23454 - Black Edition",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5
                                ),),
                              ),
                              CustomStepper(lowerLimit: 1, upperLimit: 10, stepValue: 1, value: 1, onChange: ( newValue){
                                print(newValue);
                              })
                            ],
                          ),
                          Row(
                            children: [
                              const Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(()=>const ReviewListScreen(),transition: PageChangingAnimation.sendTransition,duration: PageChangingAnimation.duration);
                                },
                                child: const Text(
                                  'Review',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Card(
                                color: AppColors.primaryColor,
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            'Color',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 28,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: colors.length,
                                itemBuilder: (context,index){
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(16.0),
                                    onTap: (){
                                      _selectedColorIndex =index;
                                      if(mounted){
                                        setState(() {});
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: colors[index],
                                      child: _selectedColorIndex == index ? const Icon(Icons.done,color: Colors.white,) : null,
                                    ),
                                  );
                                }, separatorBuilder: (BuildContext context, int index) {
                                 return const SizedBox(width: 8.0);
                            },
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          const Text(
                            'Size',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 28,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: colors.length,
                              itemBuilder: (context,index){
                                return InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: (){
                                    _selectedSizeIndex =index;
                                    if(mounted){
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: _selectedSizeIndex == index ? AppColors.primaryColor : null,
                                    ),
                                    child: Text(sizes[index],style: TextStyle(
                                      fontSize: _selectedSizeIndex == index ? 14 : null,
                                      fontWeight: _selectedSizeIndex == index ? FontWeight.bold : null,
                                      color: _selectedSizeIndex == index ? Colors.white : null,
                                    ),),
                                  )
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 8.0);
                            },
                            ),
                          ),
                          const SizedBox(height: 16,),
                          const Text('Description', style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                          ),),
                          const SizedBox(height: 16,),
                          const Text(
                              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                                    '''
                          ),
                        ],
                      ),
                    ),
                 ],
               ),
             ),
           ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black54
                    ),),
                    SizedBox(height: 4,),
                    Text('\$1000', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.primaryColor
                    ),),
                  ],
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(onPressed: () {}, child: const Text('Add to cart'),),)
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
