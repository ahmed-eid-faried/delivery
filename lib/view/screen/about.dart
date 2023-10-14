import 'package:delivery/controller/about_controller.dart';
import 'package:delivery/core/class/customtotalanimation.dart';
import 'package:delivery/view/widget/auth/custom_body_auth.dart';
import 'package:delivery/view/widget/auth/custom_title_auth.dart';
import 'package:delivery/view/widget/auth/logo_auth.dart';
import 'package:delivery/view/widget/custom_list_title_abot_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  @override
  Widget build(BuildContext context) {
    // AboutControllerImp controller =
    Get.put(AboutControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: CustomTotalAnimation(
        // animation: controller.animationState,
        child: GetBuilder<AboutControllerImp>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const LogoAuth(),
                const CustomTitleAuth(title: "Welcome To E-Commerce"),
                const SizedBox(height: 20),
                CustomListTitleAbotUs(
                    title: "About Us",
                    fun: () {
                      controller.aboutus = !controller.aboutus;
                      controller.update();
                    }),
                if (controller.aboutus)
                  const CustomBodyAuth(
                      body:
                          '''At E-Commerce, we're dedicated to bringing you a seamless shopping experience right at your fingertips. Our mission is to provide you with high-quality products, exceptional customer service, and a user-friendly platform that makes online shopping a breeze. Who We Are:
          We're a passionate team of individuals who are deeply committed to curating a diverse range of products that cater to your needs and preferences. Our selection includes the latest trends in fashion, technology, home goods, and more, sourced from trusted suppliers and brands.
          '''),
                CustomListTitleAbotUs(
                    title: "Our Promise",
                    fun: () {
                      controller.promise = !controller.promise;
                      controller.update();
                    }),
                if (controller.promise)
                  const CustomBodyAuth(
                      body:
                          '''- Quality Assurance: We believe in quality over quantity. Every product on our platform is carefully selected to ensure it meets our stringent quality standards.
          - Secure Shopping: Your security is our top priority. We've implemented advanced security measures to protect your personal and payment information.
          - Customer Satisfaction: We're here for you. Our dedicated customer support team is ready to assist you with any questions, concerns, or issues you may have.
          '''),
                CustomListTitleAbotUs(
                    title: "Why Choose Us",
                    fun: () {
                      controller.choose = !controller.choose;
                      controller.update();
                    }),
                if (controller.choose)
                  const CustomBodyAuth(
                      body:
                          '''- Wide Range of Products: Whether you're looking for fashion-forward clothing, cutting-edge gadgets, or stylish home decor, you'll find it all here.
          - Easy Navigation: Our app is designed to make your shopping experience simple and enjoyable. Browse categories, search for specific items, and discover new favorites effortlessly.
          - Fast and Reliable Delivery: We understand that waiting for your order can be exciting, which is why we strive to deliver your purchases promptly and reliably.
          - Exclusive Deals: We love giving back to our loyal customers. Enjoy special discounts, promotions, and exclusive offers available only on [Your App Name].
          '''),
                CustomListTitleAbotUs(
                    title: "Join Us",
                    fun: () {
                      controller.joinus = !controller.joinus;
                      controller.update();
                    }),
                if (controller.joinus)
                  const CustomBodyAuth(
                      body:
                          '''Explore our app and be a part of our growing community of satisfied shoppers. Experience the convenience of shopping anytime, anywhere. We're excited to embark on this journey with you.
          '''),
                const CustomTitleAuth(
                    title:
                        "Thank you for choosing \n E-Commerce. Happy shopping!"),
              ],
            ),
          );
        }),
      ),
    );
  }
}
