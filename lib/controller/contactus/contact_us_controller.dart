import 'dart:io';

import 'package:delivery/core/services/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends GetxController {
  String settingstel = '';
  String settingssms = '';
  String settingsemail = '';
  MyService myServices = Get.find();

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  intialData() {
    settingstel = myServices.pref.getString('settingstel') ?? '+201555663045';
    settingssms = myServices.pref.getString('settingssms') ?? '+201555663045';
    settingsemail =
        myServices.pref.getString('settingsemail') ?? 'smith@example.com';
  }

  launchUrl(url) async {
    if (!await canLaunch(url.toString())) {
      throw Exception('Could not launch $url');
    } else {
      await launch(url.toString());
    }
  }

  whatsapp() async {
    var contact = "+201555663045";
    var androidUrl = "whatsapp://send?phone=$contact&text=Here Message";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('text=Here Message')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      print('WhatsApp is not installed.');
    }
  }

  launchTel() async {
    final Uri telUri = Uri(scheme: 'tel', path: settingstel);
    await launchUrl(telUri);
    update();
  }

  launchMail() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: settingsemail,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Your Subject',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  launchSMS() async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: settingssms,
      queryParameters: {'body': "here message"}, // Updated variable name
    );
    await launchUrl(smsUri);
    update();
  }
}
