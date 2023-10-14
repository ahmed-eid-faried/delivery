import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/middleware/middlewares.dart';
import 'package:delivery/view/screen/about.dart';

import 'package:delivery/view/screen/contactus/contactus.dart';
import 'package:delivery/view/screen/forgetpassword/forget_password.dart';
import 'package:delivery/view/screen/forgetpassword/reset_password.dart';
import 'package:delivery/view/screen/forgetpassword/success_resetpassword.dart';
import 'package:delivery/view/screen/forgetpassword/verfiy_code.dart';
import 'package:delivery/view/screen/auth/login.dart';
import 'package:delivery/view/screen/homeapp.dart';

import 'package:delivery/view/screen/lang.dart';
import 'package:delivery/view/screen/notifications.dart';
import 'package:delivery/view/screen/onboarding.dart';
import 'package:delivery/view/screen/orders/order_accepted.dart';
import 'package:delivery/view/screen/orders/order_archive.dart';
import 'package:delivery/view/screen/orders/orderdetails.dart';
import 'package:delivery/view/screen/orders/orders.dart';
import 'package:delivery/view/screen/orders/tracking_orders_details.dart';
import 'package:delivery/view/screen/settings.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/test", page: () => const OrderDetails()),

  //lang
  GetPage(
      name: AppRoute.lang,
      page: () => const Lang(),
      middlewares: [MiddlewaresLogin()]),

  //Auth
  // GetPage(name: AppRoute.singup, page: () => const SignUp()),
  // GetPage(
  //     name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  // GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.login, page: () => const Login()),

  //forgetpassword
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.verfiyCodeForgetPassword,
      page: () => const VerfiyCodeForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetpassword()),

  //onboarding
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  //home

  GetPage(name: AppRoute.home, page: () => const Home()),
  //items
  // GetPage(name: AppRoute.items, page: () => const Items()),
  // GetPage(name: AppRoute.itemsdetails, page: () => const ItemsDetails()),
  // favorite
  // GetPage(name: AppRoute.favorite, page: () => const Favorite()),
  // Settings
  GetPage(name: AppRoute.settings, page: () => const Settings()),
  // Cart
  // GetPage(name: AppRoute.cart, page: () => const Cart()),
  // Checkout
  // GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  // OrdersView
  GetPage(name: AppRoute.ordersView, page: () => const OrdersView()),
  GetPage(name: AppRoute.ordersAccepted, page: () => const OrderAccepted()),

  // OrderArchive
  GetPage(name: AppRoute.orderarchive, page: () => const OrderArchive()),
  // OrderDetails
  GetPage(name: AppRoute.orderdetails, page: () => const OrderDetails()),

  // ContactUs
  GetPage(name: AppRoute.contactus, page: () => const ContactUs()),
  GetPage(name: AppRoute.aboutus, page: () => const AboutUs()),
  // GetPage(
  //     name: AppRoute.customcustomersservice,
  //     page: () => const CustomCustomersService()),
  // Notifications
  GetPage(name: AppRoute.notifications, page: () => const Notifications()),
  // Offers
  // GetPage(name: AppRoute.offers, page: () => const Offers(), bindings: [
  //   BindingsBuilder.put(() => SearchControllerImp())
  // ]),
  // TrackingOrderDetails
  GetPage(
      name: AppRoute.trackingorderdetails,
      page: () => const TrackingOrderDetails()),
];
