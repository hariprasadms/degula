// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:store_redirect/store_redirect.dart';

Future shareAppStoreLink(
  String? playStoreLink,
  String? appStoreAppId,
) async {
  // Add your function code here!
  StoreRedirect.redirect(androidAppId: playStoreLink, iOSAppId: appStoreAppId);
}
