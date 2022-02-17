import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:degula/bording_page/bording_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'temp_feed/temp_feed_widget.dart';
import 'citylist/citylist_widget.dart';
import 'favourite_tempels/favourite_tempels_widget.dart';
import 'about_temple/about_temple_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;
  Stream<DegulaFirebaseUser> userStream;
  DegulaFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  void initState() {
    super.initState();
    userStream = degulaFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Degula',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
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
          : currentUser.loggedIn
              ? PushNotificationsHandler(child: NavBarPage())
              : BordingPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'temp_feed';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'temp_feed': TempFeedWidget(),
      'citylist': CitylistWidget(),
      'favourite_tempels': FavouriteTempelsWidget(),
      'about_temple': AboutTempleWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) =>
            setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        color: Color(0xFFA9A3A3),
        activeColor: FlutterFlowTheme.of(context).primaryColor,
        tabBackgroundColor: Color(0x00000000),
        tabActiveBorder: Border.all(
          color: FlutterFlowTheme.of(context).primaryColor,
          width: 2,
        ),
        tabBorderRadius: 100,
        tabMargin: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 20),
        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
        gap: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        duration: Duration(milliseconds: 800),
        haptic: false,
        tabs: [
          GButton(
            icon: Icons.dynamic_feed_outlined,
            text: 'Feeds',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.location_city,
            text: 'City',
            iconSize: 24,
          ),
          GButton(
            icon: currentIndex == 2
                ? Icons.favorite
                : Icons.favorite_border_sharp,
            text: 'Favourite',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.info_outlined,
            text: 'About',
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
