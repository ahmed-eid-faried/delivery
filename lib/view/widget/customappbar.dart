 import 'package:flutter/material.dart';
 
class CustomAppBar extends StatelessWidget {
  final void Function()? onPressedSearch;
  final Function(String)? onChangedSearch;
  final String title;
  final TextEditingController? controller;
  const CustomAppBar({
    super.key,
    this.onPressedSearch,
    this.onChangedSearch,
    required this.title,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                controller: controller,
                onChanged: onChangedSearch,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: title,
                  prefixIcon: IconButton(
                      onPressed: onPressedSearch,
                      icon: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          // Container(
          //     height: 50,
          //     width: 50,
          //     decoration: BoxDecoration(
          //         color: Colors.grey[200],
          //         borderRadius: BorderRadius.circular(10)),
          //     child: IconButton(
          //         onPressed: onPressedAlarm,
          //         icon: Icon(Icons.alarm, size: 30, color: Colors.grey[600]))),
          // const SizedBox(
          //   width: 10,
          // ),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {
                    // Get.toNamed(AppRoute.favorite);
                  },
                  icon: Icon(Icons.favorite_border_outlined,
                      size: 30, color: Colors.grey[600]))),
        ],
      ),
    );
  }
}
