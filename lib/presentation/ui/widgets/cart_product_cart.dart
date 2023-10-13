import 'package:cached_network_image/cached_network_image.dart';
import 'package:crafty_bay/data/models/cart_list_model.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final CartData cartData;
  const CartProductCard({
    super.key, required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 90,
           decoration: BoxDecoration(
             color: AppColors.primaryColor.withOpacity(0.2),
             borderRadius:  BorderRadius.circular(12.0),
           ),
            child: CachedNetworkImage(
              imageUrl: cartData.product?.image ?? "", // Provide the URL of the image
              placeholder: (context, url) => SvgPicture.asset(AssetsPath.cadreBlackSVG),
              errorWidget: (context, url, error) => SvgPicture.asset(AssetsPath.craftybayLogoSVG),
              fit: BoxFit.cover, // You can adjust this to your needs
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(cartData.product?.title ?? '',style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),),
                              const SizedBox(
                                height: 4.0,
                              ),
                              RichText(text:  TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black54
                                  ),
                                  children: [
                                    TextSpan(text: 'Color: ${cartData.color ?? ''}'),
                                    TextSpan(text: '${cartData.size ?? ''}'),
                                  ]
                              ))
                            ],

                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.delete_outline),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text("\$100",style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),),
                        const Spacer(),
                        SizedBox(
                         width: 85,
                          child: FittedBox(
                            child: CustomStepper(
                                lowerLimit: 1,
                                upperLimit: 10,
                                stepValue: 1,
                                value: cartData.numberOfItems,
                                onChange: (int value){
                                  Get.find<CartListController>().changeItem(cartData.id!, value);
                                }),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
