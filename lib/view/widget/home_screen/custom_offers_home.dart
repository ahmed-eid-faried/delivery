import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOffersHome extends StatelessWidget {
  final String title;
  final String body;

  const CustomOffersHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    MyService myServices = Get.find();
    String? lang;
    lang = myServices.pref.getString("lang");
    final isArabic = lang == 'ar';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("A Summer Surprise",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text("CashBack 20%",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ],
                ),
              )),
          Positioned(
            bottom: -25,
            right: isArabic ? null : -30,
            left: isArabic ? -30 : null,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: AppColor.secondColor.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(150))),
            ),
          ),
          Positioned(
            top: -35,
            right: isArabic ? null : -60,
            left: isArabic ? -60 : null,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: AppColor.thirdColor.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(150))),
            ),
          )
        ],
      ),
    );
  }
}
