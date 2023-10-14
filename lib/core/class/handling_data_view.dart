import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget child;
  final bool view;
  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.child,
    this.view = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return Center(child: Lottie.asset(AppImageAsset.loading));
      case StatusRequest.offlinefailure:
        return Center(child: Lottie.asset(AppImageAsset.offline));
      case StatusRequest.serverfailure:
        return Center(child: Lottie.asset(AppImageAsset.server));
      case StatusRequest.failure:
        return view == true
            ? Center(child: Lottie.asset(AppImageAsset.noData))
            : child;
      default:
        return child;
    }
  }
}
