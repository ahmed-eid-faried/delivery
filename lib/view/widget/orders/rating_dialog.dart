// import 'package:delivery/controller/orders/archive_orders_controller.dart';
// import 'package:delivery/core/constant/imgaeasset.dart';
// import 'package:flutter/material.dart';
// import 'package:rating_dialog/rating_dialog.dart';
// import 'package:get/get.dart';

// showRatingDialog(String ordersid) {
//   final dialog = RatingDialog(
//     initialRating: 1.0,
//     // your app's name?
//     title: const Text(
//       'Rating Dialog',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: 25,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     // encourage your user to leave a high rating?
//     message: const Text(
//       'Tap a star to set your rating. Add more description here if you want.',
//       textAlign: TextAlign.center,
//       style: TextStyle(fontSize: 15),
//     ),
//     image: Image.asset(AppImageAsset.logoImage, height: 100, width: 100),
//     submitButtonText: 'Submit',
//     submitButtonTextStyle: const TextStyle(fontWeight: FontWeight.bold),
//     commentHint: 'Set your custom comment hint',
//     onCancelled: () => print('cancelled'),
//     onSubmitted: (response) {
//       // print('rating: ${response.rating}, comment: ${response.comment}');
//       ArchiveOrdersViewController con = ArchiveOrdersViewController();
//       con.ratingOrder(ordersid, response.rating, response.comment);
//       // if (response.rating < 3.0) {
//       //   // send their comments to your email or anywhere you wish
//       //   // ask the user to contact you instead of leaving a bad review
//       // } else {
//       //   // _rateAndReviewApp();
//       // }
//     },
//   );
//   // Get.defaultDialog(content: dialog);
//   showDialog(context: Get.context!, builder: (context) => dialog);
//   // show the dialog
//   // showDialog(context, dialog
//   //     // barrierDismissible: true, // set to false if you want to force a rating
//   //     // builder: (context) => dialog,
//   //     );
// }
