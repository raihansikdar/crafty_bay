import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
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
            child: Image.asset(AssetsPath.shoePng),
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
                              const Text("Bata new shoe Aw345566",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),),
                              const SizedBox(
                                height: 4.0,
                              ),
                              RichText(text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black54
                                  ),
                                  children: [
                                    TextSpan(text: 'Color: Black'),
                                    TextSpan(text: 'Size: XL'),
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
                                value: 1,
                                onChange: (int value){
                                  print(value);
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
