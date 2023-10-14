import 'package:delivery/controller/onboarding.dart';
import 'package:delivery/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) {
          print(onBoardingList[i].image!);
          return Column(
            children: [
              const SizedBox(height: 10),
              // Image(
              //   image: AssetImage(
              //     onBoardingList[i].image!,
              //   ),
              //   height: Get.width / 1.3,
              //   fit: BoxFit.fill,
              // ),
              Image.asset(
                onBoardingList[i].image!,
                height: Get.width / 1.3,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 30),
              Text(onBoardingList[i].title!,
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 15),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
            ],
          );
        });
  }
}
