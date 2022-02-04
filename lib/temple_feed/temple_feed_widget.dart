import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_temples_yet_widget.dart';
import '../famous_temples/famous_temples_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../templedetails/templedetails_widget.dart';
import '../temples_feed_page_search/temples_feed_page_search_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TempleFeedWidget extends StatefulWidget {
  const TempleFeedWidget({Key key}) : super(key: key);

  @override
  _TempleFeedWidgetState createState() => _TempleFeedWidgetState();
}

class _TempleFeedWidgetState extends State<TempleFeedWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: FlutterFlowTheme.tertiaryColor,
            size: 28,
          ),
        ),
        title: Text(
          'Temples',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemplesFeedPageSearchWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.search,
                color: FlutterFlowTheme.tertiaryColor,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Icon(
                            Icons.account_circle,
                            color: FlutterFlowTheme.tertiaryColor,
                            size: 50,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Guest  user',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        if (scaffoldKey.currentState.isDrawerOpen ||
                            scaffoldKey.currentState.isEndDrawerOpen) {
                          Navigator.pop(context);
                        }
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: FamousTemplesWidget(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        alignment: AlignmentDirectional(0.10000000000000009, 0),
                        child: Align(
                          alignment: AlignmentDirectional(-0.65, 0),
                          child: Text(
                            'ಪ್ರಸಿದ್ಧ ದೇವಾಲಯಗಳು',
                            style: FlutterFlowTheme.title2.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).animated([animationsMap['columnOnPageLoadAnimation']]),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
          child: StreamBuilder<List<TemplesRecord>>(
            stream: queryTemplesRecord(
              queryBuilder: (templesRecord) =>
                  templesRecord.where('publishe', isEqualTo: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitSquareCircle(
                      color: FlutterFlowTheme.primaryColor,
                      size: 50,
                    ),
                  ),
                );
              }
              List<TemplesRecord> listViewTemplesRecordList = snapshot.data;
              if (listViewTemplesRecordList.isEmpty) {
                return Center(
                  child: NoTemplesYetWidget(),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewTemplesRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewTemplesRecord =
                      listViewTemplesRecordList[listViewIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TempledetailsWidget(
                                currenttemple: listViewTemplesRecord,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: functions.getImageURL(
                                        listViewTemplesRecord.tempDetailsImg
                                            .toList()),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  if (listViewTemplesRecord.favBy
                                          .toList()
                                          .contains(currentUserUid) ??
                                      true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.86, -0.84),
                                      child: Icon(
                                        Icons.favorite,
                                        color: FlutterFlowTheme.primaryColor,
                                        size: 28,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          listViewTemplesRecord.templename,
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '${listViewTemplesRecord.templePlaceName}, ${listViewTemplesRecord.cityKanName}',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).animated([animationsMap['listViewOnPageLoadAnimation']]);
            },
          ),
        ),
      ),
    );
  }
}
