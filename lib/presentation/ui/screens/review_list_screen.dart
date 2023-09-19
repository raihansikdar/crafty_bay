import 'package:crafty_bay/presentation/ui/screens/review_add_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay/presentation/ui/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({Key? key}) : super(key: key);

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black54,
        ),
          title: const Text(
            "Reviews",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.circle),
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.person_outlined,
                                    size: 18,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16.0,
                              ),
                              const Text(
                                "Raihan Sikdar",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              letterSpacing: 0.4,
                              wordSpacing: 0.4,
                            ),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 8.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 15,bottom: 55),
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
                const Text('Reviews (1000)', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black54
                ),),
                FloatingActionButton(onPressed: (){
                  Get.to(()=>ReviewAddScreen(),transition: PageChangingAnimation.sendTransition,duration: PageChangingAnimation.duration);
                },child: const Icon(Icons.add),),
                ],
            ),
          )
        ],
      )
    );
  }
}
