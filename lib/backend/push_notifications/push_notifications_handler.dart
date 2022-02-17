import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../temple_feed/temple_feed_widget.dart';
import '../../templedetails/templedetails_widget.dart';
import '../../citytemples/citytemples_widget.dart';
import '../../bording_page/bording_page_widget.dart';
import '../../cities_search_page/cities_search_page_widget.dart';
import '../../temples_feed_page_search/temples_feed_page_search_widget.dart';
import '../../famous_temples/famous_temples_widget.dart';
import '../../volunteer_details/volunteer_details_widget.dart';
import '../../your_temples/your_temples_widget.dart';
import '../../degualadmin/degualadmin_widget.dart';
import '../../degula_users/degula_users_widget.dart';
import '../../degula_valunteers/degula_valunteers_widget.dart';
import '../../valunteer_temple_posts/valunteer_temple_posts_widget.dart';
import '../../create_temple_post/create_temple_post_widget.dart';
import '../../temple_posts/temple_posts_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).tertiaryColor,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/degula_app_icon_(1).png',
                width: 200,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'temple_feed': (data) async => TempleFeedWidget(),
  'citylist': (data) async => NavBarPage(initialPage: 'CitylistWidget'),
  'templedetails': (data) async => TempledetailsWidget(
        currenttemple: await getDocumentParameter(
            data, 'currenttemple', TemplesRecord.serializer),
      ),
  'citytemples': (data) async => CitytemplesWidget(
        cityname: getParameter(data, 'cityname'),
        kannadaName: getParameter(data, 'kannadaName'),
      ),
  'about_temple': (data) async => NavBarPage(initialPage: 'AboutTempleWidget'),
  'bording_page': (data) async => BordingPageWidget(),
  'favourite_tempels': (data) async =>
      NavBarPage(initialPage: 'FavouriteTempelsWidget'),
  'cities_search_page': (data) async => CitiesSearchPageWidget(),
  'temples_feed_page_search': (data) async => TemplesFeedPageSearchWidget(),
  'famous_temples': (data) async => FamousTemplesWidget(
        cityname: getParameter(data, 'cityname'),
        kannadaName: getParameter(data, 'kannadaName'),
      ),
  'volunteer_details': (data) async => VolunteerDetailsWidget(),
  'your_temples': (data) async => YourTemplesWidget(),
  'degualadmin': (data) async => DegualadminWidget(),
  'degula_users': (data) async => DegulaUsersWidget(),
  'degula_valunteers': (data) async => DegulaValunteersWidget(),
  'valunteer_temple_posts': (data) async => ValunteerTemplePostsWidget(
        templeName: getParameter(data, 'templeName'),
        temple: await getDocumentParameter(
            data, 'temple', TemplesRecord.serializer),
      ),
  'create_temple_post': (data) async => CreateTemplePostWidget(
        templeName: getParameter(data, 'templeName'),
      ),
  'temple_posts': (data) async => TemplePostsWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
