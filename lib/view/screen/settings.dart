import 'package:delivery/view/widget/settings/custom_card_setting.dart';
import 'package:delivery/view/widget/settings/customtoppartsettings.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(width: 35),
        CustomTopPartSettings(),
        SizedBox(height: 20),
        CustomCardSetting()
      ],
    );
  }
}
