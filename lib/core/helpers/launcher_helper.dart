import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class LauncherHelper {
  static Future<void> url(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      log('url: Não foi possível iniciar $url', name: 'LauncherServiceImpl');
    }
  }
}
