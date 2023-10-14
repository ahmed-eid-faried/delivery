import 'package:delivery/controller/orders/orders_view_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/fonts.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/model/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersViewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        title: const Text("Pending Orders"),
        leading: const Icon(
          Icons.arrow_back_sharp,
          color: AppColor.backgroundcolor,
        ),
      ),
      body: GetBuilder<OrdersViewController>(
        builder: (controller) {
          return HandlingDataView(
              view: true,
              statusRequest: controller.statusRequest,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    OrdersModel ordersModel = controller.data[index];

                    return Card(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                    "Number Of Order:  ${ordersModel.ordersId!}",
                                    style: AppFonts.textStyle7),
                                trailing: Text(
                                  Jiffy.parse(ordersModel.ordersDatetime!,
                                          pattern: "yyyy-MM-dd")
                                      .fromNow()
                                      .toString(),
                                  style: AppFonts.textStyle6,
                                ),
                              ),
                              Text(
                                  "Recive Type:  ${controller.getValOfReciveType(ordersModel.ordersRecivetype!)}",
                                  style: AppFonts.textStyle4),
                              Text(
                                  "Orders Price:  ${ordersModel.ordersPrice!} \$",
                                  style: AppFonts.textStyle4),
                              ordersModel.ordersPricedelivery != "0"
                                  ? Text(
                                      "Delivery Price:  ${ordersModel.ordersPricedelivery!} \$",
                                      style: AppFonts.textStyle4)
                                  : const Text("Delivery Price:  Free",
                                      style: AppFonts.textStyle4),
                              Text(
                                  "Payment Method:  ${controller.getValOfPaymentMethod(ordersModel.ordersPaymentmethod!)}",
                                  style: AppFonts.textStyle4),
                              const Divider(color: AppColor.primaryColor),
                              Text(
                                  "Order Status:  ${controller.getValOfOrderStatus(ordersModel.ordersStatus!)}",
                                  style: AppFonts.textStyle4),
                              const Divider(color: AppColor.primaryColor),
                              Row(
                                children: [
                                  Text(
                                      "Total Price:  ${ordersModel.ordersTotalprice!} \$",
                                      textAlign: TextAlign.start,
                                      style: AppFonts.textStyle),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        Get.toNamed(
                                            AppRoute.trackingorderdetails,
                                            arguments: {
                                              "ordersModel": ordersModel,
                                              "listOrdersModel": []
                                            });
                                      },
                                      child: const Text("Details")),
                                  TextButton(
                                      onPressed: () {
                                        controller.accepted(
                                            ordersModel.ordersUserid,
                                            ordersModel.ordersId);
                                      },
                                      child: const Text("Accepted")),
                                ],
                              ),
                            ]),
                      ),
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
