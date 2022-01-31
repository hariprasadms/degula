// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:store_redirect/store_redirect.dart';

Future shareAppStoreLink(
  String playStoreLink,
  String appStoreAppId,
) async {
  // Add your function code here!
  StoreRedirect.redirect(androidAppId: playStoreLink, iOSAppId: appStoreAppId);
}
